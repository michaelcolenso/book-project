// Build What Pays — shared diagram palette
//
// Every color here must remain legible in grayscale (many readers see these
// in black-and-white print or e-ink). Use value contrast, not just hue, to
// distinguish elements. Where color-coded segments appear, pair color with a
// pattern fallback.

// ─── Core ink and surface ─────────────────────────────────────────
#let bg            = rgb("#FFFFFF")   // page background (matches ilm page fill)
#let ink           = rgb("#1A1A1A")   // primary text and rules
#let ink-soft      = rgb("#4A4A4A")   // secondary text
#let ink-faint     = rgb("#8A8A8A")   // captions, tertiary labels
#let rule-light    = rgb("#D4D0C8")   // grid lines, light separators

// ─── Primary accent (book-wide) ──────────────────────────────────
// Construction Red, the single accent used across body matter.
#let bwp-red       = rgb("#8B1A1A")

// ─── Decision palette ────────────────────────────────────────────
// Four bands used by the Six Filters footer, sprint timeline, and any
// decision visual. Chosen so value darkens monotonically from Build to Kill,
// so the gradient still reads in grayscale.
#let band-build    = rgb("#2E5D3E")   // dark green
#let band-test     = rgb("#2A5270")   // steel blue
#let band-backlog  = rgb("#B8872A")   // brass / amber
#let band-kill     = rgb("#8B1A1A")   // construction red

// ─── Filter segment palette (Brief 7 stacked bar chart) ──────────
// Six distinct values, darkest-to-lightest, so grayscale still separates them.
#let filter-1 = rgb("#1F2E4A")   // dark navy       — Buyer Clarity
#let filter-2 = rgb("#2A5270")   // medium blue     — Pain Severity
#let filter-3 = rgb("#3F8C8A")   // teal            — Monetization Clarity
#let filter-4 = rgb("#B8872A")   // gold / amber    — Build Feasibility
#let filter-5 = rgb("#C86A2A")   // warm orange     — Defensibility
#let filter-6 = rgb("#8B1A1A")   // muted red       — Distribution Realism

// ─── Overlay tints ───────────────────────────────────────────────
// Used for polygon fills on the radar and similar low-opacity surfaces.
// Rendered at ~20% opacity so underlying grid remains visible.
#let strong-tint  = rgb(47, 93, 62, 50)      // band-build at ~20%
#let weak-tint    = rgb(200, 106, 42, 50)    // warm orange at ~20%
