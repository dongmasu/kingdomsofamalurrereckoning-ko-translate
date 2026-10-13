#!/usr/bin/env python3
"""Apply the approved D-19504 Scholia Arcana rank-term edits in place."""

from __future__ import annotations

import hashlib
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
CSV_PATH = ROOT / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
BACKUP_PATH = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-adept-rank-cluster-D19504/"
    "locatexts_zh_cn.koalocatext_default.csv"
)
EXPECTED_SHA256 = "f053125768e2383b2686dadf188d8172d65dda3f1e487b011b5835ec43bc177f"
INTERMEDIATE_SHA256 = "d49293d2513ce094d953a4328ec1323b5d619d7256ff2f368ed0a8c05839a85f"

EDITS = {
    "760": [("견습 마법사 레르카라 펠", "숙련자 레르카라 펠")],
    "4796": [("수습생,", "숙련자여,")],
    "5369": [("수습생(Adept)", "숙련자(Adept)")],
    "6758": [("수련자를 찾으라고", "숙련자를 찾으라고")],
    "21664": [("수련자여,", "숙련자여,")],
    "22135": [
        ("수련자로 마법을", "숙련자로 마법을"),
        ("아르카나 학회(Scholia Arcana)", "스콜리아 아르카나(Scholia Arcana)"),
    ],
    "32458": [("수습자여.", "숙련자여.")],
    "34679": [("수습 현자 이그나스", "숙련자 이그나스")],
    "39071": [("수습 마법사 펠", "숙련자 펠")],
    "56163": [("펠 수습자(Adept Fel)", "펠 숙련자(Adept Fel)")],
    "4862": [("수습 마법사 레르카라 펠", "숙련자 레르카라 펠")],
    "28762": [("수련자여", "숙련자여")],
    "58499": [("현자 에이선 엥가르", "사반트 에이선 엥가르")],
    "18954": [
        ("아르카나 대학의 숙련자 계급", "스콜리아 아르카나의 숙련자 계급")
    ],
    "31887": [("석학 에이선 엥가르", "사반트 에이선 엥가르")],
}


def record_spans(data: bytes) -> tuple[list[tuple[str, int, int]], dict[str, tuple[int, int]]]:
    matches = list(re.finditer(rb"(?m)^(\d+);", data))
    spans = []
    by_id = {}
    for index, match in enumerate(matches):
        row_id = match.group(1).decode("ascii")
        start = match.start()
        end = matches[index + 1].start() if index + 1 < len(matches) else len(data)
        spans.append((row_id, start, end))
        by_id[row_id] = (start, end)
    return spans, by_id


def main() -> None:
    current = CSV_PATH.read_bytes()
    backup = BACKUP_PATH.read_bytes()
    before_hash = hashlib.sha256(backup).hexdigest()
    current_hash = hashlib.sha256(current).hexdigest()
    if before_hash != EXPECTED_SHA256:
        raise SystemExit(f"Unexpected backup hash: {before_hash}")
    if current_hash not in {EXPECTED_SHA256, INTERMEDIATE_SHA256}:
        raise SystemExit(f"Unexpected active input hash: {current_hash}")
    original = backup

    spans, by_id = record_spans(original)
    if len(spans) != 65135:
        raise SystemExit(f"Unexpected row count: {len(spans)}")

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
                    f"Expected one occurrence of {old_text!r} in ID {row_id}; "
                    f"found {row.count(old)}"
                )
            row = row.replace(old, new_text.encode("utf-8"), 1)
        changed[row_id] = row

    output = bytearray(original[: spans[0][1]])
    for row_id, start, end in spans:
        output.extend(changed.get(row_id, original[start:end]))

    edited = bytes(output)
    if not edited.startswith(b"\xef\xbb\xbf"):
        raise SystemExit("UTF-8 BOM was not preserved")
    if edited.count(b"\r\n") != original.count(b"\r\n"):
        raise SystemExit("CRLF count changed")
    if edited.count(b"\n") - edited.count(b"\r\n") != (
        original.count(b"\n") - original.count(b"\r\n")
    ):
        raise SystemExit("Bare-LF count changed")
    edited_spans, _ = record_spans(edited)
    if [row[0] for row in edited_spans] != [row[0] for row in spans]:
        raise SystemExit("ID order or row boundaries changed")

    restored = bytearray(edited[: edited_spans[0][1]])
    for row_id, start, end in edited_spans:
        row = edited[start:end]
        for old_text, new_text in reversed(EDITS.get(row_id, [])):
            old = old_text.encode("utf-8")
            new = new_text.encode("utf-8")
            if row.count(new) != 1:
                raise SystemExit(
                    f"Cannot uniquely reverse {new_text!r} in ID {row_id}"
                )
            row = row.replace(new, old, 1)
        restored.extend(row)
    if bytes(restored) != original:
        raise SystemExit("Reversing only approved substitutions did not restore input")

    CSV_PATH.write_bytes(edited)
    print(f"pre-edit SHA-256: {before_hash}")
    print(f"post-edit SHA-256: {hashlib.sha256(edited).hexdigest()}")
    print(f"changed IDs: {', '.join(EDITS)}")
    print(f"approved substitutions: {sum(map(len, EDITS.values()))}")
    crlf_count = edited.count(b"\r\n")
    bare_lf_count = edited.count(b"\n") - crlf_count
    print(f"CRLF: {crlf_count}; bare LF: {bare_lf_count}")
    print(f"backup: {BACKUP_PATH}")


if __name__ == "__main__":
    main()
