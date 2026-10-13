#!/usr/bin/env python3
"""Apply the contextual copper-ring correction at default ID 18954."""

import hashlib
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
CSV_PATH = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
BACKUP_PATH = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-adept-partial-closures-D19505/"
    "locatexts_zh_cn.koalocatext_default.csv"
)
EXPECTED_SHA256 = "c4f1def4843091d0a8fe9d31e618c67ab496495e922a4ed70842753220b05b2c"
OLD = "구리 고리".encode("utf-8")
NEW = "구리 반지".encode("utf-8")


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
    original = CSV_PATH.read_bytes()
    backup = BACKUP_PATH.read_bytes()
    if hashlib.sha256(original).hexdigest() != EXPECTED_SHA256:
        raise SystemExit("Active CSV hash does not match the D-19504 checkpoint")
    if backup != original:
        raise SystemExit("Pre-edit backup is not byte-identical")

    rows = spans(original)
    if len(rows) != 65135:
        raise SystemExit(f"Unexpected ID row count: {len(rows)}")
    output = bytearray(original[: rows[0][1]])
    changed = False
    for row_id, start, end in rows:
        row = original[start:end]
        if row_id == "18954":
            if row.count(OLD) != 1:
                raise SystemExit("Expected exactly one `구리 고리` in ID 18954")
            row = row.replace(OLD, NEW, 1)
            changed = True
        output.extend(row)
    if not changed:
        raise SystemExit("Target ID 18954 was not found")

    edited = bytes(output)
    if not edited.startswith(b"\xef\xbb\xbf"):
        raise SystemExit("UTF-8 BOM changed")
    if edited.count(b"\r\n") != original.count(b"\r\n"):
        raise SystemExit("CRLF count changed")
    if edited.count(b"\n") - edited.count(b"\r\n") != (
        original.count(b"\n") - original.count(b"\r\n")
    ):
        raise SystemExit("Bare-LF count changed")
    if [item[0] for item in spans(edited)] != [item[0] for item in rows]:
        raise SystemExit("ID order changed")

    reverse_spans = spans(edited)
    reverted = bytearray(edited[: reverse_spans[0][1]])
    for row_id, start, end in reverse_spans:
        row = edited[start:end]
        if row_id == "18954":
            if row.count(NEW) != 1:
                raise SystemExit("Cannot uniquely reverse the ID 18954 edit")
            row = row.replace(NEW, OLD, 1)
        reverted.extend(row)
    if bytes(reverted) != original:
        raise SystemExit("Reversing the approved substitution did not restore input")
    CSV_PATH.write_bytes(edited)
    print(f"pre-edit SHA-256: {EXPECTED_SHA256}")
    print(f"post-edit SHA-256: {hashlib.sha256(edited).hexdigest()}")
    print(f"changed ID: 18954; row count: {len(rows)}")
    crlf_count = edited.count(b"\r\n")
    bare_lf_count = edited.count(b"\n") - crlf_count
    print(f"CRLF: {crlf_count}; bare LF: {bare_lf_count}")
    print(f"backup: {BACKUP_PATH}")


if __name__ == "__main__":
    main()
