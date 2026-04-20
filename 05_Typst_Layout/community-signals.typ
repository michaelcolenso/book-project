#set page(
  paper: "us-letter",
  margin: (x: 1in, y: 0.95in),
  numbering: "1",
)

#set text(font: ("Libertinus Serif", "New Computer Modern"), size: 11pt, leading: 0.7em)
#set heading(numbering: "1.", font: "Libertinus Sans", weight: "semibold")
#set par(justify: true)
#set block(spacing: 0.8em)
#set quote(block: true, stroke: (left: 2pt + rgb("#274c77")), inset: (x: 0.8em, y: 0.6em), fill: rgb("#f4f8fc"))

#let navy = rgb("#1d3557")
#let blue = rgb("#457b9d")
#let sky = rgb("#a8dadc")
#let cream = rgb("#f9f6ef")
#let ink = rgb("#1f2933")
#let green = rgb("#2a9d8f")
#let amber = rgb("#e9c46a")
#let red = rgb("#e76f51")

#let part-break(title, subtitle: none) = [
  #pagebreak(weak: true)
  #align(center)[
    #v(7em)
    #text(11pt, fill: blue, smallcaps[Part])
    #v(0.5em)
    #text(28pt, weight: "bold", fill: navy)[#title]
    #if subtitle != none {
      #v(1em)
      #text(12pt, fill: ink)[#subtitle]
    }
  ]
  #pagebreak(weak: true)
]

#let signal-card(level, name, desc, color) = rect(
  width: 100%,
  radius: 6pt,
  stroke: 0.8pt + color,
  fill: color.lighten(84%),
  inset: 10pt,
  [#text(10pt, weight: "bold", fill: color)[Level #level — #name]\#desc]
)

#let figure-title(title) = text(9pt, weight: "semibold", fill: blue)[#title]

#align(center)[
  #v(5.5em)
  #text(12pt, fill: blue, tracking: 0.18em)[FIELD MANUAL]
  #v(0.8em)
  #text(38pt, weight: "bold", fill: navy)[COMMUNITY SIGNALS]
  #v(0.8em)
  #text(15pt, fill: ink)[How to Find What People Will Pay For\by Reading Where They Complain]
  #v(2.2em)
  #rect(
    width: 72%,
    inset: 16pt,
    radius: 8pt,
    fill: cream,
    stroke: 0.8pt + blue,
    [#text(10.5pt, fill: ink)[A practical system to separate noise from signal, validate demand, and decide what is worth building right now.]]
  )
  #v(8em)
  #text(10pt, fill: blue)[Edition 1 · 2026]
]

#pagebreak()

= Before You Read This

This is not a founder memoir.

There are no exits here. No origin story about how something started in a garage and ended in a headline. No lessons reverse-engineered from success.

This is a working system for answering a much simpler question:

#quote[What is worth building right now?]

Most founders never answer that question correctly.

They don’t fail because they can’t build. They fail because they build something no one needed badly enough.

The default approach looks like this:

- Brainstorm ideas
- Ask people what they want
- Analyze competitors
- Start building

It feels productive. It produces nothing.

This book replaces that approach with a different one:

- Start with people already struggling
- Read what they say when they’re frustrated
- Identify patterns in their behavior
- Validate before you build

The raw material is already public.

Online communities—Reddit, forums, Slack groups, Discord servers—contain a constant stream of:

- broken workflows
- failed tools
- manual processes
- pricing complaints
- hiring attempts

That is where real opportunities live.

This method teaches you how to:

- separate noise from signal
- identify problems tied to real cost
- recognize when money is already moving
- kill weak ideas before they cost you months
- validate demand using behavior, not opinions

There is no guarantee in this process. There is a filter.

Run it honestly, and you will stop building the wrong thing.

That is the entire promise of this book.

#part-break([I], subtitle: [Signal vs Noise])

= Why People Tell the Truth When They’re Annoyed

Most market research fails for a simple reason: it asks people to imagine behavior instead of observing it.

Surveys ask: _“Would you pay for a better solution?”_

Communities reveal: _“I spent two hours fixing this because nothing works.”_

One is hypothetical. The other is a record of cost.

People rarely lie when they’re annoyed.

They describe:

- what broke
- what they tried
- what didn’t work
- how much time they lost
- how much it’s costing them

In a survey, people perform. In a community, people solve problems. That is what you are mining.

