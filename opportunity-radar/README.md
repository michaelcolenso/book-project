# Opportunity Radar

A small, opinionated tool for finding and ranking monetizable niches around public data, operational pain, and automation leverage.

This project is built around `OPPORTUNITY-FRAMEWORK.md` in the workspace.

## What v0 does

- stores candidate opportunities as JSON
- scores them against Mike's standing filters
- ranks them by weighted total
- emits a markdown report for review

## Why this exists

The goal is not to generate random startup ideas.
The goal is to systematically find opportunities where:

- the pain is real
- users show intent to pay
- the data is accessible
- distribution is reachable
- a solo builder can ship an MVP quickly

## Current scoring criteria

Each candidate is scored 1-5 on:

- pain severity
- frequency
- intent to pay
- buyer clarity
- data accessibility
- distribution accessibility
- MVP simplicity
- defensibility
- fit with Mike's strengths

## Auth

OpenAI auth is supported for upcoming LLM-backed commands.

The project reads:
- `OPENAI_API_KEY`
- optional `OPPORTUNITY_RADAR_OPENAI_MODEL`

A sample file is included at `.env.example`.

## Quick start

### Score seeded candidates

```bash
cd /home/openclaw/.openclaw/workspace/opportunity-radar
uv run opp-radar score data/seeds/public_data_candidates.json
```

That writes:

- `reports/latest.json`
- `reports/latest.md`

### Discover public-data sources

```bash
cd /home/openclaw/.openclaw/workspace/opportunity-radar
uv run opp-radar discover-public-data "building permits" --limit 8
```

That writes:

- `reports/public-data-latest.json`
- `reports/public-data-latest.md`

### Generate opportunity briefs from public-data search results

```bash
cd /home/openclaw/.openclaw/workspace/opportunity-radar
uv run opp-radar brief-public-data "building permits" --limit 3
```

That writes:

- `reports/briefs-latest.json`
- `reports/briefs-latest.md`

### End-to-end rank live public-data opportunities

```bash
cd /home/openclaw/.openclaw/workspace/opportunity-radar
uv run opp-radar rank-public-data "building permits" --limit 3
```

That writes:

- `reports/ranked-briefs-latest.json`
- `reports/ranked-briefs-latest.md`

## File layout

- `data/seeds/` — initial candidate opportunities
- `docs/` — product notes and roadmap
- `src/opportunity_radar/` — scoring and report code
- `reports/` — generated outputs

## Next steps

v1 should add source adapters for:

- Reddit pain mining
- Google Trends / pytrends
- public dataset catalogs
- review sites / forums
- HN / Indie Hackers / niche communities

But v0 is intentionally manual-first so we can improve judgment before we automate discovery.
