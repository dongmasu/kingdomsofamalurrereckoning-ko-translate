#!/usr/bin/env python3
"""Produce provisional, evidence-bounded Lua localization candidates."""

from collections import Counter, defaultdict
from contextlib import ExitStack
import csv
import hashlib
import json
import math
import os
from pathlib import Path
import re
import sqlite3
import tempfile

from lua_review_inputs import _payload_path
from lua_resource_codec import sha256_file


LOCALES = ("en", "ja", "zh", "ko")
LEVEL = "exact_source_literal_candidate"
OUTPUT_NAMES = ("candidates.jsonl", "four-language-comparisons.tsv",
                "legacy-reconciliation.tsv", "credit-reconciliation.tsv",
                "candidate-summary.json")
TASK4_HASHES = {
    "coverage.tsv": "0f012be99bf1dcef3e3f31b5d2184339bdde8dfc50b51710524ed7426b65d993",
    "decoded-evidence.jsonl": "b661bccb9539404a5db4557297aaa6780d70d69ae4c5abe4446a7ca5d4c97577",
    "coverage-summary.json": "4621062e56417dfa4678c100c27af80728f93b38e1e0d91696a518a965c9ddf6",
}
CREDITS = ("8786", "9064", "9581", "9639", "9893", "9993", "10172", "10426",
           "17594", "18413", "18518", "18616", "18666", "27496", "47123", "64017")
REVIEW_PACKET_SIZE = 50
REVIEW_RESOURCES = ("affix", "base", "default")
REVIEW_DIMENSIONS = frozenset({
    "meaning", "naturalness", "voice_register", "terminology",
    "omissions_additions", "punctuation_layout", "evidence_linkage",
})
REVIEW_DISPOSITIONS = frozenset({"retain", "proposed correction", "unresolved"})
TASK5_OUTPUT_HASHES = {
    "candidates.jsonl": "ab364e5a1563cd3fd53e16660fb10781e02ab3c2e69660b5f7e9aee852d303d3",
    "four-language-comparisons.tsv": "f21780eb3256b6215ca71460638aa60fa011d26f4d823975f93fe84cb9160c94",
    "candidate-summary.json": "1ce016f69c914f975eb4942a72f3d4dc7133a0fc12864faff29a1dff96d11350",
}
EXPECTED_TASK5_CANDIDATES = 106309
EXPECTED_COMPARISON_ROWS = 106611
EXPECTED_REVIEW_KEYS = 2656


def load_locale_rows(path: Path, resource: str) -> dict[tuple[str, str], dict]:
    with Path(path).open(encoding="utf-8-sig", newline="") as stream:
        reader = csv.DictReader(stream, delimiter=";")
        required = {"ID_Linha", "Texto"}
        if resource == "affix":
            required.add("Tipo_Variante")
        if not reader.fieldnames or not required <= set(reader.fieldnames):
            raise ValueError(f"Missing locale columns: {path}")
        rows = {}
        for row in reader:
            key = (row["ID_Linha"], row["Tipo_Variante"] if resource == "affix" else "")
            if key in rows:
                raise ValueError(f"Duplicate locale key {key}: {path}")
            rows[key] = row
    return rows


def english_index(locales):
    index = defaultdict(list)
    for resource, languages in sorted(locales.items()):
        for (key, variant), row in sorted(languages["en"].items()):
            if row["Texto"]:
                index[row["Texto"]].append((resource, key, variant))
    return index


def _id(occurrence, path, offset, resource, key, variant, method):
    identity = [occurrence, path, offset, resource, key, variant, method]
    return hashlib.sha256(json.dumps(identity, ensure_ascii=True,
                                     separators=(",", ":")).encode("ascii")).hexdigest()


def _candidate(occurrence, function, constant, text, resource, key, variant,
               method, references):
    path = function["path"] if function is not None else None
    offset = constant["data_start"] if function is not None else constant["start"]
    return {
        "candidate_id": _id(occurrence["occurrence_key"], path, offset,
                            resource, key, variant, method),
        "evidence_level": LEVEL, "extraction_method": method,
        "disposition": "unresolved",
        "usage_limit": ("Raw bytes are not proven to be a string or displayed."
                        if function is None else
                        "Exact constant does not prove localization linkage or runtime display."),
        "resource": resource, "id": key, "variant": variant, "source_text": text,
        "occurrence": {k: v for k, v in occurrence.items() if k != "function"},
        "prototype_path": path,
        "function_range": [function["start"], function["end"]] if function else None,
        "constant": constant, "references": references, "calls": [],
    }


def _build_for_row(row, index):
    function = row["function"]
    if not any(c["type"] == "string" and c.get("value") in index
               for c in function["constants"]):
        return
    analysis = function["analysis"]
    if "code_hex" in function:
        from analyze_lua_corpus import expand_analysis
        analysis = expand_analysis(function)
    refs = defaultdict(list)
    for ref in analysis["references"]:
        if ref.get("kind") == "constant":
            ref = dict(ref)
            ref["offset"] = function["code_offset"] + ref["pc"] * 4
            refs[ref["index"]].append(ref)
    for constant in function["constants"]:
        text = constant.get("value")
        if constant["type"] != "string" or not isinstance(text, str) or not text:
            continue
        for resource, key, variant in index.get(text, ()):
            candidate = _candidate(row, function, constant, text, resource, key, variant,
                                   "parsed_string_constant", refs[constant["index"]])
            candidate["calls"] = [
                call for call in analysis["calls"]
                if any(arg.get("value", {}).get("kind") == "constant"
                       and arg["value"].get("constant_index") == constant["index"]
                       for arg in (call.get("arguments") or []))
            ]
            yield candidate


def build_candidates(evidence: list[dict], locales: dict) -> list[dict]:
    index = english_index(locales)
    return [candidate for row in evidence for candidate in _build_for_row(row, index)]


def compare_candidates(candidates: list[dict], locales: dict) -> list[dict]:
    result = []
    for candidate in candidates:
        resource, key = candidate["resource"], candidate["id"]
        languages = locales[resource]
        variants = {candidate["variant"]}
        if resource == "affix":
            variants.update(v for language in LOCALES
                            for i, v in languages.get(language, {}) if i == key)
        for variant in sorted(variants):
            comparison = {"candidate_id": candidate["candidate_id"],
                          "evidence_level": candidate["evidence_level"],
                          "resource": resource, "id": key, "variant": variant,
                          "matched_english_variant": candidate["variant"]}
            for language in LOCALES:
                row = languages.get(language, {}).get((key, variant))
                comparison[f"{language}_status"] = "present" if row is not None else "missing"
                comparison[f"{language}_text"] = row["Texto"] if row is not None else None
            result.append(comparison)
    return result


def raw_literal_fallback(occurrence, extraction_dir):
    body = _payload_path(Path(extraction_dir), occurrence["payload_path"]).read_bytes()
    if len(body) != occurrence["payload_bytes"]:
        raise ValueError(f'Payload size mismatch: {occurrence["occurrence_key"]}')
    if hashlib.sha256(body).hexdigest() != occurrence["payload_sha256"]:
        raise ValueError(f'Payload hash mismatch: {occurrence["occurrence_key"]}')
    for match in re.finditer(rb"[\x20-\x7e]+", body):
        yield {"text": match.group().decode("ascii"),
               "start": match.start(), "end": match.end()}


def reference_links(candidate, indexes):
    resource, key, variant = candidate["resource"], candidate["id"], candidate["variant"]
    links = list(indexes["glossary"].get((resource, key, variant), ()))
    links.extend(indexes["exceptions"].get((resource, key), ()))
    if resource == "default":
        if key in indexes["duplicates"]:
            links.append(indexes["duplicates"][key])
        if key in indexes["contexts"]:
            links.append("work/zh_cn/translation-reference/classification/"
                         f"dialogue-context-id-catalog.tsv#id={key}")
    return sorted(set(links))


