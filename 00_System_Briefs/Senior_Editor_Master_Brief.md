# Senior Editor Master Brief — *Build What Pays*

**Document purpose:** Single source of truth for all contributors (human or agent) working on this manuscript. Read this before touching anything. Every decision made here has a reason. If you disagree with a decision, note it — don't silently override it.

**Canonical manuscript:** `04_Final_Manuscript/Build_What_Pays_Publication_Ready.md`  
**Canonical PDF:** `04_Final_Manuscript/build-what-pays-ilm.pdf`  
**Branch:** `build-what-pays`

---

## 1. The Book in One Sentence

A ruthless scoring system — the Six Filters — that lets solo builders evaluate business ideas before wasting months building the wrong thing.

---

## 2. The Voice Standard

This book has one voice. Every sentence should pass the test: *does it sound like a construction PM who learned to score risk on a job site?*

### What the voice IS

Declarative. Compressed. Slightly aggressive. Trusts the reader. Does not over-explain.

**Real examples from the manuscript — protect these:**

> "A good framework should reject more ideas than it advances. If it blesses everything, it is not a framework. It is a mood board."

> "Hope is not a channel."

> "If no one wants the manual result, software will not save you."

> "Parallel idea pursuit feels productive. Usually it is focus leakage."

> "If you use this book well, it will probably save you from building a few things you currently like. Good. That is cheaper than building them."

> "The most common failure mode is not execution failure. It is selection failure."

**Structural markers of the voice:**
- Short declarative paragraph, often one sentence
- No hedging qualifiers ("can often," "may sometimes," "tends to")
- No citations or external authority ("Forbes says," "research shows")
- No rhetorical throat-clearing ("It is important to note that...")
- Active voice almost exclusively
- When listing, no preamble longer than one sentence

### What the voice IS NOT

Textbook. Citation-heavy. Explanatory for its own sake.

**Red flag phrases — if you write these, stop and rewrite:**
- "Research shows..."
- "According to [source]..."
- "It is also important to..."
- "The benefits are tangible..."
- "can feel counterintuitive"
- "is essential to"
- Anything attributing an idea to another author's framework by name (Eric Ries, Steve Blank, etc.)

**The test:** Read any sentence you write, then read the paragraph starting "A good framework should reject more ideas..." If yours sounds like a different person wrote it, rewrite it.

---

## 3. Current Structure (Publication-Ready Version)

The following is the correct section order. Do not reorder without editor sign-off.

| # | Section | Status |
|---|---------|--------|
| — | Framework at a Glance | ✅ Complete |
| 1 | Why This Book | ✅ Complete |
| 2 | The Idea Trap | ✅ Complete |
| 3 | The Money-First Lens | ✅ Complete |
| 4 | First Customer Before Full Product | ✅ Complete |
| 5 | The Six Filters | ✅ Complete — rubric definitions needed (see Fix Queue) |
| 6 | Kill Signals | ✅ Complete |
| 7 | Three Discovery Engines | ✅ Complete |
| 8 | From Signal to Wedge | ✅ Complete |
| 9 | The 30-Day Validation Sprint | ✅ Complete |
| 10 | How Founders Cheat the Framework | ✅ Complete |
| 11 | Framework in Action (8 examples) | ✅ Good — depth varies, see Fix Queue |
| 12 | When the Framework Gets It Wrong | ✅ Complete |
| 13 | What to Build Next | ✅ Complete |
| 14 | What Comes After the Wedge | ✅ Complete |
| 15 | Extended Pattern Library | ✅ Complete (short-form patterns, intentionally brief) |
| 16 | Conclusion | ✅ Complete |
| A | Appendix A: Opportunity Scorecard | ✅ Complete |
| B | Appendix B: Opportunity Worksheet | ✅ Complete |

**What is NOT in this manuscript and should stay out:**
- Niche Strategy section (cut — redundant with Six Filters)
- Lean Validation / Build-Measure-Learn section (cut — replaced by 30-Day Sprint)
- Tools & Resources appendix (cut — dates instantly)
- Compliance & Risk section (cut — absorbed into Kill Signals)
- Typst markup code (removed)
- Forbes/Medallia/Ries citations (removed)

