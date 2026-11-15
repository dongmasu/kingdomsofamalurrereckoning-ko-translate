#!/usr/bin/env python3
"""Mechanically join validated key reviews; never generate linguistic judgments.

Single comparisons inherit the review verbatim. Multiple comparisons resolve
only on unanimous retains or identical unanimous proposals. All other cases
remain unresolved, with every original decision and locale text preserved in
candidate-variant-decisions.jsonl. Retain is bounded review, not runtime linkage;
proposals remain provisional and never authorize translation edits.
Outputs form one dedicated, atomically published directory; existing output
must match the complete generation exactly, including for read-only --check.
"""

import argparse
from collections import Counter, defaultdict
from contextlib import ExitStack
import csv
import hashlib
import json
import os
from pathlib import Path
import re
import tempfile

from lua_resource_codec import DEFAULT_EXTRACTION_DIR, sha256_file
from lua_review_inputs import verify_snapshot
from lua_translation_candidates import (
    LEVEL, LOCALES, _comparison_locales, _jsonl_rows, _locale_csv_path,
    _review_key, _validated_review_audit_dir,
    validate_adjudications, validate_key_review_files,
)


AUDIT_PATH = Path("work/zh_cn/audit/lua-corpus-review-20261115")
OUTPUT_NAMES = ("adjudications.jsonl", "candidate-variant-decisions.jsonl",
                "reconciliation-summary.json")
LINK_FIELDS = (
    "candidate_id", "resource", "id", "variant", "candidate_variant",
    "matched_english_variant", "extraction_method", "evidence_level",
    "context_inventory_line",
)
RULE = (
    "Mechanical join only: single-key decisions inherit bounded reviews; "
    "multiple comparisons require unanimous retain or identical unanimous "
    "proposals. Missing locales, conflicts, unresolved reviews, mixed "
    "dispositions or differing proposals remain unresolved. Retains do not "
    "establish runtime linkage; proposals remain provisional."
)


def _json(value):
    return json.dumps(value, ensure_ascii=True, sort_keys=True,
                      separators=(",", ":"), allow_nan=False) + "\n"


def _load(path):
    with Path(path).open(encoding="utf-8") as stream:
        value = json.load(stream)
    if not isinstance(value, dict):
        raise ValueError(f"Expected JSON object: {path}")
    return value


def _file(root, name):
    relative = Path(name)
    if (not name or str(relative) != name or relative == Path(".")
            or relative.is_absolute() or ".." in relative.parts):
        raise ValueError(f"Unsafe frozen input path: {name}")
    path = root / relative
    current = root
    for component in relative.parts:
        current = current / component
        if current.is_symlink():
            raise ValueError(f"Symlink in frozen input path: {name}")
    return path


def _hashes(audit, summary):
    machine = summary.get("machine_files")
    if (not isinstance(machine, list) or
            not all(isinstance(name, str) for name in machine) or
            len(set(machine)) != len(machine) or
            not {"candidate-id-mapping.jsonl", "review-context-inventory.jsonl"} <= set(machine)
            or set(machine) & set(summary["packet_files"])):
        raise ValueError("Missing or invalid declared machine files")
    required = {
        "task5_frozen_outputs": {
            "candidates.jsonl", "candidate-summary.json", "four-language-comparisons.tsv"},
        "output_sha256": set(summary["packet_files"]) | set(machine),
    }
    expected = {}
    for field in ("task5_frozen_outputs", "output_sha256"):
        records = summary.get(field)
        if not isinstance(records, dict) or set(records) != required[field]:
            raise ValueError(f"Exact complete frozen hashes required: {field}")
        for name, digest in records.items():
            path = _file(audit, name)
            if path in expected and expected[path] != digest:
                raise ValueError(f"Inconsistent frozen hash: {name}")
            expected[path] = digest
    expected[audit / "input-snapshot.json"] = summary.get("snapshot_sha256")
    for path, digest in expected.items():
        if (not isinstance(digest, str) or not re.fullmatch(r"[0-9a-f]{64}", digest)
                or not path.is_file() or sha256_file(path) != digest):
            raise ValueError(f"Frozen input hash mismatch: {path}")
    return expected


