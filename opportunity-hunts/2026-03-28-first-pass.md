# Opportunity Hunt — 2026-03-28 — First Pass

## Notes

Implemented standing framework in:
- `OPPORTUNITY-FRAMEWORK.md`
- `OPERATOR.md` (Scout mode now points to the framework)

Search telemetry was partially degraded:
- `web_search` failed with auth issues
- general search engines hit anti-bot challenges
- used reachable sources instead: Hacker News Algolia API and Shopify Community public page text

Confidence: medium. Enough to rank a first wave, not enough to call them fully validated.

---

## 1) Reseller sourcing / valuation copilot

### Niche
Independent thrift / eBay / Facebook Marketplace resellers evaluating secondhand inventory.

### Intent signals
- HN comment: "I’ve been thrifting and reselling electronics for about 5 years now. I eventually got tired of the manual grind: checking every item via Google Lens or ChatGPT, checking eBay Sold listings, and manually adding data to my inventory spreadsheet."
- Same comment: "Every item took ~3 minutes to vet."

### Pain point
Too much manual lookup per item kills throughput and margin.

### Current solutions
- Google Lens
- ChatGPT
- eBay Sold comps
- manual spreadsheet tracking

### Frequency
Per item. High-frequency, repetitive, directly tied to daily sourcing.

### Proposed solution
Mobile-first sourcing copilot:
- photo/item recognition
- sold comps aggregation
- likely resale range
- buy/no-buy recommendation
- one-tap inventory logging

### Access
- reseller YouTube communities
- flipping Discords / forums
- eBay seller groups
- thrift/reseller subcultures

### MVP scope
- input photo + rough title
- fetch comps from accessible marketplaces
- produce estimated resale range + margin band
- export to inventory log

### Why this could win
Direct time savings on every sourcing decision. Clear ROI. Users already use ugly workarounds.

### Risks / disqualifiers
Marketplace data access can get messy. Need a clear legal/technical path to comps.

---

## 2) Contractor estimate composer + follow-up engine

### Niche
Small contractors / tradies doing quotes manually.

### Intent signals
- HN story snippet: "Free HVAC estimate templates (Excel) for contractors still doing quotes manually."
- Same snippet: "Built these after watching contractors waste 2+ hours per estimate."

### Pain point
Estimating is slow, inconsistent, and admin-heavy. Follow-up is often sloppy, so quotes die.

### Current solutions
- Excel templates
- manual material/labor calculations
- texting/emailing PDFs
- ad hoc follow-up

### Frequency
Multiple times per week for active contractors; often daily in busy shops.

### Proposed solution
Quote ops tool for small operators:
- structured estimate builder
- pricebook templates
- good/better/best packages
- follow-up reminders + auto-chasing
- quote acceptance tracking

### Access
- contractor Facebook groups
- HVAC/plumbing/electrical communities
- local trade associations
- outbound using existing tradie directories

### MVP scope
- niche-specific estimate template
- quick pricebook
- send + track quote
- automatic follow-up sequence

### Why this could win
Pain is operational, frequent, and money-adjacent. Better quoting directly affects close rate and speed.

### Risks / disqualifiers
Crowded field if framed as broad FSM software. Needs a narrow wedge: estimate speed + follow-up, not full business management.

---

## 3) Shopify catalog ops copilot for large catalogs

### Niche
Small-to-mid Shopify merchants with large or messy catalogs.

### Intent signals
Observed on Shopify Community public page:
- "How do you manage product description quality across a large catalog?"
- "PRODUCT FEATURE REQUEST: Shopify Bundles - list bundle contents on PDP"
- "Trying to keep my inbox clean while building my store"

### Pain point
Catalog quality, bundle merchandising, and store ops become messy fast as SKU count grows.

### Current solutions
- manual editing in Shopify
- piecemeal apps
- spreadsheets / copy-paste workflows
- store-owner-as-operator chaos

### Frequency
Ongoing. Recurs whenever products are added, bundles change, or merchandising drifts.

### Proposed solution
Catalog ops assistant:
- detect weak/missing descriptions
- enforce product data rules
- generate/edit copy in batch
- visualize missing bundle metadata
- flag PDP quality issues

### Access
- Shopify community
- app marketplace
- cold outreach to stores with weak PDPs
- agencies serving Shopify merchants

### MVP scope
- import catalog
- score PDP quality
- suggest fixes in batch
- highlight missing bundle/content elements

### Why this could win
Pain is visible, recurring, and tied to conversion. Merchants already buy apps.

### Risks / disqualifiers
High competition. Needs a stronger wedge than "AI for product descriptions" — probably catalog QA + bundle/content enforcement.

---

## Ranking

1. Contractor estimate composer + follow-up engine
2. Reseller sourcing / valuation copilot
3. Shopify catalog ops copilot

## Recommendation

Main line: **contractor estimate composer + follow-up engine**.

Why:
- strongest fit with Mike's background
- easy access to users
- recurring painful workflow
- clear MVP boundary
- direct monetization path
- avoids broad marketplace/platform dependency

## Next validation moves

1. Pull 30–50 public signals from contractor communities and reviews specifically about quoting, follow-up, and admin drag.
2. Build a one-page offer + fake demo around estimate speed / follow-up recovery.
3. Interview or DM 10 contractors with a concrete wedge instead of broad software positioning.
