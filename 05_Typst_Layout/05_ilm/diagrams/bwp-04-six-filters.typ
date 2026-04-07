// bwp-04 — The Six Filters Radar
//
// Brief 1: hexagonal radar with two overlaid polygons (Strong Wedge in
// teal/blue, Weak Wedge in muted orange) and a footer band of the four
// scoring tiers. Scale runs 1–5 on each of the six axes.
//
// To preview standalone:
//   typst compile bwp-04-six-filters.typ /tmp/bwp-04.pdf

#import "@preview/cetz:0.4.2": canvas, draw
#import "palette.typ": *
#import "styles.typ": *

// ─── Data ────────────────────────────────────────────────────────
// Six axes ordered clockwise from top-left, matching the current diagram.
// Each entry: (label-line-1, label-line-2, question, axis-angle-degrees).
#let axes = (
  ("Pain",         "Severity",     "Is the pain strong enough to create motion?", 120deg),
  ("Buyer",        "Clarity",      "Can you name the buyer in one sentence?",      60deg),
  ("Distribution", "Realism",      "Can you reach the buyer?",                      0deg),
  ("Defensibility", "",            "What stops commoditization?",                 -60deg),
  ("Build",        "Feasibility",  "Can one operator ship in weeks?",            -120deg),
  ("Monetization", "Clarity",      "Where does money come from?",                180deg),
)

// Strong Wedge example: a credible 27/30 scorer (Building Permit Cross-Sell)
// Order matches `axes` above: PS, BC, DR, D, BF, MC
#let strong-scores = (4, 5, 4, 4, 5, 5)

// Weak Wedge example: uneven and mostly 1–3, totals to ~13
#let weak-scores = (3, 2, 1, 2, 4, 1)

// ─── Geometry helpers ────────────────────────────────────────────
#let max-score = 5
#let radar-radius = 4.0  // cetz units; outer ring of the hexagon
#let unit = radar-radius / max-score

// Convert (axis-index, score) to (x, y) point in cetz space.
#let point-at(idx, score) = {
  let theta = axes.at(idx).at(3)
  let r = score * unit
  (calc.cos(theta) * r, calc.sin(theta) * r)
}

// ─── Canvas ──────────────────────────────────────────────────────
#let radar = canvas(length: 1cm, {
  import draw: *

  set-style(
    stroke: (paint: ink-faint, thickness: 0.4pt),
    fill: none,
  )

  // 1. Concentric grid rings — one hexagon per integer score level.
  for level in (1, 2, 3, 4, 5) {
    let pts = ()
    for i in range(axes.len()) {
      pts.push(point-at(i, level))
    }
    pts.push(pts.at(0))
    line(..pts, stroke: (
      paint: if level == 5 { ink } else { rule-light },
      thickness: if level == 5 { 0.8pt } else { 0.3pt },
    ))
  }

  // 2. Axis spokes from center out to radius 5.
  for i in range(axes.len()) {
    line((0, 0), point-at(i, 5), stroke: (paint: rule-light, thickness: 0.3pt))
  }

  // 3. Numeric ticks (1–5) along the rightmost spoke (Distribution Realism, 0°).
  for level in (1, 2, 3, 4, 5) {
    let p = point-at(2, level)
    content(
      (p.at(0), p.at(1) - 0.18),
      text(font: font-sans, size: 5.5pt, fill: ink-faint, str(level)),
      anchor: "north",
    )
  }

  // 4. Weak Wedge polygon (drawn first so Strong sits on top).
  let weak-pts = ()
  for i in range(axes.len()) {
    weak-pts.push(point-at(i, weak-scores.at(i)))
  }
  weak-pts.push(weak-pts.at(0))
  line(..weak-pts,
    fill: weak-tint,
    stroke: (paint: rgb("#C86A2A"), thickness: 1.2pt),
  )

  // 5. Strong Wedge polygon.
  let strong-pts = ()
  for i in range(axes.len()) {
    strong-pts.push(point-at(i, strong-scores.at(i)))
  }
  strong-pts.push(strong-pts.at(0))
  line(..strong-pts,
    fill: strong-tint,
    stroke: (paint: band-build, thickness: 1.2pt),
  )

  // 6. Vertex dots on each polygon.
  for i in range(axes.len()) {
    let sp = point-at(i, strong-scores.at(i))
    circle(sp, radius: 0.07, fill: band-build, stroke: none)
    let wp = point-at(i, weak-scores.at(i))
    circle(wp, radius: 0.07, fill: rgb("#C86A2A"), stroke: none)
  }

  // 7. Axis labels — slightly outside the outer ring.
  let label-radius = radar-radius + 0.55
  for i in range(axes.len()) {
    let theta = axes.at(i).at(3)
    let lx = calc.cos(theta) * label-radius
    let ly = calc.sin(theta) * label-radius
    let l1 = axes.at(i).at(0)
    let l2 = axes.at(i).at(1)
    let q  = axes.at(i).at(2)

    let anchor = if calc.abs(calc.cos(theta)) < 0.1 {
      "south" // top axis – we don't have one but keep general
    } else if calc.cos(theta) > 0 {
      "west"
    } else {
      "east"
    }

    let label-block = align(
      if anchor == "west" { left }
      else if anchor == "east" { right }
      else { center },
      block(width: 4cm, [
        #text(font: font-sans, size: 7.5pt, weight: "bold", fill: ink, upper(l1 + if l2 != "" { " " + l2 } else { "" })) \
        #text(font: font-sans, size: 6pt, fill: ink-faint, q)
      ])
    )
    content((lx, ly), label-block, anchor: anchor)
  }
})

