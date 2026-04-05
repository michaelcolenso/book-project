# Audit — Claude `main-tufte` File

## Verdict
Claude’s `main-tufte` file is a **useful implementation reference** and a **weak long-term architecture**.

It appears to do the most important near-term job well:
- render a readable Tufte-style book PDF
- establish frontmatter / TOC / book flow
- prove that the manuscript works in a more mature reading shell

But it is still better treated as a **working blob** than as the final publishing system.

---

## What to Keep

### 1. Tufte reading-shell behavior
Keep the parts that give the PDF its calm, serious reading rhythm:
- serif-forward body setting
- restrained chapter flow
- frontmatter / title / copyright sequencing
- contents handling
- mature page-level pacing

### 2. Frontmatter assembly patterns
Claude’s file likely already solved practical issues around:
- title page ordering
- author placement
- copyright page / edition notes
- TOC placement

Those are worth reusing because they are implementation details that don’t need reinvention.

### 3. Sensible body typography defaults
If the file already uses a stable text stack like:
- IBM Plex Serif for body
- IBM Plex Sans for utility text
- IBM Plex Mono where needed

that is worth keeping as the baseline for the Tufte-reading layer.

### 4. Any working outline / TOC behavior
If it compiles and produces a readable TOC, keep the logic and port it into the modular package.

### 5. Any clean chapter include pattern
If Claude structured the main file with predictable content inclusion or section grouping, borrow the pattern.

---

## What to Discard or Replace

### 1. One-file architecture
Do not keep the project as one giant `main-tufte` file.

That is fine for proving a PDF, bad for:
- repeated revisions
- appendices/toolkit pages
- custom component overrides
- long-term reuse

### 2. Generic template styling where brand matters
Replace the generic Tufte defaults for:
- cover / title treatment
- chapter opener typography
- callout styling
- opportunity cards
- scorecard / worksheet pages
- validation sprint pages

These must feel like **Build What Pays**, not like a nice template.

### 3. Any plain-body treatment of tactical pages
If Chapter 7, Chapter 9, or the appendices are just body text with headings, replace them with custom components.

### 4. Any styling logic mixed directly into content blocks
Move stable styling into package modules (`styles/typography.typ`, `styles/layout.typ`, `styles/components.typ`).

---

## What Claude’s File Proves

The most important thing the file proves is not architectural purity.
It proves that the manuscript works well inside a Tufte-adjacent reading shell.

That means the right next move is not to argue about whether Tufte is valid.
It is to:
- keep the reading-shell strengths
- modularize the implementation
- selectively override the places where identity and toolkit utility matter

---

## Migration Recommendation

### Keep from Claude
- frontmatter logic
- TOC logic
- book flow
- body typography direction
- calm page rhythm

### Port into package
- metadata handling
- frontmatter helpers
- outline/TOC wrapper
- chapter inclusion structure

### Replace with custom Build What Pays system
- cover
- chapter openers
- callouts
- opportunity cards
- pattern cards
- scorecard pages
- worksheet pages
- validation sprint pages

---

## Bottom Line

Claude’s file is a good **rendered-book prototype**.
It is not the final **production architecture**.

Use it as a donor for:
- reading shell behavior
- frontmatter / TOC implementation
- stable body defaults

Do not let it become the long-term system boundary.
