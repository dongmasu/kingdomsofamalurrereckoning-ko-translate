#!/usr/bin/env python3
"""Extract and rebuild framed Lua-family payloads without editing source assets."""

import hashlib
import json
import mmap
import os
from pathlib import Path
import shutil
import struct
import tempfile


SCHEMA_VERSION = 2
LUA_SIGNATURE = b"\x1bLua"
LUA_HEADER = bytes.fromhex("1b4c756151080004040404010100")
TYPE_NAMES = (
    "TNIL", "TBOOLEAN", "TLIGHTUSERDATA", "TNUMBER", "TSTRING", "TTABLE",
    "TFUNCTION", "TUSERDATA", "TTHREAD", "TIFUNCTION", "TCFUNCTION",
    "TUI64", "TSTRUCT",
)
TYPE_TABLE_BYTES = 238
DEFAULT_ROOT = Path(__file__).resolve().parents[1]
DEFAULT_ASSET_DIR = DEFAULT_ROOT / "references/data/unpacked"
DEFAULT_EXTRACTION_DIR = DEFAULT_ROOT / "work/zh_cn/audit/lua-script-extracted"
DEFAULT_REENCODED_DIR = DEFAULT_ROOT / "work/zh_cn/audit/lua-script-reencoded"


def sha256_bytes(data):
    return hashlib.sha256(data).hexdigest()


def sha256_file(path):
    digest = hashlib.sha256()
    with Path(path).open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def u32(data, offset, endian="<"):
    if offset < 0 or offset + 4 > len(data):
        raise ValueError(f"Truncated u32 at offset {offset}")
    return struct.unpack_from(endian + "I", data, offset)[0]


def validate_lua_type_table(payload):
    if len(payload) < TYPE_TABLE_BYTES:
        raise ValueError("Truncated Lua-family header/type table")
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
    if cursor != TYPE_TABLE_BYTES:
        raise ValueError(f"Unexpected Lua type-table end: {cursor}")
    return cursor


def _validate_type_table_at(data, offset):
    if offset < 0 or offset + TYPE_TABLE_BYTES > len(data):
        raise ValueError("Truncated Lua-family header/type table")
    return validate_lua_type_table(data[offset:offset + TYPE_TABLE_BYTES])


def parse_batch_records(data):
    count = u32(data, 0)
    if count > (len(data) - 4) // 8:
        raise ValueError("Truncated batch directory")
    cursor = 4 + count * 8
    records = []
    seen = set()
    for index in range(count):
        entry_offset = 4 + 8 * index
        asset_id = u32(data, entry_offset)
        length = u32(data, entry_offset + 4)
        if asset_id in seen:
            raise ValueError(f"Duplicate batch ID: {asset_id}")
        seen.add(asset_id)
        if length > len(data) - cursor:
            raise ValueError(f"Truncated batch record: {asset_id}")
        records.append({
            "asset_id": asset_id,
            "record_index": index,
            "record_length_offset": entry_offset + 4,
            "record_offset": cursor,
            "record_bytes": length,
        })
        cursor += length
    if cursor != len(data):
        raise ValueError("Trailing bytes after batch records")
    return records


def _read_record_text(data, cursor):
    length = u32(data, cursor)
    cursor += 4
    if length > len(data) - cursor:
        raise ValueError("Truncated script record string")
    value = data[cursor:cursor + length].decode("utf-8")
    if "\0" in value:
        raise ValueError("Unexpected NUL in script record string")
    return value, cursor + length


def parse_script_record(record):
    cursor = 0
    name, cursor = _read_record_text(record, cursor)
    count = u32(record, cursor)
    cursor += 4
    if count > (len(record) - cursor) // 4:
        raise ValueError("Truncated script string-reference list")
    references = []
    for _ in range(count):
        value, cursor = _read_record_text(record, cursor)
        references.append(value)
    length_offset = cursor
    payload_length = u32(record, cursor)
    cursor += 4
    if payload_length != len(record) - cursor:
        raise ValueError("Script payload length does not consume record")
    payload = record[cursor:]
    validate_lua_type_table(payload)
    return {
        "record_name": name,
        "string_references": references,
        "payload_length_offset": length_offset,
        "payload_offset": cursor,
        "payload_bytes": payload_length,
        "payload": payload,
    }


