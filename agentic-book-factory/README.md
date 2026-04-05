# Agentic Book Factory Architecture

This is a stateless, artifact-driven assembly line designed to mitigate context window decay and goal drift over long writing horizons. 

By decoupling *memory* from the *model*, the workflow is broken into rigid phases. Specialized agents pass structured artifacts to each other instead of relying on a continuously expanding chat thread.

## Components

### 1. `skeleton_schema.yaml`
The global map. It defines the target, outlines chapters as data (not text), and dictates required word counts, promises, beats, and assets.

### 2. `templates/immutable_brief.md`
The anchor for tone and rules. Read by every agent, every time. It contains the thesis, audience profile, voice guidelines, and most importantly, **Kill Signals** (banned phrases and structural tics).

### 3. `templates/decision_ledger.md`
The running log of locked-in narrative or structural choices. This replaces reading the entire manuscript. If Chapter 1 defines a term, the Editor logs it here so Chapter 4 doesn't redefine it.

### 4. Specialized Agents (`prompts/`)
- **Orchestrator:** The manager. Reads the schema, triggers the sub-agents in sequence, updates the Ledger, and writes the files. Halts if an asset is missing.
- **Scout:** Pulls data, quotes, and structural hooks based on the chapter's `required_assets`. Outputs high-density facts, no prose.
- **Drafter:** Writes raw text to hit the word count. Strictly follows the `immutable_brief`, the `decision_ledger`, and the preceding chapter summary to maintain flow.
- **Continuity Editor:** Reads the draft against the Brief and the Ledger. Polishes prose, enforces kill signals, writes a 200-word summary for the next Drafter, and logs any new rules to the Ledger.

## Execution Flow

1. Initialize `skeleton_schema.yaml` and `immutable_brief.md`.
2. For each chapter:
   - Run **Scout** -> Outputs `research.md`
   - Run **Drafter** (inputs: Brief, Ledger, prev Summary, Skeleton, Research) -> Outputs `raw_draft.md`
   - Run **Editor** (inputs: Brief, Ledger, Skeleton, Draft) -> Outputs `final_chapter.md`, `next_summary.md`, and updates `decision_ledger.md`.
3. Compile all `final_chapter.md` artifacts.