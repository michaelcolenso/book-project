// Build What Pays — shared diagram type and layout styles.
//
// These are the type and rule defaults every diagram imports so the visual
// language stays consistent across the book. Keep all values here; do not
// inline fonts or sizes inside individual diagrams.

#import "palette.typ": *

// ─── Font stack ──────────────────────────────────────────────────
// Sans-serif throughout per the Universal Production Standards. We prefer
// "Inter" where available, then Helvetica, then a generic fallback.
#let font-sans = ("Inter", "Helvetica", "Arial", "Liberation Sans")

// ─── Type scale ──────────────────────────────────────────────────
// Sized for a diagram that lives roughly 14–16 cm wide on an 8x10 page.
#let type-title       = (size: 14pt,  weight: "bold")
#let type-subtitle    = (size:  9pt,  weight: "regular")
#let type-axis-label  = (size:  8pt,  weight: "bold")
#let type-axis-sub    = (size:  7pt,  weight: "regular")
#let type-body        = (size:  8pt,  weight: "regular")
#let type-body-bold   = (size:  8pt,  weight: "bold")
#let type-small       = (size:  6.5pt, weight: "regular")
#let type-footer      = (size:  6pt,  weight: "regular")

// ─── Shorthand helpers ───────────────────────────────────────────
// `styled(content, spec)` applies the given type spec to a piece of content.
#let styled(spec, body) = text(
  font: font-sans,
  size: spec.size,
  weight: spec.weight,
  fill: ink,
  body,
)

#let title(body) = styled(type-title, upper(body))
#let subtitle(body) = styled(type-subtitle, body)
#let axis-label(body) = styled(type-axis-label, upper(body))
#let axis-sub(body) = styled(type-axis-sub, body)
#let footer(body) = text(
  font: font-sans,
  size: type-footer.size,
  weight: type-footer.weight,
  fill: ink-faint,
  upper(body),
)

// ─── Standard diagram frame ──────────────────────────────────────
// Every diagram is a figure with: title + optional subtitle + canvas + rule + footer.
// Call `diagram-frame` from inside a diagram file's main content.
//
//   title       — string, rendered uppercase bold
//   subtitle    — optional string beneath the title
//   body        — the diagram content (usually a #canvas call)
//   footer-text — small caps reference like "Chapter 3 · The Six Filters"
//   width       — overall block width, default 100%
//
#let diagram-frame(
  title-text: none,
  subtitle-text: none,
  body,
  footer-text: none,
  width: 100%,
) = block(width: width, above: 0pt, below: 0pt, {
  set align(center)
  if title-text != none [
    #title(title-text)
  ]
  if subtitle-text != none [
    #v(0.2em)
    #subtitle(subtitle-text)
  ]
  v(0.8em)
  body
  if footer-text != none [
    #v(0.8em)
    #line(length: 100%, stroke: 0.4pt + rule-light)
    #v(0.35em)
    #footer(footer-text)
  ]
})

// ─── Standalone-preview page setup ───────────────────────────────
// Each diagram file ends with `#show: preview` so that compiling it directly
// yields a one-page PDF of just that diagram, sized sensibly for review.
#let preview(doc) = {
  set page(width: 18cm, height: auto, margin: 1.2cm, fill: bg)
  set text(font: font-sans, size: 9pt, fill: ink)
  doc
}
