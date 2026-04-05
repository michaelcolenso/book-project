from __future__ import annotations

import json
from datetime import datetime, UTC
from pathlib import Path
from typing import Any, Dict, List


def ensure_reports_dir(base: Path) -> Path:
    reports = base / "reports"
    reports.mkdir(parents=True, exist_ok=True)
    return reports


def write_json_report(base: Path, ranked: List[Dict[str, Any]]) -> Path:
    reports = ensure_reports_dir(base)
    path = reports / "latest.json"
    payload = {
        "generated_at": datetime.now(UTC).isoformat(),
        "recommendation": ranked[0]["name"] if ranked else None,
        "count": len(ranked),
        "ranked": ranked,
    }
    path.write_text(json.dumps(payload, indent=2) + "\n")
    return path


def to_markdown(ranked: List[Dict[str, Any]]) -> str:
    lines: List[str] = []
    timestamp = datetime.now(UTC).strftime("%Y-%m-%d %H:%M UTC")
    lines.append("# Opportunity Radar Report")
    lines.append("")
    lines.append(f"Generated: {timestamp}")
    lines.append("")
    if ranked:
        lines.append(f"**Main line:** {ranked[0]['name']} ({ranked[0]['percentage']}%)")
        lines.append("")

    for idx, item in enumerate(ranked, start=1):
        lines.append(f"## {idx}. {item['name']} — {item['percentage']}%")
        lines.append("")
        lines.append(f"**NICHE**  ")
        lines.append(item["niche"])
        lines.append("")
        lines.append(f"**INTENT SIGNALS**")
        for signal in item["intent_signals"]:
            lines.append(f"- {signal}")
        lines.append("")
        lines.append(f"**PAIN POINT**  ")
        lines.append(item["pain_point"])
        lines.append("")
        lines.append("**CURRENT SOLUTIONS**")
        for solution in item["current_solutions"]:
            lines.append(f"- {solution}")
        lines.append("")
        lines.append(f"**PROPOSED SOLUTION**  ")
        lines.append(item["proposed_solution"])
        lines.append("")
        lines.append(f"**ACCESS**  ")
        lines.append(item["access"])
        lines.append("")
        lines.append(f"**MVP SCOPE**  ")
        lines.append(item["mvp_scope"])
        lines.append("")
        lines.append(f"**WHY THIS COULD WIN**  ")
        lines.append(item["why_this_could_win"])
        lines.append("")
        lines.append("**RISKS / DISQUALIFIERS**")
        for risk in item["risks"]:
            lines.append(f"- {risk}")
        lines.append("")
        lines.append("**SCORE BREAKDOWN**")
        for key, value in item["scores"].items():
            lines.append(f"- {key}: {value}")
        lines.append("")

    return "\n".join(lines) + "\n"


def write_markdown_report(base: Path, ranked: List[Dict[str, Any]]) -> Path:
    reports = ensure_reports_dir(base)
    path = reports / "latest.md"
    path.write_text(to_markdown(ranked))
    return path
