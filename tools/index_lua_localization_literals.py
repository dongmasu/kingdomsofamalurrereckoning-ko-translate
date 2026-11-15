#!/usr/bin/env python3
"""Index exact printable Lua-script literals matching English default rows."""

import argparse
import csv
import hashlib
import json
from pathlib import Path
import re


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_EXTRACTION_DIR = ROOT / "work/zh_cn/audit/lua-script-extracted"
DEFAULT_ENGLISH_CSV = ROOT / "src/csv/en_us/locatexts_en_us.koalocatext_default.csv"
DEFAULT_REGISTRY_TSV = (
    ROOT / "work/zh_cn/translation-reference/classification/lua-script-registry-index.tsv"
)
DEFAULT_OUTPUT = (
    ROOT / "work/zh_cn/translation-reference/classification/"
    "lua-script-localization-literal-index.tsv"
)
PRINTABLE_ASCII = re.compile(rb"[\x20-\x7e]{4,}")
MINIMUM_LITERAL_LENGTH = 25
HEADER = (
    "script_id", "registry_name", "record_name", "source_path", "batch",
    "record_offset", "record_bytes", "script_payload_offset",
    "script_payload_bytes", "script_payload_sha256", "payload_path",
    "literal_offset", "default_id", "source_text", "minimum_literal_length",
    "match_evidence", "usage_limit",
)
MATCH_EVIDENCE = "exact_ascii_printable_run_equals_en_us_default_Texto"
USAGE_LIMIT = "Literal presence does not prove runtime execution or display."


def read_csv_rows(path):
    with Path(path).open(encoding="utf-8-sig", newline="") as stream:
        reader = csv.DictReader(stream, delimiter=";")
        if not reader.fieldnames or not {"ID_Linha", "Texto"} <= set(reader.fieldnames):
            raise ValueError(f"CSV must contain ID_Linha and Texto: {path}")
        return list(reader)


def read_registry(path):
    with Path(path).open(encoding="utf-8", newline="") as stream:
        reader = csv.DictReader(stream, delimiter="\t")
        required = {"script_id", "registry_name", "source_path"}
        if not reader.fieldnames or not required <= set(reader.fieldnames):
            raise ValueError(f"Lua registry TSV is missing required columns: {path}")
        rows = {}
        for row in reader:
            script_id = row["script_id"]
            if script_id in rows:
                raise ValueError(f"Duplicate script registry ID: {script_id}")
            rows[script_id] = row
        return rows


def build_literal_rows(
    manifest,
    extraction_dir,
    english_rows,
    registry,
    minimum_length=MINIMUM_LITERAL_LENGTH,
):
    if minimum_length < 1:
        raise ValueError("Minimum literal length must be positive")
    by_text = {}
    for row in english_rows:
        by_text.setdefault(row["Texto"], []).append(row["ID_Linha"])

    rows = []
    extraction_dir = Path(extraction_dir).resolve()
    for occurrence in manifest["occurrences"]:
        if occurrence["container_kind"] != "batch_script":
            continue
        script_id = str(occurrence["asset_id"])
        script = registry.get(script_id)
        if script is None:
            raise ValueError(f"Script ID missing from registry index: {script_id}")
        payload_path = Path(occurrence["payload_path"])
        if payload_path.is_absolute() or ".." in payload_path.parts:
            raise ValueError(f"Unsafe extracted payload path: {payload_path}")
        candidate = extraction_dir / payload_path
        resolved = candidate.resolve()
        if candidate.is_symlink() or not resolved.is_relative_to(extraction_dir):
            raise ValueError(f"Unsafe extracted payload path: {payload_path}")
        payload = resolved.read_bytes()
        actual_hash = hashlib.sha256(payload).hexdigest()
        if actual_hash != occurrence["payload_sha256"]:
            raise ValueError(f"Edited or stale Lua payload: {payload_path}")

        for match in PRINTABLE_ASCII.finditer(payload):
            text = match.group().decode("ascii")
            if len(text) < minimum_length:
                continue
            for default_id in by_text.get(text, ()):
                rows.append((
                    script_id,
                    script["registry_name"],
                    occurrence.get("record_name", ""),
                    script["source_path"],
                    occurrence["container_path"],
                    occurrence["record_offset"],
                    occurrence["record_bytes"],
                    occurrence["payload_offset"],
                    occurrence["payload_bytes"],
                    occurrence["payload_sha256"],
                    occurrence["payload_path"],
                    match.start(),
                    default_id,
                    text,
                    minimum_length,
                    MATCH_EVIDENCE,
                    USAGE_LIMIT,
                ))
    rows.sort(key=lambda row: (
        int(row[0]), int(row[5]), int(row[11]), int(row[12]),
    ))
    return rows


def render_tsv(rows):
    import io
    output = io.StringIO(newline="")
    writer = csv.writer(output, delimiter="\t", lineterminator="\n")
    writer.writerow(HEADER)
    writer.writerows(rows)
    return output.getvalue()


def build_index(
    extraction_dir=DEFAULT_EXTRACTION_DIR,
    english_csv=DEFAULT_ENGLISH_CSV,
    registry_tsv=DEFAULT_REGISTRY_TSV,
    minimum_length=MINIMUM_LITERAL_LENGTH,
):
    manifest_path = Path(extraction_dir) / "manifest.json"
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    rows = build_literal_rows(
        manifest,
        extraction_dir,
        read_csv_rows(english_csv),
        read_registry(registry_tsv),
        minimum_length,
    )
    return rows, render_tsv(rows)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--extraction-dir", default=DEFAULT_EXTRACTION_DIR)
    parser.add_argument("--english-csv", default=DEFAULT_ENGLISH_CSV)
    parser.add_argument("--registry-tsv", default=DEFAULT_REGISTRY_TSV)
    parser.add_argument("--output", default=DEFAULT_OUTPUT)
    parser.add_argument(
        "--min-literal-length",
        type=int,
        default=MINIMUM_LITERAL_LENGTH,
        help=f"minimum ASCII literal length to index (default: {MINIMUM_LITERAL_LENGTH})",
    )
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    rows, output = build_index(
        args.extraction_dir,
        args.english_csv,
        args.registry_tsv,
        args.min_literal_length,
    )
    path = Path(args.output)
    if args.check:
        if not path.exists() or path.read_text(encoding="utf-8") != output:
            raise SystemExit(f"Index is stale: {path}")
    else:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(output, encoding="utf-8")
    print(json.dumps({"literal_matches": len(rows), "output": str(path)}, sort_keys=True))


if __name__ == "__main__":
    main()
