# Build What Pays — Typst Render Notes

## Files
- `build-what-pays-full.typ` — full book source in the custom Typst starter system
- `build-what-pays.typ` — smaller starter / prototype file

## Render command
Once Typst is installed:

```bash
typst compile build-what-pays-full.typ build-what-pays-full.pdf
```

For live iteration:

```bash
typst watch build-what-pays-full.typ build-what-pays-full.pdf
```

## Current limitation
Typst is not installed on this machine right now, so I could generate the source but not compile the PDF locally.

## Suggested next step
Install Typst, compile once, then we can tighten:
- chapter opener spacing
- TOC styling
- appendix worksheet styling
- opportunity card styling
- page numbering / headers
