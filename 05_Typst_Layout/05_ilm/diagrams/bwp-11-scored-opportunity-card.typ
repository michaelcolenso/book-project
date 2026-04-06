// bwp-11 — Scored Opportunity Card (worked example)
//
// Chapter 9: a single opportunity card showing the canonical structure of
// a scored wedge — buyer, pain, wedge, then a six-row scoring table with
// filter, score, and reasoning, and a verdict footer. Uses SauceStack as
// the worked example (25/30) so the chapter narrative and the diagram
// stay in sync.

#import "palette.typ": *
#import "styles.typ": *

// ─── Data ────────────────────────────────────────────────────────
#let card-buyer  = "First-time hot sauce entrepreneurs"
#let card-pain   = "State-by-state cottage food confusion, labeling rules, and co-packer uncertainty."
#let card-wedge  = "Compliance navigator plus label requirement checker."

#let filter-rows = (
  ("Buyer Clarity",        5, "Exact profile: first-time hot sauce entrepreneur."),
  ("Pain Severity",        5, "Legal risk, launch delays, potential business failure."),
  ("Monetization Clarity", 4, "Subscription or one-time compliance package."),
  ("Build Feasibility",    5, "Checklists and rule summaries ship fast."),
  ("Defensibility",        3, "Copyable data, but trust + updates create stickiness."),
  ("Distribution Realism", 3, "Communities exist but need active outreach."),
)

#let total-score = 25
#let max-score   = 30
#let verdict     = "BUILD"

// ─── Header ──────────────────────────────────────────────────────
#let header = block(
  width: 100%,
  inset: (x: 14pt, y: 10pt),
  fill: ink,
  above: 0pt, below: 0pt,
  {
    grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      [
        #text(font: font-sans, size: 8pt, weight: "bold", fill: rule-light, upper("Opportunity"))
        #v(2pt)
        #text(font: font-sans, size: 14pt, weight: "bold", fill: white, upper("SauceStack"))
      ],
      [
        #text(font: font-sans, size: 7pt, weight: "bold", fill: rule-light, upper("Six Filters Score"))
        #v(2pt)
        #text(font: font-sans, size: 14pt, weight: "bold", fill: white, str(total-score) + " / " + str(max-score))
      ],
    )
  },
)

// ─── Buyer / Pain / Wedge block ──────────────────────────────────
#let bpw-row(label, body) = grid(
  columns: (3.0cm, 1fr),
  column-gutter: 10pt,
  align: (right + top, left + top),
  text(font: font-sans, size: 7pt, weight: "bold", fill: ink-faint, upper(label)),
  text(font: font-sans, size: 9pt, fill: ink, body),
)

#let bpw-block = block(
  width: 100%,
  inset: 12pt,
  stroke: (bottom: 0.4pt + rule-light),
  {
    bpw-row("Buyer", card-buyer)
    v(5pt)
    bpw-row("Pain", card-pain)
    v(5pt)
    bpw-row("Wedge", card-wedge)
  }
)

// ─── Score row helper ────────────────────────────────────────────
#let score-pill(n) = box(
  width: 18pt, height: 18pt,
  fill: if n >= 5 { band-build } else if n >= 4 { band-test } else if n >= 3 { band-backlog } else { band-kill },
  stroke: 0.4pt + ink,
  inset: 0pt,
  align(center + horizon, text(
    font: font-sans, size: 9pt, weight: "bold", fill: white, str(n),
  )),
)

#let score-row(filter-name, score, reason) = block(
  width: 100%,
  inset: (top: 5pt, bottom: 5pt, left: 12pt, right: 12pt),
  stroke: (bottom: 0.4pt + rule-light),
  {
    grid(
      columns: (3.4cm, 22pt, 1fr),
      column-gutter: 10pt,
      align: (left + horizon, center + horizon, left + horizon),
      text(font: font-sans, size: 8.5pt, weight: "bold", fill: ink, upper(filter-name)),
      score-pill(score),
      text(font: font-sans, size: 8pt, fill: ink-soft, reason),
    )
  }
)

#let score-table = block(
  width: 100%,
  {
    for r in filter-rows {
      score-row(r.at(0), r.at(1), r.at(2))
    }
  }
)

// ─── Verdict footer ──────────────────────────────────────────────
#let verdict-bar = block(
  width: 100%,
  fill: band-build,
  inset: (x: 14pt, y: 10pt),
  above: 0pt, below: 0pt,
  {
    grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      text(font: font-sans, size: 8pt, weight: "bold", fill: white,
        upper("Verdict — strong wedge")),
      text(font: font-sans, size: 11pt, weight: "bold", fill: white, upper(verdict)),
    )
  }
)

// ─── Composition ─────────────────────────────────────────────────
#let card = block(
  width: 100%,
  stroke: 0.8pt + ink,
  fill: white,
  inset: 0pt,
  {
    header
    bpw-block
    score-table
    verdict-bar
  }
)

#let bwp-11-scored-opportunity-card = diagram-frame(
  title-text: "Scored Opportunity Card",
  subtitle-text: "What a strong wedge looks like once the filters do their job.",
  footer-text: "Chapter 9 · Framework in Action",
  [
    #v(0.4em)
    #card
  ],
)

#show: preview
#bwp-11-scored-opportunity-card
