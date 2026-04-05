from __future__ import annotations

from typing import Any, Dict, List

from .adapters_public_data import search_data_gov
from .models import Candidate
from .pipeline import generate_validated_briefs
from .scoring import rank_candidates


def search_brief_and_rank_public_data(query: str, limit: int) -> List[Dict[str, Any]]:
    datasets = [item.to_dict() for item in search_data_gov(query, rows=limit)]
    briefs = generate_validated_briefs(datasets)
    candidates = [Candidate.from_dict(brief) for brief in briefs]
    ranked = rank_candidates(candidates)

    # preserve validation metadata if present
    for ranked_item, brief in zip(ranked, briefs):
        if brief.get("_validation"):
            ranked_item["_validation"] = brief["_validation"]

    return ranked
