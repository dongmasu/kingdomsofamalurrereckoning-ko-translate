#!/usr/bin/env python3
"""Apply only source-supported terminology edits for grouped review D-19518."""

import hashlib
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
CSV_PATH = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
BACKUP_PATH = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-bisarane-context-D19518/"
    "locatexts_zh_cn.koalocatext_default.csv"
)
EXPECTED_SHA256 = "65cc6722a80c3a94c3623ec50720bf9c6a963634c76d09a6d643aaf149d7ebb4"
EDITS = {
    "62360": [("까마귀 팀(Crows)", "크로우즈(The Crows) 팀")],
    "62363": [("미사루", "미타란")],
    "62365": [
        ("숄리아 아르카나(Scholia Arcana)", "스콜리아 아르카나(Scholia Arcana)")
    ],
}


def spans(data):
    starts = list(re.finditer(rb"(?m)^(\xef\xbb\xbf)?(\d+);", data))
    return [
        (
            match.group(2).decode("ascii"),
            match.start(),
            starts[index + 1].start() if index + 1 < len(starts) else len(data),
        )
        for index, match in enumerate(starts)
    ]


def main():
    original = BACKUP_PATH.read_bytes()
    current = CSV_PATH.read_bytes()
    if hashlib.sha256(original).hexdigest() != EXPECTED_SHA256:
        raise SystemExit("Backup hash does not match the D-19517 checkpoint")
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
                    f"Expected one {old_text!r} in ID {row_id}; "
                    f"found {row.count(old)}"
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
