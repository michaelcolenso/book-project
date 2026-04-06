// bwp-14 — The Three Discovery Engines
//
// Brief 4: three parallel vertical columns representing repeatable engines
// (not sequential steps), each with a header icon, a list of signal words,
// and a descriptor. All three flow into a shared output bar.

#import "@preview/cetz:0.3.1": canvas, draw
#import "palette.typ": *
#import "styles.typ": *

// ─── Data ────────────────────────────────────────────────────────
#let engines = (
  (
    title: "Money Trails in Communities",
    color: rgb("#2A5270"),    // medium blue
    glyph: "💬",                // forum/speech metaphor (placeholder; iconography is text)
    signals: ("Complaints", "Cost", "Frequency", "Workarounds"),
    descriptor: "What people pay for, hate, or waste time doing.",
  ),
  (
    title: "Public-Data Arbitrage",
    color: rgb("#3F8C8A"),    // teal
    glyph: "🏛",
    signals: ("Permits", "Licenses", "Violations", "Filings"),
    descriptor: "Valuable data with broken interfaces and no packaging.",
  ),
  (
    title: "Workflow Compression",
    color: rgb("#B8872A"),    // amber
    glyph: "⚙",
    signals: ("Spreadsheets", "Copy-Paste", "Manual Tracking", "Email-Based Process"),
    descriptor: "Ugly manual work waiting to be collapsed.",
  ),
)

// ─── Column helper ───────────────────────────────────────────────
#let engine-col(e) = block(
  width: 100%,
  inset: 0pt,
  stroke: 0.6pt + ink,
  fill: e.color.lighten(92%),
  {
    // Header strip
    block(
      width: 100%,
      fill: e.color,
      inset: (x: 8pt, y: 7pt),
      above: 0pt,
      below: 0pt,
      {
        set align(center)
        text(font: font-sans, size: 14pt, fill: white, e.glyph)
        h(6pt)
        text(font: font-sans, size: 9pt, weight: "bold", fill: white, upper(e.title))
      }
    )
    // Signals + descriptor
    block(inset: 12pt, above: 0pt, [
      #for s in e.signals [
        #text(font: font-sans, size: 9pt, weight: "bold", fill: ink, sym.bullet)
        #h(5pt)
        #text(font: font-sans, size: 9pt, weight: "bold", fill: ink, s) \
        #v(2pt)
      ]
      #v(6pt)
      #line(length: 100%, stroke: 0.4pt + rule-light)
      #v(4pt)
      #text(font: font-sans, size: 7.5pt, fill: ink-soft, style: "italic", e.descriptor)
    ])
  }
)

// ─── Convergence bar ─────────────────────────────────────────────
#let convergence = block(
  width: 100%,
  inset: (x: 14pt, y: 12pt),
  fill: ink,
  {
    set align(center)
    text(font: font-sans, size: 11pt, weight: "bold", fill: white,
      upper("Signal → Wedge → First Customer"))
  }
)

// ─── Composition ─────────────────────────────────────────────────
#let columns-grid = grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 10pt,
  ..engines.map(engine-col),
)

// Funnel arrows showing the three columns flowing into the output bar.
#let arrows-row = grid(
  columns: (1fr, 1fr, 1fr),
  align: center,
  ..range(3).map(_ => text(font: font-sans, size: 16pt, fill: ink-faint, sym.arrow.b)),
)

#let bwp-14-discovery-engines = diagram-frame(
  title-text: "The Three Discovery Engines",
  subtitle-text: "Stop asking for ideas. Start running engines.",
  footer-text: "Chapter 4 · Three Discovery Engines",
  [
    #v(0.4em)
    #columns-grid
    #v(0.4em)
    #arrows-row
    #v(0.2em)
    #convergence
  ],
)

// Wide preview for the three-column layout.
#show: doc => {
  set page(width: 22cm, height: auto, margin: 1.2cm, fill: bg)
  set text(font: font-sans, size: 9pt, fill: ink)
  doc
}
#bwp-14-discovery-engines