def _output_directory(root, requested, root_argument):
    requested = Path(requested)
    if ".." in requested.parts:
        raise ValueError("Output directory must not contain '..'")
    parent = _validated_review_audit_dir(root, requested.parent, root_argument)
    output = parent / requested.name
    if output.is_symlink() or (output.exists() and not output.is_dir()):
        raise ValueError(f"Unsafe existing output directory: {output}")
    return output


def _existing_outputs(output):
    if output.is_symlink() or not output.is_dir():
        raise ValueError(f"Unsafe existing output directory: {output}")
    if {path.name for path in output.iterdir()} != set(OUTPUT_NAMES):
        raise ValueError(f"Existing output directory differs: {output}")
    for name in OUTPUT_NAMES:
        target = output / name
        if (target.is_symlink() or not target.is_file()
                or target.stat().st_nlink != 1):
            raise ValueError(f"Unsafe existing output: {target}")


def _verify_files(expected):
    for path, digest in expected.items():
        if not path.is_file() or sha256_file(path) != digest:
            raise ValueError(f"Input hash changed during reconciliation: {path}")


def _aggregate(candidate_id, comparisons, reviews):
    first = reviews[0]
    decision = {field: value for field, value in first.items()
                if field not in ("resource", "id", "variant")}
    decision["candidate_id"] = candidate_id
    if len(reviews) == 1:
        return decision
    dispositions = {review["disposition"] for review in reviews}
    missing = any(item["status"] == "missing" for packet in comparisons
                  for item in packet["locales"].values())
    conflicts = sorted({item for review in reviews for item in review["source_conflicts"]})
    if missing or conflicts or "unresolved" in dispositions:
        disposition, explanation = "unresolved", "unresolved review, missing locale or conflict"
    elif dispositions == {"retain"}:
        disposition, explanation = "retain", "unanimous bounded retains"
    elif (dispositions == {"proposed correction"} and
          len({review["proposed_text"] for review in reviews}) == 1):
        disposition, explanation = "proposed correction", "identical unanimous provisional proposals"
    else:
        disposition, explanation = "unresolved", "ambiguous mixed dispositions or differing proposals"
    details = [
        {"variant": packet["variant"], "disposition": review["disposition"],
         "reason": review["reason"], "proposed_text": review["proposed_text"],
         "source_conflicts": review["source_conflicts"],
         "texts": {locale: item["text"] for locale, item in packet["locales"].items()}}
        for packet, review in zip(comparisons, reviews)
    ]
    decision.update(
        disposition=disposition,
        reason=f"Mechanical reconciliation: {explanation}. {RULE} Variants: "
               + _json(details).rstrip("\n"),
        proposed_text=first["proposed_text"] if disposition == "proposed correction" else None,
        confidence=min(review["confidence"] for review in reviews),
        source_conflicts=conflicts,
        review_dimensions=sorted({item for review in reviews
                                  for item in review["review_dimensions"]}),
        evidence_refs=sorted({item for review in reviews for item in review["evidence_refs"]}),
    )
    return decision


def _relations(mapping_path, packets):
    links = defaultdict(list)
    counts = Counter()
    for _, number, row in _jsonl_rows([mapping_path], "mapping"):
        key = _review_key(row, "mapping")
        candidate_id = row.get("candidate_id")
        if (set(row) != set(LINK_FIELDS) or not isinstance(candidate_id, str)
                or not candidate_id or key not in packets):
            raise ValueError("Malformed or extra mapping link")
        if any(link[1:4] == key for link in links[candidate_id]):
            raise ValueError(f"Duplicate mapping link: {candidate_id} {key}")
        packet = packets[key]
        match = re.fullmatch(r"candidate-id-mapping.jsonl#L(\d+)-L(\d+)",
                            packet.get("candidate_id_mapping_ref", ""))
        if not match or not int(match[1]) <= number <= int(match[2]):
            raise ValueError("Mapping link differs from packet line range")
        if (row["matched_english_variant"] not in packet["matched_english_variants"]
                or row["candidate_variant"] != row["matched_english_variant"]
                or row["evidence_level"] != LEVEL
                or isinstance(row["context_inventory_line"], bool)
                or not isinstance(row["context_inventory_line"], int)
                or row["context_inventory_line"] != number):
            raise ValueError("Mapping relation variant/evidence differs from packet")
        links[candidate_id].append(tuple(row[field] for field in LINK_FIELDS))
        counts[key] += 1
    for key, packet in packets.items():
        if counts[key] != packet["candidate_counts"]["total"]:
            raise ValueError(f"Missing or extra mapping links for packet key {key}")
    return links, sum(counts.values())


