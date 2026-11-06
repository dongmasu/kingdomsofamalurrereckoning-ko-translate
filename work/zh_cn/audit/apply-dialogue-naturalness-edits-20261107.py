#!/usr/bin/env python3
"""Apply only independently verified, ID-scoped dialogue corrections."""

import argparse
import csv
import hashlib
import importlib.util
import io
import json
import os
from pathlib import Path
import re
import stat
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[3]
HELPER_PATH = ROOT / "tools/replace_text_preserve_eol.py"
HELPER_SPEC = importlib.util.spec_from_file_location(
    "replace_text_preserve_eol", HELPER_PATH
)
HELPER = importlib.util.module_from_spec(HELPER_SPEC)
sys.modules[HELPER_SPEC.name] = HELPER
HELPER_SPEC.loader.exec_module(HELPER)

CSV_PATH = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
AUDIT_DIR = ROOT / "work/zh_cn/audit/dialogue-naturalness-20261106"
VERIFY_TSV = AUDIT_DIR / "adjudication/verification/verification-decisions.tsv"
SUMMARY = AUDIT_DIR / "summary.json"
APPLIED_TSV = AUDIT_DIR / "adjudication/verification/applied-edits.tsv"
APPLICATION_SUMMARY = AUDIT_DIR / "adjudication/verification/application-summary.json"
ADJUDICATION_TSV = AUDIT_DIR / "adjudication/review-decisions.tsv"
FINAL_TSV = AUDIT_DIR / "adjudication/final-dispositions.tsv"
NEWLINE_RE = re.compile(r"\r\n|\r|\n")
PLACEHOLDER_RE = re.compile(r"\{[^{}]+\}")


def line_ending_signature(text):
    return NEWLINE_RE.findall(text)


def encode_csv_field(text):
    if any(char in text for char in ';"\r\n'):
        return '"' + text.replace('"', '""') + '"'
    return text


def replace_id_field(data, row_id, old_text, new_text):
    if old_text == new_text:
        raise ValueError(f"ID {row_id}: replacement is unchanged")
    if line_ending_signature(old_text) != line_ending_signature(new_text):
        raise ValueError(f"ID {row_id}: embedded line-ending pattern changed")
    if sorted(PLACEHOLDER_RE.findall(old_text)) != sorted(
        PLACEHOLDER_RE.findall(new_text)
    ):
        raise ValueError(f"ID {row_id}: placeholder set changed")

    prefix = f"{row_id};"
    old = (prefix + encode_csv_field(old_text)).encode("utf-8")
    new = (prefix + encode_csv_field(new_text)).encode("utf-8")
    if b"\n" not in old and b"\r" not in old:
        return HELPER.replace_bytes(data, old, new, expected_count=1)
    count = data.count(old)
    if count != 1:
        raise ValueError(f"ID {row_id}: expected one exact row match, found {count}")
    return data.replace(old, new, 1)


def read_csv_rows(data):
    with io.StringIO(data.decode("utf-8-sig"), newline="") as stream:
        reader = csv.DictReader(stream, delimiter=";")
        if reader.fieldnames != ["ID_Linha", "Texto"]:
            raise ValueError(f"Unexpected CSV columns: {reader.fieldnames}")
        rows = list(reader)
    ids = [int(row["ID_Linha"]) for row in rows]
    if ids != list(range(len(rows))):
        raise ValueError("CSV IDs are missing, duplicated, or out of order")
    if any(row["Texto"] is None for row in rows):
        raise ValueError("CSV contains an empty parsed text field")
    return {row_id: row["Texto"] for row_id, row in enumerate(rows)}


def line_ending_counts(data):
    return {
        "crlf": data.count(b"\r\n"),
        "lf": data.count(b"\n") - data.count(b"\r\n"),
        "cr": data.count(b"\r") - data.count(b"\r\n"),
    }


def load_approved_edits():
    with VERIFY_TSV.open(encoding="utf-8-sig", newline="") as stream:
        rows = list(csv.DictReader(stream, delimiter="\t"))
    if len({row["id"] for row in rows}) != len(rows):
        raise ValueError("Verification TSV contains duplicate IDs")
    return [row for row in rows if row["verification"] == "apply"]


