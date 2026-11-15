#!/usr/bin/env python3
"""Re-encode edited payloads into new container copies; never writes source assets."""

import argparse
import json

from lua_resource_codec import (
    DEFAULT_ASSET_DIR,
    DEFAULT_REENCODED_DIR,
    reencode_corpus,
    verify_roundtrip,
)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("extraction_dir", help="directory created by extract_lua_scripts.py")
    parser.add_argument("--asset-dir", default=DEFAULT_ASSET_DIR, help="read-only unpacked corpus")
    parser.add_argument("--output-dir", default=DEFAULT_REENCODED_DIR)
    parser.add_argument(
        "--check", action="store_true",
        help="read-only verification; requires every extracted payload to remain unchanged",
    )
    args = parser.parse_args()

    if args.check:
        result = verify_roundtrip(args.asset_dir, args.extraction_dir)
    else:
        result = reencode_corpus(args.asset_dir, args.extraction_dir, args.output_dir)
    print(json.dumps(result, sort_keys=True))


if __name__ == "__main__":
    main()
