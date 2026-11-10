#!/usr/bin/env python3
"""Build a read-only exact-key index from default IDs to quest assets."""

import argparse
import csv
import hashlib
import io
from pathlib import Path
import re


ROOT = Path(__file__).resolve().parents[3]
KEYS_PATH = ROOT / "src/csv/en_us/estrutura_hashes_flat.bin"
DEFAULT_PATH = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
ASSET_DIR = ROOT / "references/data/unpacked"
OUTPUT_PATH = ROOT / "work/zh_cn/audit/default-quest-asset-index.tsv"
REVIEW_PATH = ROOT / "work/zh_cn/audit/dialogue-context-review-ledger.tsv"
LANGUAGE_PATHS = {
    "en": ROOT / "src/csv/en_us/locatexts_en_us.koalocatext_default.csv",
    "ja": ROOT / "src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv",
    "zh": ROOT / "src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv",
    "ko": DEFAULT_PATH,
}
REVIEW_STATUSES = {
    "meaning",
    "naturalness",
    "speech_level",
    "address",
    "honorifics",
    "format",
}
REVIEW_VALUES = {"not_flagged", "candidate", "uncertain", "n/a"}
REVIEW_OVERALL_VALUES = {"not-issue", "candidate", "uncertain"}
HEADER = (
    "resource",
    "id",
    "asset",
    "quest_ids",
    "npc_symbols",
    "dialog_handler_count",
    "key_evidence",
    "speaker_mapping",
    "playback_order",
)
REVIEW_HEADER = (
    "resource",
    "id",
    "review_groups",
    "linked_assets",
    "speaker_attribution",
    "speaker_confidence",
    "dialogue_order",
    "meaning",
    "naturalness",
    "speech_level",
    "address",
    "honorifics",
    "format",
    "overall",
    "finding_ref",
    "source_fingerprint",
)
PRINTABLE = re.compile(rb"[\x20-\x7e]{4,}")
NPC_SYMBOL = re.compile(rb"\bNPC_[A-Za-z0-9_]+\b")
DIALOG_HANDLER = re.compile(rb"dialog_line_[A-Za-z0-9_]+")
QUEST_VALUE = re.compile(r"^[A-Z][A-Z0-9_]{1,31}$")


def read_default_keys(path=KEYS_PATH):
    raw = path.read_bytes()
    if len(raw) % 8:
        raise ValueError(f"Key table length is not divisible by 8: {len(raw)}")
    keys = [raw[offset : offset + 8] for offset in range(0, len(raw), 8)]
    if len(set(keys)) != len(keys):
        raise ValueError("The default key table contains duplicate keys")
    return keys


def validate_default_csv(path=DEFAULT_PATH, expected_rows=None):
    raw = path.read_bytes()
    with io.StringIO(raw.decode("utf-8-sig"), newline="") as stream:
        reader = csv.DictReader(stream, delimiter=";")
        if reader.fieldnames != ["ID_Linha", "Texto"]:
            raise ValueError(f"Unexpected default CSV columns: {reader.fieldnames}")
        ids = [int(row["ID_Linha"]) for row in reader]
    if ids != list(range(len(ids))):
        raise ValueError("Default CSV IDs are missing, duplicated, or unordered")
    if expected_rows is not None and len(ids) != expected_rows:
        raise ValueError(f"CSV has {len(ids)} rows; expected {expected_rows}")


def load_language_tables(paths=LANGUAGE_PATHS):
    tables = {}
    for language, path in paths.items():
        raw = path.read_bytes()
        with io.StringIO(raw.decode("utf-8-sig"), newline="") as stream:
            reader = csv.DictReader(stream, delimiter=";")
            if reader.fieldnames != ["ID_Linha", "Texto"]:
                raise ValueError(f"Unexpected {language} CSV columns: {reader.fieldnames}")
            rows = list(reader)
        ids = [int(row["ID_Linha"]) for row in rows]
        if ids != list(range(len(ids))):
            raise ValueError(f"{language} CSV IDs are missing, duplicated, or unordered")
        tables[language] = {row_id: row["Texto"] for row_id, row in zip(ids, rows)}
    if len({len(table) for table in tables.values()}) != 1:
        raise ValueError("Language tables have different row counts")
    return tables


def source_fingerprint(row_id, tables):
    text = "\x00".join(
        tables[language][row_id] for language in ("en", "ja", "zh", "ko")
    )
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


