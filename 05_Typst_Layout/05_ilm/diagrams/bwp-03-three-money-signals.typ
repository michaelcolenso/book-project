// bwp-03 — Three Money Signals Worth Taking Seriously
//
// Chapter 2: three columns, each with an icon-style numeral, a signal name,
// a one-line operator question, and a short worked example. The visual
// teaches: spend, mistakes, urgency.

#import "palette.typ": *
#import "styles.typ": *

// ─── Data ────────────────────────────────────────────────────────
#let signals = (
  (
    n: "1",
    title: "Current Spending",
    question: "What are they already paying for, even when they hate it?",
    examples: (
      "Recurring SaaS they resent",
      "Bookkeepers and VAs",
      "Patchwork tools and consultants",
    ),
    color: filter-1,
  ),
  (
    n: "2",
    title: "Costly Mistakes",
    question: "Where do repeated errors leak cash, time, or reputation?",
    examples: (
      "Underpriced custom work",
      "Missed filings and deadlines",
      "Bad vendor or sourcing calls",
    ),
    color: filter-3,
  ),
  (
    n: "3",
    title: "Time-Sensitive Decisions",
    question: "What deadline forces a buying decision now?",
    examples: (
      "Permit, license, inspection windows",
      "Tax-season closeouts",
      "Launch and compliance dates",
    ),
    color: bwp-red,
  ),
)

// ─── Column helper ───────────────────────────────────────────────
#let column(s) = block(
  width: 100%,
  height: 100%,
  inset: 0pt,
  stroke: 0.6pt + ink,
  fill: white,
  {
    // Header strip
    block(
      width: 100%,
      fill: s.color,
      inset: (x: 12pt, y: 8pt),
      above: 0pt, below: 0pt,
      {
        text(font: font-sans, size: 18pt, weight: "bold", fill: white, s.n)
        h(8pt)
        text(font: font-sans, size: 10pt, weight: "bold", fill: white, upper(s.title))
      },
    )
    // Body
    block(inset: 12pt, above: 0pt, {
      text(font: font-sans, size: 8.5pt, style: "italic", fill: ink, s.question)
      v(8pt)
      line(length: 100%, stroke: 0.4pt + rule-light)
      v(6pt)
      text(font: font-sans, size: 7pt, weight: "bold", fill: ink-faint, upper("Where it shows up"))
      v(3pt)
      for ex in s.examples [
        #text(font: font-sans, size: 8pt, fill: ink, sym.bullet)
        #h(4pt)
        #text(font: font-sans, size: 8pt, fill: ink-soft, ex) \
      ]
    })
  }
)

#let columns-grid = grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 8pt,
  ..signals.map(column),
)

#let bwp-03-three-money-signals = diagram-frame(
  title-text: "Three Money Signals",
  subtitle-text: "Money-first ≠ greed-first. It means evidence-first.",
  footer-text: "Chapter 2 · The Money-First Lens",
  [
    #v(0.4em)
    #columns-grid
  ],
)

#show: preview
#bwp-03-three-money-signals
