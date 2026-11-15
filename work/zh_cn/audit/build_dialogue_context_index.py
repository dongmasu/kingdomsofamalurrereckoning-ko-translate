#!/usr/bin/env python3
"""Build a read-only exact-key index from default IDs to quest assets."""

import argparse
import csv
import hashlib
import io
from pathlib import Path
import re
import struct


ROOT = Path(__file__).resolve().parents[3]
KEYS_PATH = ROOT / "src/csv/en_us/estrutura_hashes_flat.bin"
DEFAULT_PATH = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
ASSET_DIR = ROOT / "references/data/unpacked"
QUEST_REGISTRY_PATH = ASSET_DIR / "symbol_table_quest.bin"
QUEST_ASSET_COUNT = 530
REFERENCE_CLASSIFICATION = ROOT / "work/zh_cn/translation-reference/classification"
OUTPUT_PATH = REFERENCE_CLASSIFICATION / "default-quest-asset-index.tsv"
CATALOG_PATH = REFERENCE_CLASSIFICATION / "dialogue-context-asset-catalog.tsv"
ID_CATALOG_PATH = REFERENCE_CLASSIFICATION / "dialogue-context-id-catalog.tsv"
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
    "registry_quest_name",
    "registry_name_evidence",
)
CATALOG_HEADER = (
    "asset",
    "quest_ids",
    "npc_symbols",
    "matched_id_count",
    "ledger_id_count",
    "dialog_handler_count",
    "dialog_handlers",
    "grouping_tier",
    "ledger_coverage",
    "registry_quest_name",
    "registry_name_evidence",
)
ID_CATALOG_HEADER = (
    "resource",
    "id",
    "asset_link_status",
    "linked_assets",
    "linked_quest_ids",
    "asset_npc_symbols",
    "asset_grouping_tiers",
    "review_groups",
    "review_status",
    "speaker_attribution",
    "speaker_confidence",
    "dialogue_order",
    "finding_ref",
    "asset_registry_quest_names",
    "asset_registry_name_evidence",
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
NPC_SYMBOL = re.compile(rb"\b(?:DLC[0-9]+_)?NPC_[A-Za-z0-9_]+\b")
DIALOG_HANDLER = re.compile(rb"dialog_line_[A-Za-z0-9_]+")
QUEST_VALUE = re.compile(r"^[A-Z][A-Z0-9_]{1,31}$")
QUEST_ASSET_NAME = re.compile(r"^([0-9]+)\.quest_bxml$")


def read_symbol_table(path, expected_count=None, require_unique_names=False):
    """Read an ordinary ID/name table, optionally requiring unique names."""
    raw = path.read_bytes()
    if len(raw) < 4:
        raise ValueError("Symbol table is truncated before its entry count")
    count = struct.unpack_from("<I", raw)[0]
    if expected_count is not None and count != expected_count:
        raise ValueError(
            f"Symbol table has {count} entries; expected {expected_count}"
        )

    records_end = 4 + count * 12
    if len(raw) < records_end + 4:
        raise ValueError("Symbol table is truncated before its string area")
    string_size = struct.unpack_from("<I", raw, records_end)[0]
    strings_start = records_end + 4
    expected_size = strings_start + string_size
    if len(raw) < expected_size:
        raise ValueError("Symbol table string area is truncated")
    if len(raw) > expected_size:
        raise ValueError("Symbol table has trailing bytes after its string area")

    string_area = raw[strings_start:]
    names_by_id = {}
    seen_names = set()
    next_offset = 0
    for index in range(count):
        symbol_id, start, end = struct.unpack_from("<III", raw, 4 + index * 12)
        if symbol_id in names_by_id:
            raise ValueError(f"Symbol table contains duplicate ID: {symbol_id}")
        if start != next_offset or start >= end or end > len(string_area):
            raise ValueError(
                f"Symbol table has an invalid string range for ID {symbol_id}"
            )
        encoded_name = string_area[start:end]
        if encoded_name[-1:] != b"\x00" or b"\x00" in encoded_name[:-1]:
            raise ValueError(
                f"Symbol table name for ID {symbol_id} is not null-terminated"
            )
        try:
            name = encoded_name[:-1].decode("utf-8")
        except UnicodeDecodeError as exc:
            raise ValueError(
                f"Symbol table name for ID {symbol_id} is not valid UTF-8"
            ) from exc
        if not name:
            raise ValueError(f"Symbol table name for ID {symbol_id} is empty")
        if require_unique_names and name in seen_names:
            raise ValueError(f"Symbol table contains duplicate name: {name}")
        names_by_id[symbol_id] = name
        seen_names.add(name)
        next_offset = end
    if next_offset != len(string_area):
        raise ValueError("Symbol table string ranges do not cover the string area")
    return names_by_id


def read_quest_registry(path=QUEST_REGISTRY_PATH, expected_count=None):
    return read_symbol_table(
        path, expected_count, require_unique_names=True
    )


def registry_name_metadata(asset_name, quest_names=None):
    if quest_names is None:
        return "", "registry_not_supplied"
    match = QUEST_ASSET_NAME.fullmatch(asset_name)
    if not match:
        return "", "non_numeric_quest_asset_stem"
    quest_id = int(match.group(1))
    name = quest_names.get(quest_id)
    if name is None:
        return "", "symbol_table_quest.bin:no_exact_numeric_id_match"
    return name, "symbol_table_quest.bin:exact_numeric_filename_stem"


def validate_quest_asset_registry(
    assets, quest_names, expected_count=QUEST_ASSET_COUNT
):
    if len(assets) != expected_count:
        raise ValueError(
            f"Found {len(assets)} quest assets; expected {expected_count}"
        )
    asset_ids = []
    for asset_name, _ in assets:
        match = QUEST_ASSET_NAME.fullmatch(asset_name)
        if not match:
            raise ValueError(
                f"Quest asset has a non-numeric filename stem: {asset_name}"
            )
        asset_ids.append(int(match.group(1)))
    if len(set(asset_ids)) != len(asset_ids):
        raise ValueError("Quest assets contain duplicate numeric filename stems")
    missing_ids = sorted(set(asset_ids) - quest_names.keys())
    if missing_ids:
        preview = ", ".join(str(quest_id) for quest_id in missing_ids[:10])
        raise ValueError(
            f"{len(missing_ids)} quest assets are missing from the quest registry: "
            f"{preview}"
        )


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
    quest_ids, npc_symbols, handlers = asset_details(data)
    return quest_ids, npc_symbols, len(handlers)


def asset_details(data):
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
        sorted(handlers),
    )


