#!/usr/bin/env python3
"""Build a multilingual occurrence index for repeated English default text."""

import argparse
import csv
import hashlib
import io
import json
from collections import defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[4]
LANGUAGE_PATHS = {
    "en": ROOT / "src/csv/en_us/locatexts_en_us.koalocatext_default.csv",
    "ja": ROOT / "src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv",
    "zh": ROOT / "src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv",
    "ko": ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv",
}
OUTPUT_PATH = (
    ROOT
    / "work/zh_cn/translation-reference/duplicates/"
    / "exact-english-default-groups.jsonl"
)


class IndexError(ValueError):
    pass


def read_translation(path):
    raw = path.read_bytes()
    rows = {}
    stream = io.StringIO(raw.decode("utf-8-sig"), newline="")
    reader = csv.DictReader(stream, delimiter=";")
    if reader.fieldnames != ["ID_Linha", "Texto"]:
        raise IndexError(f"{path}: unexpected columns {reader.fieldnames!r}")
    for row in reader:
        row_id = row["ID_Linha"]
        if row_id in rows:
            raise IndexError(f"{path}: duplicate ID {row_id}")
        rows[row_id] = row["Texto"]
    return rows, hashlib.sha256(raw).hexdigest()


def build_groups(language_rows):
    expected_ids = set(language_rows["en"])
    for language, rows in language_rows.items():
        if set(rows) != expected_ids:
            raise IndexError(f"{language}: ID set differs from English")

    by_source = defaultdict(list)
    for row_id, english in language_rows["en"].items():
        if english:
            by_source[english].append(row_id)

    groups = []
    for english, row_ids in by_source.items():
        if len(row_ids) < 2:
            continue
        groups.append(
            {
                "english": english,
                "occurrences": [
                    {
                        "id": row_id,
                        "ja": language_rows["ja"][row_id],
                        "zh": language_rows["zh"][row_id],
                        "ko": language_rows["ko"][row_id],
                    }
                    for row_id in row_ids
                ],
            }
        )
    groups.sort(key=lambda group: int(group["occurrences"][0]["id"]))
    return groups


def render_jsonl(groups, source_hashes):
    occurrence_count = sum(len(group["occurrences"]) for group in groups)
    records = [
        {
            "_meta": {
                "schema_version": 1,
                "source_sha256": source_hashes,
                "group_count": len(groups),
                "occurrence_count": occurrence_count,
            }
        },
        *groups,
    ]
    return "".join(
        json.dumps(group, ensure_ascii=False, separators=(",", ":")) + "\n"
        for group in records
    ).encode("utf-8")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="check without writing")
    parser.add_argument("--output", type=Path, default=OUTPUT_PATH)
    args = parser.parse_args()

    loaded = {
        language: read_translation(path)
        for language, path in LANGUAGE_PATHS.items()
    }
    language_rows = {language: result[0] for language, result in loaded.items()}
    source_hashes = {language: result[1] for language, result in loaded.items()}
    rendered = render_jsonl(build_groups(language_rows), source_hashes)
    if args.check:
        if not args.output.exists() or args.output.read_bytes() != rendered:
            raise SystemExit(f"Repeated-source index is missing or stale: {args.output}")
        print(f"OK: {args.output}")
        return

    args.output.parent.mkdir(parents=True, exist_ok=True)
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_bytes(rendered)
    temporary.replace(args.output)
    print(f"Wrote {args.output}: {len(rendered.splitlines()) - 1} groups")


if __name__ == "__main__":
    try:
        main()
    except (IndexError, OSError) as error:
        raise SystemExit(str(error)) from error
