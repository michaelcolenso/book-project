#import "palette.typ": *
#import "../project.typ": *
#import "typography.typ": *
#import "layout.typ": *
#import "frontmatter.typ": *

#let bwp-cover() = bwp-title-page()

#let bwp-book(doc) = {
  bwp-layout()
  bwp-type()
  bwp-title-page()
  pagebreak()
  bwp-copyright-page()
  pagebreak()
  bwp-contents-page()
  pagebreak()
  doc
}

#let bwp-part(title, subtitle: none) = [
  #pagebreak()
  #text(font: ui-font, size: 11pt, weight: "bold", fill: construction-red)[PART]
  #v(0.5em)
  #text(font: display-font, size: 28pt, weight: "bold", fill: ink)[#title]
  #if subtitle != none [
    #v(0.7em)
    #text(font: ui-font, size: 11pt, fill: warm-gray)[#subtitle]
  ]
  #pagebreak()
]

#let bwp-chapter(title) = [
  #pagebreak(weak: true)
  #text(font: display-font, size: 24pt, weight: "bold", fill: ink)[#title]
  #v(0.25em)
  #line(length: 100%, stroke: 1pt + mid-gray)
  #v(0.8em)
]

#let bwp-callout(body) = block(
  inset: 12pt,
  stroke: (left: 2pt + construction-red),
)[#body]

#let bwp-opportunity-card(title, buyer, pain, wedge, why) = block(
  inset: 12pt,
  stroke: 1.2pt + ink,
)[
  #text(font: display-font, size: 15pt, weight: "bold", fill: ink)[#title]
  #v(0.35em)
  #text(font: ui-font, size: 10pt)[*Buyer:* #buyer]
  #linebreak()
  #text(font: ui-font, size: 10pt)[*Pain:* #pain]
  #linebreak()
  #text(font: ui-font, size: 10pt)[*Wedge:* #wedge]
  #linebreak()
  #text(font: ui-font, size: 10pt)[*Why it works:* #why]
]

#let bwp-pattern-card(title, buyer, pain, wedge) = block(
  inset: 10pt,
  stroke: 1pt + mid-gray,
)[
  #text(font: display-font, size: 13pt, weight: "semibold", fill: ink)[#title]
  #v(0.25em)
  #text(font: ui-font, size: 9.5pt)[*Buyer:* #buyer]
  #linebreak()
  #text(font: ui-font, size: 9.5pt)[*Pain:* #pain]
  #linebreak()
  #text(font: ui-font, size: 9.5pt)[*Wedge:* #wedge]
]

#let bwp-scorecard-page() = [
  #bwp-chapter([Opportunity Scorecard])
  #table(
    columns: (2fr, 3fr),
    stroke: 1pt + mid-gray,
    inset: 8pt,
    [Criterion], [Prompt],
    [Buyer clarity], [Can you find the buyer in 5 minutes?],
    [Pain severity], [Is this a bleeding neck or a broken nail?],
    [Monetization clarity], [Is there proof of spend?],
    [Build feasibility], [Can the smallest wedge ship in weeks?],
    [Defensibility], [Does it get stickier with use?],
    [Distribution realism], [Do you have a believable path to the buyer?],
  )
]

#let bwp-worksheet-page() = [
  #bwp-chapter([One-Page Opportunity Worksheet])
  #table(
    columns: (1.2fr, 3fr),
    stroke: 1pt + mid-gray,
    inset: 8pt,
    [Field], [Value],
    [Working name], [],
    [Buyer], [],
    [Pain], [],
    [Trigger moment], [],
    [Wedge], [],
    [Path to money], [],
    [Fastest way to test], [],
    [Main risk], [],
    [Build / Backlog / Kill], [],
  )
]

#let bwp-diagram-page(path, label: none, scale: 100%) = [
  #pagebreak()
  #align(center)[
    #image(path, width: scale)
  ]
  #if label != none [
    #v(0.35em)
    #align(right)[#text(font: ui-font, size: 8pt, fill: warm-gray)[#label]]
  ]
  #pagebreak()
]