def find_key_ids(data, key_to_id):
    found = set()
    for offset in range(max(0, len(data) - 7)):
        row_id = key_to_id.get(data[offset : offset + 8])
        if row_id is not None:
            found.add(row_id)
    return found


def split_asset_links(value):
    return [name.strip() for name in re.split(r"[;|]", value) if name.strip()]


def build_rows(keys, assets, quest_names=None):
    key_to_id = {key: row_id for row_id, key in enumerate(keys)}
    rows = []
    for asset_name, data in sorted(assets):
        ids = find_key_ids(data, key_to_id)
        if not ids:
            continue
        quest_ids, npc_symbols, handler_count = asset_metadata(data)
        registry_name, registry_evidence = registry_name_metadata(
            asset_name, quest_names
        )
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
                    registry_name,
                    registry_evidence,
                )
            )
    return rows


def classify_asset_grouping(quest_ids, npc_symbols, handler_count, matched_id_count):
    if matched_id_count == 0:
        return "no_default_key_link"
    quest_count = len(quest_ids.split(",")) if quest_ids else 0
    npc_count = len(npc_symbols.split(",")) if npc_symbols else 0
    if quest_count > 1:
        return "multi_quest_asset"
    if quest_count == 1 and npc_count == 1 and handler_count:
        return "single_quest_single_npc_candidate"
    if quest_count == 1 and npc_count == 1:
        return "single_quest_single_npc_no_dialog_handler"
    if quest_count and npc_count > 1:
        return "quest_multi_npc_asset"
    if quest_count and npc_count == 0:
        return "quest_no_npc_asset"
    if npc_count > 1:
        return "multi_npc_no_quest_asset"
    if npc_count == 1 and handler_count:
        return "single_npc_no_quest_asset_candidate"
    if npc_count == 1:
        return "single_npc_no_quest_asset_no_dialog_handler"
    if handler_count:
        return "dialog_handlers_no_quest_or_npc"
    return "asset_only_no_quest_id"


