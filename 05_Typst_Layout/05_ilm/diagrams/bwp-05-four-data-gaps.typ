// bwp-05 — Four Public-Data Arbitrage Gaps
//
// Chapter 4 (Engine 2): a 2x2 matrix showing the four gap conditions where
// public data arbitrage works — broken interface, weak SEO, hidden
// commercial use, slow refresh. Each cell names the gap, the symptom, and
// the play.

#import "palette.typ": *
#import "styles.typ": *

// ─── Data ────────────────────────────────────────────────────────
#let gaps = (
  (
    n: "01",
    title: "Broken Interface",
    symptom: "The data exists, but the official viewer is unusable.",
    play: "Repackage with search, filters, alerts, and exports.",
  ),
  (
    n: "02",
    title: "Weak SEO",
    symptom: "Records are public, but invisible to people searching for them.",
    play: "Index and rank the records that match real buyer intent.",
  ),
  (
    n: "03",
    title: "Hidden Commercial Use",
    symptom: "Operators do not know the dataset can drive their pipeline.",
    play: "Translate the records into a commercial trigger they recognize.",
  ),
  (
    n: "04",
    title: "Slow Refresh",
    symptom: "The official source updates too slowly to act on.",
    play: "Pull, normalize, and notify faster than the source ever will.",
  ),
)

// ─── Cell helper ─────────────────────────────────────────────────
#let cell(g) = block(
  width: 100%,
  inset: 12pt,
  stroke: 0.6pt + ink,
  fill: white,
  {
    grid(
      columns: (auto, 1fr),
      column-gutter: 10pt,
      align: (left + top, left + top),
      text(font: font-sans, size: 16pt, weight: "bold", fill: bwp-red, g.n),
      [
        #text(font: font-sans, size: 10pt, weight: "bold", fill: ink, upper(g.title))
        #v(4pt)
        #text(font: font-sans, size: 7pt, weight: "bold", fill: ink-faint, upper("Symptom"))
        #v(1pt)
        #text(font: font-sans, size: 8pt, fill: ink-soft, g.symptom)
        #v(5pt)
        #text(font: font-sans, size: 7pt, weight: "bold", fill: ink-faint, upper("Play"))
        #v(1pt)
        #text(font: font-sans, size: 8pt, fill: ink, g.play)
      ],
    )
  }
)

#let matrix = grid(
  columns: (1fr, 1fr),
  column-gutter: 8pt,
  row-gutter: 8pt,
  cell(gaps.at(0)), cell(gaps.at(1)),
  cell(gaps.at(2)), cell(gaps.at(3)),
)

#let common-sources = block(
  width: 100%,
  above: 1em,
  inset: (x: 12pt, y: 8pt),
  stroke: (left: 2pt + bwp-red),
  {
    text(font: font-sans, size: 7pt, weight: "bold", fill: ink-faint, upper("Common sources"))
    v(2pt)
    text(font: font-sans, size: 8pt, fill: ink-soft,
      [Permits · licenses · inspections · complaints · recalls · filings · violations · registrations · procurement records])
  },
)

#let bwp-05-four-data-gaps = diagram-frame(
  title-text: "Four Public-Data Arbitrage Gaps",
  subtitle-text: "Where the data exists but nobody has packaged the value.",
  footer-text: "Chapter 4 · Three Discovery Engines",
  [
    #v(0.4em)
    #matrix
    #common-sources
  ],
)

#show: preview
#bwp-05-four-data-gaps
