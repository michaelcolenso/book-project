# Typst for Build What Pays

## Recommendation
Yes — Typst is a good fit for this project.

Not because it is trendy. Because it gives us a cleaner production path than hand-built HTML hacks and a saner authoring model than LaTeX.

## Why it fits
- We have a repeatable design system.
- The book uses recurring structures: chapter openers, callouts, scorecards, worksheets, opportunity cards.
- Typst is strong at reusable document components.
- PDF is the main output target.
- We want maintainable revisions, not one-off exports.

## What Typst would be best for here
### Best use cases
- master manuscript PDF
- scorecard / worksheet assets
- appendix tools
- clean reusable templates for future books/playbooks

### Less ideal use cases
- highly bespoke marketing graphics
- cover art generation
- image-heavy landing-page graphics

## Practical next path
1. Learn Typst basics well enough to template the book.
2. Rebuild the book shell in Typst.
3. Recreate 2–3 recurring components first:
   - chapter opener
   - callout box
   - opportunity card
4. Export PDF and compare against the current designed PDF.
5. Only migrate fully if Typst gives us equal or better production quality.

## What I now know well enough to use
- `set` rules for defaults
- `show` rules for styling/transformation
- `let` variables and functions
- template structure via everything show rules
- page, text, heading, align, block, box, table patterns
- component-based document construction

## What I would still want more reps on
- multi-file project organization
- advanced counters / TOC / references
- package ecosystem and imports
- more refined table/grid systems for production-perfect worksheets

## Bottom line
Typst looks like a real contender for future book production and template-driven PDFs. It is worth learning and probably worth piloting on a componentized version of Build What Pays.
