#import "@preview/marginalia:0.3.1" as marginalia: note, notefigure, wideblock

#set page(width: 8in, height: 10in, fill: rgb("#F5F2EB"))
#show: marginalia.setup.with(
  book: true,
  inner: (far: 0.9in, width: 0pt, sep: 0pt),
  outer: (far: 0.45in, width: 1.65in, sep: 0.25in),
  top: 0.8in,
  bottom: 0.9in,
  clearance: 10pt,
)

#let parchment = rgb("#F5F2EB")
#let ink = rgb("#1A1A1A")
#let construction-red = rgb("#8B1A1A")
#let bwp-red = construction-red
#let warm-gray = rgb("#6B6B6B")
#let light-grid = rgb("#D4D0C8")
#let mid-gray = rgb("#B8B4AC")

#let display-font = ("DejaVu Sans",)
#let body-font = ("Liberation Serif", "DejaVu Serif")
#let ui-font = ("Liberation Sans", "DejaVu Sans")
#let mono-font = ("Liberation Mono", "DejaVu Sans Mono")

#set text(font: body-font, size: 10.9pt, fill: ink)
#set par(justify: true, leading: 0.74em)
#set heading(numbering: none)
#show strong: set text(font: ui-font, weight: "semibold")

#let note = note.with(
  numbering: marginalia.note-numbering.with(repeat: false, markers: ()),
  anchor-numbering: auto,
  text-style: (size: 8.8pt, fill: warm-gray),
  par-style: (leading: 0.48em, spacing: 0.85em),
)

#set page(
  header: context {
    let chapter_page = query(selector(heading.where(level: 1))).any(h => h.location().page() == here().page())
    if here().page() > 1 and not chapter_page {
      let chap = bwp-current-chapter.get()
      let sec = bwp-current-section.get()
      let page-num = counter(page).display()
      let left = if calc.even(here().page()) {
        [#text(font: ui-font, size: 8pt, tracking: 0.05em, fill: warm-gray)[#page-num]]
      } else {
        [#text(font: ui-font, size: 8pt, tracking: 0.05em, fill: warm-gray)[#upper(chap.at("eyebrow", default: ""))]]
      }
      let center = if calc.even(here().page()) {
        [#text(font: ui-font, size: 8pt, tracking: 0.03em, fill: warm-gray)[#upper(chap.at("title", default: ""))]]
      } else if sec != none {
        [#text(font: ui-font, size: 8pt, tracking: 0.03em, fill: warm-gray)[#sec]]
      } else { [] }
      let right = if calc.even(here().page()) {
        []
      } else {
        [#text(font: ui-font, size: 8pt, tracking: 0.05em, fill: warm-gray)[#page-num]]
      }
      marginalia.header(text-style: (font: ui-font), left, center, right)
    }
  },
  footer: none,
)

#let bwp-current-chapter = state("bwp-current-chapter", (title: "", eyebrow: ""))
#let bwp-current-section = state("bwp-current-section", none)
#let bwp-chapter-counter = counter("bwp-chapter")
#let bwp-appendix-counter = counter("bwp-appendix")

#let toc() = outline(title: [Contents])
#let frontmatter(body) = [
  #set page(numbering: "i")
  #body
  #pagebreak()
]
#let mainmatter(body) = [
  #set page(numbering: "1")
  #counter(page).update(1)
  #body
]
#let backmatter(body) = [
  #set page(numbering: "1")
  #body
]
#let part(title) = [
  #pagebreak(to: "odd")
  #set page(header: none)
  #v(14%)
  #text(font: ui-font, size: 9pt, tracking: 0.09em, weight: "bold", fill: construction-red)[PART]
  #v(0.38em)
  #text(font: display-font, size: 27pt, weight: "bold", fill: ink)[#title]
  #v(0.42em)
  #line(length: 100%, stroke: 1.1pt + construction-red)
  #v(1.0em)
  #pagebreak(to: "odd")
]
#let appendix-part(title) = part(title)
#let special-appendix(title) = appendix(title)
#let chapter(title, eyebrow: none, numbering: auto, outlined: true) = context {
  let chapnum = none
  let label = eyebrow
  if numbering != none {
    bwp-chapter-counter.step()
    chapnum = bwp-chapter-counter.get().first()
    if label == none {
      label = "Chapter " + str(chapnum)
    }
  }
  bwp-current-chapter.update((title: title, eyebrow: label))
  bwp-current-section.update(none)
  heading(level: 1, outlined: outlined, numbering: none)[#title]
}
#let appendix(title, outlined: true) = context {
  bwp-appendix-counter.step()
  let appnum = bwp-appendix-counter.get().first()
  let label = "Appendix " + str(appnum)
  bwp-current-chapter.update((title: title, eyebrow: label))
  bwp-current-section.update(none)
  heading(level: 1, outlined: outlined, numbering: none)[#title]
}
#let section(title) = [
  #bwp-current-section.update(title)
  #heading(level: 2, outlined: true, numbering: none)[#title]
]
#let subsection(title) = [
  #heading(level: 3, outlined: true, numbering: none)[#title]
]
#let subsubsection(title) = [
  #heading(level: 4, outlined: true, numbering: none)[#title]
]

#show heading.where(level: 1): it => context [
  #pagebreak(to: "odd")
  #v(9%)
  #let meta = bwp-current-chapter.get()
  #if meta.at("eyebrow", default: none) != none [
    #text(font: ui-font, size: 9pt, tracking: 0.09em, weight: "bold", fill: construction-red)[#upper(meta.at("eyebrow"))]
    #v(0.42em)
  ]
  #text(font: display-font, size: 25pt, weight: "bold", fill: ink)[#it.body]
  #v(0.34em)
  #line(length: 100%, stroke: 1.1pt + construction-red)
  #v(1.35em)
]

#show heading.where(level: 2): it => [
  #v(0.9em)
  #text(font: ui-font, size: 10.2pt, tracking: 0.03em, weight: "bold", fill: ink)[#it.body]
  #v(0.22em)
]
#show heading.where(level: 3): it => [
  #v(0.6em)
  #text(font: ui-font, size: 9.4pt, weight: "semibold", fill: construction-red)[#it.body]
  #v(0.15em)
]
#show heading.where(level: 4): it => [
  #v(0.45em)
  #text(font: ui-font, size: 9pt, weight: "semibold", fill: ink)[#it.body]
  #v(0.1em)
]


#let bwp-diagram-page(path, label: none) = [
  #pagebreak()
  #set page(margin: 1in, header: none, footer: none)
  #align(center + horizon)[
    #image(path, width: 100%)
    #if label != none [
      #v(0.5em)
      #align(right)[#text(font: ui-font, size: 8pt, fill: warm-gray)[#label]]
    ]
  ]
  #pagebreak()
]
