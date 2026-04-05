from __future__ import annotations

import json
from typing import Any, Dict, List

from .llm import get_openai_client, get_openai_model
from .models import CRITERIA

SYSTEM_PROMPT = """You are an expert product strategist focused on monetizable public-data opportunities.

Your job is to turn a dataset description into a concrete opportunity brief.

Rules:
- Prefer boring, monetizable B2B opportunities over broad consumer ideas.
- Favor monitoring, compliance, risk visibility, pricing, workflow, discovery, and lead-generation products.
- Prefer realistic MVPs a solo builder can ship quickly.
- Be skeptical. If the dataset is weak or generic, say so in risks.
- Keep ideas grounded in the dataset, not fantasy platforms.

Return strict JSON only.
"""


def _response_schema() -> Dict[str, Any]:
    score_properties = {
        criterion: {
            "type": "integer",
            "minimum": 1,
            "maximum": 5,
            "description": f"Score for {criterion}",
        }
        for criterion in CRITERIA
    }

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
                "properties": score_properties,
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


def dataset_to_opportunity_brief(dataset: Dict[str, Any]) -> Dict[str, Any]:
    client = get_openai_client()
    model = get_openai_model()

    user_prompt = f"""
Turn this dataset into one concrete opportunity brief.

Dataset title: {dataset.get('title', '')}
Dataset URL: {dataset.get('url', '')}
Organization: {dataset.get('organization', '')}
Tags: {', '.join(dataset.get('tags', []))}
Updated: {dataset.get('metadata_modified', '')}
Notes: {dataset.get('notes', '')}

Scoring rubric:
- pain_severity: how painful the problem is
- frequency: how often the problem occurs
- intent_to_pay: whether buyers already pay or likely would pay
- buyer_clarity: whether the buyer is identifiable
- data_accessibility: whether data seems usable/reachable
- distribution_accessibility: whether there is a believable route to users
- mvp_simplicity: whether a narrow MVP is realistic
- defensibility: whether there is a wedge
- fit_with_mike: fit with public data arbitrage, operational pain, B2B wedge, and simple MVPs

The output should be useful as direct input into an opportunity ranking system.
"""

    response = client.responses.create(
        model=model,
        input=[
            {"role": "system", "content": SYSTEM_PROMPT},
            {"role": "user", "content": user_prompt},
        ],
        text={
            "format": {
                "type": "json_schema",
                "name": "opportunity_brief",
                "schema": _response_schema(),
                "strict": True,
            }
        },
    )

    content = response.output[0].content[0].text
    return json.loads(content)


def datasets_to_briefs(datasets: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
    briefs: List[Dict[str, Any]] = []
    for dataset in datasets:
        briefs.append(dataset_to_opportunity_brief(dataset))
    return briefs
