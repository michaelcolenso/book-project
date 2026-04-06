// bwp-15 — Eight Wedges Scored: Comparative Stacked Bar Chart
//
// Brief 7: a horizontal stacked bar chart of all eight teaching wedges from
// Chapter 9, with each bar split into the six filter scores. Reference lines
// at 26 (Build threshold) and 21 (Test threshold). Score totals at the right.
//
// Per-filter scores were extracted from
// 04_Final_Manuscript/Build_What_Pays_Publication_Ready.md and verified to
// match the headline totals. EV Permit Alert Engine was reconciled from
// 28 → 27 (Defensibility 4 → 3) for internal consistency.

#import "@preview/cetz:0.3.1": canvas, draw
#import "palette.typ": *
#import "styles.typ": *

// ─── Data ────────────────────────────────────────────────────────
// Each row: (label, [BC, PS, MC, BF, D, DR]) — order matches filter palette.
#let wedges = (
  ("EV Permit Alert Engine",         (5, 5, 5, 5, 3, 4)),  // 27
  ("Building Permit Cross-Sell",     (5, 4, 5, 5, 4, 4)),  // 27
  ("FlipTrack",                      (5, 5, 5, 4, 4, 3)),  // 26
  ("AI Model Compliance Monitor",    (5, 5, 5, 3, 5, 3)),  // 26
  ("SauceStack",                     (5, 5, 4, 5, 3, 3)),  // 25
  ("CraftLedger",                    (5, 4, 5, 5, 3, 3)),  // 25
  ("Ingredient Traceability",        (5, 5, 4, 4, 4, 3)),  // 25
  ("Federal Contracting Engine",     (4, 4, 5, 4, 4, 3)),  // 24
)

#let filter-meta = (
  ("Buyer Clarity",        filter-1),
  ("Pain Severity",        filter-2),
  ("Monetization Clarity", filter-3),
  ("Build Feasibility",    filter-4),
  ("Defensibility",        filter-5),
  ("Distribution Realism", filter-6),
)

// ─── Chart geometry (cetz units) ─────────────────────────────────
#let bar-height  = 0.7
#let bar-gap     = 0.45
#let chart-x0    = 0
#let chart-x-max = 30
#let scale-x     = 0.42      // cetz x-units per score point
#let label-w     = 6.2       // left label column width

#let chart = canvas(length: 1cm, {
  import draw: *

  let n = wedges.len()
  let total-height = n * (bar-height + bar-gap)

  // X-axis baseline
  let baseline-y = 0
  let top-y = baseline-y + total-height + 0.4

  // Vertical reference lines: 26 (Build) and 21 (Test)
  let build-x = 26 * scale-x
  let test-x  = 21 * scale-x
  line(
    (build-x, baseline-y - 0.2),
    (build-x, top-y),
    stroke: (paint: band-build, thickness: 0.8pt, dash: "dashed"),
  )
  content(
    (build-x, top-y + 0.05),
    text(font: font-sans, size: 6.5pt, weight: "bold", fill: band-build, [BUILD ≥ 26]),
    anchor: "south",
  )
  line(
    (test-x, baseline-y - 0.2),
    (test-x, top-y),
    stroke: (paint: band-test, thickness: 0.8pt, dash: "dashed"),
  )
  content(
    (test-x, top-y + 0.05),
    text(font: font-sans, size: 6.5pt, weight: "bold", fill: band-test, [TEST ≥ 21]),
    anchor: "south",
  )

  // X-axis tick marks at 0, 5, 10, 15, 20, 25, 30
  for tick in (0, 5, 10, 15, 20, 25, 30) {
    let tx = tick * scale-x
    line(
      (tx, baseline-y - 0.05),
      (tx, baseline-y - 0.18),
      stroke: (paint: ink-faint, thickness: 0.4pt),
    )
    content(
      (tx, baseline-y - 0.22),
      text(font: font-sans, size: 6pt, fill: ink-faint, str(tick)),
      anchor: "north",
    )
  }
  // Baseline line itself
  line(
    (0, baseline-y),
    (chart-x-max * scale-x, baseline-y),
    stroke: (paint: ink-faint, thickness: 0.4pt),
  )

  // Bars (top to bottom; data already ordered highest score first)
  for (i, w) in wedges.enumerate() {
    let label = w.at(0)
    let scores = w.at(1)
    let total = scores.sum()

    let row-top = baseline-y + total-height - i * (bar-height + bar-gap) - bar-gap / 2
    let row-bot = row-top - bar-height
    let row-mid = (row-top + row-bot) / 2

    // Left label column
    content(
      (-0.2, row-mid),
      align(right, box(width: label-w * 1cm,
        text(font: font-sans, size: 8pt, weight: "bold", fill: ink, label))),
      anchor: "east",
    )

    // Stacked segments
    let cursor = 0
    for (j, sc) in scores.enumerate() {
      let seg-x0 = cursor * scale-x
      let seg-x1 = (cursor + sc) * scale-x
      rect(
        (seg-x0, row-bot),
        (seg-x1, row-top),
        fill: filter-meta.at(j).at(1),
        stroke: (paint: white, thickness: 0.6pt),
      )
      cursor += sc
    }

    // Total score label at the right end of each bar
    content(
      (total * scale-x + 0.15, row-mid),
      text(font: font-sans, size: 9pt, weight: "bold", fill: ink, str(total)),
      anchor: "west",
    )
  }
})

// ─── Legend ──────────────────────────────────────────────────────
#let legend = block(width: 100%, {
  set align(center)
  let swatch(c, label) = box(
    inset: (x: 5pt, y: 1pt),
    [
      #box(width: 10pt, height: 10pt, fill: c, stroke: c.darken(15%) + 0.4pt)
      #h(4pt)
      #text(font: font-sans, size: 7pt, fill: ink, label)
    ]
  )
  for (i, m) in filter-meta.enumerate() {
    swatch(m.at(1), m.at(0))
  }
})

#let bwp-15-eight-wedges-scored = diagram-frame(
  title-text: "Eight Wedges Scored",
  subtitle-text: "Total of six filters per opportunity, ranked by overall score.",
  footer-text: "Chapter 9 · Framework in Action",
  [
    #v(0.4em)
    #legend
    #v(0.4em)
    #chart
  ],
)

// Landscape preview.
#show: doc => {
  set page(width: 26cm, height: auto, margin: 1.2cm, fill: bg)
  set text(font: font-sans, size: 9pt, fill: ink)
  doc
}
#bwp-15-eight-wedges-scored