def validate_candidate_outputs(root, extraction, snapshot, output):
    from analyze_lua_corpus import validate_output_dir
    output = validate_output_dir(root, extraction, snapshot, output)
    snapshot = Path(snapshot).resolve()
    for name in OUTPUT_NAMES:
        path = output / name
        if path == snapshot or path.is_symlink():
            raise ValueError(f"Protected candidate output path: {path}")
        if path.exists() and (not path.is_file() or path.stat().st_nlink != 1):
            raise ValueError(f"Unsafe candidate output: {path}")
    return output


def _fingerprint(path):
    return {"sha256": sha256_file(path), "size": path.stat().st_size}


def _fingerprints(value, label):
    if not isinstance(value, dict) or set(value) != set(LOCALES):
        raise ValueError(f"{label} must contain exactly en, ja, zh, ko fingerprints")
    for locale, digest in value.items():
        if not isinstance(digest, str) or not re.fullmatch(r"[0-9a-f]{64}", digest):
            raise ValueError(f"Invalid {label} fingerprint for {locale}")
    return value


def _nonempty_strings(value, field, *, allow_empty=False):
    if not isinstance(value, list):
        raise ValueError(f"{field} must be a list")
    if not allow_empty and not value:
        raise ValueError(f"{field} must not be empty")
    if any(not isinstance(item, str) or not item.strip() for item in value):
        raise ValueError(f"{field} must contain non-empty strings")
    return value


def _confidence(value):
    if (isinstance(value, bool) or not isinstance(value, (int, float)) or
            not math.isfinite(value) or not 0 <= value <= 1):
        raise ValueError("confidence must be a finite number from 0 through 1")


def _candidate_locale_evidence(candidate):
    key = (candidate.get("resource"), candidate.get("id"), candidate.get("variant"))
    _review_key(candidate, "candidate")
    fingerprints = _fingerprints(candidate.get("input_fingerprints"),
                                 "candidate input_fingerprints")
    comparisons = candidate.get("comparisons")
    if comparisons is None:
        comparisons = [{
            "resource": key[0], "id": key[1], "variant": key[2],
            "locales": candidate.get("locale_evidence"),
            "input_fingerprints": fingerprints,
            "available_evidence_refs": candidate.get("available_evidence_refs"),
        }]
    if not isinstance(comparisons, list) or not comparisons:
        raise ValueError("Candidate lacks same-key four-language comparisons")
    seen_keys = set()
    missing = []
    allowed_refs = set()
    for comparison in comparisons:
        if not isinstance(comparison, dict):
            raise ValueError("Malformed candidate comparison")
        comparison_key = _review_key(comparison, "comparison")
        if comparison_key[:2] != key[:2] or comparison_key in seen_keys:
            raise ValueError("Wrong-key or duplicate candidate comparison")
        seen_keys.add(comparison_key)
        if comparison.get("input_fingerprints") != fingerprints:
            raise ValueError("Candidate comparison fingerprints differ")
        allowed_refs.update(_nonempty_strings(
            comparison.get("available_evidence_refs"),
            "comparison available_evidence_refs"))
        evidence = comparison.get("locales")
        if not isinstance(evidence, dict) or set(evidence) != set(LOCALES):
            raise ValueError(f"Candidate {candidate.get('candidate_id')} lacks four-language evidence")
        for locale in LOCALES:
            item = evidence[locale]
            if not isinstance(item, dict):
                raise ValueError(f"Malformed {locale} locale evidence")
            # Packet locale rows inherit the key; explicit locale keys must agree.
            item_key = tuple(item.get(field, comparison_key[index])
                             for index, field in enumerate(("resource", "id", "variant")))
            if item_key != comparison_key:
                raise ValueError(f"{locale} evidence does not match candidate key")
            if item.get("status") not in ("present", "missing"):
                raise ValueError(f"Invalid {locale} locale status")
            if item.get("input_sha256") != fingerprints[locale]:
                raise ValueError(f"Candidate {locale} fingerprint is inconsistent")
            if item["status"] == "missing":
                if item.get("text") is not None:
                    raise ValueError(f"Missing {locale} locale must have null text")
                missing.append((comparison_key[2], locale))
            elif not isinstance(item.get("text"), str):
                raise ValueError(f"Present {locale} locale must have text")
    if key not in seen_keys:
        raise ValueError("Candidate comparisons omit its matched variant")
    return fingerprints, missing, allowed_refs


def validate_adjudications(candidates: list[dict], decisions: list[dict]) -> None:
    """Fail closed unless each candidate has one current, evidence-backed decision.

    Enrich frozen candidates with input_fingerprints and their complete list of
    comparison packet rows under comparisons. locale_evidence is accepted for
    single-key candidates only; no evidence or decisions are inferred here.
    """
    candidate_by_id = {}
    candidate_missing_locales = {}
    candidate_fingerprints = {}
    candidate_evidence_refs = {}
    for candidate in candidates:
        if not isinstance(candidate, dict):
            raise ValueError("Candidate must be an object")
        candidate_id = candidate.get("candidate_id")
        if not isinstance(candidate_id, str) or not candidate_id:
            raise ValueError("Candidate lacks candidate_id")
        if candidate_id in candidate_by_id:
            raise ValueError(f"duplicate candidate ID: {candidate_id}")
        candidate_by_id[candidate_id] = candidate

    decision_by_id = {}
    for decision in decisions:
        if not isinstance(decision, dict):
            raise ValueError("Decision must be an object")
        candidate_id = decision.get("candidate_id")
        if not isinstance(candidate_id, str) or not candidate_id:
            raise ValueError("Decision lacks candidate_id")
        if candidate_id in decision_by_id:
            raise ValueError(f"duplicate decision ID: {candidate_id}")
        decision_by_id[candidate_id] = decision

    missing_ids = sorted(candidate_by_id.keys() - decision_by_id.keys())
    if missing_ids:
        raise ValueError(f"missing decisions for candidate IDs: {missing_ids[:5]}")
    extra_ids = sorted(decision_by_id.keys() - candidate_by_id.keys())
    if extra_ids:
        raise ValueError(f"extra decisions for candidate IDs: {extra_ids[:5]}")

    for candidate_id, candidate in candidate_by_id.items():
        fingerprints, missing, allowed_refs = _candidate_locale_evidence(candidate)
        candidate_fingerprints[candidate_id] = fingerprints
        candidate_missing_locales[candidate_id] = missing
        candidate_evidence_refs[candidate_id] = allowed_refs

    required = {
        "candidate_id", "disposition", "reason", "confidence", "proposed_text",
        "review_dimensions", "source_conflicts", "evidence_refs", "input_fingerprints",
    }
    for candidate_id, decision in decision_by_id.items():
        if not required <= decision.keys():
            raise ValueError(f"Decision {candidate_id} lacks fields: "
                             f"{sorted(required - decision.keys())}")
        if decision.keys() != required:
            raise ValueError(f"Decision {candidate_id} has unexpected fields")
        disposition = decision["disposition"]
        if not isinstance(disposition, str) or disposition not in REVIEW_DISPOSITIONS:
            raise ValueError(f"Invalid disposition for {candidate_id}")
        if not isinstance(decision["reason"], str) or not decision["reason"].strip():
            raise ValueError(f"Decision {candidate_id} lacks rationale")
        _confidence(decision["confidence"])
        dimensions = _nonempty_strings(decision["review_dimensions"], "review_dimensions")
        if any(dimension not in REVIEW_DIMENSIONS for dimension in dimensions):
            raise ValueError(f"Unknown review dimension for {candidate_id}")
        refs = _nonempty_strings(decision["evidence_refs"], "evidence_refs")
        if any(ref not in candidate_evidence_refs[candidate_id] for ref in refs):
            raise ValueError(
                f"Decision {candidate_id} cites evidence unavailable or not linked to candidate")
        conflicts = _nonempty_strings(decision["source_conflicts"], "source_conflicts",
                                      allow_empty=True)
        actual_fingerprints = _fingerprints(decision["input_fingerprints"],
                                            "decision input_fingerprints")
        if actual_fingerprints != candidate_fingerprints[candidate_id]:
            raise ValueError(f"Stale input fingerprint for {candidate_id}")
        if candidate_missing_locales[candidate_id] and disposition != "unresolved":
            raise ValueError(f"Decision {candidate_id} has missing locale evidence")
        if conflicts and disposition != "unresolved":
            raise ValueError(f"Decision {candidate_id} has unresolved source conflicts")
        if disposition == "proposed correction":
            if not isinstance(decision["proposed_text"], str):
                raise ValueError(f"Proposal {candidate_id} lacks proposed text")
            if candidate_missing_locales[candidate_id]:
                raise ValueError(f"Proposal {candidate_id} lacks same-key four-language evidence")
        elif decision["proposed_text"] is not None:
            raise ValueError(f"Non-proposal {candidate_id} must have null proposed_text")