def build_id_catalog(
    keys, index_rows, asset_catalog_rows, review_rows, quest_names=None
):
    index_rows_by_id = {}
    for row in index_rows:
        index_rows_by_id.setdefault(str(row[1]), []).append(row)
    catalog_by_asset = {row[0]: row for row in asset_catalog_rows}
    review_by_id = {row["id"]: row for row in review_rows}

    rows = []
    for row_id in range(len(keys)):
        row_id_text = str(row_id)
        linked_rows = index_rows_by_id.get(row_id_text, [])
        assets = sorted({row[2] for row in linked_rows})
        quest_ids = sorted(
            {
                value
                for row in linked_rows
                for value in row[3].split(",")
                if value
            }
        )
        npc_symbols = sorted(
            {
                value
                for row in linked_rows
                for value in row[4].split(",")
                if value
            }
        )
        registry_names = {}
        registry_evidence = {}
        for row in linked_rows:
            asset_name = row[2]
            if len(row) > 10:
                name, evidence = row[9], row[10]
            else:
                name, evidence = registry_name_metadata(asset_name, quest_names)
            if name:
                registry_names[asset_name] = name
            if evidence:
                registry_evidence[asset_name] = evidence
        grouping_tiers = sorted(
            {
                catalog_by_asset[asset][7]
                for asset in assets
                if asset in catalog_by_asset
            }
        )
        review = review_by_id.get(row_id_text)
        rows.append(
            (
                "default",
                row_id_text,
                "quest_asset_linked" if assets else "no_quest_asset_match",
                ";".join(assets),
                ",".join(quest_ids),
                ",".join(npc_symbols),
                ";".join(grouping_tiers),
                review["review_groups"] if review else "",
                "reviewed" if review else "not_reviewed",
                review["speaker_attribution"] if review else "unassigned",
                review["speaker_confidence"] if review else "unknown",
                review["dialogue_order"] if review else "unknown",
                review["finding_ref"] if review else "",
                ";".join(
                    f"{asset}={registry_names[asset]}"
                    for asset in sorted(registry_names)
                ),
                ";".join(
                    f"{asset}={registry_evidence[asset]}"
                    for asset in sorted(registry_evidence)
                ),
            )
        )
    return rows


def build_asset_catalog(keys, assets, review_rows, quest_names=None):
    key_to_id = {key: row_id for row_id, key in enumerate(keys)}
    ledger_ids_by_asset = {}
    for row in review_rows:
        for asset_name in split_asset_links(row["linked_assets"]):
            ledger_ids_by_asset.setdefault(asset_name, set()).add(row["id"])

    rows = []
    for asset_name, data in sorted(assets):
        quest_ids, npc_symbols, handlers = asset_details(data)
        registry_name, registry_evidence = registry_name_metadata(
            asset_name, quest_names
        )
        matched_ids = find_key_ids(data, key_to_id)
        ledger_ids = ledger_ids_by_asset.get(asset_name, set()) & {
            str(row_id) for row_id in matched_ids
        }
        if not matched_ids:
            ledger_coverage = "no_default_key_links"
        elif not ledger_ids:
            ledger_coverage = "not_recorded"
        elif len(ledger_ids) == len(matched_ids):
            ledger_coverage = "all_ids_recorded"
        else:
            ledger_coverage = "partially_recorded"
        tier = classify_asset_grouping(
            quest_ids, npc_symbols, len(handlers), len(matched_ids)
        )
        rows.append(
            (
                asset_name,
                quest_ids,
                npc_symbols,
                len(matched_ids),
                len(ledger_ids),
                len(handlers),
                ",".join(handlers),
                tier,
                ledger_coverage,
                registry_name,
                registry_evidence,
            )
        )
    return rows


