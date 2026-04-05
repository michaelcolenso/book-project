#import "@local/eightbyten:0.2.0": *

#show: eightbyten.with(
  title: "Build What Pays",
  authors: ("Michael Colenso",),
  publisher: "A Solo Builder's Field Manual for Finding Ideas That Pay",
  book: true,
  debug: false,
  isbn: "First Edition, 2026",
  repository: none,
  printer-info: "",
  codly-support: false,
  paper: "8in x 10in",
  fonts: (
    serif: "Liberation Serif",
    sans: "Liberation Sans",
    mono: "Liberation Mono",
  )
)

#let bwp-red = rgb("#8B1A1A")

#include "frontmatter.typ"
#include "mainmatter.typ"
#include "backmatter.typ"
