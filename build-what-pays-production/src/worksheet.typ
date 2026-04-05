#set page(paper: "us-letter", margin: (top: 0.75in, bottom: 0.75in, left: 0.75in, right: 0.75in), fill: rgb("F5F2EB"))
#set text(font: "IBM Plex Sans", size: 10pt, fill: rgb("1A1A1A"))

#let accent = rgb("8B1A1A")
#let gray = rgb("B8B4AC")

#align(center)[
  #text(font: "Barlow Condensed", size: 28pt, weight: "bold")[BUILD WHAT PAYS]
  #v(0.2em)
  #text(font: "Barlow Condensed", size: 14pt, weight: "semibold", fill: accent)[ONE-PAGE OPPORTUNITY WORKSHEET]
]

#v(1em)

#table(
  columns: (1.5fr, 4fr),
  stroke: 1pt + gray,
  inset: 8pt,
  [Field], [Value],
  [Working name], [],
  [Buyer], [],
  [Pain], [],
  [Current workaround], [],
  [Trigger moment], [],
  [Wedge], [],
  [Why now], [],
  [Path to money], [],
  [Fastest way to test], [],
  [Main risk], [],
  [Build / Backlog / Kill], [],
)

#v(0.8em)
If the buyer is fuzzy, narrow it. If the fastest way to test still sounds like a full product build, the wedge is too broad.
