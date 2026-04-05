from __future__ import annotations

import os
from openai import OpenAI


def get_openai_model() -> str:
    return os.environ.get("OPPORTUNITY_RADAR_OPENAI_MODEL") or os.environ.get("OPENAI_MODEL") or "gpt-5.4"


def get_openai_client() -> OpenAI:
    api_key = os.environ.get("OPENAI_API_KEY", "").strip()
    if not api_key:
        raise RuntimeError(
            "OPENAI_API_KEY is not set. Export it in the shell or place it in a loaded .env flow before running LLM-backed commands."
        )
    return OpenAI(api_key=api_key)
