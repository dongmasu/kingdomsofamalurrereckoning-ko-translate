#!/usr/bin/env python3
"""Account for every frozen Lua occurrence without executing bytecode."""

import argparse
from collections import Counter
from contextlib import ExitStack
import csv
import hashlib
import io
import json
import os
from pathlib import Path
import tempfile
import zlib

from lua_bytecode_reader import ParseError, analyze_function, decode_fields, parse_payload
from lua_resource_codec import DEFAULT_EXTRACTION_DIR, DEFAULT_ROOT
from lua_review_inputs import _payload_path, verify_snapshot


AUDIT_PATH = Path("work/zh_cn/audit/lua-corpus-review-20261115")
OUTPUT_NAMES = ("coverage.tsv", "decoded-evidence.jsonl", "coverage-summary.json")
COVERAGE_FIELDS = (
    "occurrence_key", "container_kind", "container_path", "container_sha256",
    "container_bytes", "asset_id", "record_index", "record_name",
    "record_length_offset", "record_offset", "record_bytes", "record_payload_offset",
    "string_references", "payload_path", "payload_sha256", "payload_bytes",
    "payload_offset", "payload_length_offset", "status", "structural_support",
    "instruction_support", "semantic_support", "dataflow_status", "diagnostic_code",
    "diagnostic_offset", "diagnostic_detail", "function_count", "instruction_count",
    "constant_count",
)
SITE_LISTS = ("instruction_statuses", "references", "control_flow_edges",
              "calls", "closure_bindings")
SITE_FIELDS = ("path", "offset", "word", "raw_operands", "support_rationale")


def _json_bytes(value):
    return json.dumps(value, ensure_ascii=True, sort_keys=True,
                      separators=(",", ":"), allow_nan=False).encode("ascii")


def _compact_function(function, analysis):
    rationales = []
    indexes = {}
    compact = {key: value for key, value in analysis.items()
               if key not in SITE_LISTS and key != "path"}
    for name in SITE_LISTS:
        entries = []
        for site in analysis[name]:
            rationale = site["support_rationale"]
            if rationale not in indexes:
                indexes[rationale] = len(rationales)
                rationales.append(rationale)
            entry = {key: value for key, value in site.items() if key not in SITE_FIELDS}
            entry["rationale_index"] = indexes[rationale]
            entries.append(entry)
        compact[name] = entries
    compact["rationales"] = rationales
    instructions = function["instructions"]
    return {
        "path": function["path"], "start": function["start"], "end": function["end"],
        "metadata": function["metadata"], "constants": function["constants"],
        "child_paths": function["child_paths"],
        "code_offset": instructions[0]["offset"] if instructions else None,
        "code_hex": "".join(f'{instruction["word"]:08x}' for instruction in instructions),
        "analysis": compact,
    }


def expand_analysis(function: dict) -> dict:
    """Reconstruct the exact Task 3 analysis contract from a compact function."""
    compact = function["analysis"]
    result = {key: value for key, value in compact.items()
              if key not in SITE_LISTS and key != "rationales"}
    result["path"] = function["path"]
    words = bytes.fromhex(function["code_hex"])
    for name in SITE_LISTS:
        entries = []
        for entry in compact[name]:
            pc = entry["pc"]
            word = int.from_bytes(words[pc * 4:pc * 4 + 4], "big")
            fields = decode_fields(word)
            site = {key: value for key, value in entry.items() if key != "rationale_index"}
            site.update(
                path=function["path"], offset=function["code_offset"] + 4 * pc, word=word,
                raw_operands=dict(zip(("opcode", "a", "b", "c", "bx"), fields)),
                support_rationale=compact["rationales"][entry["rationale_index"]],
            )
            entries.append(site)
        result[name] = entries
    return result


def _analyze_payload(body):
    try:
        parsed = parse_payload(body)
    except ParseError as error:
        if error.code.startswith("unsupported_"):
            status = "unsupported"
        elif error.code.startswith("malformed_"):
            status = "malformed"
        else:
            raise
        return {
            "coverage": {
                "status": status, "structural_support": status,
                "instruction_support": "unavailable", "semantic_support": "unavailable",
                "dataflow_status": "unavailable", "diagnostic_code": error.code,
                "diagnostic_offset": error.offset, "diagnostic_detail": error.detail,
                "function_count": None, "instruction_count": None, "constant_count": None,
            },
            "functions": [],
        }
    functions = parsed["functions"]
    compact_functions = []
    instruction_partial = False
    semantic_partial = False
    blocked = False
    for function in functions:
        analysis = analyze_function(function)
        instruction_partial |= any(site["status"] in ("unsupported", "invalid")
                                   for site in analysis["instruction_statuses"])
        semantic_partial |= (analysis["status"] != "supported" or
                             any(site["semantic_support"] in ("partial", "unsupported")
                                 for site in analysis["instruction_statuses"]))
        blocked |= analysis["dataflow_status"] != "complete"
        compact_functions.append(_compact_function(function, analysis))
    return {
        "coverage": {
            "status": "parsed", "structural_support": "supported",
            "instruction_support": "partial" if instruction_partial else "supported",
            "semantic_support": "partial" if semantic_partial else "supported",
            "dataflow_status": "blocked" if blocked else "complete",
            "diagnostic_code": "", "diagnostic_offset": None, "diagnostic_detail": "",
            "function_count": len(functions),
            "instruction_count": sum(len(function["instructions"]) for function in functions),
            "constant_count": sum(len(function["constants"]) for function in functions),
        },
        "functions": compact_functions,
    }


