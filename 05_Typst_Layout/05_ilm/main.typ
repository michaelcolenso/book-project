#import "../build-what-pays-ilm-template/lib.typ": *
#import "@preview/marginalia:0.3.1"

#show: marginalia.setup.with(
  book: false,
  outer: (width: 4.6cm, sep: 0.6cm)
)

#show: ilm.with(
  title: [Build What Pays],
  authors: "Michael Colenso",
  date: datetime(year: 2026, month: 04, day: 03),
  abstract: [A Solo Builder's Field Manual for Finding Ideas That Pay],
  figure-index: (enabled: false),
  table-index: (enabled: false),
  listing-index: (enabled: false)
)

#let bwp-red = rgb("#8B1A1A")

#include "frontmatter.typ"
#include "mainmatter.typ"
#include "backmatter.typ"