// ─── Footer score band strip ─────────────────────────────────────
// Four equal cells with a subtle background tint and a label inside each.
// Reads as light → dark in grayscale (Build → Kill).
#let score-bands = block(width: 100%, {
  let bands = (
    ("26–30", "BUILD",   band-build),
    ("21–25", "TEST",    band-test),
    ("16–20", "BACKLOG", band-backlog),
    ("≤ 15",  "KILL",    band-kill),
  )
  set align(center)
  table(
    columns: (1fr, 1fr, 1fr, 1fr),
    inset: 6pt,
    align: center,
    stroke: (x, y) => (
      top: 0.6pt + ink,
      bottom: 0.6pt + ink,
      left: if x == 0 { 0.6pt + ink } else { none },
      right: 0.6pt + ink,
    ),
    fill: (col, row) => {
      let c = bands.at(col).at(2)
      // very light tint so it still reads in grayscale
      c.lighten(82%)
    },
    ..bands.map(b => {
      let range-text = b.at(0)
      let label = b.at(1)
      let stripe = b.at(2)
      [
        #text(font: font-sans, size: 6.5pt, fill: ink-faint, range-text) \
        #text(font: font-sans, size: 8pt, weight: "bold", fill: stripe.darken(15%), label)
      ]
    })
  )
})

// ─── Legend ──────────────────────────────────────────────────────
#let legend = block(width: 100%, {
  set align(center)
  let swatch(c, label) = box(
    inset: (x: 4pt),
    [
      #box(width: 9pt, height: 9pt, fill: c, stroke: c.darken(20%) + 0.5pt)
      #h(4pt)
      #text(font: font-sans, size: 7pt, fill: ink, label)
    ]
  )
  swatch(strong-tint, "Strong Wedge (build candidate)")
  h(0.6cm)
  swatch(weak-tint, "Weak Wedge (kill or reshape)")
})

// ─── Final composition ───────────────────────────────────────────
#let bwp-04-six-filters = diagram-frame(
  title-text: "The Six Filters",
  subtitle-text: "Score each axis 1–5. A strong wedge totals 26 or above.",
  footer-text: "Chapter 3 · The Six Filters",
  [
    #radar
    #v(0.4em)
    #legend
    #v(0.6em)
    #score-bands
  ],
)

// Standalone preview — `#show: preview` makes this file render to a one-page
// PDF when compiled directly. When imported by a chapter, only the named
// `bwp-04-six-filters` content is consumed and this show rule is ignored.
#show: preview
#bwp-04-six-filters