#figure(
  caption: [Figure 1. The Signal Ladder],
  placement: auto,
  [
    #figure-title([From emotion to economics])
    #v(0.4em)
    #grid(columns: 1, gutter: 0.4em,
      signal-card(1, [Noise], [General dissatisfaction, vague preference, emotional reaction without detail. Ignore it.], red),
      signal-card(2, [Friction], [Specific annoyance and visible workaround, but no demonstrated buying behavior yet.], amber),
      signal-card(3, [Operational Pain], [Repeated time or money loss embedded in workflow. Cannot be ignored.], green),
      signal-card(4, [Purchase Intent], [Tool search, budget discussion, hiring behavior, explicit alternatives.], blue),
    )
  ]
)

Rule: Only Levels 3 and 4 are worth building for.

Most founders build at Level 1. Some build at Level 2. Revenue lives at Levels 3 and 4.

== The Two Types of Pain

This distinction kills most otherwise good ideas.

#figure(
  caption: [Figure 2. Pain Type Matrix],
  [
    #figure-title([Natural user behavior decides product format])
    #v(0.35em)
    #table(
      columns: (1fr, 1fr),
      stroke: 0.6pt + rgb("#8ea9c1"),
      fill: (x, y) => if y == 0 { sky.lighten(30%) } else if x == 0 { cream } else { white },
      inset: 8pt,
      [Self-Serve Pain], [Outsource Pain],
      ["I want a tool to solve this."], ["I want someone else to handle this."],
      [Search for software, test workflows, build sheets.], [Hire experts, pay consultants, delegate fully.],
      [Good SaaS or template candidate.], [Usually service-led, not tool-led.],
    )
  ]
)

A problem can have high cost, urgency, and willingness to pay—and still fail as a product if the natural behavior is outsourcing.

== The Buyer Signal Test

Ask one question before you get excited:

#quote[Is the person complaining the person who would pay?]

- Junior employee complaining → weak
- Manager complaining → medium
- Business owner complaining → strong

A problem can be real and still not be monetizable from your current vantage point.

== The Workaround Heuristic

The best opportunities do not look clean. They look like bad systems:

- spreadsheets duct-taped together
- email chains used as process management
- personal shadow systems alongside official tools

These are not hacks. They are unfinished products.

== Loud vs Expensive Problems

Your job is not to find what people talk about.

Your job is to find what they cannot ignore.

#part-break([II], subtitle: [The Extraction System])

= The Minimum Viable Community

A community is worth mining if:

- you can read it freely
- people complain in detail
- tools or spending are mentioned
- users are identifiable
- activity is steady

If two fail, move on.

== The Deep Mine

You are not collecting ideas. You are collecting evidence of repeated failure.

This process runs in three phases.

