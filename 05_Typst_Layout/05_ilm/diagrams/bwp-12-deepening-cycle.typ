// bwp-12 — The Deepening Cycle
//
// Chapter 11: four post-wedge moves arranged as a clockwise cycle —
// Productize, Increase Frequency, Expand Adjacently, Deepen Workflow.
// The center contains the discipline that holds the cycle together:
// stay with the buyer, the trigger, and the painful job.

#import "palette.typ": *
#import "styles.typ": *

// ─── Data ────────────────────────────────────────────────────────
// Order is clockwise starting at the top.
#let moves = (
  (
    title: "Productize",
    sub: "Turn the manual result into a packaged version.",
    color: filter-1,
  ),
  (
    title: "Increase Frequency",
    sub: "Make recurring use easier and more automatic.",
    color: filter-3,
  ),
  (
    title: "Expand Adjacently",
    sub: "Only after the first buyer is fully working.",
    color: filter-4,
  ),
  (
    title: "Deepen Workflow",
    sub: "Go further into the painful job before going broader.",
    color: bwp-red,
  ),
)

// ─── Geometry ────────────────────────────────────────────────────
// We render the cycle as a 2x2 grid with a center marker, plus arrows
// drawn with cetz between cell centers. The grid keeps text legible at
// any size; cetz handles the directional arrows.

#let move-cell(m) = block(
  width: 100%,
  inset: 0pt,
  stroke: 0.6pt + ink,
  fill: m.color.lighten(86%),
  {
    block(width: 100%, height: 5pt, fill: m.color, above: 0pt, below: 0pt)
    block(inset: 12pt, above: 0pt, [
      #text(font: font-sans, size: 10pt, weight: "bold", fill: ink, upper(m.title))
      #v(4pt)
      #line(length: 100%, stroke: 0.4pt + rule-light)
      #v(4pt)
      #text(font: font-sans, size: 8pt, fill: ink-soft, m.sub)
    ])
  }
)

#let arrow-symbol(sym-arrow, color: bwp-red) = align(center + horizon,
  text(font: font-sans, size: 16pt, weight: "bold", fill: color, sym-arrow),
)

// Top row: Productize → Increase Frequency
// Bottom row: Deepen Workflow ← Expand Adjacently
// (clockwise: TL → TR → BR → BL → TL)
#let cycle-grid = grid(
  columns: (1fr, 24pt, 1fr),
  rows: (auto, 24pt, auto),
  column-gutter: 4pt,
  row-gutter: 4pt,
  // top row
  move-cell(moves.at(0)),
  arrow-symbol(sym.arrow.r),
  move-cell(moves.at(1)),
  // middle row (down arrows on the sides, center label)
  arrow-symbol(sym.arrow.t, color: ink-faint),
  align(center + horizon, text(
    font: font-sans, size: 7pt, style: "italic", fill: ink-soft,
    [stay with the buyer],
  )),
  arrow-symbol(sym.arrow.b),
  // bottom row
  move-cell(moves.at(3)),
  arrow-symbol(sym.arrow.l),
  move-cell(moves.at(2)),
)

#let takeaway = block(
  width: 100%,
  above: 1em,
  align(center, text(
    font: font-sans, size: 9pt, style: "italic", fill: ink-soft,
    [Deepen the hold. Do not start over with a bigger fantasy.],
  )),
)

#let bwp-12-deepening-cycle = diagram-frame(
  title-text: "The Deepening Cycle",
  subtitle-text: "What to do after the wedge works — without exploding scope.",
  footer-text: "Chapter 11 · What Comes After the Wedge",
  [
    #v(0.4em)
    #cycle-grid
    #takeaway
  ],
)

#show: preview
#bwp-12-deepening-cycle
