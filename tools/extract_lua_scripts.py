#!/usr/bin/env python3
"""Extract framed Lua-family bytecode payloads; this does not decompile Lua."""

import argparse
import json

from lua_resource_codec import (
    DEFAULT_ASSET_DIR,
    DEFAULT_EXTRACTION_DIR,
    extract_corpus,
    verify_roundtrip,
)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--asset-dir", default=DEFAULT_ASSET_DIR, help="read-only unpacked corpus")
    parser.add_argument("--output-dir", default=DEFAULT_EXTRACTION_DIR)
    parser.add_argument(
        "--check", action="store_true",
        help="verify an existing extraction and exact no-edit container round-trip",
    )
    args = parser.parse_args()

    if args.check:
        result = verify_roundtrip(args.asset_dir, args.output_dir)
        print(json.dumps(result, sort_keys=True))
        return
    manifest = extract_corpus(args.asset_dir, args.output_dir)
    print(json.dumps(manifest["summary"], sort_keys=True))


if __name__ == "__main__":
    main()