def prepare_edits(data, approved):
    source_rows = read_csv_rows(data)
    updated = data
    for item in approved:
        row_id = int(item["id"])
        if row_id not in source_rows:
            raise ValueError(f"Unknown ID {row_id}")
        if item["original_ko"] != source_rows[row_id]:
            raise ValueError(f"ID {row_id}: current Korean differs from verified snapshot")
        updated = replace_id_field(
            updated, row_id, item["original_ko"], item["proposed_ko"]
        )

    if data.startswith(b"\xef\xbb\xbf") != updated.startswith(b"\xef\xbb\xbf"):
        raise ValueError("UTF-8 BOM changed")
    if line_ending_counts(data) != line_ending_counts(updated):
        raise ValueError("CSV line-ending distribution changed")
    updated_rows = read_csv_rows(updated)
    for item in approved:
        row_id = int(item["id"])
        if updated_rows[row_id] != item["proposed_ko"]:
            raise ValueError(f"ID {row_id}: replacement did not verify after edit")
    if len(updated_rows) != len(source_rows):
        raise ValueError("CSV record count changed")
    return updated


def atomic_write(path, data):
    original_mode = stat.S_IMODE(path.stat().st_mode)
    temporary = None
    try:
        with tempfile.NamedTemporaryFile(dir=path.parent, prefix=f".{path.name}.", delete=False) as stream:
            temporary = Path(stream.name)
            stream.write(data)
            stream.flush()
            os.fsync(stream.fileno())
        os.chmod(temporary, original_mode)
        os.replace(temporary, path)
    finally:
        if temporary is not None and temporary.exists():
            temporary.unlink()


def write_manifest(path, approved):
    with path.open("w", encoding="utf-8-sig", newline="") as stream:
        writer = csv.writer(stream, delimiter="\t", lineterminator="\n")
        writer.writerow([
            "id", "original_ko", "revised_ko", "evidence_language",
            "evidence_quote", "reason",
        ])
        for item in approved:
            writer.writerow([
                item["id"], item["original_ko"], item["proposed_ko"],
                item["evidence_language"], item["evidence_quote"], item["reason"],
            ])


def verify_applied_bytes(data, approved, expected_hash):
    current_rows = read_csv_rows(data)
    if len({item["id"] for item in approved}) != len(approved):
        raise ValueError("Applied-edit manifest contains duplicate IDs")
    for item in approved:
        row_id = int(item["id"])
        if current_rows.get(row_id) != item["proposed_ko"]:
            raise ValueError(f"Applied text mismatch at ID {row_id}")
    restored = data
    for item in reversed(approved):
        restored = replace_id_field(
            restored, int(item["id"]), item["proposed_ko"], item["original_ko"]
        )
    source_hash = hashlib.sha256(restored).hexdigest()
    if source_hash != expected_hash:
        raise ValueError("Reverse patch does not restore the reviewed source snapshot")
    return {
        "applied_edits": len(approved),
        "source_sha256": source_hash,
        "result_sha256": hashlib.sha256(data).hexdigest(),
        "reverse_patch_restores_source": True,
        "records": len(current_rows),
        "line_endings": line_ending_counts(data),
        "utf8_bom": data.startswith(b"\xef\xbb\xbf"),
    }


def merge_final_dispositions(adjudicated, verified):
    adjudicated_by_id = {row["id"]: row for row in adjudicated}
    verified_by_id = {row["id"]: row for row in verified}
    correction_ids = {
        row["id"] for row in adjudicated if row["decision"] == "corrected"
    }
    if len(adjudicated_by_id) != len(adjudicated):
        raise ValueError("Adjudication decisions contain duplicate IDs")
    if set(verified_by_id) != correction_ids:
        raise ValueError("Verification IDs do not match all correction proposals")

    final = []
    for row in adjudicated:
        item = dict(row)
        verification = verified_by_id.get(row["id"])
        if row["decision"] == "corrected":
            item["verification"] = verification["verification"]
            item["verification_reason"] = verification["reason"]
            item["final_decision"] = (
                "corrected" if verification["verification"] == "apply" else "unresolved"
            )
        else:
            item["verification"] = ""
            item["verification_reason"] = ""
            item["final_decision"] = (
                "retained" if row["decision"] == "retained" else "unresolved"
            )
        final.append(item)
    return final


