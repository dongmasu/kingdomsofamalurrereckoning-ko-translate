#!/usr/bin/env python3
"""Expand manually authored key decisions with frozen packet metadata."""

import json
import argparse
from pathlib import Path


ROOT = Path(__file__).resolve().parent
DECISIONS = ROOT / "key-review-decisions-0001-0018.jsonl"
OUTPUT = ROOT / "key-reviews-0001-0018.jsonl"
LOCALES = ("en", "ja", "zh", "ko")

parser = argparse.ArgumentParser()
parser.add_argument("--first-packet", type=int, default=1)
parser.add_argument("--last-packet", type=int, default=18)
args = parser.parse_args()
if not (1 <= args.first_packet <= args.last_packet <= 18):
    raise SystemExit("packet range must be within 1-18")


def read_jsonl(path):
    with path.open(encoding="utf-8") as source:
        return [json.loads(line) for line in source if line.strip()]


decisions = {}
for decision in read_jsonl(DECISIONS):
    key = (decision["resource"], decision["id"], decision["variant"])
    if key in decisions:
        raise SystemExit(f"duplicate manual decision: {key}")
    decisions[key] = decision

packet_rows = [
    row
    for number in range(args.first_packet, args.last_packet + 1)
    for row in read_jsonl(ROOT / f"review-packet-{number:04d}.jsonl")
]
packet_keys = [(row["resource"], row["id"], row["variant"]) for row in packet_rows]
if len(packet_keys) != len(set(packet_keys)):
    raise SystemExit("assigned packets contain duplicate keys")

missing = set(packet_keys) - set(decisions)
if missing:
    raise SystemExit(f"decision coverage mismatch: missing={len(missing)}")

output_rows = []
for row in packet_rows:
    key = (row["resource"], row["id"], row["variant"])
    decision = decisions[key]
    refs = decision.get("evidence_refs", [row["packet_ref"]])
    if any(ref not in row["available_evidence_refs"] for ref in refs):
        raise SystemExit(f"unavailable evidence ref for {key}")
    output_rows.append(
        {
            "resource": row["resource"],
            "id": row["id"],
            "variant": row["variant"],
            "disposition": decision["disposition"],
            "reason": decision["reason"],
            "review_dimensions": decision["review_dimensions"],
            "source_conflicts": decision["source_conflicts"],
            "confidence": decision["confidence"],
            "proposed_text": decision["proposed_text"],
            "input_fingerprints": {
                locale: row["input_fingerprints"][locale] for locale in LOCALES
            },
            "evidence_refs": refs,
        }
    )

with OUTPUT.open("w", encoding="utf-8", newline="\n") as target:
    for row in output_rows:
        target.write(json.dumps(row, ensure_ascii=False, separators=(",", ":")) + "\n")
