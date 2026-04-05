from __future__ import annotations

import json
from dataclasses import dataclass
from typing import Any, Dict, List
from urllib.parse import quote_plus
from urllib.request import urlopen


DATA_GOV_SEARCH_URL = "https://catalog.data.gov/api/3/action/package_search?q={query}&rows={rows}"


@dataclass
class DatasetHit:
    title: str
    url: str
    notes: str
    organization: str
    tags: List[str]
    metadata_created: str | None
    metadata_modified: str | None

    def to_dict(self) -> Dict[str, Any]:
        return {
            "title": self.title,
            "url": self.url,
            "notes": self.notes,
            "organization": self.organization,
            "tags": self.tags,
            "metadata_created": self.metadata_created,
            "metadata_modified": self.metadata_modified,
        }


def _get_json(url: str) -> Dict[str, Any]:
    with urlopen(url, timeout=30) as response:
        return json.loads(response.read().decode("utf-8"))


def search_data_gov(query: str, rows: int = 10) -> List[DatasetHit]:
    url = DATA_GOV_SEARCH_URL.format(query=quote_plus(query), rows=rows)
    payload = _get_json(url)
    result = payload.get("result", {})
    items = result.get("results", [])

    hits: List[DatasetHit] = []
    for item in items:
        resources = item.get("resources", [])
        best_url = item.get("url") or (resources[0].get("url") if resources else "") or ""
        org = (item.get("organization") or {}).get("title", "")
        tags = [tag.get("display_name", "") for tag in item.get("tags", []) if tag.get("display_name")]
        notes = (item.get("notes") or "").strip().replace("\r", " ").replace("\n", " ")
        notes = notes[:280] + ("…" if len(notes) > 280 else "")

        hits.append(
            DatasetHit(
                title=item.get("title", "Untitled dataset"),
                url=best_url,
                notes=notes,
                organization=org,
                tags=tags,
                metadata_created=item.get("metadata_created"),
                metadata_modified=item.get("metadata_modified"),
            )
        )

    return hits
