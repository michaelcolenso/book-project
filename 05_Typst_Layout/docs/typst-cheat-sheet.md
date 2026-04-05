# Typst Cheat Sheet

## What Typst is
Typst is a modern typesetting system positioned as a faster, more ergonomic alternative to LaTeX.

Best mental model:
- Markdown-like writing surface
- scripting language built in
- strong layout and styling controls
- much cleaner than raw LaTeX for custom documents and templates

## Core concepts

### 1. Markup + code
You write normal content directly, then use `#` to enter code or function calls.

Example:
```typst
= Chapter Title

This is normal text.

#set text(font: "Libertinus Serif", size: 11pt)

#strong[Important]
```

### 2. `set` rules
Use `set` to configure element defaults.

Example:
```typst
#set text(font: "IBM Plex Sans", size: 10pt)
#set heading(numbering: "1.")
#set page(margin: 1in)
```

Think of `set` as the default styling layer.

### 3. `show` rules
Use `show` to restyle or transform elements.

Example:
```typst
#show heading: set text(fill: rgb("8B1A1A"))
#show heading.where(level: 1): it => block[
  #set align(center)
  #text(weight: "bold", size: 22pt)[#it.body]
]
```

Think of `show` as the more powerful and composable styling/transformation layer.

### 4. Variables
```typst
#let title = [Build What Pays]
#let accent = rgb("8B1A1A")
```

### 5. Functions
Functions are how you make reusable templates.

```typst
#let chapter-title(body) = block[
  #set text(size: 24pt, weight: "bold")
  #body
]

#chapter-title[The Idea Trap]
```

### 6. Templates
Typst templates are just functions wrapped around document content.

```typst
#let book-template(title: [], subtitle: [], author: [], doc) = {
  set page(margin: (x: 1in, y: 1.1in))
  set text(font: "IBM Plex Sans", size: 10pt)

  align(center)[
    #text(size: 28pt, weight: "bold")[#title]
    #v(8pt)
    #text(size: 14pt)[#subtitle]
    #v(16pt)
    #text(size: 11pt)[#author]
  ]

  pagebreak()
  doc
}

#show: doc => book-template(
  title: [Build What Pays],
  subtitle: [A Solo Builder's Field Manual for Finding Ideas That Pay],
  author: [Michael Colenso],
  doc,
)
```

## High-value layout functions

### Page setup
```typst
#set page(
  paper: "us-letter",
  margin: (top: 1in, bottom: 1in, left: 1in, right: 1in),
  number-align: bottom + center,
)
```

### Text
```typst
#set text(font: "IBM Plex Sans", size: 10pt, fill: rgb("1A1A1A"))
```

### Headings
```typst
#show heading.where(level: 1): set text(size: 22pt, weight: "bold")
#show heading.where(level: 2): set text(size: 16pt, weight: "semibold")
```

### Spacing helpers
```typst
#v(12pt)  // vertical space
#h(8pt)   // horizontal space
#pagebreak()
#line(length: 100%)
```

### Boxes and blocks
```typst
#box(stroke: 1pt + rgb("1A1A1A"), inset: 10pt)[Important box]

#block[
  This is grouped content.
]
```

### Align
```typst
#align(center)[Centered text]
#align(right)[Right aligned]
```

### Tables / grid
```typst
#table(
  columns: (1fr, 2fr),
  [Label], [Value],
  [Buyer], [Solo builders],
)
```

## Best practices for book / playbook design
- Use `set` rules for global defaults.
- Use `show` rules for heading systems, chapter openers, and repeated component styling.
- Build reusable functions for callouts, opportunity cards, scorecards, and worksheet blocks.
- Put palette, fonts, spacing, and reusable components at the top of the file or in a separate module.
- Use explicit page breaks for cover, contents, chapter openers, and appendices.
- Keep one master template file and import sections if the book gets large.

## Why Typst is attractive for this project
For Build What Pays, Typst is appealing because it can give us:
- cleaner source than LaTeX
- much stronger repeatability than ad hoc Canva / design exports
- programmable templates for scorecards, worksheets, and opportunity cards
- PDF-native output
- better long-term maintainability for revisions

## Rough LaTeX → Typst mental translation
- `\\section{}` → `= Heading`
- preamble packages → top-level `set`, `show`, `let`, imports
- macros → `#let` functions
- environment styling → `show` rules + boxes/blocks/tables
- PDF output still first-class, but syntax is much saner

## What to learn next
1. page setup
2. headings and numbering
3. `set` vs `show`
4. reusable functions for components
5. template file structure
6. importing modules / splitting files
7. PDF export workflow
