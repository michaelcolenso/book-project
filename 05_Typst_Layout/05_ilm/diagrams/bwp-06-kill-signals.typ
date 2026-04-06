// bwp-06 — Kill Signals Checklist
//
// Brief 5: a single-page visual checklist styled like a preflight inspection
// card. 10 numbered signal rows with empty checkboxes, then a bordered
// warning box at the bottom.

#import "palette.typ": *
#import "styles.typ": *

// ─── Data ────────────────────────────────────────────────────────
#let signals = (
  ("Buyer is blurry",
   "Cannot say exactly who this is for in one sentence."),
  ("Smells like a feature, not a product",
   "No standalone buying trigger; only works as an add-on."),
  ("Path to money is hand-wavy",
   "“Maybe ads,” “maybe marketplace later” are not monetization plans."),
  ("Pain is polite, not painful",
   "No urgency, cost, embarrassment, or operational consequence."),
  ("Distribution is wishful",
   "No believable path to the buyer beyond hope."),
  ("Wedge is too broad",
   "First version tries to serve the whole category."),
  ("Cannot reach the buyer",
   "Trust barriers, procurement cycles, or domain constraints block access."),
  ("Needs too much before it can prove anything",
   "Requires heavy infrastructure, integrations, or polished UX before validation."),
  ("Legally contaminated",
   "Path depends on legal gray zones or high-liability behavior."),
  ("Excited about tooling, not market",
   "The stack is the real draw, not the buyer’s pain."),
)

// ─── Row layout ──────────────────────────────────────────────────
#let row(idx, label, sub) = block(
  width: 100%,
  inset: (top: 5pt, bottom: 5pt, left: 0pt, right: 0pt),
  stroke: (bottom: 0.4pt + rule-light),
  {
    grid(
      columns: (12pt, 18pt, 1fr),
      column-gutter: 8pt,
      align: (left + horizon, left + horizon, left),
      // empty checkbox
      box(width: 10pt, height: 10pt, stroke: 0.8pt + ink, fill: white),
      // index numeral
      text(font: font-sans, size: 8pt, weight: "bold", fill: ink-faint, str(idx) + "."),
      // label + descriptor
      [
        #text(font: font-sans, size: 9pt, weight: "bold", fill: ink, upper(label)) \
        #text(font: font-sans, size: 7.5pt, fill: ink-soft, sub)
      ],
    )
  }
)

// ─── Warning box ─────────────────────────────────────────────────
#let warning = block(
  width: 100%,
  inset: 10pt,
  stroke: 1.4pt + bwp-red,
  fill: white,
  {
    set align(center)
    text(font: font-sans, size: 9pt, weight: "bold", fill: bwp-red,
      upper("Two or more checked = reshape or abandon before this eats six months."))
  }
)

// ─── Final composition ───────────────────────────────────────────
#let bwp-06-kill-signals = diagram-frame(
  title-text: "Kill Signals — Check Before You Build",
  subtitle-text: "Bad ideas leak weakness early. Run the list before you commit.",
  footer-text: "Chapter 5 · Kill Signals",
  [
    #v(0.4em)
    #for (i, sig) in signals.enumerate() {
      row(i + 1, sig.at(0), sig.at(1))
    }
    #v(0.8em)
    #warning
  ],
)

#show: preview
#bwp-06-kill-signals