---

## 4. The Fix Queue

### P1 — Must fix before publication

**[P1-A] Add 1–5 rubric definitions for each of the Six Filters**

*Location:* `## The Six Filters` section  
*Problem:* The scoring bands (26–30, 21–25, etc.) are defined, but individual filter ratings are not. A reader scoring "Buyer Clarity" has no anchor for what 1 vs 3 vs 5 actually means. This makes the framework feel subjective when it shouldn't.  
*Fix:* After each filter's description, add a compact rubric table like:

| Score | What it means |
|-------|--------------|
| 5 | Single-sentence buyer with named trigger: "Solo eBay reseller during tax season" |
| 3 | Demographic without pain trigger: "Small businesses" |
| 1 | Category without buyer: "Anyone who sells things online" |

Do this for all six filters. Keep the same compressed, declarative voice. Each rubric table should be 3–4 rows max (1, 3, 5 — or 1, 2, 4, 5 if gradations matter).

**[P1-B] Add at least one "kill" story to Framework in Action**

*Location:* `## Framework in Action` section — add after the 8 current examples  
*Problem:* All 8 examples are opportunities that survived the filters. The framework is about killing weak ideas — but there's no example of a kill. Readers need to see the system say "no" as much as they need to see it say "yes."  
*Fix:* Add one "Failed Wedge" example. Format identical to the 8 current examples (Buyer / Pain / Wedge / Six Filters Score table / Why it failed). Pick an idea that sounds plausible, scores 14–18, and fails on 2+ kill signals. Show the reasoning. End with the verdict: Kill.  
*Voice note:* "The idea had surface appeal. The market did not."

---

### P2 — Strongly recommended

**[P2-A] Vary narrative depth in Framework in Action examples**

*Location:* `## Framework in Action`, examples 4–8  
*Problem:* Examples 1–3 (SauceStack, FlipTrack, Building Permit Cross-Sell) each have a concrete "The Story" paragraph with a real founding moment. Examples 4–8 have thinner or absent story context.  
*Fix:* Add a 2–3 sentence "The Story" paragraph to any example that lacks one. The format from SauceStack is the model: builder noticed a signal in a community, validated manually, then built. These do not need to be real stories — they should read as plausible, specific archetypes.  
*Do not:* Expand the scoring tables — they're the right length. Add story only.

**[P2-B] Reduce hot sauce example repetition**

*Problem:* The hot sauce / SauceStack example appears across multiple sections (The Money-First Lens, From Signal to Wedge, and the Framework in Action case study). Three appearances is two too many.  
*Fix:* Keep the full case study in Framework in Action. In the other two sections, replace the hot sauce reference with a different example. The permit-alert contractor (example 3) or the FlipTrack reseller are equally strong — use those instead. The reader should feel like the author has a wide range of examples, not one favorite.

**[P2-C] Add worked example to Appendix A: Opportunity Scorecard**

*Location:* `## Appendix A: Opportunity Scorecard`  
*Problem:* The scorecard is a blank template. Readers benefit from seeing it completed.  
*Fix:* Add a single worked example beneath the scoring table — use FlipTrack or the Permit Alert example, show each filter scored with a one-phrase justification per row. 8 lines total. Adds immediate utility without bulk.

---

### P3 — Nice to have

**[P3-A] Chapter-opening micro-epigraphs**

The voice lends itself to one-sentence chapter openers that frame the section before the first paragraph. Several sections already open this way effectively ("Validation is not about certainty. It is about earning the next 30 days."). Consider adding equivalent openers to any section that starts with setup rather than a statement.

**[P3-B] Callout box audit**

The manuscript uses `>` blockquotes for pull-quote callouts. Some add compression ("Hope is not a channel"). Some restate the adjacent paragraph. Do a pass specifically looking at callouts and cut any that echo rather than sharpen.

---

## 5. What "Done" Looks Like

The manuscript is publication-ready when:

