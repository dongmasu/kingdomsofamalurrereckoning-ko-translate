#!/usr/bin/env python3
"""Freeze read-only Lua review inputs and select a reproducible pilot."""

from collections import Counter
from pathlib import Path, PurePosixPath
import re

from lua_resource_codec import load_manifest, sha256_file


PINNED_FFQ35_HASHES = (
    "2b0ba91abe92a761ae7f28330f5765f74a1f45101cf879745a740b43697578b5",
    "604abfc9f55fdccb5b276b23de8027683f993f898e5907234a65bbfb5bbc69b4",
    "f3ac587da8ba1cbd92c34d054ff14c8a9776b10b042ecebc9d4bc2b4f9eaec12",
)
KINDS = {"bxml", "batch_bxml", "batch_script"}
HEADER_BYTES = 14


def _valid_relative_path(value):
    if not isinstance(value, str) or not value or "\\" in value:
        return False
    path = PurePosixPath(value)
    return (value != "." and not path.is_absolute()
            and not re.match(r"^[A-Za-z]:", value)
            and ".." not in path.parts and str(path) == value)


def _payload_path(extraction_dir, relative):
    if not _valid_relative_path(relative):
        raise ValueError(f"Unsafe payload path: {relative!r}")
    root = extraction_dir.resolve()
    resolved = (root / relative).resolve()
    if not resolved.is_relative_to(root):
        raise ValueError(f"Unsafe payload path: {relative}")
    if not resolved.is_file():
        raise ValueError(f"Missing payload file: {relative}")
    return resolved


def _validate_provenance(row):
    key = row["occurrence_key"]
    kind = row["container_kind"]
    container = row["container_path"]
    if not _valid_relative_path(container):
        raise ValueError(f"Unsafe container path: {container!r}")
    for field in ("payload_offset", "payload_length_offset", "container_bytes"):
        if type(row.get(field)) is not int or row[field] < 0:
            raise ValueError(f"Invalid provenance {field}: {key}")
    container_hash = row.get("container_sha256")
    if not isinstance(container_hash, str) or not re.fullmatch(r"[0-9a-f]{64}", container_hash):
        raise ValueError(f"Invalid container hash: {key}")
    offset = row["payload_offset"]
    if (offset < 4 or row["payload_length_offset"] != offset - 4
            or offset + row["payload_bytes"] > row["container_bytes"]):
        raise ValueError(f"Invalid payload provenance offsets or length: {key}")
    if kind == "bxml":
        stem = Path(container).stem
        expected_asset = stem if stem.isdecimal() else ""
        if (offset < 5 or Path(container).suffix == ".batch"
                or row.get("asset_id") != expected_asset):
            raise ValueError(f"Invalid BXML asset provenance: {key}")
        expected_key = f"{container}|{kind}|{offset}"
    else:
        for field in ("asset_id", "record_index", "record_length_offset",
                      "record_offset", "record_bytes"):
            if type(row.get(field)) is not int or row[field] < 0:
                raise ValueError(f"Invalid provenance {field}: {key}")
        if row["asset_id"] > 0xffffffff:
            raise ValueError(f"Invalid batch asset ID: {key}")
        start = row["record_offset"]
        end = start + row["record_bytes"]
        if (Path(container).suffix != ".batch"
                or row["record_length_offset"] != 8 + 8 * row["record_index"]
                or row["record_length_offset"] + 4 > start
                or end > row["container_bytes"]
                or offset - (5 if kind == "batch_bxml" else 4) < start
                or offset + row["payload_bytes"] > end):
            raise ValueError(f"Invalid batch record provenance: {key}")
        if kind == "batch_script":
            references = row.get("string_references")
            if (not isinstance(row.get("record_name"), str)
                    or not isinstance(references, list)
                    or not all(isinstance(value, str) for value in references)
                    or type(row.get("record_payload_offset")) is not int
                    or row["record_payload_offset"] != offset - start
                    or offset + row["payload_bytes"] != end):
                raise ValueError(f"Invalid batch script provenance: {key}")
            texts = [row["record_name"], *references]
            if any("\0" in text for text in texts):
                raise ValueError(f"Invalid batch script text: {key}")
            try:
                lengths = [len(text.encode("utf-8")) for text in texts]
            except UnicodeEncodeError as error:
                raise ValueError(f"Invalid batch script UTF-8 text: {key}") from error
            if len(references) > 0xffffffff or any(size > 0xffffffff for size in lengths):
                raise ValueError(f"Invalid batch script text length: {key}")
            expected_prefix = 12 + lengths[0] + sum(4 + size for size in lengths[1:])
            if row["record_payload_offset"] != expected_prefix:
                raise ValueError(f"Invalid batch script encoded prefix length: {key}")
        expected_key = f'{container}|{kind}|{offset}:{row["asset_id"]}'
    if key != expected_key:
        raise ValueError(f"Occurrence key does not match provenance: {key}")


