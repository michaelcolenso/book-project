from __future__ import annotations

import argparse
from pathlib import Path

from .adapters_public_data import search_data_gov
from .live_pipeline import search_brief_and_rank_public_data
from .pipeline import generate_validated_briefs
from .reporting import write_json_report, write_markdown_report
from .reporting_briefs import write_briefs_json, write_briefs_markdown
from .reporting_discovery import write_discovery_json, write_discovery_markdown
from .reporting_ranked_briefs import write_ranked_json, write_ranked_markdown
from .scoring import load_candidates, rank_candidates


def cmd_score(input_path: str) -> int:
    base = Path.cwd()
    candidates = load_candidates(input_path)
    ranked = rank_candidates(candidates)
    json_path = write_json_report(base, ranked)
    md_path = write_markdown_report(base, ranked)

    print(f"Scored {len(ranked)} candidates")
    if ranked:
        print(f"Top opportunity: {ranked[0]['name']} ({ranked[0]['percentage']}%)")
    print(f"JSON report: {json_path}")
    print(f"Markdown report: {md_path}")
    return 0


def cmd_discover_public_data(query: str, limit: int) -> int:
    base = Path.cwd()
    items = [item.to_dict() for item in search_data_gov(query, rows=limit)]
    json_path = write_discovery_json(base, query, "data.gov", items)
    md_path = write_discovery_markdown(base, query, "data.gov", items)

    print(f"Discovered {len(items)} public-data sources for query: {query}")
    print(f"JSON report: {json_path}")
    print(f"Markdown report: {md_path}")
    return 0


def cmd_brief_public_data(query: str, limit: int) -> int:
    base = Path.cwd()
    datasets = [item.to_dict() for item in search_data_gov(query, rows=limit)]
    briefs = generate_validated_briefs(datasets)
    json_path = write_briefs_json(base, query, "data.gov", briefs)
    md_path = write_briefs_markdown(base, query, "data.gov", briefs)

    print(f"Generated {len(briefs)} validated opportunity briefs for query: {query}")
    print(f"JSON report: {json_path}")
    print(f"Markdown report: {md_path}")
    return 0


def cmd_rank_public_data(query: str, limit: int) -> int:
    base = Path.cwd()
    ranked = search_brief_and_rank_public_data(query, limit)
    json_path = write_ranked_json(base, query, "data.gov", ranked)
    md_path = write_ranked_markdown(base, query, "data.gov", ranked)

    print(f"Ranked {len(ranked)} live opportunity briefs for query: {query}")
    if ranked:
        print(f"Top opportunity: {ranked[0]['name']} ({ranked[0]['percentage']}%)")
    print(f"JSON report: {json_path}")
    print(f"Markdown report: {md_path}")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(prog="opp-radar")
    subparsers = parser.add_subparsers(dest="command", required=True)

    score_parser = subparsers.add_parser("score", help="Score candidate opportunities from a JSON file")
    score_parser.add_argument("input", help="Path to JSON file containing candidate opportunities")

    discover_parser = subparsers.add_parser("discover-public-data", help="Search public data catalogs for source candidates")
    discover_parser.add_argument("query", help="Search query, e.g. 'building permits' or 'code enforcement'")
    discover_parser.add_argument("--limit", type=int, default=10, help="Max results to return")

    brief_parser = subparsers.add_parser("brief-public-data", help="Turn public-data search results into opportunity briefs")
    brief_parser.add_argument("query", help="Search query, e.g. 'building permits'")
    brief_parser.add_argument("--limit", type=int, default=5, help="Max datasets to brief")

    rank_parser = subparsers.add_parser("rank-public-data", help="End-to-end search, brief, validate, repair, and rank public-data opportunities")
    rank_parser.add_argument("query", help="Search query, e.g. 'building permits'")
    rank_parser.add_argument("--limit", type=int, default=5, help="Max datasets to process")

    args = parser.parse_args()

    if args.command == "score":
        return cmd_score(args.input)
    if args.command == "discover-public-data":
        return cmd_discover_public_data(args.query, args.limit)
    if args.command == "brief-public-data":
        return cmd_brief_public_data(args.query, args.limit)
    if args.command == "rank-public-data":
        return cmd_rank_public_data(args.query, args.limit)

    parser.error("Unknown command")
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
