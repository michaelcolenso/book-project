// bwp-09 — The 30-Day Validation Sprint Timeline
//
// Brief 3: a horizontal timeline with four weekly blocks. Each block has a
// distinct color (which still reads as monotonic value in grayscale), a
// stage title, an activity list, and an italic success criterion.

#import "palette.typ": *
#import "styles.typ": *

// ─── Data ────────────────────────────────────────────────────────
// Order matches the four-week structure of Chapter 7.
#let weeks = (
  (
    week: "Week 1",
    days: "Days 1–7",
    title: "Verify the pain",
    color: rgb("#2A5270"),    // muted blue (lightest in grayscale)
    activities: (
      "Search communities for complaint patterns",
      "Document current workarounds",
      "Interview 3–5 buyers directly",
      "Write the opportunity memo",
    ),
    criterion: "Can quote specific buyer language and document real costs.",
  ),
  (
    week: "Week 2",
    days: "Days 8–14",
    title: "Test the offer",
    color: rgb("#3F8C8A"),    // muted teal-green
    activities: (
      "Define a specific paid offer",
      "Ship a one-page landing page",
      "Capture email + send to communities",
      "Direct outreach to 10–15 buyers",
    ),
    criterion: "10+ signups or 3+ positive responses.",
  ),
  (
    week: "Week 3",
    days: "Days 15–21",
    title: "Deliver manually",
    color: rgb("#B8872A"),    // muted amber / gold
    activities: (
      "Identify pilot customers",
      "Deliver the manual version",
      "Gather feedback and iterate",
      "Document what buyers actually value",
    ),
    criterion: "At least one pilot actively uses the output.",
  ),
  (
    week: "Week 4",
    days: "Days 22–30",
    title: "Decide brutally",
    color: rgb("#8B1A1A"),    // construction red (darkest)
    activities: (
      "Compile evidence into one doc",
      "Re-score with the Six Filters",
      "Compare against alternatives",
      "Issue a verdict: Build / Backlog / Kill",
    ),
    criterion: "Clear decision with documented rationale.",
  ),
)

// ─── Block helper ────────────────────────────────────────────────
#let week-block(w) = block(
  width: 100%,
  inset: 0pt,
  stroke: 0.6pt + ink,
  fill: w.color.lighten(86%),
  {
    // Top stripe — its own block, full width, no surrounding spacing.
    block(width: 100%, height: 6pt, fill: w.color, above: 0pt, below: 0pt)
    // Inner padding for the rest of the content.
    block(inset: 10pt, above: 0pt, [
      #text(font: font-sans, size: 7pt, fill: ink-faint, upper(w.days))
      #linebreak()
      #text(font: font-sans, size: 8pt, weight: "bold", fill: w.color.darken(15%), upper(w.week))
      #v(2pt)
      #text(font: font-sans, size: 10pt, weight: "bold", fill: ink, upper(w.title))
      #v(6pt)
      #line(length: 100%, stroke: 0.4pt + rule-light)
      #v(4pt)
      #for a in w.activities [
        #text(font: font-sans, size: 7.5pt, fill: ink, sym.bullet)
        #h(3pt)
        #text(font: font-sans, size: 7.5pt, fill: ink-soft, a) \
      ]
      #v(4pt)
      #line(length: 100%, stroke: 0.4pt + rule-light)
      #v(4pt)
      #text(
        font: font-sans, size: 7pt, fill: ink-soft, style: "italic",
        [Output: ] + w.criterion,
      )
    ])
  }
)

// ─── Connector arrow row ─────────────────────────────────────────
#let arrows = grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  align: center,
  ..weeks.enumerate().map(((i, _)) => {
    if i < weeks.len() - 1 {
      text(font: font-sans, size: 14pt, weight: "bold", fill: ink-faint, sym.arrow.r)
    } else {
      text(font: font-sans, size: 14pt, weight: "bold", fill: bwp-red, [✓])
    }
  })
)

// ─── Composition ─────────────────────────────────────────────────
#let timeline-grid = grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: 6pt,
  ..weeks.map(week-block),
)

#let bwp-09-sprint-timeline = diagram-frame(
  title-text: "The 30-Day Validation Sprint",
  subtitle-text: "Validation is not certainty. It is earning the next 30 days.",
  footer-text: "Chapter 7 · The 30-Day Validation Sprint",
  [
    #v(0.4em)
    #timeline-grid
    #v(0.4em)
    #arrows
  ],
)

// Landscape preview override — sprint timeline reads better wide.
#show: doc => {
  set page(width: 24cm, height: auto, margin: 1.2cm, fill: bg)
  set text(font: font-sans, size: 9pt, fill: ink)
  doc
}
#bwp-09-sprint-timeline