def _jsonl_rows(paths, label):
    for path in paths:
        path = Path(path)
        with path.open(encoding="utf-8") as stream:
            for number, line in enumerate(stream, 1):
                if not line.strip():
                    continue
                try:
                    row = json.loads(line)
                except json.JSONDecodeError as exc:
                    raise ValueError(f"Invalid {label} JSON at {path}:{number}: {exc}") from exc
                if not isinstance(row, dict):
                    raise ValueError(f"{label} row must be an object at {path}:{number}")
                yield path, number, row


def _review_key(row, label):
    resource, key, variant = row.get("resource"), row.get("id"), row.get("variant")
    if resource not in REVIEW_RESOURCES:
        raise ValueError(f"Invalid {label} resource")
    if not isinstance(key, str) or not key.isdecimal():
        raise ValueError(f"Invalid {label} numeric ID")
    if not isinstance(variant, str) or (resource != "affix" and variant):
        raise ValueError(f"Invalid {label} variant")
    if resource == "affix" and variant and not re.fullmatch(r"[0-9A-Fa-f]{2}", variant):
        raise ValueError(f"Invalid {label} affix variant")
    return resource, key, variant


def validate_key_review_files(packet_paths, review_paths) -> dict:
    """Validate worker key reviews against packet keys and locale fingerprints."""
    packets = {}
    for path, number, packet in _jsonl_rows(packet_paths, "packet"):
        key = _review_key(packet, "packet")
        if key in packets:
            raise ValueError(f"duplicate packet key: {key}")
        fingerprints = _fingerprints(packet.get("input_fingerprints"),
                                     "packet input_fingerprints")
        locales = packet.get("locales")
        if not isinstance(locales, dict) or set(locales) != set(LOCALES):
            raise ValueError(f"Packet {key} lacks four locale rows")
        missing = []
        for locale in LOCALES:
            item = locales[locale]
            if not isinstance(item, dict) or item.get("status") not in ("present", "missing"):
                raise ValueError(f"Malformed packet locale {locale} for {key}")
            if item.get("input_sha256") != fingerprints[locale]:
                raise ValueError(f"Packet {locale} fingerprint mismatch for {key}")
            if item["status"] == "missing":
                if item.get("text") is not None:
                    raise ValueError(f"Missing packet locale {locale} must have null text")
                missing.append(locale)
            elif not isinstance(item.get("text"), str):
                raise ValueError(f"Present packet locale {locale} must have text")
        available_refs = _nonempty_strings(
            packet.get("available_evidence_refs"), "packet evidence_refs")
        packets[key] = {
            "fingerprints": fingerprints, "missing": missing,
            "available_evidence_refs": set(available_refs),
        }

    reviews = {}
    required = {
        "resource", "id", "variant", "disposition", "reason", "review_dimensions",
        "source_conflicts", "confidence", "proposed_text", "input_fingerprints",
        "evidence_refs",
    }
    for path, number, review in _jsonl_rows(review_paths, "review"):
        key = _review_key(review, "review")
        if key in reviews:
            raise ValueError(f"duplicate key review: {key}")
        if review.keys() != required:
            raise ValueError(f"Key review {key} fields differ from schema")
        if key not in packets:
            raise ValueError(f"extra key review: {key}")
        packet = packets[key]
        if (not isinstance(review["disposition"], str) or
                review["disposition"] not in REVIEW_DISPOSITIONS):
            raise ValueError(f"Invalid disposition for {key}")
        if not isinstance(review["reason"], str) or not review["reason"].strip():
            raise ValueError(f"Key review {key} lacks rationale")
        _confidence(review["confidence"])
        dimensions = _nonempty_strings(review["review_dimensions"], "review_dimensions")
        if any(dimension not in REVIEW_DIMENSIONS for dimension in dimensions):
            raise ValueError(f"Unknown review dimension for {key}")
        conflicts = _nonempty_strings(review["source_conflicts"], "source_conflicts",
                                      allow_empty=True)
        refs = _nonempty_strings(review["evidence_refs"], "evidence_refs")
        available = packet["available_evidence_refs"]
        if any(ref not in available for ref in refs):
            raise ValueError(f"Key review {key} cites an unavailable packet evidence ref")
        fingerprints = _fingerprints(review["input_fingerprints"],
                                     "review input_fingerprints")
        if fingerprints != packet["fingerprints"]:
            raise ValueError(f"Stale input fingerprint for key {key}")
        disposition = review["disposition"]
        if packet["missing"] and disposition != "unresolved":
            raise ValueError(f"Key review {key} has missing locale evidence")
        if conflicts and disposition != "unresolved":
            raise ValueError(f"Key review {key} has unresolved source conflicts")
        if disposition == "proposed correction":
            if not isinstance(review["proposed_text"], str):
                raise ValueError(f"Proposal for {key} lacks proposed_text")
        elif review["proposed_text"] is not None:
            raise ValueError(f"Non-proposal for {key} must have null proposed_text")
        reviews[key] = disposition

    missing_keys = sorted(packets.keys() - reviews.keys())
    if missing_keys:
        raise ValueError(f"missing key reviews: {missing_keys[:5]}")
    counts = Counter(reviews.values())
    return {
        "packet_keys": len(packets), "reviewed_keys": len(reviews),
        "counts_by_disposition": dict(sorted(counts.items())),
    }


def _locale_csv_path(resource, locale):
    directory, prefix = {
        "en": ("src/csv/en_us", "en_us"),
        "ja": ("src/csv/ja_jp", "ja_jp"),
        "zh": ("src/csv/zh_cn", "zh_cn"),
        "ko": ("work/zh_cn", "zh_cn"),
    }[locale]
    return Path(directory) / f"locatexts_{prefix}.koalocatext_{resource}.csv"


def _variant_order(variant):
    if not variant:
        return -1
    if not re.fullmatch(r"[0-9A-Fa-f]{2}", variant):
        raise ValueError(f"Invalid numeric variant: {variant}")
    return int(variant, 16)


def _review_order(key):
    resource, row_id, variant = key
    return (REVIEW_RESOURCES.index(resource), int(row_id), row_id,
            _variant_order(variant), variant)


def _verify_task5_inputs(root, audit_dir, summary):
    expected = summary.get("input_fingerprints")
    if not isinstance(expected, dict):
        raise ValueError("Task5 candidate summary lacks input fingerprints")
    for relative, fingerprint in expected.items():
        path = root / relative
        if not path.is_file():
            raise ValueError(f"Missing frozen Task5 input: {relative}")
        if _fingerprint(path) != fingerprint:
            raise ValueError(f"Frozen Task5 input changed: {relative}")
    snapshot = audit_dir / "input-snapshot.json"
    if summary.get("snapshot_sha256") != sha256_file(snapshot):
        raise ValueError("Task5 input snapshot hash mismatch")


