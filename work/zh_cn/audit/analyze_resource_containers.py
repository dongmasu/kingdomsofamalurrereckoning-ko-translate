#!/usr/bin/env python3
"""Index verified batch records and embedded Lua-family envelopes, read-only."""

import argparse
from collections import Counter, defaultdict
import hashlib
import json
from pathlib import Path
import re
import struct

from build_dialogue_context_index import read_symbol_table, render_tsv


ROOT = Path(__file__).resolve().parents[3]
ASSET_DIR = ROOT / "references/data/unpacked"
KEYS_PATH = ROOT / "src/csv/en_us/estrutura_hashes_flat.bin"
OUTPUT_DIR = ROOT / "work/zh_cn/translation-reference/classification"
LUA_HEADER = bytes.fromhex("1b4c756151080004040404010100")
TYPE_NAMES = (
    "TNIL", "TBOOLEAN", "TLIGHTUSERDATA", "TNUMBER", "TSTRING", "TTABLE",
    "TFUNCTION", "TUSERDATA", "TTHREAD", "TIFUNCTION", "TCFUNCTION",
    "TUI64", "TSTRUCT",
)
PRINTABLE = re.compile(rb"[\x20-\x7e]{4,}")
BATCH_HEADER = (
    "batch", "sha256", "file_bytes", "record_count", "directory_end",
    "matching_ordered_symbol_tables", "matching_ordered_init_files",
    "same_id_bxml_count", "byte_identical_bxml_count",
)
BXML_HEADER = (
    "asset", "sha256", "file_bytes", "lua_payload_count", "lua_payload_bytes",
    "byte_identical_batch_records_json",
)
PAYLOAD_HEADER = (
    "asset", "payload_index", "signature_offset", "payload_bytes",
    "end_offset_exclusive", "sha256", "header_hex",
    "type_table_end_relative", "exact_default_key_ids", "printable_runs_json",
)
SCRIPT_HEADER = (
    "script_id", "registry_name", "record_name", "source_path", "batch",
    "record_offset", "record_bytes", "lua_offset", "lua_bytes", "lua_sha256",
    "serialized_string_references_json",
)
QUEST_SCRIPT_HEADER = (
    "asset", "quest_registry_name", "asset_id_at_offset_8",
    "script_id_at_offset_28", "script_registry_name", "source_path",
    "script_batch", "script_record_offset", "script_record_bytes",
    "evidence", "name_comparison",
)


def digest(data):
    return hashlib.sha256(data).hexdigest()


def compact_json(value):
    return json.dumps(value, ensure_ascii=True, separators=(",", ":"), sort_keys=True)


def u32(data, offset, endian="<"):
    if offset < 0 or offset + 4 > len(data):
        raise ValueError(f"Truncated u32 at {offset}")
    return struct.unpack_from(endian + "I", data, offset)[0]


def batch_records(data):
    count = u32(data, 0)
    cursor = 4 + 8 * count
    if cursor > len(data):
        raise ValueError("Truncated batch directory")
    records = []
    seen = set()
    for index in range(count):
        asset_id = u32(data, 4 + 8 * index)
        length = u32(data, 8 + 8 * index)
        if asset_id in seen:
            raise ValueError(f"Duplicate batch ID: {asset_id}")
        seen.add(asset_id)
        if cursor + length > len(data):
            raise ValueError(f"Truncated batch record: {asset_id}")
        records.append((asset_id, cursor, length))
        cursor += length
    if cursor != len(data):
        raise ValueError("Trailing bytes after batch records")
    return records


def lua_type_table(payload):
    if payload[:len(LUA_HEADER)] != LUA_HEADER:
        raise ValueError("Unsupported Lua-family header")
    count = u32(payload, 14, ">")
    if count != len(TYPE_NAMES):
        raise ValueError(f"Unexpected Lua type count: {count}")
    cursor = 18
    for expected_id, expected_name in enumerate(TYPE_NAMES):
        type_id = u32(payload, cursor, ">")
        length = u32(payload, cursor + 4, ">")
        cursor += 8
        expected = expected_name.encode("ascii") + b"\0"
        if type_id != expected_id or length != len(expected):
            raise ValueError(f"Unexpected Lua type entry: {type_id}")
        if payload[cursor:cursor + length] != expected:
            raise ValueError(f"Unexpected Lua type name: {type_id}")
        cursor += length
    return cursor


