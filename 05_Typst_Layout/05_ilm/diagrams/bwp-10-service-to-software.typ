// bwp-10 — Service to Software Conversion Path
//
// Chapter 8: a four-step horizontal progression showing how a solo
// builder converts a service-shaped wedge into a software product over
// time. Each step has a label, the operator action, and what gets
// proven before earning the next step.

#import "palette.typ": *
#import "styles.typ": *

// ─── Data ────────────────────────────────────────────────────────
#let steps = (
  (
    n: "01",
    title: "Manual Service",
    action: "Deliver the result by hand for 1–3 paying buyers.",
    proves: "Pain is real and someone will pay.",
    color: filter-1,
  ),
  (
    n: "02",
    title: "Productized Service",
    action: "Fix scope, price, and turnaround. Same result, repeatable.",
    proves: "The job has consistent shape and margin.",
    color: filter-2,
  ),
  (
    n: "03",
    title: "Internal Tooling",
    action: "Automate the boring parts of your own delivery first.",
    proves: "Software speeds up the steps the buyer already values.",
    color: filter-3,
  ),
  (
    n: "04",
    title: "Customer-Facing Software",
    action: "Hand the tools to the buyer; you charge for the outcome.",
    proves: "The wedge survives without you in the loop.",
    color: bwp-red,
  ),
)

// ─── Step helper ─────────────────────────────────────────────────
#let step-block(s) = block(
  width: 100%,
  inset: 0pt,
  stroke: 0.6pt + ink,
  fill: s.color.lighten(86%),
  {
    block(width: 100%, height: 5pt, fill: s.color, above: 0pt, below: 0pt)
    block(inset: 10pt, above: 0pt, [
      #text(font: font-sans, size: 7pt, weight: "bold", fill: ink-faint, upper("Step " + s.n))
      #v(2pt)
      #text(font: font-sans, size: 10pt, weight: "bold", fill: ink, upper(s.title))
      #v(6pt)
      #line(length: 100%, stroke: 0.4pt + rule-light)
      #v(4pt)
      #text(font: font-sans, size: 7pt, weight: "bold", fill: ink-faint, upper("Action"))
      #v(1pt)
      #text(font: font-sans, size: 7.5pt, fill: ink, s.action)
      #v(5pt)
      #text(font: font-sans, size: 7pt, weight: "bold", fill: ink-faint, upper("Proves"))
      #v(1pt)
      #text(font: font-sans, size: 7.5pt, style: "italic", fill: ink-soft, s.proves)
    ])
  }
)

#let flow-grid = grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: 6pt,
  ..steps.map(step-block),
)

#let arrows = grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  align: center,
  ..steps.enumerate().map(((i, _)) => {
    if i < steps.len() - 1 {
      text(font: font-sans, size: 14pt, weight: "bold", fill: ink-faint, sym.arrow.r)
    } else {
      text(font: font-sans, size: 14pt, weight: "bold", fill: bwp-red, [✓])
    }
  })
)

#let takeaway = block(
  width: 100%,
  above: 0.8em,
  align(center, text(
    font: font-sans, size: 9pt, style: "italic", fill: ink-soft,
    [Sell the result. The buyer cares about the outcome, not the architecture.],
  )),
)

#let bwp-10-service-to-software = diagram-frame(
  title-text: "Service to Software",
  subtitle-text: "Get to money first. Let the build follow the proof.",
  footer-text: "Chapter 8 · First Customer Before Full Product",
  [
    #v(0.4em)
    #flow-grid
    #v(0.4em)
    #arrows
    #takeaway
  ],
)

#show: preview
#bwp-10-service-to-software