- [ ] Six Filters rubric definitions are added (P1-A)
- [ ] One "kill" example exists in Framework in Action (P1-B)
- [ ] No single example appears more than twice across all sections (P2-B)
- [ ] Every Framework in Action example has a "The Story" paragraph (P2-A)
- [ ] Appendix A has a worked example (P2-C)
- [ ] No section sounds like Register B (citations, textbook tone, hedging)
- [ ] A non-builder who reads it can immediately start scoring an idea
- [ ] A builder who reads it feels like the author has actually done this work — not theorized about it

---

## 6. The Commercial Hook

**What this book sells:**

Not inspiration. Not theory. A decision tool. The reader finishes it and immediately uses the scorecard on three ideas they're currently considering.

**Why readers buy it:**

They are already building or about to build. They have more ideas than time. They've wasted months on something that didn't work. They want a system that tells them what to kill.

**Why readers recommend it:**

Because the framework produces a concrete output (a score), the book is *demonstrably useful* in a way most business books are not. A reader can describe the Six Filters to a friend in 90 seconds. That's shareable.

**Comp titles and differentiation:**

| Title | What it is | What BWP isn't |
|-------|-----------|----------------|
| *The Mom Test* (Fitzpatrick) | How to have validation conversations | BWP comes before the conversation — evaluates whether to have it at all |
| *MAKE* (Pieter Levels) | How to build and launch | BWP is about what to build, not how |
| *The Embedded Entrepreneur* (Kahl) | Build audience before product | BWP is opportunity-first, not audience-first |
| *Zero to One* (Thiel) | Philosophy of startup differentiation | BWP is a field tool, not a philosophy |

**The one-sentence pitch:**

> *The Six Filters system that tells you which idea to build, which to backlog, and which to kill — before you write a line of code.*

**Pricing and format:**
- Digital: $19–$29 (impulse-buy range for solo builders)
- Potential: companion scorecard as printable/fillable PDF at same price point or bundled
- Distribution: Gumroad, Lemon Squeezy, or direct — the audience (indie hackers) shops there

---

## 7. Sub-Agent Briefing Template

Copy-paste this when assigning a specific section to any agent:

---

```
You are a line editor and developmental writer working on *Build What Pays*, a practical business book for solo builders.

**Your task:** [DESCRIBE SPECIFIC TASK]

**The voice:** Declarative, compressed, operator-mode. Short sentences. No hedging. No citations. No textbook language. Sound like a construction PM who learned to score risk. When in doubt, ask: does this sound like the person who wrote "A good framework should reject more ideas than it advances. If it blesses everything, it is not a framework. It is a mood board."?

**Scope:** Do not change anything outside the section you are assigned. Do not add sections. Do not reorder the manuscript.

**Working file:** `04_Final_Manuscript/Build_What_Pays_Publication_Ready.md`

**Deliverable:** [SPECIFY — edited section text / new section text / etc.]

**Quality check before submitting:**
- Does every sentence sound like the same person who wrote "Hope is not a channel"?
- Are there any citations to external research? (Remove them)
- Are there any hedging qualifiers? (Remove them)
- Does it add new information, or does it restate something already said? (If restate, cut it)
```

---

## 8. Source Document Index

| Document | Location | What it contains |
|----------|----------|-----------------|
| Canonical manuscript (MD) | `04_Final_Manuscript/Build_What_Pays_Publication_Ready.md` | The book |
| Canonical manuscript (PDF) | `04_Final_Manuscript/build-what-pays-ilm.pdf` | Latest revision PDF |
| Original pre-editorial draft | `03_Raw_Drafts/BWP_Original_Draft.md` | Pre-edit version — reference only |
| Post-editorial revision | `03_Raw_Drafts/BWP_Revised_Draft.md` | Intermediate revision — reference only |
| Publishing house editorial report | `00_System_Briefs/BWP_Editorial_Report.md` | Big-picture market and structural notes |
| Developmental edit memo | `00_System_Briefs/BWP_Editorial_Memo.md` | Line-by-line section notes from senior editor |
| Revision assessment | `00_System_Briefs/BWP_Revision_Assessment.md` | What the last revision got right and wrong |
| This document | `00_System_Briefs/Senior_Editor_Master_Brief.md` | **Governing brief — read first** |

---

*Last updated: April 2026. All contributors: read this document before making changes. If you discover a conflict between this brief and another source document, this brief wins unless you have a specific reason to escalate.*