def _occurrence_key(container_path, kind, payload_offset, record_asset_id=None):
    suffix = "" if record_asset_id is None else f":{record_asset_id}"
    return f"{container_path}|{kind}|{payload_offset}{suffix}"


def find_bxml_payloads(data, container_path):
    rows = []
    search_offset = 0
    previous_end = 0
    while True:
        offset = data.find(LUA_SIGNATURE, search_offset)
        if offset < 0:
            break
        search_offset = offset + len(LUA_SIGNATURE)
        if offset < 5 or data[offset - 5] != 2:
            continue
        length = u32(data, offset - 4)
        end = offset + length
        if length < TYPE_TABLE_BYTES or end > len(data):
            continue
        try:
            validate_lua_type_table(data[offset:end])
        except (ValueError, struct.error):
            continue
        if offset - 5 < previous_end:
            raise ValueError(f"Overlapping BXML Lua payload at {container_path}:{offset}")
        payload = bytes(data[offset:end])
        rows.append({
            "occurrence_key": _occurrence_key(container_path, "bxml", offset),
            "container_path": container_path,
            "container_kind": "bxml",
            "payload_offset": offset,
            "payload_length_offset": offset - 4,
            "payload_bytes": length,
            "payload_sha256": sha256_bytes(payload),
            "asset_id": Path(container_path).stem if Path(container_path).stem.isdecimal() else "",
            "payload": payload,
        })
        previous_end = end
    return rows


def find_batch_payloads(data, container_path):
    rows = []
    for entry in parse_batch_records(data):
        start = entry["record_offset"]
        end = start + entry["record_bytes"]
        record = data[start:end]
        try:
            parsed = parse_script_record(record)
        except (UnicodeDecodeError, ValueError, struct.error):
            continue
        payload_offset = start + parsed["payload_offset"]
        rows.append({
            "occurrence_key": _occurrence_key(
                container_path, "batch_script", payload_offset, entry["asset_id"],
            ),
            "container_path": container_path,
            "container_kind": "batch_script",
            "payload_offset": payload_offset,
            "payload_length_offset": start + parsed["payload_length_offset"],
            "payload_bytes": parsed["payload_bytes"],
            "payload_sha256": sha256_bytes(parsed["payload"]),
            "asset_id": entry["asset_id"],
            "record_index": entry["record_index"],
            "record_length_offset": entry["record_length_offset"],
            "record_offset": start,
            "record_bytes": entry["record_bytes"],
            "record_name": parsed["record_name"],
            "string_references": parsed["string_references"],
            "record_payload_offset": parsed["payload_offset"],
            "payload": parsed["payload"],
        })
    return rows


def find_batch_bxml_payloads(data, container_path):
    records = parse_batch_records(data)
    rows = find_bxml_payloads(data, container_path)
    embedded = []
    for row in rows:
        envelope_start = row["payload_offset"] - 5
        envelope_end = row["payload_offset"] + row["payload_bytes"]
        entry = next((
            item for item in records
            if item["record_offset"] <= envelope_start
            and envelope_end <= item["record_offset"] + item["record_bytes"]
        ), None)
        if entry is None:
            continue
        row["container_kind"] = "batch_bxml"
        row["occurrence_key"] = _occurrence_key(
            container_path, "batch_bxml", row["payload_offset"], entry["asset_id"],
        )
        row.update({
            "asset_id": entry["asset_id"],
            "record_index": entry["record_index"],
            "record_length_offset": entry["record_length_offset"],
            "record_offset": entry["record_offset"],
            "record_bytes": entry["record_bytes"],
        })
        embedded.append(row)
    return embedded


