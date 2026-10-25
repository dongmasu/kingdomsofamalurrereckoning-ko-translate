#!/usr/bin/env python3
"""Replace exact single-line UTF-8 text without rewriting file line endings."""

import argparse
from pathlib import Path


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


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Replace exact single-line text while preserving all line endings."
    )
    parser.add_argument("file", type=Path)
    parser.add_argument("--old", required=True, help="Exact text to find")
    parser.add_argument("--new", required=True, help="Replacement text")
    parser.add_argument(
        "--expected-count",
        type=int,
        default=1,
        help="Required number of matches (default: 1)",
    )
    args = parser.parse_args()

    try:
        path = args.file
        original = path.read_bytes()
        updated = replace_bytes(
            original,
            args.old.encode("utf-8"),
            args.new.encode("utf-8"),
            args.expected_count,
        )
        if updated != original:
            path.write_bytes(updated)
    except (OSError, ValueError) as error:
        parser.error(str(error))

    print(f"Updated {path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