#figure(
  caption: [Figure 3. Extraction Flow],
  [
    #figure-title([From raw complaint to ranked opportunity])
    #v(0.5em)
    #grid(columns: 3, gutter: 0.6em,
      rect(width: 100%, inset: 10pt, radius: 6pt, fill: rgb("#ecf3fb"), stroke: 0.7pt + blue,
      [#text(weight: "bold", fill: navy)[Phase 1 — Extraction]\Capture exact frustration language, workaround, failed tool, and cost/time clues.]),
      rect(width: 100%, inset: 10pt, radius: 6pt, fill: rgb("#eef8f6"), stroke: 0.7pt + green,
      [#text(weight: "bold", fill: navy)[Phase 2 — Clustering]\Group repeated failures into one-problem/one-product clusters and define persona + alternatives.]),
      rect(width: 100%, inset: 10pt, radius: 6pt, fill: rgb("#fff6e8"), stroke: 0.7pt + amber,
      [#text(weight: "bold", fill: navy)[Phase 3 — Reality Score]\Rank each cluster with weighted factors to decide what deserves validation.]),
    )
  ]
)

=== Phase 1 — Extraction

Search with friction language:

- “why doesn’t”
- “there has to be a better way”
- “frustrated with”
- “anyone know a tool”
- “I’d pay for”
- “workaround”

For each relevant post, capture:

- the exact sentence where frustration peaks
- the workaround being used
- the tool that failed
- any mention of time or cost

Do not summarize. Capture language exactly.

Aim for 200–400 data points.

=== Phase 2 — Clustering

Group problems into clusters where each cluster could be solved by one product.

For each cluster:

- define the problem in customer language
- identify persona
- list existing solutions and failures
- capture verbatim quotes
- estimate willingness to pay

Most datasets produce 8–15 clusters.

=== Phase 3 — The Reality Score

#figure(
  caption: [Figure 4. Weighted Reality Score],
  [
    #table(
      columns: (2fr, 1fr, 3fr),
      stroke: 0.5pt + rgb("#9fb3c8"),
      fill: (x, y) => if y == 0 { sky.lighten(30%) } else { white },
      inset: 7pt,
      [Factor], [Weight], [What it asks],
      [Pain Frequency], [×2], [How often does this cost repeat in real workflows?],
      [Pain Intensity], [×2], [How severe is the operational drag?],
      [Solution Gap], [×1.5], [Do current tools fail on a critical need?],
      [Willingness to Pay], [×2], [Are users already spending or actively seeking options?],
      [Build Feasibility], [×1], [Can you deliver a useful wedge quickly?],
      [Market Access], [×1.5], [Can you reliably reach the buyer?],
      [Defensibility], [×1], [Can insight/data/workflow depth compound?],
      [Buyer Alignment], [×2], [Is the complainer also the payer/decision-maker?],
    )
  ]
)

Interpretation:

- 80+ → validate immediately
- 60–79 → promising but uncertain
- below 60 → move on

This score does not tell you what to build. It tells you what deserves validation.

#part-break([III], subtitle: [Validation (Kill or Commit)])

= Will Strangers Take Action?

A good idea on paper is meaningless.

Validation reduces to one question: will strangers take action?

== Test 1 — Signal Confirmation

Ask the community directly:

“How are you currently handling _[problem]_?”

Strong engagement indicates real pain. No engagement indicates weak signal.

== Test 2 — Intent Capture

Create a one-page landing test with:

- the problem
- the solution
- one action (waitlist or pre-order)

Measure:

- 15%+ waitlist conversion → strong
- 3%+ paid conversion → very strong

== Test 3 — Direct Contact

Reach out to 12 people who posted about the problem.

Goal:

- 4+ responses
- 2+ real conversations

== Optional — Money Test

Attempt a pre-sale. Even a few paid commitments are powerful.

#figure(
  caption: [Figure 5. Validation Readout],
  [
    #grid(columns: 3, gutter: 0.5em,
      rect(inset: 9pt, radius: 6pt, fill: rgb("#ecf8f4"), stroke: 0.8pt + green,
      [#text(weight: "bold", fill: green.darken(35%))[All strong]\Build.]),
      rect(inset: 9pt, radius: 6pt, fill: rgb("#fff8ec"), stroke: 0.8pt + amber,
      [#text(weight: "bold", fill: amber.darken(45%))[Mixed]\Refine and re-test.]),
      rect(inset: 9pt, radius: 6pt, fill: rgb("#fff0ec"), stroke: 0.8pt + red,
      [#text(weight: "bold", fill: red.darken(30%))[Weak]\Kill.]),
    )
  ]
)

Compliments are not validation. Signups are weak validation. Money is validation.

#part-break([IV], subtitle: [What to Ship])

= The Product Shape Rule

The product is implied by the complaint.

#figure(
  caption: [Figure 6. Complaint-to-Format Map],
  [
    #table(
      columns: (2fr, 2fr),
      stroke: 0.5pt + rgb("#95a9bf"),
      fill: (x, y) => if y == 0 { sky.lighten(32%) } else if y % 2 == 0 { rgb("#f8fbff") } else { white },
      inset: 8pt,
      [Complaint], [Likely Product Shape],
      [Manual recurring task], [SaaS],
      [Custom spreadsheet], [Template],
      [Paid human solution], [Service],
      [Information gap], [Guide],
      [Discovery problem], [Directory],
    )
  ]
)

Do not invent the product. Extract it.

== Pricing

Price against cost saved.

- If a problem costs ~$1,000/year, price around $10–50/month.
- If a problem costs ~$10,000/year, price around $100/month.

The value is not in the product. It is in the problem it removes.

== Launching

Launch where the signal came from.

Sequence:

1. Contribute
2. Share insights
3. Build in public
4. Launch

Use customer language, not your own framing.

#part-break([V], subtitle: [Case Files])

= Case 1 — Construction Submittals

- strong operational pain
- clear workaround
- poor existing solutions

→ validates → simple SaaS opportunity

= Case 2 — Tax Tool (Failure)

- high pain
- high stakes

But outsourcing behavior dominates, so software is a mismatch.

→ fails validation

= Case 3 — Vet Tech Templates

- moderate pain
- strong workaround

→ best format is template

= Case 4 — False Positive

- high engagement
- strong complaints

But wrong buyer and low willingness to pay.

→ fails conversion → kill

#pagebreak(weak: true)

= Final Section — The Real Advantage

This is not a one-time method. It is a way of seeing.

Most people skim communities. You are learning to:

- detect patterns
- identify cost
- recognize urgency
- interpret behavior

The advantage is not tools.

The advantage is attention.

#align(center)[
  #v(1.3em)
  #rect(width: 85%, inset: 13pt, radius: 8pt, fill: rgb("#ecf3fb"), stroke: 1pt + blue,
    [#text(12pt, weight: "bold", fill: navy)[Build for problems people are already paying to solve.]])
  #v(0.8em)
  #text(10pt, fill: blue)[Everything else is noise.]
]
