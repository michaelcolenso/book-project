// bwp-01 — The Opportunity Arbitrage Gap
//
// Introduction visual: two stacked bars showing the gap between value that
// already exists in a market and value that is currently captured. The
// shaded delta in the middle is "opportunity arbitrage" — value that is
// real but poorly surfaced, packaged, or served.

#import "palette.typ": *
#import "styles.typ": *

// ─── Bar helper ──────────────────────────────────────────────────
#let bar(label, sublabel, fill-color, stroke-color, width-frac, text-fill) = block(
  width: 100%,
  inset: 0pt,
  {
    grid(
      columns: (4.4cm, 1fr),
      column-gutter: 10pt,
      align: (right + horizon, left + horizon),
      [
        #text(font: font-sans, size: 9pt, weight: "bold", fill: ink, upper(label)) \
        #text(font: font-sans, size: 7pt, fill: ink-faint, sublabel)
      ],
      block(
        width: width-frac,
        height: 28pt,
        fill: fill-color,
        stroke: 0.8pt + stroke-color,
        inset: (x: 10pt, y: 6pt),
        align(left + horizon, text(
          font: font-sans, size: 8pt, weight: "bold", fill: text-fill,
          upper("value at this layer"),
        )),
      ),
    )
  }
)

// ─── Gap callout ─────────────────────────────────────────────────
#let gap-callout = block(
  width: 100%,
  above: 0.6em,
  below: 0.6em,
  {
    grid(
      columns: (4.4cm, 1fr),
      column-gutter: 10pt,
      align: (right + horizon, left + horizon),
      [
        #text(font: font-sans, size: 9pt, weight: "bold", fill: bwp-red, upper("The arbitrage gap"))
      ],
      block(
        width: 100%,
        inset: (x: 10pt, y: 8pt),
        stroke: (left: 3pt + bwp-red),
        text(
          font: font-sans, size: 9pt, fill: ink,
          [Real demand. Real spending. Real complaints. #text(weight: "bold", fill: bwp-red)[Poorly surfaced, poorly packaged, poorly served.]],
        ),
      ),
    )
  }
)

// ─── Composition ─────────────────────────────────────────────────
#let arbitrage-stack = block(width: 100%, {
  bar(
    "Value that exists",
    "Pain, spending, mistakes, urgency, ugly workarounds",
    band-build.lighten(78%),
    band-build,
    100%,
    band-build.darken(20%),
  )
  v(8pt)
  gap-callout
  v(8pt)
  bar(
    "Value already captured",
    "Existing tools, incumbents, services people tolerate",
    rule-light.lighten(40%),
    ink-soft,
    42%,
    ink-soft,
  )
})

#let footnote-row = block(
  width: 100%,
  above: 1em,
  align(center, text(
    font: font-sans, size: 8pt, style: "italic", fill: ink-soft,
    [The gap is the opportunity. Most builders chase the captured layer instead.],
  )),
)

#let bwp-01-arbitrage-gap = diagram-frame(
  title-text: "The Opportunity Arbitrage Gap",
  subtitle-text: "Value that exists vs. value already captured.",
  footer-text: "Introduction · Build What Pays",
  [
    #v(0.4em)
    #arbitrage-stack
    #footnote-row
  ],
)

#show: preview
#bwp-01-arbitrage-gap
