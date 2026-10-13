#!/usr/bin/env python3
"""Apply only the approved Plagueshield Texto substitutions."""

import csv
import hashlib
from pathlib import Path


CSV_PATH = Path("work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
BACKUP_PATH = Path(
    "/private/tmp/ko-translate-backups/20261012/"
    "before-plagueshield-D19570/locatexts_zh_cn.koalocatext_default.csv"
)
EXPECTED_PRE_HASH = (
    "6d6b31f9d1fae61826541a1d3176dad6f18a896b7b87ea44e4c7c05b364fe122"
)

EDITS = {
    3761: ("플라그실드(Plagueshield)", "역병 방호제(Plagueshield)"),
    4574: ("역병 방패(Plagueshield)", "역병 방호제(Plagueshield)"),
    7553: ("역병 방호막(Plagueshield)", "역병 방호제(Plagueshield)"),
    8947: ("역병방패", "역병 방호제"),
    9871: ("역병 방패", "역병 방호제"),
    10361: ("역병 방패", "역병 방호제"),
    12465: ("역병 방패(Plagueshield)", "역병 방호제(Plagueshield)"),
    12914: ("역병 방호(Plagueshield)", "역병 방호제(Plagueshield)"),
    15337: ("역병 방패", "역병 방호제"),
    16063: ("역병 방패(Plagueshield)", "역병 방호제(Plagueshield)"),
    28211: ("역병 방패(Plagueshield)", "역병 방호제(Plagueshield)"),
    31671: ("역병 방지제", "역병 방호제"),
    33430: ("플레그실드", "역병 방호제"),
    33724: ("플레이그실드", "역병 방호제"),
    34919: ("역병 방패", "역병 방호제"),
    36638: ("역병 방패", "역병 방호제"),
    39541: ("역병 방패", "역병 방호제"),
    39762: ("역병 방패", "역병 방호제"),
    40597: ("역병 방패", "역병 방호제"),
    47275: (
        "플레이그실드가 다시 들어왔다더군. 아스트리드 말로는 "
        "카하린도 잘 받아들이고 있대.",
        "역병 방호제가 다시 들어왔다더군. 아스트리드 말로는 "
        "카하린도 치료에 잘 반응하고 있대.",
    ),
    48782: ("역병 방패 꾸러미", "역병 방호제 꾸러미"),
    55054: ("역병 방패(Plagueshield)", "역병 방호제(Plagueshield)"),
    56239: ("역병 방패(Plagueshield)", "역병 방호제(Plagueshield)"),
    60756: ("플래그실드(Plagueshield)", "역병 방호제(Plagueshield)"),
    63752: (
        "다른 서약방패병(Pledgeshield)은 어디 있지?",
        "다른 역병 방호제(Plagueshield)는 어디 있지?",
    ),
    64448: (
        "플래그실드(Plagueshield)가 한 명 더 있으니",
        "역병 방호제가 더 마련됐으니",
    ),
}


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def csv_records(data: bytes):
    """Yield record spans and field spans without normalizing any bytes."""
    pos = 3 if data.startswith(b"\xef\xbb\xbf") else 0
    record_start = pos
    field_start = pos
    fields = []
    quoted = False

    while pos < len(data):
        byte = data[pos]
        if byte == 0x22:
            if quoted and pos + 1 < len(data) and data[pos + 1] == 0x22:
                pos += 2
                continue
            quoted = not quoted
        elif not quoted and byte == 0x3B:
            fields.append((field_start, pos))
            field_start = pos + 1
        elif not quoted and byte in (0x0A, 0x0D):
            fields.append((field_start, pos))
            end = pos + 1
            if byte == 0x0D and end < len(data) and data[end] == 0x0A:
                end += 1
            yield record_start, end, fields
            record_start = end
            field_start = end
            fields = []
            pos = end
            continue
        pos += 1

    if record_start < len(data):
        fields.append((field_start, len(data)))
        yield record_start, len(data), fields


def decode_field(raw: bytes) -> str:
    row = next(csv.reader([raw.decode("utf-8")], delimiter=";"))
    if len(row) != 1:
        raise ValueError("Expected exactly one parsed field")
    return row[0]


def encode_replacement(old_raw: bytes, new_text: str) -> bytes:
    new = new_text.encode("utf-8")
    if old_raw.startswith(b'"') and old_raw.endswith(b'"'):
        return b'"' + new.replace(b'"', b'""') + b'"'
    if any(token in new for token in (b";", b'"', b"\r", b"\n")):
        return b'"' + new.replace(b'"', b'""') + b'"'
    return new


def main() -> None:
    original = CSV_PATH.read_bytes()
    backup = BACKUP_PATH.read_bytes()
    if sha256(original) != EXPECTED_PRE_HASH or original != backup:
        raise SystemExit("CSV/backup does not match the expected pre-edit bytes")

    found = {}
    old_texts = {}
    spans = {}
    for start, end, fields in csv_records(original):
        if len(fields) != 2:
            continue
        raw_id = decode_field(original[slice(*fields[0])])
        if raw_id == "ID_Linha":
            continue
        row_id = int(raw_id)
        if row_id not in EDITS:
            continue
        text_span = fields[1]
        raw_text = original[slice(*text_span)]
        parsed_text = next(
            csv.reader(
                [original[start:end].rstrip(b"\r\n").decode("utf-8")],
                delimiter=";",
            )
        )[1]
        old_fragment, new_fragment = EDITS[row_id]
        if parsed_text.count(old_fragment) != 1:
            raise SystemExit(f"ID {row_id}: expected fragment not unique")
        updated = parsed_text.replace(old_fragment, new_fragment, 1)
        found[row_id] = updated
        old_texts[row_id] = parsed_text
        spans[row_id] = (text_span, encode_replacement(raw_text, updated))

    if set(found) != set(EDITS):
        raise SystemExit(f"Missing target IDs: {sorted(set(EDITS) - set(found))}")

    changed = original
    for row_id in sorted(spans, key=lambda key: spans[key][0][0], reverse=True):
        (start, end), replacement = spans[row_id]
        changed = changed[:start] + replacement + changed[end:]

    CSV_PATH.write_bytes(changed)

    reverse_spans = {}
    for start, end, fields in csv_records(changed):
        if len(fields) != 2:
            continue
        raw_id = decode_field(changed[slice(*fields[0])])
        if raw_id == "ID_Linha":
            continue
        row_id = int(raw_id)
        if row_id not in EDITS:
            continue
        text_span = fields[1]
        raw_text = changed[slice(*text_span)]
        reverse_spans[row_id] = (
            text_span,
            encode_replacement(raw_text, old_texts[row_id]),
        )
    reverse = changed
    for row_id in sorted(
        reverse_spans, key=lambda key: reverse_spans[key][0][0], reverse=True
    ):
        (start, end), replacement = reverse_spans[row_id]
        reverse = reverse[:start] + replacement + reverse[end:]
    if reverse != original:
        raise SystemExit("Reverse reconstruction did not match pre-edit bytes")
    if not changed.startswith(b"\xef\xbb\xbf"):
        raise SystemExit("UTF-8 BOM was not preserved")

    crlf = changed.count(b"\r\n")
    bare_lf = changed.count(b"\n") - crlf
    print(f"Edited Texto cells: {len(EDITS)}")
    print(f"Post-edit SHA-256: {sha256(changed)}")
    print(f"Reversal byte-identical: {reverse == original}")
    print(f"BOM preserved; CRLF={crlf}; bare LF={bare_lf}")


if __name__ == "__main__":
    main()
