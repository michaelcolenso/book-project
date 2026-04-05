# Build What Pays
## The Six-Filters System for Finding Business Ideas That Actually Work

**A practical field manual for solo builders who want to find, evaluate, and validate business ideas before wasting time on the wrong ones.**

---

## What This Is

A non-fiction business book for solo builders, indie hackers, and bootstrappers. Not theory. A compressed operating system for idea evaluation built from 200+ scored opportunities.

The core thesis: most builders fail from **selection failure**, not execution failure. They build the wrong thing. This book fixes that.

## The Framework

**The Six Filters** — Rate every opportunity 1–5:
1. Buyer Clarity
2. Pain Severity
3. Monetization Clarity
4. Build Feasibility
5. Defensibility
6. Distribution Realism

**Scoring:** 26–30 = Build | 21–25 = Test the wedge | 16–20 = Backlog | ≤15 = Kill

**The Three Discovery Engines:** Money Trails · Public-Data Arbitrage · Workflow Compression

**The 30-Day Validation Sprint:** Verify Pain → Test Offer → Deliver Manually → Decide Brutally

## Repository Structure

```
/00_System_Briefs/     — Editorial reports, memos, revision notes, manuscript ruleset
/01_Research_Data/     — Opportunity databases, CSVs, opportunity-hunts sessions
/02_Chapter_Outlines/  — Beat-sheets before prose (archived; outlines folded into drafts)
/03_Raw_Drafts/        — Versioned drafts in chronological order (see timeline below)
  /01_early-concept/   — Rough opportunity-OS notes (pre-book)
  /02_opportunity-arbitrage/ — "The Opportunity Arbitrage Playbook" working drafts + HTML
  /03_build-what-pays-working/ — Transition drafts once title solidified
  BWP_Original_Draft.md       — Pre-editorial full manuscript
  BWP_Revised_Draft.md        — Post-editorial revision
  build-what-pays-v2.pdf      — PDF snapshot of v2
/04_Final_Manuscript/  — Publication-ready content + canonical PDF
/05_Typst_Layout/      — Layout experiments (chronological: claude-base → eightbyten → tufte → marginalia → ilm)
  /01_claude-base/     — First typst import (original source material)
  /02_eightbyten/      — 8×10 structured format attempt
  /03_tufte/           — Tufte-style layout experiment
  /04_marginalia/      — Marginalia layout (v1–v5 refinement iterations)
  /05_ilm/             — ILM format — final production layout (canonical source)
  /docs/               — Typst architecture notes, cheat sheets, audit docs
/06_Marketing/         — Gumroad packages, sales pages, ghost offer templates
/07_Tools_Templates/   — Standalone reader tools: scorecard, worksheet, sprint template
/build-what-pays-production/ — Diagrams, print-ready supplements (scorecard PDF, sprint PDF, worksheet PDF)
/opportunity-radar/    — Python tool for live opportunity discovery and scoring
```

## Development Timeline

| Phase | When | Key Files |
|-------|------|-----------|
| 1. Concept notes | Mar 2026 | `03_Raw_Drafts/01_early-concept/opportunity-os-v1.md` |
| 2. "Opportunity Arbitrage Playbook" | Mar 2026 | `03_Raw_Drafts/02_opportunity-arbitrage/` |
| 3. Typst layout experiments | Mar–Apr 2026 | `05_Typst_Layout/01_claude-base/` → `05_ilm/` |
| 4. "Build What Pays" title solidifies | Apr 2026 | `03_Raw_Drafts/03_build-what-pays-working/` |
| 5. Pre-editorial manuscript | Apr 2026 | `03_Raw_Drafts/BWP_Original_Draft.md` |
| 6. Editorial review | Apr 2026 | `00_System_Briefs/BWP_Editorial_Report.md`, `BWP_Editorial_Memo.md` |
| 7. Revision + assessment | Apr 2026 | `03_Raw_Drafts/BWP_Revised_Draft.md`, `00_System_Briefs/BWP_Revision_Assessment.md` |
| 8. Publication-ready | Apr 2026 | `04_Final_Manuscript/Build_What_Pays_Publication_Ready.md` + `build-what-pays-ilm.pdf` |

## Current Manuscript Files

| File | Location | Notes |
|------|----------|-------|
| `Build_What_Pays_Publication_Ready.md` | `04_Final_Manuscript/` | Latest polished manuscript |
| `build-what-pays-ilm.pdf` | `04_Final_Manuscript/` | **Canonical latest revision (PDF)** |
| `BWP_Revised_Draft.md` | `03_Raw_Drafts/` | Post-editorial revision |
| `BWP_Original_Draft.md` | `03_Raw_Drafts/` | Pre-editorial original |
| `BWP_Editorial_Report.md` | `00_System_Briefs/` | Full publishing house review |
| `BWP_Editorial_Memo.md` | `00_System_Briefs/` | Line-by-line revision notes |
| `BWP_Revision_Assessment.md` | `00_System_Briefs/` | What the revision got right/wrong |

## Status

**Current phase:** Post-editorial revision — manuscript is publication-ready with targeted improvements pending.

**Priority actions remaining (from editorial review):**

**Execution plan:** see `00_System_Briefs/BWP_Shipping_Plan.md` for delegated owners, dates, quality gates, and launch readiness checklist.
- [x] Restore "Good. That is cheaper than building them." closing lines
- [x] Restore three-deliverable structural promise in Introduction
- [x] Add two-sentence bridge before 30-Day Sprint
- [x] Expand example wedges with filter-by-filter scoring
- [x] Add scoring rubrics (1–5 definitions) for each filter

---

*Built in public with AI + Git. The manuscript moves through the pipeline the same way software ships.*