def load_occurrences(extraction_dir: Path) -> list[dict]:
    extraction_dir = Path(extraction_dir)
    try:
        manifest = load_manifest(extraction_dir)
    except (AttributeError, TypeError) as error:
        raise ValueError("Invalid extraction manifest") from error
    rows = []
    keys = set()
    checked = {}
    container_metadata = {}
    record_metadata = {}
    locations = set()
    for row in manifest["occurrences"]:
        if not isinstance(row, dict):
            raise ValueError("Invalid occurrence record")
        key = row.get("occurrence_key")
        if not isinstance(key, str) or not key:
            raise ValueError("Invalid occurrence key")
        if key in keys:
            raise ValueError(f"Duplicate occurrence key: {key}")
        keys.add(key)
        if not isinstance(row.get("container_kind"), str) or row["container_kind"] not in KINDS:
            raise ValueError(f"Invalid container kind: {key}")
        if not isinstance(row.get("container_path"), str) or not row["container_path"]:
            raise ValueError(f"Invalid container path: {key}")
        length = row.get("payload_bytes")
        if type(length) is not int or length < 0:
            raise ValueError(f"Invalid payload length: {key}")
        expected = row.get("payload_sha256")
        if not isinstance(expected, str) or not re.fullmatch(r"[0-9a-f]{64}", expected):
            raise ValueError(f"Invalid payload hash: {key}")
        path = _payload_path(extraction_dir, row.get("payload_path"))
        if path not in checked:
            try:
                size = path.stat().st_size
                actual_hash = sha256_file(path)
                with path.open("rb") as stream:
                    header = stream.read(HEADER_BYTES).hex()
            except OSError as error:
                raise ValueError(f"Cannot read payload: {path}") from error
            checked[path] = (size, actual_hash, header)
        size, actual_hash, header = checked[path]
        if size != length:
            raise ValueError(f"Payload size mismatch: {key}")
        if actual_hash != expected:
            raise ValueError(f"Payload hash mismatch: {key}")
        _validate_provenance(row)
        location = (row["container_path"], row["payload_offset"])
        if location in locations:
            raise ValueError(f"Duplicate payload location: {key}")
        locations.add(location)
        metadata = (row["container_bytes"], row["container_sha256"])
        prior = container_metadata.setdefault(row["container_path"], metadata)
        if metadata != prior:
            raise ValueError(f"Inconsistent container provenance: {key}")
        if row["container_kind"] != "bxml":
            record_key = (row["container_path"], row["record_index"])
            record = tuple(row[field] for field in
                           ("asset_id", "record_length_offset", "record_offset", "record_bytes"))
            if record_metadata.setdefault(record_key, record) != record:
                raise ValueError(f"Inconsistent batch record provenance: {key}")
        rows.append({**row, "header_group": header})

    summary = manifest.get("summary")
    containers = manifest.get("container_paths")
    if not isinstance(summary, dict) or not isinstance(containers, list):
        raise ValueError("Invalid manifest summary or container paths")
    counts = Counter(row["container_kind"] for row in rows)
    observed_containers = {row["container_path"] for row in rows}
    if (not all(isinstance(path, str) and path for path in containers)
            or len(containers) != len(set(containers))
            or set(containers) != observed_containers):
        raise ValueError("Manifest container paths mismatch")
    expected_counts = {
        "occurrences": len(rows),
        "containers": len(observed_containers),
        "bxml_payloads": counts["bxml"],
        "batch_script_payloads": counts["batch_script"],
    }
    if any(summary.get(name) != count for name, count in expected_counts.items()):
        raise ValueError("Manifest summary count mismatch")
    if type(summary.get("scanned_files")) is not int or summary["scanned_files"] < len(containers):
        raise ValueError("Invalid manifest scanned files count")
    unclassified = manifest.get("unclassified_signatures")
    signature_count = summary.get("signature_count")
    unresolved_count = summary.get("unclassified_signatures")
    if (not isinstance(unclassified, list) or type(signature_count) is not int
            or type(unresolved_count) is not int or unresolved_count != len(unclassified)
            or signature_count < len(rows) + unresolved_count):
        raise ValueError("Invalid manifest signature accounting")
    for item in unclassified:
        if (not isinstance(item, dict)
                or not isinstance(item.get("container_path"), str) or not item["container_path"]
                or type(item.get("signature_offset")) is not int or item["signature_offset"] < 0
                or type(item.get("valid_type_table")) is not bool
                or "declared_length" not in item
                or (item["declared_length"] is not None and
                    (type(item["declared_length"]) is not int or item["declared_length"] < 0))
                or not isinstance(item.get("reason"), str) or not item["reason"]):
            raise ValueError("Invalid unclassified signature record")
    if unclassified:
        details = ", ".join(f'{item["container_path"]}:{item["signature_offset"]} ({item["reason"]})'
                            for item in unclassified[:5])
        raise ValueError(f"Found {len(unclassified)} unclassified signatures: {details}")
    return sorted(rows, key=lambda row: row["occurrence_key"])


