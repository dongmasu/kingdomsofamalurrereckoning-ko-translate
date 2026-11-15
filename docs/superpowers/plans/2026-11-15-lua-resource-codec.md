# Lua Resource Extraction and Re-encoding Implementation Plan

> **For agentic workers:** Implement the user-approved structure-preserving approach 1. Try it first; if safe extraction or exact re-encoding cannot be established, document the limitation before switching to approach 2.

**Goal:** Extract every verifiable Lua-family payload in the unpacked corpus and safely re-encode edited payloads into separate container copies.

**Architecture:** Add standard-library Python tools under `tools/` for corpus scanning, extraction, exact source-literal indexing, manifest validation, and container reconstruction. Preserve each occurrence independently; validate source hashes and byte ranges, update only established length fields, and never write to `references/data/unpacked/`.

**Tech Stack:** Python 3 standard library; `unittest`.

**Spec:** User-approved approach 1 in the conversation; fallback to approach 2 only if approach 1 proves unsafe or infeasible.

## Global Constraints

- Treat `references/` and extracted assets as read-only.
- Do not execute extracted Lua bytecode.
- Preserve unknown bytes and metadata verbatim.
- Do not infer dialogue, speaker, branch, or translation relationships from script presence alone.
- Do not change translation CSVs or review ledgers without direct, verified evidence.
- Do not commit changes unless requested.

---

### Task 1: Container codec and focused tests

**Files:**
- Create: `tools/lua_resource_codec.py`
- Create: `tools/index_lua_localization_literals.py`
- Create: `tools/test_lua_resource_codec.py`
- Create: `tools/test_lua_localization_literals.py`
- Modify: `.gitignore`

**Interfaces:**
- `scan_corpus(asset_dir) -> (occurrences, unclassified_signatures)`
- `extract_corpus(asset_dir, output_dir) -> manifest`
- `verify_roundtrip(asset_dir, extraction_dir) -> summary`
- `reencode_corpus(asset_dir, extraction_dir, output_dir) -> summary`

- [x] Test BXML payload extraction and reconstruction with multiple payloads.
- [x] Test `.batch` directory, script-record strings, and payload length updates.
- [x] Test same-length and changed-length replacements while preserving unrelated bytes.
- [x] Test truncation, stale source hash, edited header/type table, overlapping spans, and unclassified valid signatures.
- [x] Match printable script literals to English `default` rows only on exact text equality; label runtime display as unverified.
- [x] Require new output directories to be absent or empty; never overwrite source assets.

### Task 2: Command-line tools and local extraction

**Files:**
- Create: `tools/extract_lua_scripts.py`
- Create: `tools/reencode_lua_scripts.py`
- Create: `work/zh_cn/translation-reference/classification/lua-script-localization-literal-index.tsv`
- Modify: `.gitignore`

**Interfaces:**
- `extract_lua_scripts.py [--asset-dir PATH] [--output-dir PATH] [--check]`
- `reencode_lua_scripts.py EXTRACTION_DIR [--asset-dir PATH] [--output-dir PATH] [--check]`

- [x] Extract each supported occurrence to its own payload file and write a deterministic JSON manifest with source path, kind, offsets, lengths, container hash, payload hash, and output path.
- [x] Scan all corpus files for Lua signatures; distinguish extracted payloads from valid-but-unclassified occurrences.
- [x] Make `--check` read-only and verify extraction hashes, coverage, and byte-identical no-edit reconstruction.
- [x] Write re-encoded container copies only to a separate output directory, preserving relative paths.
- [x] Run the extractor over the full unpacked corpus.

### Task 3: Corpus-wide verification and translation relevance

**Files:**
- Create: `work/zh_cn/audit/lua-script-extraction-and-reencoding-20261115.md`
- Modify: `work/zh_cn/translation-reference/classification/resource-corpus-map.md`
- Modify: `work/zh_cn/translation-reference/classification/README.md`

- [x] Reconcile extracted counts and hashes against the existing container indexes.
- [x] Record unsupported/unclassified signatures and all parser/re-encoding limits.
- [x] Check extracted constants and printable strings for exact localization-key and source-text evidence; update translation references only when a direct mapping is verified.
- [x] Run new unit tests, extraction `--check`, re-encoder `--check`, existing container-analysis tests, and FFQ35 sample tests.
- [x] Inspect the final diff, confirm source assets are unchanged, and verify only reviewed localization IDs changed with current fingerprints.