def bxml_lua_payloads(data):
    payloads = []
    search_offset = 0
    previous_end = 0
    while (offset := data.find(b"\x1bLua", search_offset)) >= 0:
        if offset < 5 or data[offset - 5] != 2:
            raise ValueError(f"Unsupported BXML Lua envelope at {offset}")
        length = u32(data, offset - 4)
        end = offset + length
        if end > len(data) or offset - 5 < previous_end:
            raise ValueError(f"Invalid or overlapping BXML Lua payload at {offset}")
        payload = data[offset:end]
        table_end = lua_type_table(payload)
        payloads.append((offset, payload, table_end))
        previous_end = end
        search_offset = offset + 4
    return payloads


def lua_script_record(data):
    cursor = 0

    def text():
        nonlocal cursor
        length = u32(data, cursor)
        cursor += 4
        if cursor + length > len(data):
            raise ValueError("Truncated script record string")
        value = data[cursor:cursor + length].decode("utf-8")
        if "\0" in value:
            raise ValueError("Unexpected NUL in script record string")
        cursor += length
        return value

    name = text()
    count = u32(data, cursor)
    cursor += 4
    if count > (len(data) - cursor) // 4:
        raise ValueError("Truncated script string-reference list")
    references = [text() for _ in range(count)]
    length = u32(data, cursor)
    cursor += 4
    if cursor + length != len(data):
        raise ValueError("Script payload length does not consume record")
    lua_type_table(data[cursor:])
    return name, references, cursor, data[cursor:]


def init_ids(data):
    if len(data) < 8 or u32(data, 0) != 1:
        raise ValueError("Unsupported init table")
    count = u32(data, 4)
    if len(data) != 8 + count * 8:
        raise ValueError("Unexpected init table length")
    return [u32(data, 8 + index * 4) for index in range(count)]


def quest_script_rows(assets, quest_names, script_names, script_paths, scripts_by_id):
    rows = []
    for asset, (data, _) in assets.items():
        path = Path(asset)
        if path.suffix != ".quest_bxml":
            continue
        asset_id = u32(data, 8)
        script_id = u32(data, 28)
        if not path.stem.isdecimal() or asset_id != int(path.stem):
            raise ValueError(f"Quest header asset ID disagrees with filename: {asset}")
        quest_name = quest_names[asset_id]
        script = scripts_by_id.get(script_id)
        if script is not None:
            if script_id not in script_names or script_id not in script_paths:
                raise ValueError(f"Missing script registry metadata: {script_id}")
            name = script_names[script_id]
            comparison = "exact" if quest_name == name else "different"
            rows.append((
                asset, quest_name, asset_id, script_id, name,
                script_paths[script_id], script[4], script[5], script[6],
                "u32le_at_28_matches_luascript_and_path_registry_and_batch_id",
                comparison,
            ))
        elif script_id == 0:
            rows.append((
                asset, quest_name, asset_id, script_id, "", "", "", "", "",
                "zero_value_at_offset_28_no_registry_link", "not_compared",
            ))
        else:
            raise ValueError(f"Unresolved nonzero quest script field: {asset}: {script_id}")
    return rows


