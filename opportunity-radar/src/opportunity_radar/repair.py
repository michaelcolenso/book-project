from __future__ import annotations

import json
from typing import Any, Dict, List

from .llm import get_openai_client, get_openai_model
from .models import CRITERIA

REPAIR_SYSTEM_PROMPT = """You repair opportunity briefs.

Your job is to fix inconsistencies, missing fields, and bad scoring while preserving the core idea.

Rules:
- Return strict JSON only.
- Keep the same overall opportunity unless the brief is obviously broken.
- Scores must be integers 1-5.
- Make the scores consistent with the written brief.
- Be skeptical and practical.
"""


def _response_schema() -> Dict[str, Any]:
    return {
        "type": "object",
        "additionalProperties": False,
        "properties": {
            "name": {"type": "string"},
            "niche": {"type": "string"},
            "intent_signals": {"type": "array", "items": {"type": "string"}},
            "pain_point": {"type": "string"},
            "current_solutions": {"type": "array", "items": {"type": "string"}},
            "proposed_solution": {"type": "string"},
            "access": {"type": "string"},
            "mvp_scope": {"type": "string"},
            "why_this_could_win": {"type": "string"},
            "risks": {"type": "array", "items": {"type": "string"}},
            "scores": {
                "type": "object",
                "additionalProperties": False,
                "properties": {
                    criterion: {"type": "integer", "minimum": 1, "maximum": 5}
                    for criterion in CRITERIA
                },
                "required": list(CRITERIA),
            },
        },
        "required": [
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
        ],
    }


def repair_brief(brief: Dict[str, Any], issues: List[str]) -> Dict[str, Any]:
    client = get_openai_client()
    model = get_openai_model()

    prompt = f"""
Repair this opportunity brief.

Detected issues:
{json.dumps(issues, indent=2)}

Current brief:
{json.dumps(brief, indent=2)}

Return a corrected version with coherent scoring.
"""

    response = client.responses.create(
        model=model,
        input=[
            {"role": "system", "content": REPAIR_SYSTEM_PROMPT},
            {"role": "user", "content": prompt},
        ],
        text={
            "format": {
                "type": "json_schema",
                "name": "repaired_opportunity_brief",
                "schema": _response_schema(),
                "strict": True,
            }
        },
    )

    content = response.output[0].content[0].text
    return json.loads(content)
