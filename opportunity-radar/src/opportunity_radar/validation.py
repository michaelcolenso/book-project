from __future__ import annotations

from dataclasses import dataclass
from typing import Dict, List

from .models import CRITERIA


@dataclass
class ValidationResult:
    ok: bool
    issues: List[str]


def validate_brief(brief: Dict) -> ValidationResult:
    issues: List[str] = []

    required_fields = [
        "name",
        "niche",
        "intent_signals",
        "pain_point",
        "current_solutions",
        "proposed_solution",
        "access",
        "mvp_scope",
        "why_this_could_win",
        "risks",
        "scores",
    ]
    for field in required_fields:
        if field not in brief or brief[field] in (None, "", []):
            issues.append(f"missing_or_empty:{field}")

    scores = brief.get("scores", {})
    for criterion in CRITERIA:
        value = scores.get(criterion)
        if value is None:
            issues.append(f"missing_score:{criterion}")
            continue
        if not isinstance(value, int):
            issues.append(f"non_integer_score:{criterion}={value}")
            continue
        if value < 1 or value > 5:
            issues.append(f"out_of_range_score:{criterion}={value}")

    buyer_text = " ".join(
        [
            brief.get("niche", ""),
            brief.get("pain_point", ""),
            brief.get("proposed_solution", ""),
            brief.get("access", ""),
        ]
    ).lower()
    if any(keyword in buyer_text for keyword in [
        "contractor", "buyer", "owner", "sales team", "distributor", "property manager",
        "gc", "general contractor", "permit expediter", "manufacturer", "operator",
    ]):
        if isinstance(scores.get("buyer_clarity"), int) and scores.get("buyer_clarity", 0) <= 2:
            issues.append("buyer_clarity_inconsistent_with_named_buyer")

    if any(keyword in buyer_text for keyword in ["public", "dataset", "download", "api", "portal", "records", "data"]):
        if isinstance(scores.get("data_accessibility"), int) and scores.get("data_accessibility", 0) <= 2:
            issues.append("data_accessibility_inconsistent_with_public_source")

    if any(keyword in buyer_text for keyword in ["one county", "one geography", "simple", "lightweight", "alerts", "dashboard"]):
        if isinstance(scores.get("mvp_simplicity"), int) and scores.get("mvp_simplicity", 0) <= 2:
            issues.append("mvp_simplicity_inconsistent_with_narrow_scope")

    return ValidationResult(ok=not issues, issues=issues)