def write_final_dispositions(final):
    with ADJUDICATION_TSV.open(encoding="utf-8-sig", newline="") as stream:
        adjudicated = list(csv.DictReader(stream, delimiter="\t"))
    with VERIFY_TSV.open(encoding="utf-8-sig", newline="") as stream:
        verified = list(csv.DictReader(stream, delimiter="\t"))
    final = merge_final_dispositions(adjudicated, verified)
    counts = {key: sum(item["final_decision"] == key for item in final)
              for key in ("corrected", "retained", "unresolved")}
    with FINAL_TSV.open("w", encoding="utf-8-sig", newline="") as stream:
        writer = csv.writer(stream, delimiter="\t", lineterminator="\n")
        writer.writerow([
            "id", "final_decision", "adjudication_decision", "verification",
            "original_ko", "proposed_ko", "adjudication_reason", "verification_reason",
        ])
        for item in final:
            writer.writerow([
                item["id"], item["final_decision"], item["decision"],
                item["verification"], item["original_ko"], item["revised_ko"],
                item["reason"], item["verification_reason"],
            ])
    expected_count = json.loads(SUMMARY.read_text(encoding="utf-8"))["candidate_union"]
    if len(final) != expected_count:
        raise ValueError("Final dispositions do not cover every candidate")
    return counts


def verify_applied_file():
    data = CSV_PATH.read_bytes()
    audit_summary = json.loads(SUMMARY.read_text(encoding="utf-8"))
    expected_hash = audit_summary["snapshots"]["ko"]["sha256"]
    approved = load_approved_edits()
    result = verify_applied_bytes(data, approved, expected_hash)
    final_counts = write_final_dispositions(result)
    result["candidate_count"] = audit_summary["candidate_union"]
    result["final_dispositions"] = final_counts
    APPLICATION_SUMMARY.write_text(
        json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
    )
    audit_summary["post_review"] = {
        "source_snapshot_sha256": expected_hash,
        "active_csv_sha256": result["result_sha256"],
        "applied_corrections": result["applied_edits"],
        "final_dispositions": final_counts,
        "final_dispositions_tsv": str(FINAL_TSV.relative_to(ROOT)),
    }
    SUMMARY.write_text(
        json.dumps(audit_summary, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    print(json.dumps(result, ensure_ascii=False))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--apply", action="store_true", help="Write the verified edits")
    parser.add_argument(
        "--verify-applied", action="store_true",
        help="Verify the applied manifest against the current CSV",
    )
    args = parser.parse_args()
    if args.apply and args.verify_applied:
        parser.error("--apply and --verify-applied are mutually exclusive")
    if args.verify_applied:
        verify_applied_file()
        return

    original = CSV_PATH.read_bytes()
    expected_hash = json.loads(SUMMARY.read_text(encoding="utf-8"))["snapshots"]["ko"]["sha256"]
    current_hash = hashlib.sha256(original).hexdigest()
    if current_hash != expected_hash:
        parser.error("Active Korean CSV differs from the completed review snapshot")

    approved = load_approved_edits()
    updated = prepare_edits(original, approved)
    restored = updated
    for item in reversed(approved):
        restored = replace_id_field(
            restored, int(item["id"]), item["proposed_ko"], item["original_ko"]
        )
    if hashlib.sha256(restored).hexdigest() != current_hash:
        parser.error("Reversing the planned edits does not restore the source snapshot")
    print(
        f"Preflight passed: edits={len(approved)} records={len(read_csv_rows(updated))} "
        f"line_endings={line_ending_counts(original)}"
    )
    if args.apply:
        atomic_write(CSV_PATH, updated)
        write_manifest(APPLIED_TSV, approved)
        verify_applied_file()
        print(f"Applied {len(approved)} ID-scoped edits.")


if __name__ == "__main__":
    main()
