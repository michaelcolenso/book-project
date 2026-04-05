#set page(paper: "us-letter", margin: (top: 0.75in, bottom: 0.75in, left: 0.75in, right: 0.75in), fill: rgb("F5F2EB"))
#set text(font: "IBM Plex Sans", size: 10pt, fill: rgb("1A1A1A"))

#let accent = rgb("8B1A1A")
#let gray = rgb("B8B4AC")

#align(center)[
  #text(font: "Barlow Condensed", size: 28pt, weight: "bold")[BUILD WHAT PAYS]
  #v(0.2em)
  #text(font: "Barlow Condensed", size: 14pt, weight: "semibold", fill: accent)[30-DAY VALIDATION SPRINT]
]

#v(0.8em)

#table(
  columns: (1.1fr, 3fr),
  stroke: 1pt + gray,
  inset: 8pt,
  [Week], [Objective / Tasks],
  [Week 1], [Verify the pain. Collect complaint threads, money-spent statements, ugly workarounds, and trigger moments.],
  [Week 2], [Test the offer. Create a narrow promise and put it in front of real buyers.],
  [Week 3], [Deliver manually. Use a report, checklist, alert feed, spreadsheet, or service version before building software.],
  [Week 4], [Decide brutally. BUILD, BACKLOG, or KILL based on evidence, not attachment.],
)

#v(0.8em)
*Green light:* buyers engage seriously and want recurrence.  \
*Yellow light:* the signal is real but the shape is wrong.  \
*Red light:* no real buyer motion; kill it and return to the engines.
