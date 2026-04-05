# Build What Pays — Custom Typst Architecture

## Goal
Create a fully custom Typst production system for **Build What Pays** that matches the book’s established visual language:
- architectural blueprint discipline
- editorial restraint
- condensed display typography
- parchment / near-black / restrained construction-red palette
- reusable, production-safe components for book pages and bundle assets

This is **not** a generic Typst book template.
This is a project-specific publishing system.

---

## 1. Architecture Principles

### 1.1 Design principles
- **Typography first** — layout should feel designed through hierarchy, not decoration.
- **One system, many assets** — book, worksheets, scorecards, and appendix tools should share the same design DNA.
- **Componentized** — repeated structures become functions/macros, not hand-formatted one-offs.
- **Print-safe** — output must survive PDF export cleanly.
- **Mobile-readable** — text and diagrams should still work at reduced zoom.
- **Minimal ornament** — every line, box, and accent must carry structure or meaning.

### 1.2 Typst principles
- use `set` rules for global defaults
- use `show` rules for systematic formatting of headings and recurring elements
- use `let` functions for reusable components
- keep styling separate from content where possible
- avoid a giant single-file mess once the structure stabilizes

---

## 2. Proposed File Structure

```text
build-what-pays/
  main.typ
  project.typ

  styles/
    palette.typ
    typography.typ
    layout.typ
    components.typ
    outline.typ

  frontmatter/
    cover.typ
    titlepage.typ
    contents.typ

  chapters/
    00-introduction.typ
    01-why-this-book.typ
    02-idea-trap.typ
    03-money-first-lens.typ
    04-six-filters.typ
    05-discovery-engines.typ
    06-kill-signals.typ
    07-signal-to-wedge.typ
    08-validation-sprint.typ
    09-first-customer.typ
    10-framework-in-action.typ
    11-what-to-build-next.typ
    12-what-comes-after-the-wedge.typ
    13-conclusion.typ

  appendices/
    a-pattern-library.typ
    b-scorecard.typ
    c-opportunity-worksheet.typ

  assets/
    images/
    diagrams/
    cover/

  output/
    build-what-pays.pdf
```

### Why this structure
- `main.typ` is the render entrypoint
- `project.typ` holds book metadata and configuration
- `styles/` separates design system from manuscript text
- `frontmatter/`, `chapters/`, and `appendices/` keep the book modular
- `assets/` keeps linked media predictable

---

## 3. Core Typst Modules

## 3.1 `project.typ`
Holds metadata and book-level config.

Example responsibilities:
- title
- subtitle
- author
- trim size / paper size
- version
- export profile
- optional ISBN / copyright

Suggested contents:
```typst
#let book-title = [Build What Pays]
#let book-subtitle = [A Solo Builder’s Field Manual for Finding Ideas That Pay]
#let book-author = [Michael Colenso]
#let version = [v1]
#let trim = "8.5in x 11in"
```

## 3.2 `styles/palette.typ`
Single source of truth for color system.

```typst
#let parchment = rgb("F5F2EB")
#let ink = rgb("1A1A1A")
#let construction-red = rgb("8B1A1A")
#let warm-gray = rgb("6B6B6B")
#let light-grid = rgb("D4D0C8")
#let mid-gray = rgb("B8B4AC")
```

## 3.3 `styles/typography.typ`
All font choices, scales, weights, heading systems.

Responsibilities:
- primary display font
- body font
- heading sizes
- tracking rules
- chapter opener treatment
- appendix heading treatment

## 3.4 `styles/layout.typ`
Page geometry and global layout rules.

Responsibilities:
- page size
- page margins
- headers / footers / page numbers
- page breaks
- vertical rhythm helpers
- optional grid helpers for diagrams or worksheet pages

## 3.5 `styles/components.typ`
Most important module.

This should contain reusable document components.

Core components:
- `cover-page()`
- `title-page()`
- `chapter-opener()`
- `callout()`
- `pull-quote()`
- `opportunity-card()`
- `pattern-card()`
- `score-row()`
- `scorecard-page()`
- `worksheet-field()`
- `worksheet-page()`
- `sprint-week-block()`
- `decision-banner()`

## 3.6 `styles/outline.typ`
TOC and outline behavior.

Responsibilities:
- table of contents styling
- appendix listing behavior
- PDF outline consistency
- maybe bookmark depth rules

---

## 4. Page System

## 4.1 Global page setup
Target:
- parchment background
- near-black text
- generous margins
- centered page number in footer or restrained outer footer
- no ornamental chrome

Suggested baseline:
```typst
#set page(
  paper: trim,
  margin: (top: 0.95in, bottom: 0.95in, left: 0.95in, right: 0.95in),
  fill: parchment,
  numbering: "1",
  number-align: bottom + center,
)
```

## 4.2 Rhythm system
Define helpers for repeatable spacing instead of eyeballing every chapter.

Examples:
```typst
#let space-xs = 0.25em
#let space-sm = 0.5em
#let space-md = 0.9em
#let space-lg = 1.4em
#let space-xl = 2em
```

Use them in every heading and component.

---

## 5. Heading / Section Architecture

## 5.1 Levels
Recommended mapping:
- level 1 = main chapter title
- level 2 = internal section title
- level 3 = sub-section / callout heading

## 5.2 Chapter opener system
A chapter opener should not just be a large heading.
It should feel like a new designed object.

Recommended structure:
- page break before each main chapter
- eyebrow line optional
- condensed uppercase chapter title
- thin divider rule
- short opening paragraph spacing reset

