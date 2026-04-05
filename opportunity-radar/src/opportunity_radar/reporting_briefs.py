from __future__ import annotations

import json
from datetime import UTC, datetime
from pathlib import Path
from typing import Any, Dict, List


def ensure_reports_dir(base: Path) -> Path:
    reports = base / "reports"
    reports.mkdir(parents=True, exist_ok=True)
    return reports


def write_briefs_json(base: Path, query: str, source: str, briefs: List[Dict[str, Any]]) -> Path:
    reports = ensure_reports_dir(base)
    path = reports / "briefs-latest.json"
    payload = {
        "generated_at": datetime.now(UTC).isoformat(),
        "source": source,
        "query": query,
        "count": len(briefs),
        "briefs": briefs,
    }
    path.write_text(json.dumps(payload, indent=2) + "\n")
    return path


def write_briefs_markdown(base: Path, query: str, source: str, briefs: List[Dict[str, Any]]) -> Path:
    reports = ensure_reports_dir(base)
    path = reports / "briefs-latest.md"
    lines: List[str] = []
    lines.append("# Dataset Opportunity Briefs")
    lines.append("")
    lines.append(f"Generated: {datetime.now(UTC).strftime('%Y-%m-%d %H:%M UTC')}")
    lines.append(f"Source: {source}")
    lines.append(f"Query: {query}")
    lines.append("")

    for idx, brief in enumerate(briefs, start=1):
        lines.append(f"## {idx}. {brief['name']}")
        lines.append("")
        lines.append(f"**NICHE**  \n{brief['niche']}")
        lines.append("")
        lines.append("**INTENT SIGNALS**")
        for signal in brief.get("intent_signals", []):
            lines.append(f"- {signal}")
        lines.append("")
        lines.append(f"**PAIN POINT**  \n{brief['pain_point']}")
        lines.append("")
        lines.append("**CURRENT SOLUTIONS**")
        for solution in brief.get("current_solutions", []):
            lines.append(f"- {solution}")
        lines.append("")
        lines.append(f"**PROPOSED SOLUTION**  \n{brief['proposed_solution']}")
        lines.append("")
        lines.append(f"**ACCESS**  \n{brief['access']}")
        lines.append("")
        lines.append(f"**MVP SCOPE**  \n{brief['mvp_scope']}")
        lines.append("")
        lines.append(f"**WHY THIS COULD WIN**  \n{brief['why_this_could_win']}")
        lines.append("")
        lines.append("**RISKS / DISQUALIFIERS**")
        for risk in brief.get("risks", []):
            lines.append(f"- {risk}")
        lines.append("")
        lines.append("**SCORE BREAKDOWN**")
        for key, value in brief.get("scores", {}).items():
            lines.append(f"- {key}: {value}")
        lines.append("")

    path.write_text("\n".join(lines) + "\n")
    return path