def _validated_review_audit_dir(root, audit_dir, root_argument):
    """Check lexical containment and reject every symlinked path component."""
    root = Path(root).resolve()
    requested = Path(audit_dir)
    if ".." in requested.parts:
        raise ValueError("Review packet output path must not contain '..'")
    if not requested.is_absolute():
        requested = root / requested
    else:
        try:
            relative = requested.relative_to(root)
        except ValueError:
            lexical_root = Path(os.path.abspath(root_argument))
            try:
                relative = requested.relative_to(lexical_root)
            except ValueError as exc:
                raise ValueError(
                    "Review packet outputs must remain in the Task5 audit directory") from exc
        requested = root / relative
    allowed = root / "work/zh_cn/audit/lua-corpus-review-20261115"
    if not requested.is_relative_to(allowed):
        raise ValueError("Review packet outputs must remain in the Task5 audit directory")
    current = root
    for component in requested.relative_to(root).parts:
        current = current / component
        if current.is_symlink():
            raise ValueError(f"Symlink traversal in review packet output path: {current}")
    if not current.is_dir():
        raise ValueError(f"Missing review packet audit directory: {current}")
    return current


def _comparison_locales(row, resource, summary):
    locales = {}
    fingerprints = {}
    input_fingerprints = summary["input_fingerprints"]
    for locale in LOCALES:
        status = row.get(f"{locale}_status")
        text = row.get(f"{locale}_text")
        digest = row.get(f"{locale}_input_sha256")
        expected_path = str(_locale_csv_path(resource, locale))
        expected = input_fingerprints.get(expected_path, {}).get("sha256")
        if status not in {"present", "missing"}:
            raise ValueError(f"Invalid {locale} status in comparison row")
        if not isinstance(digest, str) or digest != expected:
            raise ValueError(f"Comparison {locale} fingerprint differs from Task5 inputs")
        if status == "missing":
            if text:
                raise ValueError(f"Missing {locale} comparison row has text")
            text = None
        elif not isinstance(text, str):
            raise ValueError(f"Present {locale} comparison row lacks text")
        locales[locale] = {"status": status, "text": text, "input_sha256": digest}
        fingerprints[locale] = digest
    return locales, fingerprints


def _provenance_record(candidate, key, matched_english_variant):
    return {
        "candidate_id": candidate["candidate_id"],
        "resource": key[0], "id": key[1], "comparison_variant": key[2],
        "candidate_variant": candidate.get("variant", ""),
        "matched_english_variant": matched_english_variant,
        "evidence_level": candidate["evidence_level"],
        "extraction_method": candidate["extraction_method"],
        "usage_limit": candidate.get("usage_limit", ""),
        "occurrence": candidate.get("occurrence", {}),
        "prototype_path": candidate.get("prototype_path"),
        "function_range": candidate.get("function_range"),
        "constant": candidate.get("constant", {}),
        "reference_sites": candidate.get("references", []),
        "call_sites": candidate.get("calls", []),
        "localization_role": "unknown",
    }


def _key_uncertainty(method_counts):
    parsed = method_counts.get("parsed_string_constant", 0)
    raw = method_counts.get("unsupported_maximal_printable_ascii_run", 0)
    return {
        "evidence_level": "exact_source_literal_candidate",
        "direct_key_mappings": 0,
        "supported_static_call_site_mappings": 0,
        "localization_role": "unknown",
        "parsed_constant_candidates": parsed,
        "parsed_note": ("Decoded constant references and call operands are preserved in the "
                        "context inventory; their localization/display role remains unknown."),
        "raw_byte_candidates": raw,
        "raw_note": ("Raw maximal printable-ASCII matches are not established to be strings, "
                     "bytecode constants, or displayed text."),
        "warning": ("Raw bytes are not proven strings or localization links. No candidate "
                    "establishes a runtime localization link."),
    }