def _verify_comparisons(path, links, packets, task5):
    seen = set()
    with path.open(encoding="utf-8", newline="") as stream:
        for row in csv.DictReader(stream, delimiter="\t"):
            key = _review_key(row, "comparison")
            identity = (row.get("candidate_id"), key)
            if identity in seen:
                raise ValueError("Duplicate comparison link")
            seen.add(identity)
            matches = [link for link in links.get(identity[0], ()) if link[1:4] == key]
            if len(matches) != 1 or key not in packets:
                raise ValueError("Missing or extra candidate/comparison mapping link")
            link = dict(zip(LINK_FIELDS, matches[0]))
            if any(row.get(field) != link[field]
                   for field in ("matched_english_variant", "evidence_level")):
                raise ValueError("Comparison/mapping relation mismatch")
            locales, fingerprints = _comparison_locales(row, key[0], task5)
            packet = packets[key]
            if (packet["locales"] != locales or
                    packet["input_fingerprints"] != fingerprints or
                    json.loads(row["canonical_references"]) != packet.get(
                        "canonical_references", [])):
                raise ValueError("Comparison/packet key evidence mismatch")
    if len(seen) != sum(map(len, links.values())):
        raise ValueError("Extra or omitted comparison mapping links")


def reconcile(*, repo_root, extraction_dir, summary_path, packet_paths,
              review_paths, candidate_path, mapping_path, output_dir,
              check=False, chunk_size=128):
    """Validate globally, stream candidate copies in chunks, publish only on success."""
    if isinstance(chunk_size, bool) or not isinstance(chunk_size, int) or not 1 <= chunk_size <= 512:
        raise ValueError("chunk_size must be from 1 through 512")
    root_argument = Path(repo_root)
    root = root_argument.resolve()
    audit = _validated_review_audit_dir(root, AUDIT_PATH, root_argument)
    output = _output_directory(root, output_dir, root_argument)
    existed = output.exists()

    def absolute(path):
        path = Path(path)
        if not path.is_absolute():
            return root / path
        lexical_root = Path(os.path.abspath(root_argument))
        return root / path.relative_to(lexical_root) if path.is_relative_to(lexical_root) else path

    summary_path = absolute(summary_path)
    candidate_path, mapping_path = absolute(candidate_path), absolute(mapping_path)
    packet_paths = [absolute(path) for path in packet_paths]
    review_paths = [absolute(path) for path in review_paths]
    if (summary_path != audit / "review-packet-summary.json" or
            candidate_path != audit / "candidates.jsonl" or
            mapping_path != audit / "candidate-id-mapping.jsonl"):
        raise ValueError("Inputs must use exact frozen summary/candidate/mapping paths")
    summary = _load(summary_path)
    names = summary.get("packet_files")
    if (not isinstance(names, list) or not names or
            len(set(names)) != len(names) or
            len(packet_paths) != len(names) or
            set(packet_paths) != {_file(audit, name) for name in names} or
            summary.get("packet_count") != len(names)):
        raise ValueError("Exact complete packet paths from summary are required")
    packet_paths = [_file(audit, name) for name in names]
    if len(set(review_paths)) != len(review_paths) or not review_paths:
        raise ValueError("Missing or duplicate review input paths")
    expected = _hashes(audit, summary)
    mandatory = {
        candidate_path, mapping_path, audit / "candidate-summary.json",
        audit / "four-language-comparisons.tsv",
        audit / "review-context-inventory.jsonl", *packet_paths,
    }
    if not mandatory <= expected.keys():
        raise ValueError("Missing required frozen input hashes")
    snapshot = _load(audit / "input-snapshot.json")
    verify_snapshot(snapshot, root, Path(extraction_dir))
    task5 = _load(audit / "candidate-summary.json")
    if task5.get("snapshot_sha256") != summary["snapshot_sha256"]:
        raise ValueError("Task5 frozen snapshot hash mismatch")
    frozen_inputs = {row["path"]: {"sha256": row["sha256"], "size": row["size"]}
                     for row in snapshot["inputs"]}
    task5_inputs = task5.get("input_fingerprints")
    if not isinstance(task5_inputs, dict):
        raise ValueError("Task5 candidate summary lacks input fingerprints")
    for name, fingerprint in task5_inputs.items():
        if (not isinstance(name, str) or not isinstance(fingerprint, dict)
                or set(fingerprint) != {"sha256", "size"}
                or not isinstance(fingerprint["sha256"], str)
                or not re.fullmatch(r"[0-9a-f]{64}", fingerprint["sha256"])
                or isinstance(fingerprint["size"], bool)
                or not isinstance(fingerprint["size"], int)
                or fingerprint["size"] < 0):
            raise ValueError(f"Malformed Task5 input fingerprint: {name}")
        snapshot_fingerprint = frozen_inputs.get(name)
        if snapshot_fingerprint is not None:
            if snapshot_fingerprint != fingerprint:
                raise ValueError(f"Task5 fingerprint differs from frozen snapshot: {name}")
            continue
        # Task5 fingerprints a few provenance files that the older Task1 snapshot omitted.
        path = _file(root, name)
        if (not path.is_file() or path.stat().st_size != fingerprint["size"]
                or sha256_file(path) != fingerprint["sha256"]):
            raise ValueError(f"Task5 input fingerprint changed: {name}")
        expected[path] = fingerprint["sha256"]
    expected.update({path: sha256_file(path) for path in [summary_path, *review_paths]})
    targets = [output / name for name in OUTPUT_NAMES]
    for target in targets:
        if any(target.resolve() == path.resolve() for path in expected):
            raise ValueError("Output overlaps an input; refusing input overwrite")
        if target.is_symlink() or (target.exists() and (
                not target.is_file() or target.stat().st_nlink != 1)):
            raise ValueError(f"Unsafe existing output: {target}")
    if existed:
        _existing_outputs(output)
    elif check:
        raise ValueError(f"Missing output for --check: {output}")

    validate_key_review_files(packet_paths, review_paths)
    packets = {_review_key(row, "packet"): row
               for _, _, row in _jsonl_rows(packet_paths, "packet")}
    reviews = {_review_key(row, "review"): row
               for _, _, row in _jsonl_rows(review_paths, "review")}
    if len(packets) != summary["unique_keys"]:
        raise ValueError("Packet key count mismatch")
    links, link_count = _relations(mapping_path, packets)
    if link_count != summary["comparison_mapping_rows"]:
        raise ValueError("Missing or extra mapping link count")
    _verify_comparisons(audit / "four-language-comparisons.tsv", links, packets, task5)
    # These sets check GLOBAL coverage independently of bounded validator calls.
    candidate_ids, decision_ids = set(), set()
    dispositions = Counter()
    hashes = {name: hashlib.sha256() for name in OUTPUT_NAMES}
    sizes = Counter()
    with ExitStack() as stack:
        staging = None if check else Path(stack.enter_context(
            tempfile.TemporaryDirectory(prefix=".task6c-", dir=output.parent)))
        sinks = {} if check else {
            name: stack.enter_context((staging / name).open("wb")) for name in OUTPUT_NAMES
        }

        def emit(name, row):
            data = _json(row).encode("ascii")
            hashes[name].update(data)
            sizes[name] += len(data)
            if not check:
                sinks[name].write(data)

        chunk_candidates, chunk_decisions = [], []

        def flush():
            if chunk_candidates:
                validate_adjudications(chunk_candidates, chunk_decisions)
                for decision in chunk_decisions:
                    emit("adjudications.jsonl", decision)
                chunk_candidates.clear()
                chunk_decisions.clear()

        for _, _, candidate in _jsonl_rows([candidate_path], "candidate"):
            candidate_id = candidate.get("candidate_id")
            if not isinstance(candidate_id, str) or not candidate_id:
                raise ValueError("Candidate lacks candidate ID")
            if candidate_id in candidate_ids:
                raise ValueError(f"Duplicate candidate ID: {candidate_id}")
            candidate_ids.add(candidate_id)
            key = _review_key(candidate, "candidate")
            relations = links.get(candidate_id)
            if not relations:
                raise ValueError(f"Candidate missing mapping links: {candidate_id}")
            comparisons, key_reviews = [], []
            for values in sorted(relations, key=lambda link: link[1:4]):
                relation = dict(zip(LINK_FIELDS, values))
                relation_key = _review_key(relation, "mapping")
                if (relation_key[:2] != key[:2] or
                        relation["candidate_variant"] != key[2] or
                        relation["matched_english_variant"] != key[2] or
                        relation["evidence_level"] != candidate.get("evidence_level") or
                        relation["extraction_method"] != candidate.get("extraction_method")):
                    raise ValueError("Mapping relation does not match candidate key/variant")
                packet, review = packets[relation_key], reviews[relation_key]
                comparisons.append(packet)
                key_reviews.append(review)
                emit("candidate-variant-decisions.jsonl", {
                    "candidate_id": candidate_id, "mapping": relation,
                    "comparison": packet, "key_review": review,
                })
            fingerprints = {
                locale: task5["input_fingerprints"][
                    str(_locale_csv_path(key[0], locale))]["sha256"]
                for locale in LOCALES
            }
            enriched = {**candidate, "comparisons": comparisons,
                        "input_fingerprints": fingerprints}
            decision = _aggregate(candidate_id, comparisons, key_reviews)
            if decision["candidate_id"] in decision_ids:
                raise ValueError("Duplicate decision ID")
            decision_ids.add(decision["candidate_id"])
            dispositions[decision["disposition"]] += 1
            chunk_candidates.append(enriched)
            chunk_decisions.append(decision)
            if len(chunk_candidates) == chunk_size:
                flush()
        flush()
        if (candidate_ids != links.keys() or decision_ids != candidate_ids or
                len(candidate_ids) != summary["candidate_ids"]):
            raise ValueError("Global candidate/decision/mapping ID coverage mismatch")
        result = {
            "candidate_ids": len(candidate_ids), "comparison_mapping_rows": link_count,
            "reviewed_keys": len(reviews), "counts_by_disposition": dict(sorted(dispositions.items())),
            "snapshot_sha256": summary["snapshot_sha256"], "aggregation_rule": RULE,
            "review_input_sha256": {str(path): expected[path] for path in sorted(review_paths)},
            "output_sha256": {name: hashes[name].hexdigest() for name in OUTPUT_NAMES[:2]},
        }
        emit("reconciliation-summary.json", result)
        # Recheck all inputs before comparing/publishing; no partial final outputs.
        _verify_files(expected)
        verify_snapshot(snapshot, root, Path(extraction_dir))
        _output_directory(root, output, root_argument)
        if existed:
            _existing_outputs(output)
            for name in OUTPUT_NAMES:
                target = output / name
                if (target.stat().st_size != sizes[name] or
                        sha256_file(target) != hashes[name].hexdigest()):
                    raise ValueError(f"Output differs; refusing replacement: {target}")
        if not check:
            for sink in sinks.values():
                sink.close()
            if not existed:
                if output.exists():
                    raise ValueError(f"Output appeared during reconciliation: {output}")
                # A concurrent complete (nonempty) directory cannot be replaced.
                os.replace(staging, output)
    return result


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--extraction-dir", type=Path, default=DEFAULT_EXTRACTION_DIR)
    parser.add_argument("--summary", dest="summary_path", type=Path,
                        default=AUDIT_PATH / "review-packet-summary.json")
    parser.add_argument("--candidates", dest="candidate_path", type=Path, required=True)
    parser.add_argument("--mapping", dest="mapping_path", type=Path, required=True)
    parser.add_argument("--packets", dest="packet_paths", nargs="+", type=Path, required=True)
    parser.add_argument("--reviews", dest="review_paths", nargs="+", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, default=AUDIT_PATH / "reconciliation")
    parser.add_argument("--chunk-size", type=int, default=128)
    parser.add_argument("--check", action="store_true", help="compare deterministically; no writes")
    args = parser.parse_args(argv)
    try:
        result = reconcile(**vars(args))
    except (ValueError, OSError, KeyError, TypeError) as exc:
        parser.exit(1, f"Reconciliation failed: {exc}\n")
    print(_json(result), end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
