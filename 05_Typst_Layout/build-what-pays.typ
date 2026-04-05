// Build What Pays — Typst starter template

#let parchment = rgb("F5F2EB")
#let ink = rgb("1A1A1A")
#let accent = rgb("8B1A1A")
#let warm-gray = rgb("6B6B6B")
#let light-grid = rgb("D4D0C8")
#let mid-gray = rgb("B8B4AC")

#set page(
  paper: "us-letter",
  fill: parchment,
  margin: (top: 0.9in, bottom: 0.9in, left: 0.9in, right: 0.9in),
  numbering: "1",
  number-align: bottom + center,
)

#set text(
  font: "IBM Plex Sans",
  size: 10pt,
  fill: ink,
)

#set par(justify: false, leading: 0.68em)

#show heading.where(level: 1): it => block[
  #v(1.2em)
  #text(font: "Barlow Condensed", size: 22pt, weight: "bold", tracking: 0.03em, fill: ink)[#upper(str(it.body))]
  #v(0.45em)
]

#show heading.where(level: 2): it => block[
  #v(0.8em)
  #text(font: "Barlow Condensed", size: 15pt, weight: "semibold", tracking: 0.04em, fill: ink)[#upper(str(it.body))]
  #v(0.25em)
]

#let rule() = line(length: 100%, stroke: 1pt + mid-gray)

#let callout(body) = block(
  inset: 12pt,
  stroke: (left: 2pt + accent),
  fill: white.lighten(85%),
)[#body]

#let opportunity-card(title, buyer, pain, wedge, why) = block(
  inset: 12pt,
  stroke: 1.2pt + ink,
  fill: white.lighten(90%),
)[
  #text(font: "Barlow Condensed", size: 15pt, weight: "bold", tracking: 0.05em)[#upper(title)]
  #v(0.4em)
  *Buyer:* #buyer \
  *Pain:* #pain \
  *Wedge:* #wedge \
  *Why it works:* #why
]

#align(center)[
  #v(6em)
  #text(font: "Barlow Condensed", size: 34pt, weight: "bold", tracking: 0.04em, fill: ink)[BUILD WHAT PAYS]
  #v(0.5em)
  #text(font: "Barlow Condensed", size: 14pt, weight: "semibold", tracking: 0.08em, fill: accent)[A SOLO BUILDER'S FIELD MANUAL FOR FINDING IDEAS THAT PAY]
  #v(1.5em)
  #text(size: 11pt, fill: warm-gray)[Michael Colenso]
]

#pagebreak()

= Introduction

Most builders do not fail because they cannot execute. They fail because they choose weak ideas, validate too late, and confuse interest with demand.

#callout[
The strongest early signal is not, “People care about this topic.” It is, “People are already paying, losing money, or burning serious time because this problem is unresolved.”
]

= Framework in Action

#opportunity-card(
  "SauceStack",
  [first-time hot sauce entrepreneurs],
  [state-by-state cottage food confusion, labeling requirements, and co-packer uncertainty],
  [compliance navigator plus label requirement checker],
  [clear buyer, urgent trigger, obvious willingness to pay],
)
