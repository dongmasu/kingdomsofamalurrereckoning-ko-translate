#!/usr/bin/env python3
"""Safely replace text while preserving CSV bytes outside the target field."""

import argparse
import os
import re
import stat
import tempfile
from dataclasses import dataclass
from pathlib import Path

BOM = b"\xef\xbb\xbf"
DELIMITER = ord(";")
QUOTE = ord('"')


@dataclass(frozen=True)
class Field:
    start: int
    end: int
    value: str
    quoted: bool


def replace_bytes(data: bytes, old: bytes, new: bytes, expected_count: int) -> bytes:
    if not old:
        raise ValueError("old text must not be empty")
    if b"\n" in old or b"\r" in old or b"\n" in new or b"\r" in new:
        raise ValueError("old and new text must not contain line breaks")

    actual_count = data.count(old)
    if actual_count != expected_count:
        raise ValueError(
            f"expected {expected_count} match(es), found {actual_count}; file unchanged"
        )
    return data.replace(old, new)


def _newline_end(data: bytes, index: int) -> int:
    if data[index] == ord("\r") and index + 1 < len(data) and data[index + 1] == ord("\n"):
        return index + 2
    return index + 1


def _decode_field(raw: bytes, start: int, end: int) -> Field:
    quoted = raw.startswith(b'"')
    if quoted:
        if len(raw) < 2 or raw[-1] != QUOTE:
            raise ValueError("malformed quoted CSV field")
        value_bytes = raw[1:-1].replace(b'""', b'"')
    else:
        if b'"' in raw:
            raise ValueError("quote inside an unquoted CSV field")
        value_bytes = raw
    try:
        value = value_bytes.decode("utf-8")
    except UnicodeDecodeError as error:
        raise ValueError(f"CSV field is not valid UTF-8: {error}") from error
    return Field(start, end, value, quoted)


def parse_csv_bytes(data: bytes) -> list[list[Field]]:
    """Parse semicolon CSV into byte spans without normalizing its source bytes."""
    index = len(BOM) if data.startswith(BOM) else 0
    records: list[list[Field]] = []

    while index < len(data):
        fields: list[Field] = []
        while True:
            start = index
            quoted = index < len(data) and data[index] == QUOTE

            if quoted:
                index += 1
                while index < len(data):
                    if data[index] == QUOTE:
                        if index + 1 < len(data) and data[index + 1] == QUOTE:
                            index += 2
                            continue
                        index += 1
                        break
                    index += 1
                else:
                    raise ValueError("unterminated quoted CSV field")
                if index < len(data) and data[index] not in (DELIMITER, ord("\r"), ord("\n")):
                    raise ValueError("unexpected byte after quoted CSV field")
            else:
                while index < len(data) and data[index] not in (
                    DELIMITER,
                    ord("\r"),
                    ord("\n"),
                ):
                    if data[index] == QUOTE:
                        raise ValueError("quote inside an unquoted CSV field")
                    index += 1

            fields.append(_decode_field(data[start:index], start, index))

            if index == len(data):
                records.append(fields)
                break
            if data[index] == DELIMITER:
                index += 1
                continue

            index = _newline_end(data, index)
            records.append(fields)
            break

    return records


def _preferred_newline(data: bytes) -> bytes:
    crlf = data.count(b"\r\n")
    bare_lf = data.count(b"\n") - crlf
    bare_cr = data.count(b"\r") - crlf
    counts = [(crlf, b"\r\n"), (bare_lf, b"\n"), (bare_cr, b"\r")]
    count, newline = max(counts, key=lambda item: item[0])
    return newline if count else b"\r\n"


def _normalize_newlines(text: str, newline: bytes) -> str:
    replacement = newline.decode("ascii")
    return re.sub(r"\r\n|\r|\n", lambda _: replacement, text)


def _canonical_newlines(text: str) -> str:
    return re.sub(r"\r\n|\r|\n", "\n", text)


def _encode_field(text: str, quoted: bool) -> bytes:
    value = text.encode("utf-8")
    needs_quotes = quoted or any(char in value for char in (b";", b'"', b"\r", b"\n"))
    if needs_quotes:
        return b'"' + value.replace(b'"', b'""') + b'"'
    return value


