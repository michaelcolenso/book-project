from __future__ import annotations

from dataclasses import dataclass
from typing import Dict, List

CRITERIA = [
    "pain_severity",
    "frequency",
    "intent_to_pay",
    "buyer_clarity",
    "data_accessibility",
    "distribution_accessibility",
    "mvp_simplicity",
    "defensibility",
    "fit_with_mike",
]

WEIGHTS: Dict[str, float] = {
    "pain_severity": 1.4,
    "frequency": 1.3,
    "intent_to_pay": 1.5,
    "buyer_clarity": 1.2,
    "data_accessibility": 1.1,
    "distribution_accessibility": 1.1,
    "mvp_simplicity": 1.0,
    "defensibility": 1.0,
    "fit_with_mike": 1.4,
}


@dataclass
class Candidate:
    name: str
    niche: str
    intent_signals: List[str]
    pain_point: str
    current_solutions: List[str]
    proposed_solution: str
    access: str
    mvp_scope: str
    why_this_could_win: str
    risks: List[str]
    scores: Dict[str, int]

    @classmethod
    def from_dict(cls, data: dict) -> "Candidate":
        return cls(
            name=data["name"],
            niche=data["niche"],
            intent_signals=data.get("intent_signals", []),
            pain_point=data["pain_point"],
            current_solutions=data.get("current_solutions", []),
            proposed_solution=data["proposed_solution"],
            access=data["access"],
            mvp_scope=data["mvp_scope"],
            why_this_could_win=data["why_this_could_win"],
            risks=data.get("risks", []),
            scores=data["scores"],
        )