def _unclassified_signature(data, container_path, offset):
    valid_type_table = False
    try:
        _validate_type_table_at(data, offset)
        valid_type_table = True
    except (ValueError, struct.error):
        pass

    declared_length = None
    reason = "signature_without_supported_envelope"
    if offset >= 5 and data[offset - 5] == 2:
        declared_length = u32(data, offset - 4)
        if declared_length > len(data) - offset:
            reason = "bxml_length_out_of_bounds"
        elif not valid_type_table:
            reason = "bxml_type_table_unrecognized"
        else:
            reason = "bxml_payload_not_accepted"
    elif valid_type_table:
        reason = "valid_type_table_without_supported_envelope"
    return {
        "container_path": container_path,
        "signature_offset": offset,
        "valid_type_table": valid_type_table,
        "declared_length": declared_length,
        "reason": reason,
    }


def scan_corpus(asset_dir=DEFAULT_ASSET_DIR):
    asset_dir = Path(asset_dir).resolve()
    if not asset_dir.is_dir():
        raise ValueError(f"Asset directory does not exist: {asset_dir}")

    occurrences = []
    unclassified = []
    scanned_files = 0
    signature_count = 0
    container_paths = set()

    for path in sorted(asset_dir.rglob("*")):
        if not path.is_file() or path.is_symlink():
            continue
        scanned_files += 1
        relative = path.relative_to(asset_dir).as_posix()
        size = path.stat().st_size
        if not size:
            continue
        with path.open("rb") as stream:
            with mmap.mmap(stream.fileno(), 0, access=mmap.ACCESS_READ) as data:
                hits = []
                cursor = 0
                while True:
                    offset = data.find(LUA_SIGNATURE, cursor)
                    if offset < 0:
                        break
                    hits.append(offset)
                    cursor = offset + len(LUA_SIGNATURE)
                signature_count += len(hits)

                if path.suffix == ".batch":
                    batch_data = data[:]
                    found = find_batch_bxml_payloads(batch_data, relative)
                    found.extend(find_batch_payloads(batch_data, relative))
                else:
                    found = find_bxml_payloads(data, relative)

                found.sort(key=lambda row: (row["payload_offset"], row["container_kind"]))
                script_intervals = [
                    (row["payload_offset"], row["payload_offset"] + row["payload_bytes"])
                    for row in found if row["container_kind"] == "batch_script"
                ]
                found = [
                    row for row in found
                    if row["container_kind"] != "batch_bxml"
                    or not any(start <= row["payload_offset"] < end
                               for start, end in script_intervals)
                ]
                recognized_offsets = {row["payload_offset"] for row in found}
                intervals = sorted(
                    (row["payload_offset"],
                     row["payload_offset"] + row["payload_bytes"])
                    for row in found
                )
                interval_index = 0
                for hit in hits:
                    if hit in recognized_offsets:
                        continue
                    while interval_index < len(intervals) and intervals[interval_index][1] <= hit:
                        interval_index += 1
                    if (interval_index < len(intervals)
                            and intervals[interval_index][0] <= hit < intervals[interval_index][1]):
                        continue
                    unclassified.append(_unclassified_signature(data, relative, hit))

                if found:
                    file_hash = sha256_file(path)
                    for row in found:
                        row["container_bytes"] = size
                        row["container_sha256"] = file_hash
                    occurrences.extend(found)
                    container_paths.add(relative)

    occurrences.sort(key=lambda row: (
        row["container_path"], row["payload_offset"], row["container_kind"],
    ))
    for index, row in enumerate(occurrences, 1):
        row["payload_path"] = f"payloads/lua-{index:08d}.bin"

    return {
        "asset_dir": asset_dir,
        "scanned_files": scanned_files,
        "signature_count": signature_count,
        "occurrences": occurrences,
        "unclassified_signatures": unclassified,
        "container_paths": sorted(container_paths),
    }


def _manifest_occurrence(row):
    return {key: value for key, value in row.items() if key != "payload"}


