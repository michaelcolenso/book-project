# Build What Pays — Tufte Customization Package

A local Typst package/module set for rendering **Build What Pays** with a hybrid approach:
- Tufte-style reading shell for body chapters
- custom Build What Pays identity layer for cover, chapter openers, callouts, cards, and toolkit pages

## Structure
- `lib.typ` — package entry point / exports
- `project.typ` — book metadata
- `styles/` — palette, typography, layout, components
- `examples/sample-book.typ` — example entry file

## Usage
From another Typst file:

```typst
#import "../build-what-pays-tufte/lib.typ": *
#show: doc => bwp-book(doc)
```

Then write content using the exported helpers:
- `bwp-cover()`
- `bwp-part()`
- `bwp-chapter()`
- `bwp-callout()`
- `bwp-opportunity-card()`
- `bwp-pattern-card()`
- `bwp-scorecard-page()`
- `bwp-worksheet-page()`

## Notes
This is the beginning of the package, not the final polished system. It is designed to be iterated into the real production shell for the book.