def render_tsv(rows, header=HEADER):
    stream = io.StringIO(newline="")
    writer = csv.writer(stream, delimiter="\t", lineterminator="\n")
    writer.writerow(header)
    writer.writerows(rows)
    return stream.getvalue().encode("utf-8")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--output", type=Path, default=OUTPUT_PATH, help="TSV output path"
    )
    parser.add_argument(
        "--asset-catalog",
        type=Path,
        default=CATALOG_PATH,
        help="Per-asset grouping and ledger-coverage TSV path",
    )
    parser.add_argument(
        "--id-catalog",
        type=Path,
        default=ID_CATALOG_PATH,
        help="All-default-ID context and review-coverage TSV path",
    )
    checks = parser.add_mutually_exclusive_group()
    checks.add_argument(
        "--check",
        action="store_true",
        help="Compare generated index and catalog bytes without writing",
    )
    checks.add_argument(
        "--check-index",
        action="store_true",
        help="Compare generated index bytes with the existing TSV without writing",
    )
    checks.add_argument(
        "--check-asset-catalog",
        action="store_true",
        help="Compare generated catalog bytes with the existing TSV without writing",
    )
    checks.add_argument(
        "--check-id-catalog",
        action="store_true",
        help="Compare generated all-ID catalog bytes without writing",
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
    quest_names = read_quest_registry(expected_count=QUEST_ASSET_COUNT)
    validate_quest_asset_registry(assets, quest_names)
    review_rows = []
    if REVIEW_PATH.exists():
        with REVIEW_PATH.open(encoding="utf-8", newline="") as stream:
            reader = csv.DictReader(stream, delimiter="\t")
            if tuple(reader.fieldnames or ()) != REVIEW_HEADER:
                raise SystemExit(
                    f"Unexpected review ledger columns: {reader.fieldnames}"
                )
            review_rows = list(reader)
    index_rows = build_rows(keys, assets, quest_names)
    asset_catalog_rows = build_asset_catalog(
        keys, assets, review_rows, quest_names
    )
    rendered = render_tsv(index_rows)
    catalog = render_tsv(asset_catalog_rows, CATALOG_HEADER)
    id_catalog = render_tsv(
        build_id_catalog(
            keys, index_rows, asset_catalog_rows, review_rows, quest_names
        ),
        ID_CATALOG_HEADER,
    )

    if args.check or args.check_index:
        if not args.output.exists():
            raise SystemExit(f"Missing index: {args.output}")
        if args.output.read_bytes() != rendered:
            raise SystemExit(f"Index is stale: {args.output}")
        print(f"OK: {args.output}")
        if args.check_index:
            return

    if args.check or args.check_asset_catalog:
        if not args.asset_catalog.exists():
            raise SystemExit(f"Missing asset catalog: {args.asset_catalog}")
        if args.asset_catalog.read_bytes() != catalog:
            raise SystemExit(f"Asset catalog is stale: {args.asset_catalog}")
        print(f"OK: {args.asset_catalog}")
        if args.check_asset_catalog:
            return

    if args.check or args.check_id_catalog:
        if not args.id_catalog.exists():
            raise SystemExit(f"Missing ID catalog: {args.id_catalog}")
        if args.id_catalog.read_bytes() != id_catalog:
            raise SystemExit(f"ID catalog is stale: {args.id_catalog}")
        print(f"OK: {args.id_catalog}")
        return

    args.output.parent.mkdir(parents=True, exist_ok=True)
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_bytes(rendered)
    temporary.replace(args.output)
    args.asset_catalog.parent.mkdir(parents=True, exist_ok=True)
    catalog_temporary = args.asset_catalog.with_suffix(
        args.asset_catalog.suffix + ".tmp"
    )
    catalog_temporary.write_bytes(catalog)
    catalog_temporary.replace(args.asset_catalog)
    args.id_catalog.parent.mkdir(parents=True, exist_ok=True)
    id_catalog_temporary = args.id_catalog.with_suffix(
        args.id_catalog.suffix + ".tmp"
    )
    id_catalog_temporary.write_bytes(id_catalog)
    id_catalog_temporary.replace(args.id_catalog)
    print(f"Wrote {args.output}: {len(rendered.splitlines()) - 1} associations")
    print(f"Wrote {args.asset_catalog}: {len(assets)} quest assets")
    print(f"Wrote {args.id_catalog}: {len(id_catalog.splitlines()) - 1} IDs")


if __name__ == "__main__":
    main()