def _manifest_from_scan(scan):
    occurrences = [_manifest_occurrence(row) for row in scan["occurrences"]]
    summary = {
        "scanned_files": scan["scanned_files"],
        "signature_count": scan["signature_count"],
        "occurrences": len(occurrences),
        "bxml_payloads": sum(row["container_kind"] == "bxml" for row in occurrences),
        "batch_script_payloads": sum(
            row["container_kind"] == "batch_script" for row in occurrences
        ),
        "containers": len(scan["container_paths"]),
        "unclassified_signatures": len(scan["unclassified_signatures"]),
    }
    return {
        "schema_version": SCHEMA_VERSION,
        "summary": summary,
        "container_paths": scan["container_paths"],
        "occurrences": occurrences,
        "unclassified_signatures": scan["unclassified_signatures"],
    }


def _write_new_directory(output_dir, writer):
    output_dir = Path(output_dir).resolve()
    if output_dir.exists():
        raise ValueError(f"Output directory already exists: {output_dir}")
    output_dir.parent.mkdir(parents=True, exist_ok=True)
    stage = Path(tempfile.mkdtemp(prefix=f".{output_dir.name}.", dir=output_dir.parent))
    try:
        writer(stage)
        os.replace(stage, output_dir)
    except Exception:
        shutil.rmtree(stage, ignore_errors=True)
        raise


