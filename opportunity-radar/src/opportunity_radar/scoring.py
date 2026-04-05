from __future__ import annotations

import json
from pathlib import Path
from typing import Any, Dict, List

from .models import CRITERIA, WEIGHTS, Candidate


def load_candidates(path: str | Path) -> List[Candidate]:
    raw = json.loads(Path(path).read_text())
    return [Candidate.from_dict(item) for item in raw]


def validate_scores(candidate: Candidate) -> None:
    missing = [criterion for criterion in CRITERIA if criterion not in candidate.scores]
    if missing:
        raise ValueError(f"{candidate.name}: missing scores for {', '.join(missing)}")

    out_of_range = [
        f"{criterion}={candidate.scores[criterion]}"
        for criterion in CRITERIA
        if not 1 <= int(candidate.scores[criterion]) <= 5
    ]
    if out_of_range:
        raise ValueError(f"{candidate.name}: scores out of range: {', '.join(out_of_range)}")


def score_candidate(candidate: Candidate) -> Dict[str, Any]:
    validate_scores(candidate)
    weighted_total = 0.0
    max_total = 0.0
    weighted_breakdown: Dict[str, float] = {}

    for criterion in CRITERIA:
        score = candidate.scores[criterion]
        weight = WEIGHTS[criterion]
        weighted = score * weight
        weighted_breakdown[criterion] = round(weighted, 2)
        weighted_total += weighted
        max_total += 5 * weight

    percentage = round((weighted_total / max_total) * 100, 1)

    return {
        "name": candidate.name,
        "niche": candidate.niche,
        "intent_signals": candidate.intent_signals,
        "pain_point": candidate.pain_point,
        "current_solutions": candidate.current_solutions,
        "proposed_solution": candidate.proposed_solution,
        "access": candidate.access,
        "mvp_scope": candidate.mvp_scope,
        "why_this_could_win": candidate.why_this_could_win,
        "risks": candidate.risks,
        "scores": candidate.scores,
        "weighted_breakdown": weighted_breakdown,
        "weighted_total": round(weighted_total, 2),
        "percentage": percentage,
    }


def rank_candidates(candidates: List[Candidate]) -> List[Dict[str, Any]]:
    scored = [score_candidate(candidate) for candidate in candidates]
    return sorted(scored, key=lambda item: item["weighted_total"], reverse=True)
