from __future__ import annotations

import json
from datetime import UTC, datetime
from pathlib import Path
from typing import Any, Dict, List


def ensure_reports_dir(base: Path) -> Path:
    reports = base / "reports"
    reports.mkdir(parents=True, exist_ok=True)
    return reports


def write_discovery_json(base: Path, query: str, source: str, items: List[Dict[str, Any]]) -> Path:
    reports = ensure_reports_dir(base)
    path = reports / "public-data-latest.json"
    payload = {
        "generated_at": datetime.now(UTC).isoformat(),
        "source": source,
        "query": query,
        "count": len(items),
        "items": items,
    }
    path.write_text(json.dumps(payload, indent=2) + "\n")
    return path


def write_discovery_markdown(base: Path, query: str, source: str, items: List[Dict[str, Any]]) -> Path:
    reports = ensure_reports_dir(base)
    path = reports / "public-data-latest.md"
    lines: List[str] = []
    lines.append("# Public Data Discovery Report")
    lines.append("")
    lines.append(f"Generated: {datetime.now(UTC).strftime('%Y-%m-%d %H:%M UTC')}")
    lines.append(f"Source: {source}")
    lines.append(f"Query: {query}")
    lines.append("")

    if not items:
        lines.append("No results found.")
    else:
        for idx, item in enumerate(items, start=1):
            lines.append(f"## {idx}. {item['title']}")
            lines.append("")
            lines.append(f"- URL: {item['url']}")
            if item.get("organization"):
                lines.append(f"- Organization: {item['organization']}")
            if item.get("metadata_modified"):
                lines.append(f"- Updated: {item['metadata_modified']}")
            if item.get("tags"):
                lines.append(f"- Tags: {', '.join(item['tags'])}")
            if item.get("notes"):
                lines.append(f"- Notes: {item['notes']}")
            lines.append("")

    path.write_text("\n".join(lines) + "\n")
    return path
