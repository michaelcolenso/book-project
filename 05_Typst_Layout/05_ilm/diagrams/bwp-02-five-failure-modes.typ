// bwp-02 — The Five Failure Modes of Weak Ideas
//
// Chapter 1: five labeled cards arranged in a 2-3 (or 3-2) grid showing
// the biases that let weak ideas survive — Novelty Bias, Proximity Bias,
// Tool-First Thinking, Compliment Confusion, Scope Intoxication.

#import "palette.typ": *
#import "styles.typ": *

// ─── Data ────────────────────────────────────────────────────────
#let modes = (
  (
    n: "01",
    title: "Novelty Bias",
    body: "Chasing what feels new instead of what is painful. Excitement replaces evidence.",
  ),
  (
    n: "02",
    title: "Proximity Bias",
    body: "Overvaluing the problems you personally find interesting. Familiarity is mistaken for demand.",
  ),
  (
    n: "03",
    title: "Tool-First Thinking",
    body: "Letting the stack lead the strategy. The capability looks for a problem to justify itself.",
  ),
  (
    n: "04",
    title: "Compliment Confusion",
    body: "Treating polite enthusiasm as validation. Cheap praise without committed behavior.",
  ),
  (
    n: "05",
    title: "Scope Intoxication",
    body: "Expanding to a platform before proving the smallest commercial wedge. Ambition as avoidance.",
  ),
)

// ─── Card helper ─────────────────────────────────────────────────
#let card(m) = block(
  width: 100%,
  inset: 12pt,
  stroke: 0.6pt + ink,
  fill: white,
  {
    text(font: font-sans, size: 18pt, weight: "bold", fill: bwp-red, m.n)
    v(2pt)
    line(length: 24pt, stroke: 1pt + bwp-red)
    v(6pt)
    text(font: font-sans, size: 10pt, weight: "bold", fill: ink, upper(m.title))
    v(4pt)
    text(font: font-sans, size: 8pt, fill: ink-soft, m.body)
  }
)

// ─── Composition ─────────────────────────────────────────────────
// Three on top row, two on bottom row centered.
#let top-row = grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 8pt,
  rows: (auto),
  card(modes.at(0)),
  card(modes.at(1)),
  card(modes.at(2)),
)

#let bottom-row = grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  column-gutter: 8pt,
  [], card(modes.at(3)), [], [], card(modes.at(4)), [],
)

#let bwp-02-five-failure-modes = diagram-frame(
  title-text: "Five Failure Modes of Weak Ideas",
  subtitle-text: "Why bad ideas survive long enough to eat six months.",
  footer-text: "Chapter 1 · The Idea Trap",
  [
    #v(0.4em)
    #top-row
    #v(8pt)
    #bottom-row
  ],
)

#show: preview
#bwp-02-five-failure-modes