def prepare_review_packets(repo_root, audit_dir, packet_size=REVIEW_PACKET_SIZE) -> dict:
    """Prepare deterministic <=50-key packets and linked machine provenance."""
    root_argument = Path(repo_root)
    root = Path(repo_root).resolve()
    audit_dir = _validated_review_audit_dir(root, audit_dir, root_argument)
    if (isinstance(packet_size, bool) or not isinstance(packet_size, int) or
            not 1 <= packet_size <= REVIEW_PACKET_SIZE):
        raise ValueError(f"packet_size must be from 1 through {REVIEW_PACKET_SIZE}")

    candidate_path = audit_dir / "candidates.jsonl"
    comparison_path = audit_dir / "four-language-comparisons.tsv"
    summary_path = audit_dir / "candidate-summary.json"
    frozen_paths = [candidate_path, comparison_path, summary_path]
    for path in frozen_paths:
        if not path.is_file():
            raise ValueError(f"Missing frozen Task5 output: {path.name}")
        expected = TASK5_OUTPUT_HASHES[path.name]
        if sha256_file(path) != expected:
            raise ValueError(f"Frozen Task5 output hash mismatch: {path.name}")
    summary = json.loads(summary_path.read_text(encoding="utf-8"))
    _verify_task5_inputs(root, audit_dir, summary)

    generated_names = {
        "candidate-id-mapping.jsonl", "review-context-inventory.jsonl",
    }
    with tempfile.TemporaryDirectory(prefix=".task-6a-packets-", dir=audit_dir) as temporary, \
            ExitStack() as resources:
        staging = Path(temporary)
        database = sqlite3.connect(staging / "spool.sqlite")
        resources.callback(database.close)
        database.executescript("""
            CREATE TABLE candidates (
                candidate_id TEXT PRIMARY KEY,
                resource TEXT NOT NULL,
                localization_id TEXT NOT NULL,
                candidate_variant TEXT NOT NULL,
                extraction_method TEXT NOT NULL,
                evidence_level TEXT NOT NULL,
                record_json TEXT NOT NULL
            );
            CREATE TABLE links (
                resource TEXT NOT NULL,
                localization_id TEXT NOT NULL,
                variant TEXT NOT NULL,
                candidate_id TEXT NOT NULL,
                matched_english_variant TEXT NOT NULL,
                evidence_level TEXT NOT NULL,
                resource_order INTEGER NOT NULL,
                id_order INTEGER NOT NULL,
                variant_order INTEGER NOT NULL,
                UNIQUE(candidate_id, resource, localization_id, variant)
            );
        """)
        key_data = {}
        comparison_count = 0
        with comparison_path.open(encoding="utf-8", newline="") as stream:
            reader = csv.DictReader(stream, delimiter="\t")
            required = {
                "candidate_id", "evidence_level", "resource", "id", "variant",
                "matched_english_variant", "canonical_references",
            }
            for locale in LOCALES:
                required.update({f"{locale}_status", f"{locale}_text",
                                 f"{locale}_input_sha256"})
            if not reader.fieldnames or not required <= set(reader.fieldnames):
                raise ValueError("Task5 comparison TSV schema is incomplete")
            for row in reader:
                comparison_count += 1
                key = _review_key(row, "comparison")
                candidate_id = row["candidate_id"]
                matched_variant = row["matched_english_variant"]
                if not candidate_id:
                    raise ValueError("Comparison row lacks candidate_id")
                if key[0] == "affix":
                    _variant_order(matched_variant)
                elif matched_variant:
                    raise ValueError(f"Non-affix comparison has matched variant: {key}")
                locales, fingerprints = _comparison_locales(row, key[0], summary)
                try:
                    references = json.loads(row["canonical_references"])
                except json.JSONDecodeError as exc:
                    raise ValueError(f"Invalid canonical references for {key}") from exc
                if not isinstance(references, list) or any(
                        not isinstance(ref, str) or not ref for ref in references):
                    raise ValueError(f"Malformed canonical references for {key}")
                entry = key_data.get(key)
                if entry is None:
                    entry = {
                        "resource": key[0], "id": key[1], "variant": key[2],
                        "locales": locales, "input_fingerprints": fingerprints,
                        "canonical_references": references,
                        "matched_english_variants": set(),
                    }
                    key_data[key] = entry
                elif (entry["locales"] != locales or
                      entry["input_fingerprints"] != fingerprints or
                      entry["canonical_references"] != references):
                    raise ValueError(f"Inconsistent comparison evidence for {key}")
                entry["matched_english_variants"].add(matched_variant)
                try:
                    database.execute(
                        "INSERT INTO links VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
                        (key[0], key[1], key[2], candidate_id, matched_variant,
                         row["evidence_level"], REVIEW_RESOURCES.index(key[0]),
                         int(key[1]), _variant_order(key[2])),
                    )
                except sqlite3.IntegrityError as exc:
                    raise ValueError(f"Duplicate candidate comparison link: {candidate_id} {key}") from exc

        candidate_count = 0
        with candidate_path.open(encoding="utf-8") as stream:
            for number, line in enumerate(stream, 1):
                if not line.strip():
                    continue
                try:
                    candidate = json.loads(line)
                except json.JSONDecodeError as exc:
                    raise ValueError(f"Invalid candidate JSON at line {number}") from exc
                if not isinstance(candidate, dict):
                    raise ValueError(f"Candidate line {number} is not an object")
                candidate_id = candidate.get("candidate_id")
                resource, localization_id = candidate.get("resource"), candidate.get("id")
                variant = candidate.get("variant", "")
                if (not isinstance(candidate_id, str) or not candidate_id or
                        resource not in REVIEW_RESOURCES or
                        not isinstance(localization_id, str) or not localization_id.isdecimal() or
                        not isinstance(variant, str)):
                    raise ValueError(f"Malformed candidate identity at line {number}")
                if candidate.get("extraction_method") not in {
                        "parsed_string_constant", "unsupported_maximal_printable_ascii_run"}:
                    raise ValueError(f"Unknown candidate extraction method at line {number}")
                if candidate.get("evidence_level") != LEVEL:
                    raise ValueError(f"Unexpected candidate evidence level at line {number}")
                try:
                    database.execute(
                        "INSERT INTO candidates VALUES (?, ?, ?, ?, ?, ?, ?)",
                        (candidate_id, resource, localization_id, variant,
                         candidate["extraction_method"], candidate["evidence_level"],
                         _json(candidate)),
                    )
                except sqlite3.IntegrityError as exc:
                    raise ValueError(f"Duplicate candidate ID: {candidate_id}") from exc
                candidate_count += 1
        database.commit()
        if candidate_count != EXPECTED_TASK5_CANDIDATES:
            raise ValueError(f"Expected {EXPECTED_TASK5_CANDIDATES} candidates, got {candidate_count}")
        if comparison_count != EXPECTED_COMPARISON_ROWS:
            raise ValueError(f"Expected {EXPECTED_COMPARISON_ROWS} comparisons, got {comparison_count}")
        if len(key_data) != EXPECTED_REVIEW_KEYS:
            raise ValueError(f"Expected {EXPECTED_REVIEW_KEYS} review keys, got {len(key_data)}")
        if database.execute("""
                SELECT COUNT(*) FROM links l
                LEFT JOIN candidates c ON c.candidate_id = l.candidate_id
                WHERE c.candidate_id IS NULL OR
                      c.resource != l.resource OR c.localization_id != l.localization_id OR
                      c.candidate_variant != l.matched_english_variant OR
                      c.evidence_level != l.evidence_level
                """).fetchone()[0]:
            raise ValueError("Candidate/comparison mapping is incomplete or inconsistent")
        if database.execute("""
                SELECT COUNT(*) FROM candidates c
                LEFT JOIN links l ON l.candidate_id = c.candidate_id
                WHERE l.candidate_id IS NULL
                """).fetchone()[0]:
            raise ValueError("Candidate has no comparison mapping")

        method_counts = defaultdict(Counter)
        evidence_counts = defaultdict(Counter)
        for resource, localization_id, variant, method, level, count in database.execute("""
                SELECT l.resource, l.localization_id, l.variant,
                       c.extraction_method, c.evidence_level, COUNT(*)
                FROM links l JOIN candidates c ON c.candidate_id = l.candidate_id
                GROUP BY l.resource, l.localization_id, l.variant,
                         c.extraction_method, c.evidence_level
                """):
            key = (resource, localization_id, variant)
            method_counts[key][method] = count
            evidence_counts[key][level] += count

        context_path = staging / "review-context-inventory.jsonl"
        mapping_path = staging / "candidate-id-mapping.jsonl"
        context_ranges = {}
        mapping_ranges = {}
        with context_path.open("w", encoding="utf-8", newline="\n") as context_sink, \
             mapping_path.open("w", encoding="ascii", newline="\n") as mapping_sink:
            context_line = mapping_line = 0
            cursor = database.execute("""
                SELECT l.resource, l.localization_id, l.variant, l.candidate_id,
                       l.matched_english_variant, c.candidate_variant, c.extraction_method,
                       c.evidence_level, c.record_json
                FROM links l JOIN candidates c ON c.candidate_id = l.candidate_id
                ORDER BY l.resource_order, l.id_order, l.localization_id,
                         l.variant_order, l.variant, l.candidate_id
            """)
            for (resource, localization_id, variant, candidate_id, matched_variant,
                 candidate_variant, method, level, record_json) in cursor:
                key = (resource, localization_id, variant)
                candidate = json.loads(record_json)
                context_line += 1
                provenance = _provenance_record(candidate, key, matched_variant)
                context_sink.write(_review_json(provenance) + "\n")
                context_ranges.setdefault(key, [context_line, context_line])[1] = context_line
                mapping_line += 1
                mapping = {
                    "resource": resource, "id": localization_id, "variant": variant,
                    "candidate_id": candidate_id, "candidate_variant": candidate_variant,
                    "matched_english_variant": matched_variant,
                    "extraction_method": method, "evidence_level": level,
                    "context_inventory_line": context_line,
                }
                mapping_sink.write(_json(mapping) + "\n")
                mapping_ranges.setdefault(key, [mapping_line, mapping_line])[1] = mapping_line
        database.close()

        sorted_keys = sorted(key_data, key=_review_order)
        packet_count = (len(sorted_keys) + packet_size - 1) // packet_size
        packet_names = []
        for packet_index in range(packet_count):
            filename = f"review-packet-{packet_index + 1:04d}.jsonl"
            packet_names.append(filename)
            packet_path = staging / filename
            start = packet_index * packet_size
            with packet_path.open("w", encoding="utf-8", newline="\n") as sink:
                for line_number, key in enumerate(
                        sorted_keys[start:start + packet_size], 1):
                    entry = key_data[key]
                    method_count = method_counts[key]
                    context_start, context_end = context_ranges[key]
                    mapping_start, mapping_end = mapping_ranges[key]
                    context_ref = (
                        f"review-context-inventory.jsonl#L{context_start}-L{context_end}")
                    mapping_ref = f"candidate-id-mapping.jsonl#L{mapping_start}-L{mapping_end}"
                    packet_ref = f"{filename}#L{line_number}"
                    packet_row = {
                        "resource": key[0], "id": key[1], "variant": key[2],
                        "matched_english_variants": sorted(
                            entry["matched_english_variants"], key=_variant_order),
                        "locales": entry["locales"],
                        "input_fingerprints": entry["input_fingerprints"],
                        "canonical_references": entry["canonical_references"],
                        "candidate_counts": {
                            "parsed": method_count.get("parsed_string_constant", 0),
                            "raw": method_count.get(
                                "unsupported_maximal_printable_ascii_run", 0),
                            "total": sum(method_count.values()),
                        },
                        "evidence_level_counts": dict(sorted(evidence_counts[key].items())),
                        "linkage_uncertainty": _key_uncertainty(method_count),
                        "context_inventory_ref": context_ref,
                        "candidate_id_mapping_ref": mapping_ref,
                        "packet_ref": packet_ref,
                    }
                    packet_row["available_evidence_refs"] = sorted(set([
                        packet_ref, context_ref, *entry["canonical_references"],
                    ]))
                    sink.write(_review_json(packet_row) + "\n")

        packet_summary = {
            "schema_version": 1,
            "packet_count": packet_count,
            "packet_size_limit": REVIEW_PACKET_SIZE,
            "packet_size_used": packet_size,
            "unique_keys": len(sorted_keys),
            "candidate_ids": candidate_count,
            "comparison_mapping_rows": comparison_count,
            "context_inventory_rows": sum(end - start + 1
                                           for start, end in context_ranges.values()),
            "counts_by_resource": {
                resource: sum(key[0] == resource for key in sorted_keys)
                for resource in REVIEW_RESOURCES
            },
            "task5_frozen_outputs": {
                name: TASK5_OUTPUT_HASHES[name] for name in sorted(TASK5_OUTPUT_HASHES)
            },
            "snapshot_sha256": summary["snapshot_sha256"],
            "ordering": "resource affix/base/default, numeric ID, numeric hexadecimal variant",
            "key_review_schema": [
                "resource", "id", "variant", "disposition", "reason",
                "review_dimensions", "source_conflicts", "confidence", "proposed_text",
                "input_fingerprints", "evidence_refs",
            ],
            "review_dimensions": sorted(REVIEW_DIMENSIONS),
            "dispositions": sorted(REVIEW_DISPOSITIONS),
            "packet_files": packet_names,
            "machine_files": [
                "candidate-id-mapping.jsonl", "review-context-inventory.jsonl",
            ],
        }
        generated_names.update(packet_names)
        packet_summary["output_sha256"] = {
            name: sha256_file(staging / name) for name in sorted(generated_names)
        }
        (staging / "review-packet-summary.json").write_text(
            _json(packet_summary) + "\n", encoding="ascii")
        generated_names.add("review-packet-summary.json")
        existing_packets = {path.name for path in audit_dir.glob("review-packet-*.jsonl")}
        if existing_packets - set(packet_names):
            raise ValueError("Existing Task6A packet set differs; refusing stale packets")
        _verify_task5_inputs(root, audit_dir, summary)
        for path in frozen_paths:
            if sha256_file(path) != TASK5_OUTPUT_HASHES[path.name]:
                raise ValueError(f"Frozen Task5 output changed: {path.name}")
        # Validate the entire output set before publishing any new file.
        for name in sorted(generated_names):
            source = staging / name
            target = audit_dir / name
            if target.exists() or target.is_symlink():
                if (target.is_symlink() or not target.is_file() or
                        target.stat().st_nlink != 1):
                    raise ValueError(f"Unsafe existing Task6A output: {target}")
                if sha256_file(target) != sha256_file(source):
                    raise ValueError(f"Refusing to replace existing Task6A output: {target}")
        for name in sorted(generated_names):
            source, target = staging / name, audit_dir / name
            if not target.exists():
                os.replace(source, target)

    for path in frozen_paths:
        if sha256_file(path) != TASK5_OUTPUT_HASHES[path.name]:
            raise ValueError(f"Frozen Task5 output changed during packet preparation: {path.name}")
    _verify_task5_inputs(root, audit_dir, summary)
    return packet_summary


