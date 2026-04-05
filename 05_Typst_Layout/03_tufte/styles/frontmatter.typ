#import "palette.typ": *
#import "typography.typ": *
#import "../project.typ": *

#let bwp-title-page() = align(center + horizon)[
  #v(5.5em)
  #text(font: display-font, size: 34pt, weight: "bold", fill: ink)[BUILD WHAT PAYS]
  #v(0.45em)
  #text(font: display-font, size: 13pt, weight: "semibold", fill: construction-red)[A SOLO BUILDER’S FIELD MANUAL FOR FINDING IDEAS THAT PAY]
  #v(1.2em)
  #text(font: ui-font, size: 11pt, fill: warm-gray)[Michael Colenso]
]

#let bwp-copyright-page() = [
  #align(left)[
    #v(2em)
    #text(font: display-font, size: 18pt, weight: "bold", fill: ink)[Build What Pays]
    #v(1em)
    Copyright © 2026 Michael Colenso \
    All rights reserved. \
    Fonts: IBM Plex Serif, IBM Plex Sans, IBM Plex Mono \
    First Edition, 2026
  ]
]

#let bwp-contents-page() = [
  #outline(title: [Contents])
]