def _iter_occurrences(occurrences, extraction_dir):
    rows = sorted(occurrences, key=lambda row: row["occurrence_key"])
    keys = [row["occurrence_key"] for row in rows]
    if len(keys) != len(set(keys)):
        raise ValueError("Duplicate occurrence key")
    cache = {}
    with tempfile.TemporaryFile() as spool:
        for row in rows:
            body = _payload_path(Path(extraction_dir), row["payload_path"]).read_bytes()
            if len(body) != row["payload_bytes"]:
                raise ValueError(f'Payload size mismatch: {row["occurrence_key"]}')
            actual_hash = hashlib.sha256(body).hexdigest()
            if actual_hash != row["payload_sha256"]:
                raise ValueError(f'Payload hash mismatch: {row["occurrence_key"]}')
            if actual_hash not in cache:
                result = _analyze_payload(body)
                packed = zlib.compress(_json_bytes(result))
                spool.seek(0, os.SEEK_END)
                cache[actual_hash] = (spool.tell(), len(packed))
                spool.write(packed)
            offset, size = cache[actual_hash]
            spool.seek(offset)
            result = json.loads(zlib.decompress(spool.read(size)))
            coverage = {**row, **result["coverage"]}
            yield coverage, ({**row, "function": function} for function in result["functions"])


def analyze_occurrences(occurrences: list[dict], extraction_dir: Path) -> tuple[list[dict], list[dict]]:
    coverage, evidence = [], []
    for row, functions in _iter_occurrences(occurrences, extraction_dir):
        coverage.append(row)
        evidence.extend(functions)
    return coverage, evidence


def validate_output_dir(repo_root, extraction_dir, snapshot_path, output_dir):
    original_root = Path(repo_root).absolute()
    root = original_root.resolve()
    allowed = root / AUDIT_PATH
    output = Path(output_dir).absolute()
    if output.is_relative_to(original_root):
        output = root / output.relative_to(original_root)
    if allowed.resolve() != allowed or output.resolve() != output:
        raise ValueError("Output path must not traverse symlinks")
    if not output.is_relative_to(allowed):
        raise ValueError("Output directory must be inside the dated audit directory")
    for directory in (output, *output.parents):
        if directory.exists() and not directory.is_dir():
            raise ValueError(f"Output directory component is not a directory: {directory}")
        if directory == allowed:
            break
    if output.is_relative_to(Path(extraction_dir).resolve()):
        raise ValueError("Output directory overlaps extraction")
    snapshot = Path(snapshot_path).resolve()
    for name in OUTPUT_NAMES:
        target = output / name
        if target == snapshot or target.is_symlink():
            raise ValueError(f"Protected output path: {target}")
        if target.exists() and (not target.is_file() or target.stat().st_nlink != 1):
            raise ValueError(f"Unsafe output file: {target}")
    return output


class _Comparison:
    def __init__(self, stream, name):
        self.stream = stream
        self.name = name

    def write(self, data):
        if self.stream.read(len(data)) != data:
            raise ValueError(f"Output differs: {self.name}")

    def finish(self):
        if self.stream.read(1):
            raise ValueError(f"Output differs: {self.name}")


def _tsv_line(values):
    stream = io.StringIO(newline="")
    writer = csv.writer(stream, delimiter="\t", lineterminator="\n")
    writer.writerow([json.dumps(value, ensure_ascii=True, sort_keys=True,
                                separators=(",", ":"))
                     if isinstance(value, (list, dict)) else value for value in values])
    return stream.getvalue().encode("utf-8")


