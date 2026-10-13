#!/usr/bin/env python3
"""Apply a range from the Korean default translation map without reformatting CSV."""

import argparse
import re
from pathlib import Path


def read_map(path):
    translations = {}
    for line_number, line in enumerate(
        Path(path).read_text(encoding="utf-8").splitlines(), start=1
    ):
        match = re.fullmatch(r'(\d+)\|"(.*)"', line)
        if not match:
            raise ValueError(f"Invalid map row at line {line_number}")
        row_id, text = match.groups()
        if row_id in translations:
            raise ValueError(f"Duplicate translation ID {row_id}")
        translations[row_id] = text.replace(r"\n", "\n")
    return translations


def scan_csv(data):
    """Return (row ID, text span, quoted) for each two-column semicolon record."""
    records = []
    offset = 3 if data.startswith(b"\xef\xbb\xbf") else 0

    while offset < len(data):
        record_start = offset
        separator = data.find(b";", record_start)
        if separator < 0:
            raise ValueError(f"Missing delimiter at byte {record_start}")
        row_id = data[record_start:separator].decode("ascii")
        text_start = separator + 1

        if text_start < len(data) and data[text_start] == ord('"'):
            cursor = text_start + 1
            while cursor < len(data):
                if data[cursor] == ord('"'):
                    if cursor + 1 < len(data) and data[cursor + 1] == ord('"'):
                        cursor += 2
                        continue
                    text_end = cursor + 1
                    break
                cursor += 1
            else:
                raise ValueError(f"Unclosed quoted field for ID {row_id}")
            if text_end < len(data) and data[text_end] not in (10, 13):
                raise ValueError(f"Unexpected data after ID {row_id}")
            quoted = True
        else:
            text_end = text_start
            while text_end < len(data) and data[text_end] not in (10, 13):
                if data[text_end] == ord(";"):
                    raise ValueError(f"Unexpected third column for ID {row_id}")
                text_end += 1
            quoted = False

        records.append((row_id, text_start, text_end, quoted))

        offset = text_end
        if offset < len(data) and data[offset] == 13:
            offset += 1
        if offset < len(data) and data[offset] == 10:
            offset += 1

    return records


def encode_field(text, keep_quoted):
    raw = text.encode("utf-8")
    needs_quotes = keep_quoted or any(char in text for char in ';"\r\n')
    if not needs_quotes:
        return raw
    return b'"' + raw.replace(b'"', b'""') + b'"'


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("csv")
    parser.add_argument("map")
    parser.add_argument("first_id", type=int)
    parser.add_argument("last_id", type=int)
    args = parser.parse_args()

    csv_path = Path(args.csv)
    original = csv_path.read_bytes()
    records = scan_csv(original)
    translations = read_map(args.map)

    replacements = []
    seen = set()
    for row_id, start, end, was_quoted in records:
        if row_id == "ID_Linha":
            continue
        numeric_id = int(row_id)
        if args.first_id <= numeric_id <= args.last_id:
            if row_id not in translations:
                raise ValueError(f"Missing translation for ID {row_id}")
            replacements.append(
                (start, end, encode_field(translations[row_id], was_quoted))
            )
            seen.add(row_id)

    expected = {
        str(row_id) for row_id in range(args.first_id, args.last_id + 1)
    }
    if seen != expected:
        missing = sorted(expected - seen, key=int)
        extra = sorted(seen - expected, key=int)
        raise ValueError(f"CSV range mismatch; missing={missing}, extra={extra}")

    updated = original
    for start, end, value in reversed(replacements):
        updated = updated[:start] + value + updated[end:]

    verified = scan_csv(updated)
    if [row[0] for row in records] != [row[0] for row in verified]:
        raise ValueError("CSV IDs or row order changed during synchronization")
    csv_path.write_bytes(updated)
    print(f"Updated {len(replacements)} Texto fields ({args.first_id}-{args.last_id})")


if __name__ == "__main__":
    main()
