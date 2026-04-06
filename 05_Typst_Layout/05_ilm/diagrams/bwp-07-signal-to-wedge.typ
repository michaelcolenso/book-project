// bwp-07 — From Signal to Wedge
//
// Chapter 6: a four-stage horizontal flow showing how a raw pain signal
// gets compressed into a shippable wedge. Each stage has a label, a short
// operator question, and a connecting arrow.

#import "palette.typ": *
#import "styles.typ": *

// ─── Data ────────────────────────────────────────────────────────
#let stages = (
  (
    n: "01",
    title: "Pain Signal",
    question: "What is the buyer already losing money, time, or sleep over?",
    color: filter-1,
  ),
  (
    n: "02",
    title: "Narrowest Painful Job",
    question: "What single job inside that pain costs them the most right now?",
    color: filter-2,
  ),
  (
    n: "03",
    title: "First Buyer Moment",
    question: "What trigger forces them to act on it this week, not someday?",
    color: filter-3,
  ),
  (
    n: "04",
    title: "Smallest Product Shape",
    question: "What is the least we can ship that closes that one job credibly?",
    color: bwp-red,
  ),
)

// ─── Stage block ─────────────────────────────────────────────────
#let stage-block(s) = block(
  width: 100%,
  inset: 0pt,
  stroke: 0.6pt + ink,
  fill: s.color.lighten(86%),
  {
    block(width: 100%, height: 5pt, fill: s.color, above: 0pt, below: 0pt)
    block(inset: 10pt, above: 0pt, [
      #text(font: font-sans, size: 7pt, weight: "bold", fill: ink-faint, upper("Stage " + s.n))
      #v(2pt)
      #text(font: font-sans, size: 10pt, weight: "bold", fill: ink, upper(s.title))
      #v(6pt)
      #line(length: 100%, stroke: 0.4pt + rule-light)
      #v(4pt)
      #text(font: font-sans, size: 8pt, style: "italic", fill: ink-soft, s.question)
    ])
  }
)

#let flow-grid = grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: 6pt,
  ..stages.map(stage-block),
)

#let arrows = grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  align: center,
  ..stages.enumerate().map(((i, _)) => {
    if i < stages.len() - 1 {
      text(font: font-sans, size: 14pt, weight: "bold", fill: ink-faint, sym.arrow.r)
    } else {
      text(font: font-sans, size: 14pt, weight: "bold", fill: bwp-red, [✓])
    }
  })
)

#let bwp-07-signal-to-wedge = diagram-frame(
  title-text: "From Signal to Wedge",
  subtitle-text: "A pain signal is not a product. It is evidence.",
  footer-text: "Chapter 6 · From Signal to Wedge",
  [
    #v(0.4em)
    #flow-grid
    #v(0.4em)
    #arrows
  ],
)

#show: preview
#bwp-07-signal-to-wedge
