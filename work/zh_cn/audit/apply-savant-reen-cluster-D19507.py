#!/usr/bin/env python3
"""Normalize the Savant Reen title/name in two approved rows."""

import hashlib
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
CSV_PATH = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
BACKUP_PATH = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-savant-reen-cluster-D19507/"
    "locatexts_zh_cn.koalocatext_default.csv"
)
EXPECTED_SHA256 = "5ad2aca238cb804c343b0186591815aee2c7e9850332ae41f1aced893c47949d"
EDITS = {
    "29625": [("현자 린", "사반트 린")],
    "52051": [("사반트 리언(Savant Reen)", "사반트 린(Savant Reen)")],
}


def spans(data):
    starts = list(re.finditer(rb"(?m)^(\d+);", data))
    return [
        (
            match.group(1).decode("ascii"),
            match.start(),
            starts[index + 1].start() if index + 1 < len(starts) else len(data),
        )
        for index, match in enumerate(starts)
    ]


def main():
    current = CSV_PATH.read_bytes()
    original = BACKUP_PATH.read_bytes()
    if hashlib.sha256(original).hexdigest() != EXPECTED_SHA256:
        raise SystemExit("Backup hash does not match the D-19506 checkpoint")
    if current != original:
        raise SystemExit("Active CSV differs from the byte-identical backup")

    rows = spans(original)
    if len(rows) != 65135:
        raise SystemExit(f"Unexpected ID row count: {len(rows)}")
    by_id = {row_id: (start, end) for row_id, start, end in rows}
    changed = {}
    for row_id, replacements in EDITS.items():
        if row_id not in by_id:
            raise SystemExit(f"Missing target ID {row_id}")
        start, end = by_id[row_id]
        row = original[start:end]
        for old_text, new_text in replacements:
            old = old_text.encode("utf-8")
            if row.count(old) != 1:
                raise SystemExit(
                    f"Expected one {old_text!r} in ID {row_id}; found {row.count(old)}"
                )
            row = row.replace(old, new_text.encode("utf-8"), 1)
        changed[row_id] = row

    edited = bytearray(original[: rows[0][1]])
    for row_id, start, end in rows:
        edited.extend(changed.get(row_id, original[start:end]))
    edited = bytes(edited)
    if not edited.startswith(b"\xef\xbb\xbf"):
        raise SystemExit("UTF-8 BOM changed")
    if edited.count(b"\r\n") != original.count(b"\r\n"):
        raise SystemExit("CRLF count changed")
    if edited.count(b"\n") - edited.count(b"\r\n") != (
        original.count(b"\n") - original.count(b"\r\n")
    ):
        raise SystemExit("Bare-LF count changed")

    edited_rows = spans(edited)
    if [row[0] for row in edited_rows] != [row[0] for row in rows]:
        raise SystemExit("ID order changed")
    restored = bytearray(edited[: edited_rows[0][1]])
    for row_id, start, end in edited_rows:
        row = edited[start:end]
        for old_text, new_text in reversed(EDITS.get(row_id, [])):
            old = old_text.encode("utf-8")
            new = new_text.encode("utf-8")
            if row.count(new) != 1:
                raise SystemExit(f"Cannot uniquely reverse ID {row_id}")
            row = row.replace(new, old, 1)
        restored.extend(row)
    if bytes(restored) != original:
        raise SystemExit("Reversing approved substitutions did not restore backup")

    CSV_PATH.write_bytes(edited)
    crlf_count = edited.count(b"\r\n")
    bare_lf_count = edited.count(b"\n") - crlf_count
    print(f"pre-edit SHA-256: {EXPECTED_SHA256}")
    print(f"post-edit SHA-256: {hashlib.sha256(edited).hexdigest()}")
    print(f"changed IDs: {', '.join(EDITS)}")
    print(f"CRLF: {crlf_count}; bare LF: {bare_lf_count}")
    print(f"backup: {BACKUP_PATH}")


if __name__ == "__main__":
    main()
