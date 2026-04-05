#set page(paper: "us-letter", margin: (top: 0.75in, bottom: 0.75in, left: 0.75in, right: 0.75in), fill: rgb("F5F2EB"))
#set text(font: "IBM Plex Sans", size: 10pt, fill: rgb("1A1A1A"))

#let ink = rgb("1A1A1A")
#let accent = rgb("8B1A1A")
#let gray = rgb("B8B4AC")

#align(center)[
  #text(font: "Barlow Condensed", size: 28pt, weight: "bold")[BUILD WHAT PAYS]
  #v(0.2em)
  #text(font: "Barlow Condensed", size: 14pt, weight: "semibold", fill: accent)[OPPORTUNITY SCORECARD]
]

#v(1em)

#table(
  columns: (2fr, 3fr, 1.2fr),
  stroke: 1pt + gray,
  inset: 8pt,
  [Criterion], [Prompt], [Score 1–5],
  [Buyer clarity], [Can you find the buyer in 5 minutes?], [],
  [Pain severity], [Is this a bleeding neck or a broken nail?], [],
  [Monetization clarity], [Is there proof of spend?], [],
  [Build feasibility], [Can the smallest wedge ship in weeks?], [],
  [Defensibility], [Does it get stickier with use?], [],
  [Distribution realism], [Do you have a believable path to the buyer?], [],
)

#v(1em)
*TOTAL / 30:* __________________

#v(0.8em)
*Interpretation*
- 26–30 = strong build candidate
- 21–25 = good candidate, pressure-test before committing
- 16–20 = backlog or tighten the wedge
- 15 and below = kill unless new evidence appears

#v(0.8em)
*Decision:* BUILD / BACKLOG / KILL
