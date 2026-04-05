#import "palette.typ": *

#let display-font = ("DejaVu Sans",)
#let body-font = ("Liberation Serif", "DejaVu Serif")
#let ui-font = ("Liberation Sans", "DejaVu Sans")

#let bwp-type() = {
  set text(font: body-font, size: 11pt, fill: ink)
  set par(justify: false, leading: 0.72em)

  show heading.where(level: 1): it => block[
    #v(1.1em)
    #text(font: display-font, size: 24pt, weight: "bold", fill: ink)[#it.body]
    #v(0.25em)
    #line(length: 100%, stroke: 1pt + mid-gray)
    #v(0.6em)
  ]

  show heading.where(level: 2): it => block[
    #v(0.8em)
    #text(font: display-font, size: 16pt, weight: "semibold", fill: ink)[#it.body]
    #v(0.2em)
  ]

  show strong: set text(font: ui-font, weight: "semibold")
}