def exception_keys(line):
    keys = set(re.findall(r"\b(default|base|affix):(\d+)", line))
    for match in re.finditer(r"`(default|base|affix):\d+`((?:,\s*`\d+`)+)", line):
        keys.update((match.group(1), value) for value in re.findall(r"`(\d+)`", match.group(2)))
    return keys


def _reference_indexes(root):
    base = Path("work/zh_cn/translation-reference")
    glossary_path = base / "glossary/proper-name-occurrences.tsv"
    exception_path = base / "exceptions/translation-exceptions.md"
    duplicate_path = base / "duplicates/exact-english-default-groups.jsonl"
    context_path = base / "classification/dialogue-context-id-catalog.tsv"
    indexes = {"glossary": defaultdict(list), "exceptions": defaultdict(list),
               "duplicates": {}, "contexts": set()}
    with (root / glossary_path).open(encoding="utf-8-sig", newline="") as stream:
        for row in csv.DictReader(stream, delimiter="\t"):
            key = (row["resource"], row["ID_Linha"],
                   row["Tipo_Variante"] if row["resource"] == "affix" else "")
            indexes["glossary"][key].append(f'{glossary_path}#entity={row["entity_key"]}')
    with (root / exception_path).open(encoding="utf-8") as stream:
        for number, line in enumerate(stream, 1):
            for resource, key in exception_keys(line):
                indexes["exceptions"][(resource, key)].append(f"{exception_path}#L{number}")
    with (root / duplicate_path).open(encoding="utf-8") as stream:
        for number, line in enumerate(stream, 1):
            group = json.loads(line)
            for item in group.get("occurrences", ()):
                indexes["duplicates"][item["id"]] = f"{duplicate_path}#L{number}"
    with (root / context_path).open(encoding="utf-8-sig", newline="") as stream:
        for row in csv.DictReader(stream, delimiter="\t"):
            if row["resource"] == "default":
                indexes["contexts"].add(row["id"])
    return indexes, [glossary_path, exception_path, duplicate_path, context_path]


def _load_locales(root):
    locales, paths = {}, {}
    for resource in ("affix", "base", "default"):
        locales[resource] = {}
        for language, directory, prefix in (
                ("en", "src/csv/en_us", "en_us"), ("ja", "src/csv/ja_jp", "ja_jp"),
                ("zh", "src/csv/zh_cn", "zh_cn"), ("ko", "work/zh_cn", "zh_cn")):
            relative = Path(directory) / f"locatexts_{prefix}.koalocatext_{resource}.csv"
            locales[resource][language] = load_locale_rows(root / relative, resource)
            paths[(resource, language)] = relative
    return locales, paths


def _legacy_rows(root):
    path = Path("work/zh_cn/translation-reference/classification/"
                "lua-script-localization-literal-index.tsv")
    with (root / path).open(encoding="utf-8-sig", newline="") as stream:
        return path, list(csv.DictReader(stream, delimiter="\t"))


def _credit_prior(root):
    path = Path("work/zh_cn/audit/lua-script-extraction-and-reencoding-20261115.md")
    rows = {}
    with (root / path).open(encoding="utf-8") as stream:
        for line in stream:
            match = re.match(r"^\| `(\d+)` \| `([^`]*)` \| `([^`]*)` \| `([^`]*)` \|", line)
            if match and match.group(1) in CREDITS:
                rows[match.group(1)] = match.groups()[1:]
    if set(rows) != set(CREDITS):
        raise ValueError("Cannot identify all 16 historical credit decisions")
    return path, rows


def _json(value):
    return json.dumps(value, ensure_ascii=True, sort_keys=True, separators=(",", ":"))


def _review_json(value):
    return json.dumps(value, ensure_ascii=False, sort_keys=True, separators=(",", ":"))


