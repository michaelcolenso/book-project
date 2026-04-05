# Build What Pays — Tufte Customization Plan

## Decision
Use the Tufte-style Typst template as the **reading shell**, then override the parts that need stronger **Build What Pays** identity.

This is a hybrid approach.

### Keep from Tufte
- calm page rhythm
- elegant margins
- readable body text
- serious “book” feel
- mature frontmatter / pagination behavior
- general chapter flow

### Override for Build What Pays
- title page
- cover treatment
- chapter opener typography
- accent color system
- opportunity card layouts
- worksheet / scorecard pages
- validation sprint page
- appendix tool pages
- any decision banners or callouts

---

## Core Design Principle
The body should read like a serious nonfiction book.
The tools should feel like an operator manual.

That means:
- **Tufte for reading**
- **Build What Pays custom system for doing**

---

## 1. Typography Plan

## Keep
- serif body text for long reading sections if the template supports it well
- clean sans for labels, captions, and utility text

## Change
### Display / chapter typography
Replace generic Tufte heading style with:
- **Barlow Condensed Bold/Semibold** or equivalent condensed industrial sans
- uppercase chapter openers
- slightly increased tracking
- stronger chapter break presence

### Body pairing
Recommended pairings:
- **Body:** IBM Plex Serif or Source Serif
- **Utility / labels:** IBM Plex Sans or DM Sans
- **Display:** Barlow Condensed

## Goal
Preserve Tufte readability, but make the structural typography feel more engineered and less academic.

---

## 2. Color Plan

Default Tufte templates are usually too neutral.
We should add a restrained Build What Pays palette.

### Palette
- Parchment: `#F5F2EB`
- Near Black: `#1A1A1A`
- Construction Red: `#8B1A1A`
- Warm Gray: `#6B6B6B`
- Light Grid: `#D4D0C8`
- Mid Gray: `#B8B4AC`

## Rules
- red appears sparingly
- near black carries all structural weight
- no gradients, no glow, no glossy UI treatment

## Use red for
- chapter accent marks
- pull-quote rule
- one decision indicator per tool page
- selected appendix/tool labels

---

## 3. What to Customize First

## A. Cover / title page
Do not use default Tufte title behavior.

Use custom Build What Pays cover treatment:
- large condensed title
- restrained subtitle block
- off-white background
- minimal red accent
- no decorative illustrations

## B. Chapter openers
Custom opener style should include:
- stronger chapter number/title hierarchy
- condensed display type
- more vertical pause before text starts
- restrained divider rule or accent line

## C. Callouts / pull quotes
Tufte callouts are often too quiet for this project.

Use:
- left red rule
- sans-serif utility text
- slightly denser box rhythm
- no rounded corners

## D. Opportunity cards
Do **not** let these remain plain body subsections.

They need custom card treatment:
- boxed or ruled structure
- archetype label
- buyer / pain / wedge / why it works hierarchy
- stronger scan rhythm

## E. Toolkit pages
These should break from the normal Tufte reading shell.

For:
- scorecard
- worksheet
- validation sprint

Use full custom pages with:
- grid alignment
- lines / boxes
- utility typography
- page-level design treatment

These pages should feel like inserted operator tools inside the book.

---

## 4. What Not to Overwrite

Do not fight the Tufte template everywhere.
That creates complexity without enough upside.

### Keep Tufte defaults where they already help
- body paragraph spacing
- running text width
- frontmatter flow
- page numbering conventions
- long-form chapter readability

### Customize only where brand identity matters
- openings
- cards
- tool pages
- diagrams
- appendix worksheets

---

## 5. Recommended Structural Split

## Reading mode sections
Use mostly Tufte reading behavior for:
- Introduction
- Why This Book
- The Idea Trap
- The Money-First Lens
- The Six Filters
- Three Discovery Engines
- Kill Signals
- From Signal to Wedge
- First Customer Before Full Product
- What to Build Next
- What Comes After the Wedge
- Conclusion

## Tool / system sections
Use stronger custom styling for:
- 30-Day Validation Sprint
- Framework in Action
- Pattern Library
- Opportunity Scorecard
- One-Page Opportunity Worksheet
- Validation sprint template pages

This gives the book contrast in the right places.

---

## 6. Implementation Plan in Typst

## Phase 1 — adopt Tufte shell
- use Tufte template for overall page structure
- confirm book compiles cleanly
- confirm TOC/frontmatter behavior

## Phase 2 — override typography + palette
- change fonts
- add Build What Pays color variables
- restyle headings and chapter openers
- restyle pull quotes / callouts

## Phase 3 — add custom components
Create custom Typst functions for:
- `bwp-cover()`
- `bwp-chapter-opener()`
- `bwp-callout()`
- `bwp-opportunity-card()`
- `bwp-pattern-card()`
- `bwp-scorecard-page()`
- `bwp-worksheet-page()`
- `bwp-sprint-page()`

## Phase 4 — special-page overrides
Apply custom full-page styling to:
- Chapter 7 sprint pages
- Chapter 9 framework-in-action pages
- appendices

## Phase 5 — polish
- tighten spacing
- refine subtitle hierarchy
- unify captions and labels
- export PDF and compare against current designed version

---

## 7. Success Criteria

This hybrid is working if the final PDF feels:
- as readable as the Tufte version
- more branded than the Tufte version
- less rough than the fully custom first Typst render
- coherent between reading pages and toolkit pages
- premium enough to justify direct-sale positioning

---

## 8. Final Recommendation

Do not replace the Tufte template wholesale.
Do not build every page from scratch either.

Use Tufte as the **reading engine**.
Use Build What Pays styling as the **identity layer**.
Use custom tool pages as the **product layer**.

That is the cleanest path to a PDF that feels both serious and unmistakably yours.