Function shape:
```typst
#let chapter-opener(title, eyebrow: none) = [...]
```

Use this instead of raw heading markup for chapter starts if you want maximum control.

---

## 6. Content Components

## 6.1 Callout block
Use for thesis lines, excerptable insight, and hard warnings.

Visual treatment:
- left accent rule in construction red
- parchment or near-white fill
- no rounded corners
- no shadow

## 6.2 Opportunity cards
These are central to the book.
Need two related but different components:

### `opportunity-card()`
For the 5 primary evidence-backed wedges.
Fields:
- title
- buyer
- pain
- wedge
- why it works
- what the framework sees

### `pattern-card()`
For shorter appendix pattern library items.
Fields:
- title
- buyer
- pain
- wedge

The distinction matters because the main-text cards should feel richer and more authoritative.

## 6.3 Scorecard page
Should be built as a dedicated page function, not improvised body content.

Needs:
- title
- six criteria rows
- score boxes 1–5
- total score panel
- interpretation legend
- notes zones

## 6.4 Worksheet page
Must feel printable and useful.

Use:
- labeled rows
- real rules/boxes
- not underscore text

## 6.5 Validation sprint page
Could be one or two pages.

Needs:
- 4 week blocks
- clear objective / tasks / success / failure structure
- red/yellow/green verdict strip if desired

---

## 7. Book Assembly Flow

## 7.1 `main.typ`
The entrypoint should be simple and declarative.

Suggested shape:
```typst
#import "project.typ": *
#import "styles/palette.typ": *
#import "styles/typography.typ": *
#import "styles/layout.typ": *
#import "styles/components.typ": *
#import "styles/outline.typ": *

#show: book-shell.with(
  title: book-title,
  subtitle: book-subtitle,
  author: book-author,
)

#include "frontmatter/cover.typ"
#include "frontmatter/titlepage.typ"
#include "frontmatter/contents.typ"

#include "chapters/00-introduction.typ"
#include "chapters/01-why-this-book.typ"
...
#include "chapters/13-conclusion.typ"

#include "appendices/a-pattern-library.typ"
#include "appendices/b-scorecard.typ"
#include "appendices/c-opportunity-worksheet.typ"
```

## 7.2 `book-shell()` function
This becomes the project’s master wrapper.

Responsibilities:
- page config
- base text styles
- global heading behavior
- shared page numbering
- maybe PDF metadata

This is the Typst equivalent of the project’s publishing shell.

---

## 8. Diagram / Figure Strategy

The current book doesn’t require heavy diagrams to ship, but the architecture should support them.

## 8.1 Diagram policy
- diagrams live as external SVG/PNG assets in `assets/diagrams/`
- placement handled with reusable figure wrappers
- captions styled consistently
- diagrams should follow the visual guide, not template defaults

## 8.2 Figure wrapper function
Create a reusable wrapper for diagrams:
```typst
#let bwp-figure(body, caption: none) = [...]
```

Use it for:
- Six Filters diagram
- Validation sprint timeline
- Wedge flow diagrams
- decision diagrams

---

## 9. Appendix and Toolkit Strategy

The appendices are part of the product, not leftovers.

So build them as intentional tools.

### Appendix A — Pattern Library
- short pattern cards
- faster scan rhythm
- slightly denser layout than main text

### Appendix B — Opportunity Scorecard
- one or two full-page worksheet layouts
- should export as standalone asset too

### Appendix C — Opportunity Worksheet
- same treatment: standalone-capable page

Important principle:
Each appendix tool should be reusable outside the book without redesign.

---

## 10. Production Workflow

## 10.1 Draft workflow
- write/edit markdown or Typst source
- migrate stable chapters into Typst files
- compile continuously with `typst watch`
- tune spacing and hierarchy in components, not chapter-by-chapter hacks

## 10.2 Render workflow
```bash
typst watch main.typ output/build-what-pays.pdf
```

## 10.3 Export targets
Primary:
- PDF book

Secondary:
- standalone PDF worksheets
- PNG exports of key pages for Gumroad previews

---

## 11. Migration Plan from Current State

## Phase 1 — Shell
- finalize `project.typ`
- finalize palette / typography / layout modules
- implement chapter opener, callout, and two card components

## Phase 2 — Book body
- split manuscript into chapter files
- flow full manuscript into Typst
- confirm TOC, pagination, and chapter hierarchy

## Phase 3 — Toolkit
- build scorecard page function
- build worksheet page function
- build validation sprint page function

## Phase 4 — Polish
- tighten white space
- align appendix styling
- export preview pages for sales assets
- compare against current designed PDF

---

## 12. Decision

### Should we use a generic Typst template?
No.

### Should we borrow patterns from Typst templates?
Yes.

### Best architecture choice
A **custom Typst shell** with:
- project-specific palette
- project-specific typography
- reusable book/toolkit components
- modular chapter files
- separate appendix tool pages

That gives us the most control and the best chance of making the Typst output feel like **Build What Pays**, not like a random Typst template.

---

## 13. Immediate Next Build Order

If we’re actually implementing this, build in this order:

1. `project.typ`
2. `styles/palette.typ`
3. `styles/typography.typ`
4. `styles/layout.typ`
5. `styles/components.typ`
   - chapter opener
   - callout
   - opportunity card
   - pattern card
6. `main.typ`
7. first 2 chapters
8. appendix scorecard page
9. appendix worksheet page

That is the shortest path to a credible custom Typst edition.