def _write_tsv(sink, fields, rows):
    from analyze_lua_corpus import _tsv_line
    sink.write(_tsv_line(fields))
    for row in rows:
        sink.write(_tsv_line([row.get(field) for field in fields]))


def _variants(locales):
    result = defaultdict(set)
    for resource, languages in locales.items():
        for rows in languages.values():
            for key, variant in rows:
                result[(resource, key)].add(variant)
    return result


def _comparison(candidate, locales, variants):
    resource, key = candidate["resource"], candidate["id"]
    choices = sorted(variants[(resource, key)]) if resource == "affix" else [""]
    for variant in choices:
        result = {"candidate_id": candidate["candidate_id"], "evidence_level": LEVEL,
                  "resource": resource, "id": key, "variant": variant,
                  "matched_english_variant": candidate["variant"]}
        for language in LOCALES:
            row = locales[resource][language].get((key, variant))
            result[f"{language}_status"] = "present" if row is not None else "missing"
            result[f"{language}_text"] = row["Texto"] if row is not None else None
        yield result


def _generate(root, extraction, output, snapshot_path, snapshot, sinks):
    from analyze_lua_corpus import _tsv_line
    reference_paths = [
        Path("work/zh_cn/translation-reference/glossary/proper-name-occurrences.tsv"),
        Path("work/zh_cn/translation-reference/exceptions/translation-exceptions.md"),
        Path("work/zh_cn/translation-reference/duplicates/exact-english-default-groups.jsonl"),
        Path("work/zh_cn/translation-reference/classification/dialogue-context-id-catalog.tsv"),
        Path("work/zh_cn/translation-reference/classification/lua-script-localization-literal-index.tsv"),
        Path("work/zh_cn/audit/lua-script-extraction-and-reencoding-20261115.md"),
    ]
    reference_fingerprints = {str(p): _fingerprint(root / p) for p in reference_paths}
    locales, locale_paths = _load_locales(root)
    index = english_index(locales)
    variants = _variants(locales)
    references, reference_paths = _reference_indexes(root)
    legacy_path, old_rows = _legacy_rows(root)
    credit_path, prior = _credit_prior(root)
    extra_paths = [*reference_paths, legacy_path, credit_path]
    input_paths = set(locale_paths.values()) | set(extra_paths)
    fingerprints = {str(p): _fingerprint(root / p) for p in sorted(input_paths)}
    if any(fingerprints[p] != value for p, value in reference_fingerprints.items()):
        raise ValueError("Candidate reference inputs changed while loading")
    candidate_sink, comparison_sink, legacy_sink, credit_sink, summary_sink = sinks
    comparison_fields = ["candidate_id", "evidence_level", "resource", "id", "variant",
                         "matched_english_variant"]
    for language in LOCALES:
        comparison_fields += [f"{language}_status", f"{language}_text",
                              f"{language}_input_sha256"]
    comparison_fields += ["canonical_references"]
    comparison_sink.write(_tsv_line(comparison_fields))
    counts, unique_keys, keys_by_method = Counter(), defaultdict(set), defaultdict(set)
    legacy_matches, credits_matches = defaultdict(list), Counter()
    old_by_occurrence = defaultdict(list)
    for number, row in enumerate(old_rows, 1):
        old_by_occurrence[(row["batch"], int(row["script_payload_offset"]))].append((number, row))
    occurrences = {row["occurrence_key"]: row for row in snapshot["occurrences"]}
    coverage_path = output / "coverage.tsv"
    with coverage_path.open(encoding="utf-8", newline="") as stream:
        coverage = list(csv.DictReader(stream, delimiter="\t"))
    if len(coverage) != len(occurrences) or {r["occurrence_key"] for r in coverage} != set(occurrences):
        raise ValueError("Coverage and frozen occurrence keys differ")
    evidence_path = output / "decoded-evidence.jsonl"
    with evidence_path.open(encoding="utf-8") as stream:
        evidence = iter(json.loads(line) for line in stream)
        current = next(evidence, None)
        for coverage_row in coverage:
            occurrence = occurrences[coverage_row["occurrence_key"]]
            status = coverage_row["status"]
            counts[f"occurrences_{status}"] += 1
            old = old_by_occurrence.get((occurrence["container_path"], occurrence["payload_offset"]), [])
            if old:
                body = _payload_path(extraction, occurrence["payload_path"]).read_bytes()
                if len(body) != occurrence["payload_bytes"] or hashlib.sha256(body).hexdigest() != occurrence["payload_sha256"]:
                    raise ValueError("Legacy payload mismatch")
                for number, row in old:
                    raw = row["source_text"].encode("ascii")
                    offset = int(row["literal_offset"])
                    legacy_matches[number].append({
                        "payload_bytes_equal": body[offset:offset + len(raw)] == raw,
                        "payload_sha256_equal": row["script_payload_sha256"] == occurrence["payload_sha256"],
                        "status": status, "candidate_ids": [],
                    })
            def emit(candidate):
                candidate["analysis_disposition"] = {
                    name: coverage_row[name] for name in
                    ("status", "diagnostic_code", "diagnostic_offset", "diagnostic_detail")}
                candidate["canonical_references"] = reference_links(candidate, references)
                candidate_sink.write((_json(candidate) + "\n").encode("ascii"))
                counts["candidates"] += 1
                counts[f'candidate_{candidate["resource"]}_{candidate["extraction_method"]}'] += 1
                length = len(candidate["source_text"])
                counts[f'candidate_length_{candidate["extraction_method"]}_'
                       f'{"1" if length == 1 else "2_to_3" if length < 4 else "4_plus"}'] += 1
                unique_keys[candidate["resource"]].add((candidate["id"], candidate["variant"]))
                keys_by_method[(candidate["resource"], candidate["extraction_method"])].add(
                    (candidate["id"], candidate["variant"]))
                if (candidate["resource"] == "default" and
                        candidate["occurrence"].get("record_name", "").lower() == "credits_win"):
                    credits_matches[candidate["id"]] += 1
                offset = (candidate["constant"]["data_start"] if candidate["prototype_path"] is not None
                          else candidate["constant"]["start"])
                for number, oldrow in old:
                    if (candidate["resource"] == "default" and candidate["id"] == oldrow["default_id"]
                            and offset == int(oldrow["literal_offset"])
                            and candidate["source_text"] == oldrow["source_text"]):
                        legacy_matches[number][-1]["candidate_ids"].append(candidate["candidate_id"])
                for comparison in _comparison(candidate, locales, variants):
                    for language in LOCALES:
                        comparison[f"{language}_input_sha256"] = fingerprints[
                            str(locale_paths[(candidate["resource"], language)])]["sha256"]
                    comparison["canonical_references"] = reference_links(comparison, references)
                    comparison_sink.write(_tsv_line([comparison.get(f) for f in comparison_fields]))
                    counts["comparison_rows"] += 1
                    for language in LOCALES:
                        counts[f"missing_{language}"] += comparison[f"{language}_status"] == "missing"
            if status == "unsupported":
                for raw in raw_literal_fallback(occurrence, extraction):
                    counts["fallback_ascii_runs"] += 1
                    counts["fallback_matched_ascii_runs" if raw["text"] in index
                           else "fallback_unmatched_ascii_runs"] += 1
                    for resource, key, variant in index.get(raw["text"], ()):
                        constant = {"start": raw["start"], "end": raw["end"]}
                        emit(_candidate(occurrence, None, constant, raw["text"], resource, key,
                                        variant, "unsupported_maximal_printable_ascii_run", []))
            elif status != "parsed":
                counts["unavailable_occurrences"] += 1
            functions = 0
            while current is not None and current["occurrence_key"] == occurrence["occurrence_key"]:
                if status != "parsed" or any(current.get(k) != v for k, v in occurrence.items()):
                    raise ValueError("Evidence occurrence provenance mismatch")
                functions += 1
                fn = current["function"]
                counts["function_rows"] += 1
                counts["unresolved_call_observations"] += len(fn["analysis"]["calls"])
                for constant in fn["constants"]:
                    counts["constants"] += 1
                    if constant["type"] == "string":
                        value = constant.get("value")
                        counts["string_constants"] += 1
                        if value and value in index:
                            counts["matched_string_constants"] += 1
                        elif value is None:
                            counts["non_utf8_string_constants"] += 1
                        elif not value:
                            counts["empty_string_constants"] += 1
                        else:
                            counts["unmapped_string_constants"] += 1
                    else:
                        counts["non_string_constants"] += 1
                for candidate in _build_for_row(current, index):
                    emit(candidate)
                current = next(evidence, None)
            if status == "parsed" and functions != int(coverage_row["function_count"]):
                raise ValueError(f'Function count mismatch: {occurrence["occurrence_key"]}')
        if current is not None:
            raise ValueError("Unaccounted evidence rows or order mismatch")
    legacy_result = []
    for number, old in enumerate(old_rows, 1):
        matches = legacy_matches[number]
        current_row = locales["default"]["en"].get((old["default_id"], ""))
        legacy_result.append({
            "legacy_row": number, "script_id": old["script_id"], "batch": old["batch"],
            "payload_offset": old["script_payload_offset"], "literal_offset": old["literal_offset"],
            "default_id": old["default_id"], "source_text": old["source_text"],
            "current_english_equal": current_row is not None and current_row["Texto"] == old["source_text"],
            "occurrences": matches,
            "result": ("candidate_found" if any(m["candidate_ids"] for m in matches)
                       else "raw_literal_not_decoded_as_exact_constant_or_fallback_run"),
        })
    _write_tsv(legacy_sink, ["legacy_row", "script_id", "batch", "payload_offset",
                            "literal_offset", "default_id", "source_text",
                            "current_english_equal", "occurrences", "result"], legacy_result)
    credit_rows = []
    for key in CREDITS:
        en, zh, ko = prior[key]
        row = {"id": key, "prior_en_ja": en, "prior_zh": zh, "prior_ko": ko,
               "credits_candidate_count": credits_matches[key]}
        for language, previous in (("en", en), ("ja", en), ("zh", zh), ("ko", ko)):
            entry = locales["default"][language].get((key, ""))
            row[f"current_{language}"] = entry["Texto"] if entry else None
            row[f"{language}_equals_prior"] = entry is not None and entry["Texto"] == previous
        credit_rows.append(row)
    _write_tsv(credit_sink, ["id", "prior_en_ja", "prior_zh", "prior_ko",
                             "current_en", "current_ja", "current_zh", "current_ko",
                             "en_equals_prior", "ja_equals_prior", "zh_equals_prior",
                             "ko_equals_prior", "credits_candidate_count"], credit_rows)
    summary = {"schema_version": 1, "counts": dict(sorted(counts.items())),
               "unique_localization_keys": {r: len(keys) for r, keys in sorted(unique_keys.items())},
               "unique_keys_by_resource_and_method": [
                   {"resource": resource, "extraction_method": method, "keys": len(keys)}
                   for (resource, method), keys in sorted(keys_by_method.items())],
               "evidence_levels": {LEVEL: counts["candidates"], "direct_key_mapping": 0,
                                   "static_call_site_mapping": 0,
                                   "unmapped_or_unresolved": {
                                       "unmatched_nonempty_string_constants": counts["unmapped_string_constants"],
                                       "non_utf8_string_constants": counts["non_utf8_string_constants"],
                                       "empty_string_constants": counts["empty_string_constants"],
                                       "non_string_constants": counts["non_string_constants"],
                                       "call_observations": counts["unresolved_call_observations"],
                                       "unmatched_fallback_runs": counts["fallback_unmatched_ascii_runs"]}},
               "legacy_rows": len(old_rows),
               "legacy_rows_with_candidate": sum(r["result"] == "candidate_found" for r in legacy_result),
               "credit_rows": len(credit_rows),
               "credit_rows_current_match_prior": sum(all(r[f"{l}_equals_prior"] for l in LOCALES)
                                                       for r in credit_rows),
               "input_fingerprints": fingerprints,
               "snapshot_sha256": sha256_file(snapshot_path),
               "task4_sha256": TASK4_HASHES,
               "limitations": ["Exact matches do not establish a localization call or runtime display.",
                               "Unsupported fallback scans maximal printable ASCII runs only; "
                               "it is not a bytecode parser.",
                               "Unmatched constants are summarized; full evidence remains in Task 4.",
                               "Canonical links are review starting points, not speaker or order claims."]}
    summary_sink.write((_json(summary) + "\n").encode("ascii"))
    if {str(p): _fingerprint(root / p) for p in sorted(input_paths)} != fingerprints:
        raise ValueError("Candidate inputs changed during generation")
    return summary