def validate_review_rows(rows, tables):
    seen = set()
    for row in rows:
        key = (row["resource"], row["id"])
        if key in seen:
            raise ValueError(f"Duplicate review key: {key}")
        seen.add(key)
        if row["resource"] != "default":
            raise ValueError(f"Unsupported review resource: {row['resource']}")
        row_id = int(row["id"])
        if row_id not in tables["ko"]:
            raise ValueError(f"Review ID is missing from the language tables: {row_id}")
        if not row["review_groups"] or not row["finding_ref"]:
            raise ValueError(f"Review ID {row_id} is missing its group or evidence link")
        for field in REVIEW_STATUSES:
            if row[field] not in REVIEW_VALUES:
                raise ValueError(f"Invalid {field} status for ID {row_id}: {row[field]}")
        if row["overall"] not in REVIEW_OVERALL_VALUES:
            raise ValueError(f"Invalid overall status for ID {row_id}: {row['overall']}")
        if row["source_fingerprint"] != source_fingerprint(row_id, tables):
            raise ValueError(f"Stale source fingerprint for ID {row_id}")
    return len(seen)


def asset_metadata(data):
    strings = [match.group().decode("ascii") for match in PRINTABLE.finditer(data)]
    quest_ids = set()
    for index, value in enumerate(strings[:-1]):
        if value == "QUEST_ID" and QUEST_VALUE.fullmatch(strings[index + 1]):
            quest_ids.add(strings[index + 1])
    npc_symbols = {
        value.decode("ascii") for value in NPC_SYMBOL.findall(data)
    }
    handlers = {value.decode("ascii") for value in DIALOG_HANDLER.findall(data)}
    return (
        ",".join(sorted(quest_ids)),
        ",".join(sorted(npc_symbols)),
        len(handlers),
    )


def find_key_ids(data, key_to_id):
    found = set()
    for offset in range(max(0, len(data) - 7)):
        row_id = key_to_id.get(data[offset : offset + 8])
        if row_id is not None:
            found.add(row_id)
    return found


def build_rows(keys, assets):
    key_to_id = {key: row_id for row_id, key in enumerate(keys)}
    rows = []
    for asset_name, data in sorted(assets):
        ids = find_key_ids(data, key_to_id)
        if not ids:
            continue
        quest_ids, npc_symbols, handler_count = asset_metadata(data)
        for row_id in sorted(ids):
            rows.append(
                (
                    "default",
                    row_id,
                    asset_name,
                    quest_ids,
                    npc_symbols,
                    handler_count,
                    "exact_8_byte_key_match",
                    "not_mapped_to_key",
                    "unknown",
                )
            )
    return rows


def render_tsv(rows):
    stream = io.StringIO(newline="")
    writer = csv.writer(stream, delimiter="\t", lineterminator="\n")
    writer.writerow(HEADER)
    writer.writerows(rows)
    return stream.getvalue().encode("utf-8")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--output", type=Path, default=OUTPUT_PATH, help="TSV output path"
    )
    checks = parser.add_mutually_exclusive_group()
    checks.add_argument(
        "--check",
        action="store_true",
        help="Compare generated bytes with the existing TSV without writing",
    )
    checks.add_argument(
        "--check-review-ledger",
        action="store_true",
        help="Validate review IDs, statuses, and four-language fingerprints",
    )
    args = parser.parse_args()

    if args.check_review_ledger:
        with REVIEW_PATH.open(encoding="utf-8", newline="") as stream:
            reader = csv.DictReader(stream, delimiter="\t")
            if tuple(reader.fieldnames or ()) != REVIEW_HEADER:
                raise SystemExit(f"Unexpected review ledger columns: {reader.fieldnames}")
            rows = list(reader)
        count = validate_review_rows(rows, load_language_tables())
        print(f"OK: {REVIEW_PATH} ({count} reviewed IDs)")
        return

    keys = read_default_keys()
    validate_default_csv(expected_rows=len(keys))
    assets = [
        (path.name, path.read_bytes())
        for path in ASSET_DIR.glob("*.quest_bxml")
    ]
    rendered = render_tsv(build_rows(keys, assets))

    if args.check:
        if not args.output.exists():
            raise SystemExit(f"Missing index: {args.output}")
        if args.output.read_bytes() != rendered:
            raise SystemExit(f"Index is stale: {args.output}")
        print(f"OK: {args.output}")
        return

    args.output.parent.mkdir(parents=True, exist_ok=True)
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_bytes(rendered)
    temporary.replace(args.output)
    print(f"Wrote {args.output}: {len(rendered.splitlines()) - 1} associations")


if __name__ == "__main__":
    main()
