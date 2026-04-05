from __future__ import annotations

from typing import Any, Dict, List

from .opportunity_briefing import datasets_to_briefs
from .repair import repair_brief
from .validation import validate_brief


def generate_validated_briefs(datasets: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
    briefs = datasets_to_briefs(datasets)
    repaired: List[Dict[str, Any]] = []

    for brief in briefs:
        result = validate_brief(brief)
        if result.ok:
            repaired.append(brief)
            continue

        fixed = repair_brief(brief, result.issues)
        fixed_result = validate_brief(fixed)
        fixed["_validation"] = {
            "initial_ok": False,
            "initial_issues": result.issues,
            "repaired_ok": fixed_result.ok,
            "repaired_issues": fixed_result.issues,
        }
        repaired.append(fixed)

    return repaired