def run_candidates(repo_root, extraction_dir, output_dir, snapshot_path, check=False):
    from analyze_lua_corpus import _Comparison
    from lua_review_inputs import verify_snapshot
    root = Path(repo_root).resolve()
    extraction = Path(extraction_dir).resolve()
    snapshot_path = Path(snapshot_path).resolve()
    output = validate_candidate_outputs(repo_root, extraction, snapshot_path, output_dir)
    snapshot = json.loads(snapshot_path.read_text(encoding="utf-8"))
    verify_snapshot(snapshot, root, extraction)
    for name, expected in TASK4_HASHES.items():
        if sha256_file(output / name) != expected:
            raise ValueError(f"Task 4 artifact hash mismatch: {name}")
    if check:
        with ExitStack() as stack:
            sinks = [_Comparison(stack.enter_context((output / name).open("rb")), name)
                     for name in OUTPUT_NAMES]
            summary = _generate(root, extraction, output, snapshot_path, snapshot, sinks)
            for sink in sinks:
                sink.finish()
        verify_snapshot(snapshot, root, extraction)
    else:
        with tempfile.TemporaryDirectory(prefix=".lua-candidates-", dir=output) as staging:
            with ExitStack() as stack:
                sinks = [stack.enter_context((Path(staging) / name).open("wb"))
                         for name in OUTPUT_NAMES]
                summary = _generate(root, extraction, output, snapshot_path, snapshot, sinks)
            validate_candidate_outputs(root, extraction, snapshot_path, output)
            verify_snapshot(snapshot, root, extraction)
            for name, expected in TASK4_HASHES.items():
                if sha256_file(output / name) != expected:
                    raise ValueError(f"Task 4 artifact hash mismatch: {name}")
            for name in OUTPUT_NAMES:
                os.replace(Path(staging) / name, output / name)
    return summary


def main(argv=None):
    import argparse

    parser = argparse.ArgumentParser(description=__doc__)
    commands = parser.add_subparsers(dest="command", required=True)
    prepare = commands.add_parser("prepare-review-packets")
    prepare.add_argument("--repo-root", type=Path, default=Path.cwd())
    prepare.add_argument(
        "--audit-dir", type=Path,
        default=Path("work/zh_cn/audit/lua-corpus-review-20261115"))
    prepare.add_argument("--packet-size", type=int, default=REVIEW_PACKET_SIZE)
    validate = commands.add_parser("validate-key-reviews")
    validate.add_argument("--packets", nargs="+", type=Path, required=True)
    validate.add_argument("--reviews", nargs="+", type=Path, required=True)
    args = parser.parse_args(argv)
    if args.command == "prepare-review-packets":
        root = args.repo_root.resolve()
        audit = args.audit_dir if args.audit_dir.is_absolute() else root / args.audit_dir
        result = prepare_review_packets(root, audit, args.packet_size)
    else:
        result = validate_key_review_files(args.packets, args.reviews)
    print(_json(result))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
