# Build What Pays — Production Branch

This folder is the local production branch for the book and bundle assets.

## Structure
- `src/` — Typst source files
- `assets/` — images, diagrams, cover files, fonts if needed
- `output/` — rendered PDFs
- `docs/` — production notes, margin-note rules, checklists

## Current files
- `src/main-tufte.typ` — current Tufte-style main book source from the latest working branch
- `src/scorecard.typ` — standalone opportunity scorecard
- `src/worksheet.typ` — standalone one-page opportunity worksheet
- `src/validation-sprint.typ` — standalone 30-day validation sprint sheet

## Render commands
```bash
typst compile src/main-tufte.typ output/build-what-pays-tufte.pdf

typst compile src/scorecard.typ output/build-what-pays-scorecard.pdf
typst compile src/worksheet.typ output/build-what-pays-worksheet.pdf
typst compile src/validation-sprint.typ output/build-what-pays-validation-sprint.pdf
```

If the Tufte source uses margin-note packages that need more convergence passes:
```bash
typst compile --iterations 8 src/main-tufte.typ output/build-what-pays-tufte.pdf
```

## Immediate priorities
1. Lock the Tufte book branch as the main reading edition.
2. Keep the worksheets as separate download assets.
3. Tighten margin-note density and placement.
4. Standardize metadata and subtitle everywhere.
