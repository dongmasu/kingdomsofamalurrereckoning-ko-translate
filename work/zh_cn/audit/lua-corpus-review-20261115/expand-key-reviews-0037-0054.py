#!/usr/bin/env python3
"""Expand manual key decisions with packet fingerprints and evidence refs only."""

import argparse
import json
from pathlib import Path


FIELDS = (
    "resource",
    "id",
    "variant",
    "disposition",
    "reason",
    "review_dimensions",
    "source_conflicts",
    "confidence",
    "proposed_text",
    "input_fingerprints",
    "evidence_refs",
)


def read_jsonl(path):
    with path.open(encoding="utf-8") as stream:
        return [json.loads(line) for line in stream if line.strip()]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--decisions", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--packets", required=True, nargs="+", type=Path)
    args = parser.parse_args()

    decisions = {}
    for decision in read_jsonl(args.decisions):
        key = decision["id"]
        if key in decisions:
            raise SystemExit(f"duplicate manual decision: {key}")
        decisions[key] = decision

    output_rows = []
    seen = set()
    for packet_path in args.packets:
        for packet_row in read_jsonl(packet_path):
            key = (
                packet_row["resource"],
                packet_row["id"],
                packet_row["variant"],
            )
            if key[0] != "default" or key[2] != "":
                raise SystemExit(f"unexpected packet resource or variant: {key}")
            if key[1] not in decisions:
                raise SystemExit(f"missing manual decision: {key}")
            if key in seen:
                raise SystemExit(f"duplicate packet key: {key}")
            seen.add(key)

            locales = packet_row["locales"]
            if any(locales[locale]["status"] != "present" for locale in ("en", "ja", "zh", "ko")):
                raise SystemExit(f"missing locale requires manual unresolved review: {key}")

            evidence_ref = packet_row["packet_ref"]
            if evidence_ref not in packet_row["available_evidence_refs"]:
                raise SystemExit(f"packet ref unavailable for {key}")

            manual = decisions[key[1]]
            row = {
                "resource": key[0],
                "id": key[1],
                "variant": key[2],
                "disposition": manual["disposition"],
                "reason": manual["reason"],
                "review_dimensions": manual["review_dimensions"],
                "source_conflicts": manual["source_conflicts"],
                "confidence": manual["confidence"],
                "proposed_text": manual["proposed_text"],
                "input_fingerprints": {
                    locale: locales[locale]["input_sha256"]
                    for locale in ("en", "ja", "zh", "ko")
                },
                "evidence_refs": [evidence_ref],
            }
            if tuple(row) != FIELDS:
                raise SystemExit(f"schema field mismatch: {key}")
            output_rows.append(row)

    extra = set(decisions) - {key[1] for key in seen}
    if extra:
        raise SystemExit(f"manual decisions outside selected packets: {sorted(extra)[:5]}")

    args.output.parent.mkdir(parents=True, exist_ok=True)
    with args.output.open("w", encoding="utf-8", newline="\n") as stream:
        for row in output_rows:
            stream.write(json.dumps(row, ensure_ascii=False, separators=(",", ":")) + "\n")
    print(f"wrote {len(output_rows)} review rows from {len(args.packets)} packets")


if __name__ == "__main__":
    main()