def extract_corpus(asset_dir=DEFAULT_ASSET_DIR, output_dir=DEFAULT_EXTRACTION_DIR):
    scan = scan_corpus(asset_dir)
    manifest = _manifest_from_scan(scan)

    def write(stage):
        for row in scan["occurrences"]:
            target = stage / row["payload_path"]
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(row["payload"])
        (stage / "manifest.json").write_text(
            json.dumps(manifest, ensure_ascii=True, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )

    _write_new_directory(output_dir, write)
    return manifest


def load_manifest(extraction_dir):
    path = Path(extraction_dir) / "manifest.json"
    try:
        manifest = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as error:
        raise ValueError(f"Cannot read extraction manifest: {error}") from error
    if manifest.get("schema_version") != SCHEMA_VERSION:
        raise ValueError("Unsupported extraction manifest schema")
    if not isinstance(manifest.get("occurrences"), list):
        raise ValueError("Invalid extraction manifest occurrences")
    return manifest


def _compare_manifest_source(manifest, scan):
    current = _manifest_from_scan(scan)
    saved_occurrences = manifest["occurrences"]
    current_occurrences = current["occurrences"]
    saved_by_key = {row["occurrence_key"]: row for row in saved_occurrences}
    current_by_key = {row["occurrence_key"]: row for row in current_occurrences}
    if len(saved_by_key) != len(saved_occurrences):
        raise ValueError("Duplicate occurrence key in extraction manifest")
    if saved_by_key.keys() != current_by_key.keys():
        raise ValueError("Source payload coverage differs from extraction manifest")
    for key, source_row in current_by_key.items():
        saved = saved_by_key[key]
        if saved.get("container_sha256") != source_row["container_sha256"]:
            raise ValueError(f"source hash changed: {source_row['container_path']}")
        if saved.get("payload_sha256") != source_row["payload_sha256"]:
            raise ValueError(f"manifest payload hash mismatch: {key}")
        for field in (
            "container_kind", "payload_offset", "payload_length_offset",
            "payload_bytes", "asset_id", "container_bytes", "record_index",
            "record_length_offset", "record_offset", "record_bytes",
            "record_name", "string_references", "record_payload_offset",
        ):
            if saved.get(field) != source_row.get(field):
                raise ValueError(f"Source metadata differs from extraction manifest: {key}")
    if manifest.get("unclassified_signatures") != current["unclassified_signatures"]:
        raise ValueError("Unclassified signature inventory differs from manifest")
    if manifest.get("container_paths") != current["container_paths"]:
        raise ValueError("Source container list differs from extraction manifest")
    if manifest.get("summary") != current["summary"]:
        raise ValueError("Source scan summary differs from extraction manifest")
    return current, saved_by_key


def _read_payload_files(extraction_dir, manifest, saved_by_key, allow_edits):
    replacements = {}
    root = Path(extraction_dir).resolve()
    for row in manifest["occurrences"]:
        saved = saved_by_key[row["occurrence_key"]]
        if row.get("payload_path") != saved.get("payload_path"):
            raise ValueError(f"Payload path differs from source manifest: {row['occurrence_key']}")
        relative = Path(row["payload_path"])
        if relative.is_absolute() or ".." in relative.parts:
            raise ValueError(f"Unsafe payload path in manifest: {relative}")
        path = root / relative
        if path.is_symlink() or not path.resolve().is_relative_to(root):
            raise ValueError(f"Unsafe extracted payload path: {relative}")
        try:
            payload = path.read_bytes()
        except OSError as error:
            raise ValueError(f"Cannot read extracted payload {relative}: {error}") from error
        digest = sha256_bytes(payload)
        if not allow_edits and digest != row["payload_sha256"]:
            raise ValueError(f"Extracted payload hash mismatch: {relative}")
        validate_lua_type_table(payload)
        replacements[row["occurrence_key"]] = payload
    return replacements


def rebuild_bxml(data, rows, replacements):
    parts = []
    cursor = 0
    for row in sorted(rows, key=lambda item: item["payload_offset"]):
        offset = row["payload_offset"]
        old_length = row["payload_bytes"]
        old_end = offset + old_length
        if offset - 5 < cursor or old_end > len(data):
            raise ValueError("Overlapping or out-of-range BXML payload")
        old_payload = bytes(data[offset:old_end])
        if sha256_bytes(old_payload) != row["payload_sha256"]:
            raise ValueError(f"Stale BXML payload at {row['occurrence_key']}")
        payload = replacements.get(row["occurrence_key"], old_payload)
        validate_lua_type_table(payload)
        if offset - 4 > len(data) or u32(data, offset - 4) != old_length:
            raise ValueError(f"Stale BXML length field at {row['occurrence_key']}")
        parts.extend((
            bytes(data[cursor:offset - 4]),
            struct.pack("<I", len(payload)),
            payload,
        ))
        cursor = old_end
    parts.append(bytes(data[cursor:]))
    return b"".join(parts)


def rebuild_batch(data, rows, replacements):
    entries = parse_batch_records(data)
    by_asset_id = {}
    for row in rows:
        by_asset_id.setdefault(row["asset_id"], []).append(row)
    rebuilt_records = []
    for entry in entries:
        start = entry["record_offset"]
        end = start + entry["record_bytes"]
        record = bytes(data[start:end])
        rows_for_record = by_asset_id.get(entry["asset_id"], [])
        if rows_for_record:
            if any(row["record_offset"] != start or row["record_bytes"] != len(record)
                   for row in rows_for_record):
                raise ValueError(f"Stale batch record at ID {entry['asset_id']}")
            bxml_rows = [
                row for row in rows_for_record if row["container_kind"] == "batch_bxml"
            ]
            if bxml_rows:
                relative_rows = []
                for row in bxml_rows:
                    relative = dict(row)
                    relative["payload_offset"] -= start
                    relative_rows.append(relative)
                record = rebuild_bxml(record, relative_rows, replacements)

            for row in rows_for_record:
                if row["container_kind"] != "batch_script":
                    continue
                parsed = parse_script_record(record)
                payload = parsed["payload"]
                if sha256_bytes(payload) != row["payload_sha256"]:
                    raise ValueError(f"Stale batch payload at ID {entry['asset_id']}")
                replacement = replacements.get(row["occurrence_key"], payload)
                validate_lua_type_table(replacement)
                length_offset = parsed["payload_length_offset"]
                record = (
                    record[:length_offset]
                    + struct.pack("<I", len(replacement))
                    + replacement
                )
        rebuilt_records.append((entry["asset_id"], record))

    result = bytearray(struct.pack("<I", len(rebuilt_records)))
    for asset_id, record in rebuilt_records:
        result.extend(struct.pack("<II", asset_id, len(record)))
    for _, record in rebuilt_records:
        result.extend(record)
    return bytes(result)


def _group_occurrences(rows):
    grouped = {}
    for row in rows:
        grouped.setdefault(row["container_path"], []).append(row)
    return grouped


def verify_roundtrip(asset_dir, extraction_dir):
    manifest = load_manifest(extraction_dir)
    scan = scan_corpus(asset_dir)
    current, saved_by_key = _compare_manifest_source(manifest, scan)
    replacements = _read_payload_files(
        extraction_dir, manifest, saved_by_key, allow_edits=False,
    )
    grouped = _group_occurrences(current["occurrences"])
    for relative, rows in grouped.items():
        kinds = {row["container_kind"] for row in rows}
        if len(kinds) != 1 and not kinds <= {"batch_bxml", "batch_script"}:
            raise ValueError(f"Mixed container framing is unsupported: {relative}")
        source = (Path(asset_dir) / relative).read_bytes()
        if kinds == {"bxml"}:
            rebuilt = rebuild_bxml(source, rows, replacements)
        elif kinds <= {"batch_bxml", "batch_script"}:
            rebuilt = rebuild_batch(source, rows, replacements)
        else:
            raise ValueError(f"Unsupported container framing: {relative}")
        if rebuilt != source:
            raise ValueError(f"No-edit round-trip differs: {relative}")
    return {
        "containers": len(grouped),
        "occurrences": len(current["occurrences"]),
        "unclassified_signatures": len(current["unclassified_signatures"]),
        "byte_identical": True,
    }


def reencode_corpus(asset_dir, extraction_dir, output_dir):
    manifest = load_manifest(extraction_dir)
    scan = scan_corpus(asset_dir)
    current, saved_by_key = _compare_manifest_source(manifest, scan)
    replacements = _read_payload_files(
        extraction_dir, manifest, saved_by_key, allow_edits=True,
    )
    grouped = _group_occurrences(current["occurrences"])
    output_files = {}

    for relative, rows in grouped.items():
        changed = [
            row for row in rows
            if sha256_bytes(replacements[row["occurrence_key"]]) != row["payload_sha256"]
        ]
        if not changed:
            continue
        kinds = {row["container_kind"] for row in rows}
        if len(kinds) != 1 and not kinds <= {"batch_bxml", "batch_script"}:
            raise ValueError(f"Mixed container framing is unsupported: {relative}")
        source_path = Path(asset_dir) / relative
        source = source_path.read_bytes()
        if sha256_bytes(source) != rows[0]["container_sha256"]:
            raise ValueError(f"source hash changed: {relative}")
        if kinds == {"bxml"}:
            rebuilt = rebuild_bxml(source, rows, replacements)
        elif kinds <= {"batch_bxml", "batch_script"}:
            rebuilt = rebuild_batch(source, rows, replacements)
        else:
            raise ValueError(f"Unsupported container framing: {relative}")
        if rebuilt != source:
            output_files[relative] = rebuilt

    def write(stage):
        for relative, data in sorted(output_files.items()):
            target = stage / relative
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(data)
        summary = {
            "changed_containers": len(output_files),
            "changed_payloads": sum(
                sha256_bytes(replacements[row["occurrence_key"]]) != row["payload_sha256"]
                for row in current["occurrences"]
            ),
            "source_containers": len(grouped),
            "source_assets_modified": False,
        }
        (stage / "reencode-summary.json").write_text(
            json.dumps(summary, ensure_ascii=True, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )

    _write_new_directory(output_dir, write)
    return {
        "changed_containers": len(output_files),
        "changed_payloads": sum(
            sha256_bytes(replacements[row["occurrence_key"]]) != row["payload_sha256"]
            for row in current["occurrences"]
        ),
        "source_containers": len(grouped),
        "source_assets_modified": False,
    }