def _record(path, name):
    try:
        return {"path": name, "sha256": sha256_file(path), "size": path.stat().st_size}
    except OSError as error:
        raise ValueError(f"Cannot read input: {path}") from error


def _repository_inputs(root):
    paths = []
    for resource in ("affix", "base", "default"):
        for locale in ("en_us", "ja_jp", "zh_cn"):
            paths.append(root / f"src/csv/{locale}/locatexts_{locale}.koalocatext_{resource}.csv")
        paths.append(root / f"work/zh_cn/locatexts_zh_cn.koalocatext_{resource}.csv")
    for category in ("classification", "glossary", "exceptions"):
        directory = root / "work/zh_cn/translation-reference" / category
        if not directory.is_dir():
            raise ValueError(f"Missing reference directory: {directory}")
        paths.extend(path for path in directory.rglob("*") if path.is_file())
    audit = root / "work/zh_cn/audit"
    ledgers = sorted(path for path in audit.glob("*ledger*") if path.is_file())
    if not ledgers:
        raise ValueError(f"Missing review ledger in {audit}")
    paths.extend(ledgers)
    return paths


def snapshot_inputs(repo_root: Path, extraction_dir: Path) -> dict:
    root = Path(repo_root).resolve()
    extraction = Path(extraction_dir).resolve()
    rows = load_occurrences(extraction)
    manifest = load_manifest(extraction)
    inputs = [_record(path, path.relative_to(root).as_posix())
              for path in _repository_inputs(root)]
    inputs.append(_record(extraction / "manifest.json", "extraction/manifest.json"))
    for relative in sorted({row["payload_path"] for row in rows}):
        inputs.append(_record(_payload_path(extraction, relative), f"extraction/{relative}"))
    tools_dir = root / "tools"
    tool_paths = sorted(tools_dir.glob("*lua*.py"))
    return {
        "schema_version": 1,
        "inputs": sorted(inputs, key=lambda item: item["path"]),
        "occurrences": rows,
        "occurrence_count": len(rows),
        "kind_counts": dict(sorted(Counter(row["container_kind"] for row in rows).items())),
        "scanned_files": manifest["summary"]["scanned_files"],
        "payload_containing_files": len(manifest["container_paths"]),
        "unique_payload_hashes": len({row["payload_sha256"] for row in rows}),
        "tool_sources": [_record(path, path.relative_to(root).as_posix()) for path in tool_paths],
    }


def select_pilot(occurrences: list[dict]) -> list[str]:
    rows = sorted(occurrences, key=lambda row: row["occurrence_key"])
    selected = set()
    for expected in PINNED_FFQ35_HASHES:
        matching = [row for row in rows if row["payload_sha256"] == expected]
        if not matching:
            raise ValueError(f"Missing pinned FFQ35 payload hash: {expected}")
        selected.add(matching[0]["occurrence_key"])
    for field in ("container_kind", "header_group"):
        groups = {}
        for row in rows:
            groups.setdefault(row[field], row)
        selected.update(row["occurrence_key"] for row in groups.values())
    extensions = {}
    for row in rows:
        extensions.setdefault(Path(row["container_path"]).suffix, row)
    selected.update(row["occurrence_key"] for row in extensions.values())
    for kind in sorted({row["container_kind"] for row in rows}):
        group = [row for row in rows if row["container_kind"] == kind]
        for row in (min(group, key=lambda r: (r["payload_bytes"], r["occurrence_key"])),
                    min(group, key=lambda r: (-r["payload_bytes"], r["occurrence_key"]))):
            selected.add(row["occurrence_key"])
    return sorted(selected)


def verify_snapshot(snapshot: dict, repo_root: Path, extraction_dir: Path) -> None:
    current = snapshot_inputs(repo_root, extraction_dir)
    frozen = {key: value for key, value in snapshot.items() if key != "tool_sources"}
    actual = {key: value for key, value in current.items() if key != "tool_sources"}
    if frozen != actual:
        raise ValueError("Frozen review inputs changed")