def analyze(asset_dir=ASSET_DIR, keys_path=KEYS_PATH):
    symbols = {
        path.name: read_symbol_table(path)
        for path in sorted(asset_dir.glob("symbol_table_*.bin"))
        if path.name != "symbol_table_64_localization_keys.bin"
    }
    inits = {
        path.name: init_ids(path.read_bytes())
        for path in sorted(asset_dir.glob("*_init.bin"))
    }
    key_data = keys_path.read_bytes()
    if len(key_data) % 8:
        raise ValueError("Invalid default key sidecar length")
    key_to_id = {
        key_data[offset:offset + 8]: offset // 8
        for offset in range(0, len(key_data), 8)
    }
    if len(key_to_id) * 8 != len(key_data):
        raise ValueError("Duplicate default keys")

    assets = {}
    by_numeric_id = defaultdict(list)
    for path in sorted(asset_dir.glob("*_bxml")):
        raw = path.read_bytes()
        assets[path.name] = (raw, digest(raw))
        if path.stem.isdecimal():
            by_numeric_id[int(path.stem)].append(path.name)

    matches_by_asset = defaultdict(list)
    batch_rows, script_rows = [], []
    batch_manifest = {}
    script_ids_seen = set()
    for path in sorted(asset_dir.glob("*.batch")):
        data = path.read_bytes()
        records = batch_records(data)
        ids = [row[0] for row in records]
        matching_symbols = [
            name for name, table in symbols.items() if list(table) == ids
        ]
        matching_inits = [
            name for name, values in inits.items() if values == ids
        ]
        same_id_count = exact_count = 0
        is_lua_registry = "symbol_table_luascript.bin" in matching_symbols
        if is_lua_registry and "symbol_table_lua_script_path.bin" not in matching_symbols:
            raise ValueError("Lua script/path ID sequences disagree")
        for asset_id, offset, length in records:
            record = data[offset:offset + length]
            for asset in by_numeric_id.get(asset_id, []):
                same_id_count += 1
                if assets[asset][0] == record:
                    exact_count += 1
                    matches_by_asset[asset].append({
                        "batch": path.name, "id": asset_id,
                        "offset": offset, "bytes": length,
                    })
            if is_lua_registry:
                if asset_id in script_ids_seen:
                    raise ValueError(f"Duplicate Lua script ID across batches: {asset_id}")
                script_ids_seen.add(asset_id)
                name, refs, lua_offset, payload = lua_script_record(record)
                script_rows.append((
                    asset_id, symbols["symbol_table_luascript.bin"][asset_id],
                    name, symbols["symbol_table_lua_script_path.bin"][asset_id],
                    path.name, offset, length, offset + lua_offset, len(payload),
                    digest(payload), compact_json(refs),
                ))
        batch_rows.append((
            path.name, digest(data), len(data), len(records), 4 + 8 * len(records),
            ";".join(matching_symbols), ";".join(matching_inits),
            same_id_count, exact_count,
        ))
        batch_manifest[path.name] = digest(data)
    if script_ids_seen != set(symbols["symbol_table_luascript.bin"]):
        raise ValueError("Batch records do not cover the Lua script registry")
    quest_rows = quest_script_rows(
        assets, symbols["symbol_table_quest.bin"],
        symbols["symbol_table_luascript.bin"],
        symbols["symbol_table_lua_script_path.bin"],
        {row[0]: row for row in script_rows},
    )

    bxml_rows, payload_rows = [], []
    family_counts = defaultdict(Counter)
    families_by_payload = defaultdict(set)
    payload_hashes = Counter()
    for asset, (data, file_hash) in assets.items():
        payloads = bxml_lua_payloads(data)
        family = Path(asset).suffix
        family_counts[family]["files"] += 1
        family_counts[family]["files_with_lua"] += bool(payloads)
        family_counts[family]["payloads"] += len(payloads)
        bxml_rows.append((
            asset, file_hash, len(data), len(payloads),
            sum(len(payload) for _, payload, _ in payloads),
            compact_json(matches_by_asset[asset]),
        ))
        for index, (offset, payload, table_end) in enumerate(payloads):
            payload_hash = digest(payload)
            families_by_payload[payload_hash].add(family)
            payload_hashes[payload_hash] += 1
            key_ids = sorted({
                key_to_id[payload[pos:pos + 8]]
                for pos in range(max(0, len(payload) - 7))
                if payload[pos:pos + 8] in key_to_id
            })
            runs = [
                match.group().decode("ascii")
                for match in PRINTABLE.finditer(payload, table_end)
            ]
            payload_rows.append((
                asset, index, offset, len(payload), offset + len(payload),
                payload_hash, payload[:len(LUA_HEADER)].hex(), table_end,
                ",".join(map(str, key_ids)), compact_json(runs),
            ))
    summary = {
        "schema_version": 1,
        "scope": "top-level *_bxml, *.batch, ordinary symbol tables, *_init.bin",
        "limits": [
            "Lua-family envelope and type-table parser only; no opcode decoding",
            "Printable runs are not parsed constants or confirmed API calls",
            "Serialized script string references have no established runtime semantics",
            "Asset and script associations do not establish speaker or playback order",
        ],
        "bxml_families": {k: dict(v) for k, v in sorted(family_counts.items())},
        "bxml_files": len(bxml_rows),
        "bxml_files_with_lua": sum(bool(row[3]) for row in bxml_rows),
        "bxml_lua_payloads": len(payload_rows),
        "bxml_lua_payload_bytes": sum(row[3] for row in payload_rows),
        "bxml_unique_payload_hashes": len(payload_hashes),
        "bxml_repeated_payload_hash_groups": sum(n > 1 for n in payload_hashes.values()),
        "bxml_payloads_with_default_key_matches": sum(bool(row[8]) for row in payload_rows),
        "bxml_payload_family_combinations": dict(Counter(
            ";".join(sorted(families)) for families in families_by_payload.values()
        )),
        "batch_files": len(batch_rows),
        "batch_records": sum(row[3] for row in batch_rows),
        "bxml_exact_batch_links": sum(len(v) for v in matches_by_asset.values()),
        "lua_script_records": len(script_rows),
        "lua_serialized_string_references": sum(
            len(json.loads(row[10])) for row in script_rows
        ),
        "lua_record_names_exact_registry_matches": sum(
            row[1] == row[2] for row in script_rows
        ),
        "lua_record_names_casefold_registry_matches": sum(
            row[1].casefold() == row[2].casefold() for row in script_rows
        ),
        "lua_record_names_casefold_only_matches": sum(
            row[1] != row[2] and row[1].casefold() == row[2].casefold()
            for row in script_rows
        ),
        "lua_record_name_casefold_disagreements": [
            {"id": row[0], "registry_name": row[1], "record_name": row[2]}
            for row in script_rows if row[1].casefold() != row[2].casefold()
        ],
        "lua_header_hex": LUA_HEADER.hex(),
        "lua_type_names": list(TYPE_NAMES),
        "quest_script_links": sum(bool(row[4]) for row in quest_rows),
        "quest_script_zero_values": sum(row[3] == 0 for row in quest_rows),
        "quest_script_name_disagreements": [
            {"asset": row[0], "quest_name": row[1], "script_id": row[3],
             "script_name": row[4]}
            for row in quest_rows if row[10] == "different"
        ],
        "key_sidecar_sha256": digest(key_data),
        "batch_sha256": batch_manifest,
        "registry_sha256": {
            path.name: digest(path.read_bytes())
            for path in sorted(asset_dir.glob("symbol_table_*.bin"))
            if path.name in symbols
        },
        "init_sha256": {
            path.name: digest(path.read_bytes())
            for path in sorted(asset_dir.glob("*_init.bin"))
        },
    }
    return {
        "resource-batch-catalog.tsv": render_tsv(batch_rows, BATCH_HEADER),
        "bxml-resource-catalog.tsv": render_tsv(bxml_rows, BXML_HEADER),
        "bxml-lua-payload-index.tsv": render_tsv(payload_rows, PAYLOAD_HEADER),
        "lua-script-registry-index.tsv": render_tsv(script_rows, SCRIPT_HEADER),
        "quest-script-asset-links.tsv": render_tsv(quest_rows, QUEST_SCRIPT_HEADER),
        "resource-container-summary.json": (
            json.dumps(summary, ensure_ascii=True, indent=2, sort_keys=True) + "\n"
        ).encode("utf-8"),
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-dir", type=Path, default=OUTPUT_DIR)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    outputs = analyze()
    if args.check:
        for name, rendered in outputs.items():
            path = args.output_dir / name
            if not path.exists() or path.read_bytes() != rendered:
                raise SystemExit(f"Missing or stale resource index: {path}")
            print(f"OK: {path}")
        return
    args.output_dir.mkdir(parents=True, exist_ok=True)
    for name, rendered in outputs.items():
        path = args.output_dir / name
        temporary = path.with_suffix(path.suffix + ".tmp")
        temporary.write_bytes(rendered)
        temporary.replace(path)
        print(f"Wrote {path}")


if __name__ == "__main__":
    main()