def replace_csv_text(
    data: bytes,
    row_id: str,
    old: str,
    new: str,
    variant: str | None = None,
) -> bytes:
    records = parse_csv_bytes(data)
    if not records:
        raise ValueError("CSV is empty")

    header = [field.value for field in records[0]]
    try:
        id_column = header.index("ID_Linha")
        text_column = header.index("Texto")
    except ValueError as error:
        raise ValueError("CSV header must contain ID_Linha and Texto") from error
    if header.count("ID_Linha") != 1 or header.count("Texto") != 1:
        raise ValueError("CSV header has duplicate ID_Linha or Texto columns")

    variant_columns = [i for i, name in enumerate(header) if name == "Tipo_Variante"]
    if len(variant_columns) > 1:
        raise ValueError("CSV header has duplicate Tipo_Variante columns")
    variant_column = variant_columns[0] if variant_columns else None
    if variant is not None and variant_column is None:
        raise ValueError("--variant was supplied, but CSV has no Tipo_Variante column")
    if variant_column is not None and variant is None:
        raise ValueError("--variant is required for CSVs with Tipo_Variante")

    for record in records[1:]:
        if len(record) != len(header):
            raise ValueError("CSV row has a different number of fields than the header")

    targets = []
    for record_index, record in enumerate(records[1:], start=1):
        if record[id_column].value != row_id:
            continue
        if variant_column is not None and record[variant_column].value != variant:
            continue
        targets.append((record_index, record))
    if len(targets) != 1:
        raise ValueError(
            f"expected one row for ID {row_id}"
            + (f" variant {variant}" if variant is not None else "")
            + f", found {len(targets)}; file unchanged"
        )

    target_index, target_record = targets[0]
    target = target_record[text_column]
    newline = _preferred_newline(data)
    replacement_text = _normalize_newlines(new, newline)
    if _canonical_newlines(target.value) != _canonical_newlines(old):
        raise ValueError(
            f"old text does not match ID {row_id}"
            + (f" variant {variant}" if variant is not None else "")
            + "; file unchanged"
        )

    replacement = _encode_field(replacement_text, target.quoted)
    updated = data[: target.start] + replacement + data[target.end :]
    updated_records = parse_csv_bytes(updated)
    if len(updated_records) != len(records):
        raise ValueError("record count changed during edit; file unchanged")
    if updated.startswith(BOM) != data.startswith(BOM):
        raise ValueError("BOM changed during edit; file unchanged")

    if [field.value for field in updated_records[0]] != header:
        raise ValueError("CSV header changed during edit; file unchanged")
    for row_index, (before, after) in enumerate(zip(records[1:], updated_records[1:]), 1):
        if len(before) != len(after):
            raise ValueError("CSV row structure changed during edit; file unchanged")
        for column, (before_field, after_field) in enumerate(zip(before, after)):
            if column == text_column and row_index == target_index:
                if after_field.value != replacement_text:
                    raise ValueError("target text was not written as requested; file unchanged")
                continue
            if after_field.value != before_field.value:
                raise ValueError("non-target CSV value changed; file unchanged")

    if (
        updated[: target.start] != data[: target.start]
        or updated[target.start + len(replacement) :] != data[target.end :]
    ):
        raise ValueError("bytes outside target field changed; file unchanged")
    return updated


def _atomic_write(path: Path, data: bytes, expected_original: bytes) -> None:
    if path.read_bytes() != expected_original:
        raise ValueError("file changed during edit; file unchanged")
    mode = stat.S_IMODE(path.stat().st_mode)
    temp_path: Path | None = None
    try:
        with tempfile.NamedTemporaryFile(dir=path.parent, delete=False) as temp:
            temp_path = Path(temp.name)
            temp.write(data)
            temp.flush()
            os.fsync(temp.fileno())
        os.chmod(temp_path, mode)
        os.replace(temp_path, path)
    finally:
        if temp_path is not None and temp_path.exists():
            temp_path.unlink()


def main() -> int:
    parser = argparse.ArgumentParser(
        description=(
            "Replace exact text. CSV mode edits one ID/variant Texto field in place "
            "without reserializing the file."
        )
    )
    parser.add_argument("file", type=Path)
    parser.add_argument("--old", required=True, help="Expected current text")
    parser.add_argument("--new", required=True, help="Replacement text")
    parser.add_argument("--id", help="CSV mode: exact ID_Linha to edit")
    parser.add_argument(
        "--variant",
        help="CSV mode: exact Tipo_Variante; required when that column exists",
    )
    parser.add_argument(
        "--expected-count",
        type=int,
        default=1,
        help="Text mode only: required number of exact matches (default: 1)",
    )
    args = parser.parse_args()

    try:
        path = args.file
        original = path.read_bytes()
        if args.id is not None:
            if args.expected_count != 1:
                parser.error("--expected-count is only available outside CSV mode")
            updated = replace_csv_text(
                original, args.id, args.old, args.new, args.variant
            )
        else:
            if args.variant is not None:
                parser.error("--variant requires --id")
            updated = replace_bytes(
                original,
                args.old.encode("utf-8"),
                args.new.encode("utf-8"),
                args.expected_count,
            )
        if updated != original:
            _atomic_write(path, updated, original)
    except (OSError, ValueError) as error:
        parser.error(str(error))

    print(f"Updated {path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