def _generate(occurrences, extraction_dir, outputs):
    coverage_sink, evidence_sink, summary_sink = outputs
    coverage_sink.write(_tsv_line(COVERAGE_FIELDS))
    counts = Counter()
    status_counts = Counter()
    instruction_counts = Counter()
    semantic_counts = Counter()
    dataflow_counts = Counter()
    diagnostics = Counter()
    unique_hashes = set()
    keys = set()
    evidence_count = 0
    for row, functions in _iter_occurrences(occurrences, extraction_dir):
        key = row["occurrence_key"]
        if key in keys:
            raise ValueError(f"Duplicate coverage key: {key}")
        keys.add(key)
        kind, status, semantic = row["container_kind"], row["status"], row["semantic_support"]
        counts[(kind, status, semantic)] += 1
        status_counts[status] += 1
        instruction_counts[row["instruction_support"]] += 1
        semantic_counts[semantic] += 1
        dataflow_counts[row["dataflow_status"]] += 1
        if row["diagnostic_code"]:
            diagnostics[row["diagnostic_code"]] += 1
        unique_hashes.add(row["payload_sha256"])
        coverage_sink.write(_tsv_line([row.get(field) for field in COVERAGE_FIELDS]))
        for evidence in functions:
            evidence_sink.write(_json_bytes(evidence) + b"\n")
            evidence_count += 1
    expected = {row["occurrence_key"] for row in occurrences}
    if len(expected) != len(occurrences) or keys != expected:
        raise ValueError("Coverage keys do not match snapshot occurrence keys")
    summary = {
        "schema_version": 1,
        "occurrences": len(keys),
        "unique_payload_hashes": len(unique_hashes),
        "evidence_function_rows": evidence_count,
        "status_counts": dict(sorted(status_counts.items())),
        "instruction_support_counts": dict(sorted(instruction_counts.items())),
        "semantic_support_counts": dict(sorted(semantic_counts.items())),
        "dataflow_status_counts": dict(sorted(dataflow_counts.items())),
        "diagnostic_counts": dict(sorted(diagnostics.items())),
        "kind_status_semantic_counts": [
            {"kind": kind, "status": status, "semantic_support": semantic, "count": count}
            for (kind, status, semantic), count in sorted(counts.items())
        ],
        "evidence_schema": {
            "row": "occurrence provenance plus function",
            "code_hex": "big-endian 32-bit instruction words in PC order",
            "code_offset": "payload-relative offset of PC 0; null for empty code",
            "analysis": "Task 3 site lists omit reconstructible envelope fields; "
                        "rationale_index indexes the per-function rationales array",
            "expansion": "tools.analyze_lua_corpus.expand_analysis",
            "constant_offsets": "payload-relative half-open ranges",
            "localization": "unresolved; no API role inferred",
        },
    }
    summary_sink.write(_json_bytes(summary) + b"\n")
    return summary


def run(repo_root, extraction_dir, output_dir, snapshot_path, check=False):
    root = Path(repo_root).resolve()
    extraction = Path(extraction_dir).resolve()
    snapshot_path = Path(snapshot_path).resolve()
    output = validate_output_dir(repo_root, extraction, snapshot_path, output_dir)
    snapshot = json.loads(snapshot_path.read_text(encoding="utf-8"))
    verify_snapshot(snapshot, root, extraction)
    occurrences = snapshot["occurrences"]
    if check:
        with ExitStack() as stack:
            sinks = [_Comparison(stack.enter_context((output / name).open("rb")), name)
                     for name in OUTPUT_NAMES]
            summary = _generate(occurrences, extraction, sinks)
            for sink in sinks:
                sink.finish()
        return summary
    output.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix=".lua-corpus-", dir=output) as staging:
        with ExitStack() as stack:
            sinks = [stack.enter_context((Path(staging) / name).open("wb"))
                     for name in OUTPUT_NAMES]
            summary = _generate(occurrences, extraction, sinks)
        validate_output_dir(root, extraction, snapshot_path, output)
        for name in OUTPUT_NAMES:
            os.replace(Path(staging) / name, output / name)
    return summary


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-dir", type=Path, default=DEFAULT_ROOT / AUDIT_PATH)
    parser.add_argument("--check", action="store_true",
                        help="recompute and compare without modifying output artifacts")
    parser.add_argument("--candidates", action="store_true",
                        help="generate or check Task 5 outputs separately from Task 4")
    args = parser.parse_args()
    if args.candidates:
        from lua_translation_candidates import run_candidates
        summary = run_candidates(DEFAULT_ROOT, DEFAULT_EXTRACTION_DIR, args.output_dir,
                                 DEFAULT_ROOT / AUDIT_PATH / "input-snapshot.json", args.check)
    else:
        summary = run(DEFAULT_ROOT, DEFAULT_EXTRACTION_DIR, args.output_dir,
                      DEFAULT_ROOT / AUDIT_PATH / "input-snapshot.json", args.check)
    print(json.dumps(summary, ensure_ascii=True, sort_keys=True))


if __name__ == "__main__":
    main()
