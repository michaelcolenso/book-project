// bwp-08 — Weak Wedge vs Strong Wedge
//
// Brief 6: a high-contrast comparison table that visually teaches what
// "narrow enough" looks like. Weak column is faded/lighter; Strong column
// is bold/darker. Each pair joined by a transformation arrow.

#import "palette.typ": *
#import "styles.typ": *

// ─── Data ────────────────────────────────────────────────────────
#let pairs = (
  (
    "Software for artisan food brands",
    "Compliance navigator for first-time hot sauce sellers in the top 15 states",
  ),
  (
    "AI for resellers",
    "Inventory and tax tracker for part-time eBay and Poshmark sellers",
  ),
  (
    "Better market intelligence",
    "Permit-triggered lead alerts for roofers and solar installers by county",
  ),
)

// ─── Cell helpers ────────────────────────────────────────────────
#let weak-cell(body) = align(left + horizon, block(
  width: 100%,
  inset: (x: 12pt, y: 14pt),
  text(
    font: font-sans,
    size: 10pt,
    weight: "regular",
    fill: ink-faint,
    style: "italic",
    body,
  ),
))

#let strong-cell(body) = align(left + horizon, block(
  width: 100%,
  inset: (x: 12pt, y: 14pt),
  stroke: (left: 2pt + bwp-red),
  text(
    font: font-sans,
    size: 10.5pt,
    weight: "bold",
    fill: ink,
    body,
  ),
))

#let arrow-cell = align(center + horizon, text(
  font: font-sans,
  size: 14pt,
  weight: "bold",
  fill: bwp-red,
  sym.arrow.r,
))

// ─── Header row ──────────────────────────────────────────────────
#let header-row = (
  align(left, text(
    font: font-sans, size: 9pt, weight: "regular", fill: ink-faint,
    upper("Weak wedge"),
  )),
  none,
  align(left, text(
    font: font-sans, size: 9pt, weight: "bold", fill: ink,
    upper("Strong wedge"),
  )),
)

// ─── Table ───────────────────────────────────────────────────────
#let comparison = table(
  columns: (1fr, 36pt, 1.4fr),
  inset: 0pt,
  align: left + horizon,
  stroke: (x, y) => (
    bottom: if y < pairs.len() { 0.4pt + rule-light } else { none },
  ),
  ..header-row,
  ..pairs.map(p => (
    weak-cell(p.at(0)),
    arrow-cell,
    strong-cell(p.at(1)),
  )).flatten(),
)

#let takeaway = block(
  width: 100%,
  above: 1.0em,
  align(center, text(
    font: font-sans, size: 9pt, style: "italic", fill: ink-soft,
    [The narrower version is not smaller in a bad way. It is stronger in a useful way.],
  ))
)

// ─── Final composition ───────────────────────────────────────────
#let bwp-08-weak-vs-strong-wedge = diagram-frame(
  title-text: "Weak Wedge vs. Strong Wedge",
  subtitle-text: "Vague is comfortable. Narrow is sellable.",
  footer-text: "Chapter 6 · From Signal to Wedge",
  [
    #v(0.4em)
    #comparison
    #takeaway
  ],
)

#show: preview
#bwp-08-weak-vs-strong-wedge
