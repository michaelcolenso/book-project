// bwp-13 — The Idea Funnel: 200+ Opportunities → 1 Wedge
//
// Brief 2: a vertical funnel with four labeled gates. Each gate visibly
// rejects ideas (faded × marks ejected sideways). The book's visual thesis:
// a good framework rejects more ideas than it advances.

#import "@preview/cetz:0.4.2": canvas, draw
#import "palette.typ": *
#import "styles.typ": *

// ─── Layout constants (cetz units) ───────────────────────────────
#let funnel-top-w    = 18.0
#let funnel-bottom-w = 3.6
#let funnel-height   = 22.0
#let stage-count     = 4

#let half-width-at(t) = (funnel-top-w + (funnel-bottom-w - funnel-top-w) * t) / 2

#let stages = (
  ("Stage 1", "Discovery Engines", "Find signals where money is already moving"),
  ("Stage 2", "Six Filters",       "Score ruthlessly on six dimensions"),
  ("Stage 3", "Kill Signals",      "Cut anything that leaks weakness early"),
  ("Stage 4", "30-Day Sprint",     "Validate the survivors with real evidence"),
)

#let funnel = canvas(length: 0.42cm, {
  import draw: *

  let top-y = 0
  let bot-y = -funnel-height
  let tl = (-half-width-at(0), top-y)
  let tr = ( half-width-at(0), top-y)
  let bl = (-half-width-at(1), bot-y)
  let br = ( half-width-at(1), bot-y)

  // Funnel outline
  line(tl, tr, stroke: (paint: ink, thickness: 1.4pt))
  line(tl, bl, stroke: (paint: ink, thickness: 1.4pt))
  line(tr, br, stroke: (paint: ink, thickness: 1.4pt))
  line(bl, br, stroke: (paint: ink, thickness: 1.4pt))

  // Top header
  content((0, top-y + 1.4),
    text(font: font-sans, size: 12pt, weight: "bold", fill: ink, [200+ OPPORTUNITIES]),
    anchor: "south")
  content((0, top-y + 0.6),
    text(font: font-sans, size: 7.5pt, fill: ink-faint, [Discovery surface area]),
    anchor: "south")

  // Stage gates as horizontal bands across the funnel
  let stage-step = funnel-height / (stage-count + 1)
  for i in range(stage-count) {
    let t = (i + 1) * stage-step / funnel-height
    let y = top-y - (i + 1) * stage-step
    let hw = half-width-at(t)

    // Light tinted band across the funnel for the gate
    rect(
      (-hw + 0.05, y - 0.55),
      ( hw - 0.05, y + 0.55),
      fill: bwp-red.lighten(92%),
      stroke: (paint: bwp-red, thickness: 0.6pt, dash: "dashed"),
    )

    // Stage label rendered centered on the band
    content(
      (0, y + 0.18),
      text(font: font-sans, size: 8.5pt, weight: "bold", fill: ink, upper(stages.at(i).at(1))),
    )
    content(
      (0, y - 0.35),
      text(font: font-sans, size: 6.5pt, fill: ink-faint, stages.at(i).at(2)),
    )
    // Stage number tag at left edge of the band
    content(
      (-hw - 0.4, y),
      text(font: font-sans, size: 7pt, weight: "bold", fill: ink-faint, upper(stages.at(i).at(0))),
      anchor: "east",
    )

    // Ejected ideas — visible × glyphs drifting outward both sides.
    let eject-count = 4
    for k in range(eject-count) {
      let dx = 0.7 + k * 0.8
      let dy = -0.1 - k * 0.15
      let opacity-pct = 100 - k * 22
      let glyph-color = ink-faint
      content((-hw - dx, y + dy),
        text(font: font-sans, size: 9pt, weight: "bold", fill: glyph-color, "×"))
      content(( hw + dx, y + dy),
        text(font: font-sans, size: 9pt, weight: "bold", fill: glyph-color, "×"))
    }
  }

  // Output box at the bottom
  let result-y = bot-y - 1.6
  rect(
    (-3.4, result-y - 0.85),
    ( 3.4, result-y + 0.85),
    stroke: (paint: bwp-red, thickness: 1.6pt),
    fill: bwp-red.lighten(85%),
  )
  content((0, result-y + 0.18),
    text(font: font-sans, size: 11pt, weight: "bold", fill: bwp-red, [1 STRONG WEDGE]))
  content((0, result-y - 0.4),
    text(font: font-sans, size: 7pt, fill: ink-soft, [→ first paying customer]))

  // Connector arrow from funnel exit to result
  line(
    (0, bot-y),
    (0, result-y + 0.85),
    stroke: (paint: ink, thickness: 1pt),
    mark: (end: "stealth"),
  )
})

#let bwp-13-idea-funnel = diagram-frame(
  title-text: "From 200 Ideas to 1 Wedge",
  subtitle-text: "A good framework rejects more ideas than it advances.",
  footer-text: "Framework at a Glance",
  [
    #v(0.4em)
    #funnel
  ],
)

// Portrait preview — funnel is tall.
#show: doc => {
  set page(width: 14cm, height: auto, margin: 1.2cm, fill: bg)
  set text(font: font-sans, size: 9pt, fill: ink)
  doc
}
#bwp-13-idea-funnel
