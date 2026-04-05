from __future__ import annotations

import json
from datetime import UTC, datetime
from pathlib import Path
from typing import Any, Dict, List


def ensure_reports_dir(base: Path) -> Path:
    reports = base / "reports"
    reports.mkdir(parents=True, exist_ok=True)
    return reports


def write_ranked_json(base: Path, query: str, source: str, ranked: List[Dict[str, Any]]) -> Path:
    reports = ensure_reports_dir(base)
    path = reports / "ranked-briefs-latest.json"
    payload = {
        "generated_at": datetime.now(UTC).isoformat(),
        "source": source,
        "query": query,
        "count": len(ranked),
        "main_line": ranked[0]["name"] if ranked else None,
        "ranked": ranked,
    }
    path.write_text(json.dumps(payload, indent=2) + "\n")
    return path


def write_ranked_markdown(base: Path, query: str, source: str, ranked: List[Dict[str, Any]]) -> Path:
    reports = ensure_reports_dir(base)
    path = reports / "ranked-briefs-latest.md"
    lines: List[str] = []
    lines.append("# Ranked Opportunity Briefs")
    lines.append("")
    lines.append(f"Generated: {datetime.now(UTC).strftime('%Y-%m-%d %H:%M UTC')}")
    lines.append(f"Source: {source}")
    lines.append(f"Query: {query}")
    lines.append("")

    if ranked:
        lines.append(f"**Main line:** {ranked[0]['name']} ({ranked[0]['percentage']}%)")
        lines.append("")

    for idx, item in enumerate(ranked, start=1):
        lines.append(f"## {idx}. {item['name']} — {item['percentage']}%")
        lines.append("")
        lines.append(f"**NICHE**  \n{item['niche']}")
        lines.append("")
        lines.append("**INTENT SIGNALS**")
        for signal in item.get("intent_signals", []):
            lines.append(f"- {signal}")
        lines.append("")
        lines.append(f"**PAIN POINT**  \n{item['pain_point']}")
        lines.append("")
        lines.append("**CURRENT SOLUTIONS**")
        for solution in item.get("current_solutions", []):
            lines.append(f"- {solution}")
        lines.append("")
        lines.append(f"**PROPOSED SOLUTION**  \n{item['proposed_solution']}")
        lines.append("")
        lines.append(f"**ACCESS**  \n{item['access']}")
        lines.append("")
        lines.append(f"**MVP SCOPE**  \n{item['mvp_scope']}")
        lines.append("")
        lines.append(f"**WHY THIS COULD WIN**  \n{item['why_this_could_win']}")
        lines.append("")
        lines.append("**RISKS / DISQUALIFIERS**")
        for risk in item.get("risks", []):
            lines.append(f"- {risk}")
        lines.append("")
        lines.append("**SCORE BREAKDOWN**")
        for key, value in item.get("scores", {}).items():
            lines.append(f"- {key}: {value}")
        lines.append("")
        if item.get("_validation"):
            lines.append("**VALIDATION**")
            lines.append(f"- initial_ok: {item['_validation'].get('initial_ok')}")
            lines.append(f"- initial_issues: {', '.join(item['_validation'].get('initial_issues', [])) or 'none'}")
            lines.append(f"- repaired_ok: {item['_validation'].get('repaired_ok')}")
            lines.append(f"- repaired_issues: {', '.join(item['_validation'].get('repaired_issues', [])) or 'none'}")
            lines.append("")

    path.write_text("\n".join(lines) + "\n")
    return path
