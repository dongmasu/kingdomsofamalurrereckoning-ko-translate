# Lua Corpus Translation Review Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Account for every extracted Lua occurrence and produce evidence-graded, four-language translation review findings without editing translations.

**Architecture:** Freeze the current inputs, validate a representative bytecode pilot, and build a fail-closed static reader only for verified structures. A separate corpus runner preserves occurrence-level provenance, and a localization review layer joins supported candidates to locale rows without treating literal matches as confirmed links. Linguistic adjudication is a separate read-only step, not an automatic consequence of a string match.

**Tech Stack:** Python 3 standard library, unittest, JSON/JSONL, semicolon CSV, tab-delimited TSV; no VM execution or new dependencies.

**Spec:** `docs/superpowers/specs/2026-11-15-lua-corpus-translation-review-design.md`

## Global Constraints

- Never execute payloads. Treat source assets and extracted `.bin` payloads as read-only inputs.
- Editing source assets, extracted payloads, translation CSVs, or existing review-ledger decisions is out of scope.
- Preserve the existing four-language CSV structure and mixed line endings; because this review is read-only, no CSV edit or binary build is authorized.
- Only direct key mappings are treated as confirmed Lua-to-localization links.
- Other levels remain candidates or unresolved and must not independently authorize a translation change.
- Record global completion as full payload accounting, not as proof that all game behavior is understood or that every candidate is resolved.
- Keep generated or ignored payload-derived outputs under `work/zh_cn/audit/`; never write analysis output under `references/`.
- Do not commit unless the user separately requests it. Task checkpoints below replace automatic commits.
- Preserve the initial dirty worktree, including the existing untracked codec tools and codec plan.

## File And Interface Map

- `tools/lua_review_inputs.py`: safe manifest loading, input hashes, immutable review snapshot, deterministic pilot selection.
- `tools/lua_bytecode_reader.py`: bounded static parser and validated instruction/reference model; no corpus I/O.
- `tools/analyze_lua_corpus.py`: CLI, occurrence accounting, deterministic analysis and coverage artifacts.
- `tools/lua_translation_candidates.py`: locale keys, candidate evidence, four-language comparisons and adjudication validation.
- Matching `tools/test_*.py` modules: standard-library regression tests and synthetic fixtures.
- `work/zh_cn/audit/lua-corpus-review-20261115/`: snapshot, pilot, parse coverage, decoded evidence, comparisons, decisions and summary.
- `work/zh_cn/audit/lua-corpus-translation-review-20261115.md`: human-readable findings, rationale, limits and reproduction commands.
- `work/zh_cn/translation-reference/classification/lua-confirmed-localization-links.tsv`: only direct, validated links, if any exist.
- Existing classification/reference README files: links and verified reusable findings only.

Names below describe the proposed analysis schema, not a claim about the bytecode format. Finalize the parser representation and artifact columns at Task 2's pilot gate, documenting any interface changes in this plan before dependent implementation.

## Task 1: Freeze Inputs And Select A Reproducible Pilot

**Files:** Create `tools/lua_review_inputs.py`, `tools/test_lua_review_inputs.py`.

**Interfaces:**
- `load_occurrences(extraction_dir: Path) -> list[dict]`: validate the manifest, unique occurrence keys, safe relative payload paths, hashes and lengths.
- `snapshot_inputs(repo_root: Path, extraction_dir: Path) -> dict`: sorted path/hash/size records plus manifest, occurrence and kind counts.
- `select_pilot(occurrences: list[dict]) -> list[str]`: deterministic occurrence keys covering kinds, asset extensions, distinct sizes and header groups; include these three pinned FFQ35 payload hashes: `2b0ba91abe92a761ae7f28330f5765f74a1f45101cf879745a740b43697578b5`, `604abfc9f55fdccb5b276b23de8027683f993f898e5907234a65bbfb5bbc69b4`, and `f3ac587da8ba1cbd92c34d054ff14c8a9776b10b042ecebc9d4bc2b4f9eaec12`.
- `verify_snapshot(snapshot: dict, repo_root: Path, extraction_dir: Path) -> None`: reject changed inputs before resuming.

- [ ] **Step 1: Add synthetic manifest tests.** Use temporary directories, real SHA-256 values and minimal payload bytes. Exercise duplicates, changed bytes, wrong sizes, absolute paths, `..`, symlinks escaping the extraction directory, missing files and deterministic order.

```python
def test_rejects_changed_payload(self):
    with self.fixture(payload=b"original") as extraction:
        (extraction / "payload.bin").write_bytes(b"changed!")
        with self.assertRaisesRegex(ValueError, "hash"):
            load_occurrences(extraction)
```

- [ ] **Step 2: Run the new failing suite.** Run `python3 -m unittest discover -s tools -p 'test_lua_review_inputs.py' -v`; expect an import failure before implementation.
- [ ] **Step 3: Implement safe reads and snapshotting.** Reuse `lua_resource_codec.sha256_file`. Hash the extraction manifest, each unique payload, English/Japanese/Chinese source CSVs and Korean working CSVs for `affix`, `base`, `default`, and the existing classification indexes, glossary, exceptions and ledger. Keep a separate sorted occurrence inventory: duplicate hashes must not collapse occurrences. Include tool-source hashes as reproducibility metadata, not immutable inputs that prohibit later tool development.

```python
for resource in ("affix", "base", "default"):
    for locale in ("en_us", "ja_jp", "zh_cn"):
        inputs.append(root / f"src/csv/{locale}/locatexts_{locale}.koalocatext_{resource}.csv")
    inputs.append(root / f"work/zh_cn/locatexts_zh_cn.koalocatext_{resource}.csv")
```

- [ ] **Step 4: Run the suite and create the snapshot/pilot inventory through the new API.** Write only inside the dated audit directory. Check observed inventory against 13,268 occurrences: 5,362 standalone BXML, 4,240 batch-nested BXML, 3,666 batch scripts. Record 12,337 scanned files separately from payload-containing files. If the live manifest disagrees, stop to reconcile provenance rather than rewriting the baseline.
- [ ] **Step 5: Checkpoint.** Record chosen pilot keys, selection strata, counts, snapshot hash and the existing dirty-file list. Do not commit.

## Task 2: Validate The Parser Pilot Before Generalization

**Files:** Create `tools/lua_bytecode_reader.py`, `tools/test_lua_bytecode_reader.py`; create `work/zh_cn/audit/lua-corpus-review-20261115/parser-pilot.md`.

**Interfaces:**
- `ParseError(ValueError)` has `code: str`, `offset: int`, `detail: str`; distinguish unsupported structures from malformed input.
- `parse_payload(payload: bytes) -> dict`: return `functions`, `opaque_regions`, `payload_sha256`; every function records prototype path, byte range, raw instruction words, constant values with offsets/types, child paths and metadata.
- `decode_fields(word: int) -> tuple[int, int, int, int, int]`: opcode, A, B, C and Bx.
- A parsed structure is not automatically semantically decoded; mark instruction/reference support independently.

- [ ] **Step 1: Add the FFQ35 compatibility and malformed-input tests.** Import the existing probe only from the tests, adding its audit directory to test import paths. Match its three pinned hashes, 27 functions and 687 instruction words. Never make production code depend on that research probe.

```python
def test_decode_fields(self):
    self.assertEqual(decode_fields((25 << 25) | (3 << 8) | 2),
                     (25, 2, 0, 3, 3))

def test_rejects_truncated_header(self):
    with self.assertRaises(ParseError):
        parse_payload(b"\x1bLua")
```

- [ ] **Step 2: Run `python3 -m unittest discover -s tools -p 'test_lua_bytecode_reader.py' -v`.** Expect failure before implementation.
- [ ] **Step 3: Implement the narrow pilot reader.** Start with `validate_lua_type_table`, bounded reads and the FFQ35-supported layout. Check counts against remaining bytes, enforce recursion/work limits, preserve raw strings if UTF-8 decoding fails, and retain opaque byte ranges without assigning semantics. Unsupported headers, tags, metadata or trailers receive explicit errors; do not skip bytes or search for a plausible next function.
- [ ] **Step 4: Inspect every selected pilot result.** Record raw offsets, consumed lengths, nested function boundaries, constant tags, metadata/trailer variants and opcode populations. Corroborate shared structures across all three occurrence kinds. Add synthetic nested-function, nil/boolean/integer/string, non-UTF-8, impossible-count, excessive-depth, trailing-byte and truncation tests using builder helpers in the test module. Hash-pin real examples without checking game payloads into Git.
- [ ] **Step 5: Pilot approval gate.** Document which structures are verified and which remain opaque/unsupported, plus the exact proposed artifact columns. Reconcile the parser model and tests against independent raw-byte inspection and the pinned probe. Do not extend unsupported semantics to increase coverage. Obtain a fresh reviewer check before Task 3; if the pilot cannot support wider parsing, continue corpus accounting with explicit unsupported dispositions instead.

## Task 3: Add Validated Instruction References And Call Evidence

**Files:** Modify `tools/lua_bytecode_reader.py`, `tools/test_lua_bytecode_reader.py`.

**Interfaces:**
- `analyze_function(function: dict) -> dict`: returns instruction statuses, constant/register/prototype references, control-flow edges and call observations; each observation includes prototype path, PC, byte offset, raw operands and support rationale.
- Unknown semantics stop affected dataflow; they do not fabricate call targets or make the entire occurrence disappear.

- [ ] **Step 1: Write synthetic instruction tests.** Cover valid and invalid register/constant/child indexes, jumps to valid instructions versus auxiliary data words, cache-word ownership, missing cache words, unknown opcode 127, closure binding and branch merges. Add cases where a register is overwritten or has conflicting predecessor values; neither may yield a confirmed call argument.

```python
def test_unknown_opcode_does_not_claim_call_evidence(self):
    fn = self.function_fixture(words=[127 << 25, 9 << 25])
    result = analyze_function(fn)
    self.assertEqual(result["calls"], [])
    self.assertEqual(result["instruction_statuses"][0]["status"], "unsupported")
```

- [ ] **Step 2: Run the reader suite and observe the new failures.**
- [ ] **Step 3: Implement only pilot-supported opcode rules.** Keep a declarative operand/cache specification; validate references and jumps using it. Carry known register values through verified moves/loads and conservative control-flow joins. Record unknown values after unsupported instructions, dynamic writes or ambiguous branches. Distinguish reachable instruction words from auxiliary cache/data words. A function name alone does not establish a localization API.
- [ ] **Step 4: Re-run synthetic tests and FFQ35 parity checks.** Add a real hash-pinned regression for each newly supported form; document unverified operand semantics rather than guessing.
- [ ] **Step 5: Checkpoint the opcode support table and unresolved paths in `parser-pilot.md`.** Review evidence extraction separately from structural parsing.

## Task 4: Account For Every Corpus Occurrence

**Files:** Create `tools/analyze_lua_corpus.py`, `tools/test_analyze_lua_corpus.py`.

**Interfaces:**
- CLI: `python3 tools/analyze_lua_corpus.py --output-dir work/zh_cn/audit/lua-corpus-review-20261115`.
- CLI `--check`: recompute in memory or a temporary directory and compare existing artifacts without rewriting them.
- `analyze_occurrences(occurrences: list[dict], extraction_dir: Path) -> tuple[list[dict], list[dict]]`: one coverage row per occurrence and decoded evidence rows.
- Coverage statuses: `parsed`, `unsupported`, `malformed`; include diagnostic code/offset, structural and instruction support separately.

- [ ] **Step 1: Add synthetic corpus tests.** Supply identical payload bytes at two different occurrence keys, one unsupported payload and one malformed payload. Assert four coverage rows and deterministic evidence ordering, even if parsing is cached by hash.

```python
def test_duplicate_payloads_keep_occurrence_provenance(self):
    occurrences, extraction = self.two_occurrence_fixture()
    coverage, evidence = analyze_occurrences(occurrences, extraction)
    self.assertEqual(len(coverage), 2)
    self.assertNotEqual(coverage[0]["occurrence_key"], coverage[1]["occurrence_key"])
```

- [ ] **Step 2: Run `python3 -m unittest discover -s tools -p 'test_analyze_lua_corpus.py' -v`.** Expect failure before implementation.
- [ ] **Step 3: Implement the runner.** Verify snapshot and payload hashes, parse each unique hash once, expand results to every occurrence, and write sorted `coverage.tsv`, `decoded-evidence.jsonl`, `coverage-summary.json`. Preserve container kind/path, asset/record identity, absolute container payload offset and payload-relative code/constant offsets. Catch only expected parse errors; unexpected implementation exceptions fail the run, not masquerade as unsupported input. Refuse output paths overlapping protected inputs.
- [ ] **Step 4: Run the entire corpus twice, the second time with `--check`.** Assert exact equality of manifest keys and coverage keys, no duplicate keys, count totals by kind/status, and full snapshot verification. Report unsupported counts without calling them reviewed translations.
- [ ] **Step 5: Checkpoint coverage and unresolved parser forms.** Make narrowly validated parser additions only through Tasks 2-3's test/review gates; otherwise leave explicit unsupported records.

## Task 5: Build Evidence-Graded Four-Language Comparisons

**Files:** Create `tools/lua_translation_candidates.py`, `tools/test_lua_translation_candidates.py`; modify corpus CLI to invoke candidate generation.

**Interfaces:**
- `load_locale_rows(path: Path, resource: str) -> dict[tuple[str, str], dict]`: CSV keys `(ID_Linha, Tipo_Variante)` for affix, `(ID_Linha, "")` otherwise; reject duplicate keys.
- `build_candidates(evidence: list[dict], locales: dict) -> list[dict]`: records stable candidate IDs and the spec's four evidence levels.
- `compare_candidates(candidates: list[dict], locales: dict) -> list[dict]`: same-key locale text/status and snapshot fingerprints; missing variants are explicit, never borrowed from another variant.

- [ ] **Step 1: Add tests for duplicated English strings, short strings, multiline/quoted fields, BOM, absent locale keys, affix variants, and a numeric constant that merely equals a valid ID.** Exact matches remain provisional and numeric coincidence must not become a direct key mapping.

```python
def test_numeric_coincidence_is_not_direct_mapping(self):
    evidence, locales = self.numeric_constant_fixture(23533)
    rows = build_candidates(evidence, locales)
    self.assertFalse(any(row["evidence_level"] == "direct_key_mapping"
                         for row in rows))
```

- [ ] **Step 2: Run `python3 -m unittest discover -s tools -p 'test_lua_translation_candidates.py' -v`.** Expect failure before implementation.
- [ ] **Step 3: Implement exact joins without text normalization.** Read `utf-8-sig`, `newline=""`, delimiter `;`. Match every nonempty decoded string constant against English in all three resources; do not reuse the old index's batch-only/default-only/25-character limits. Keep raw-scan fallback candidates for unsupported payloads explicitly separate from parsed constants, preserving exact byte locations and extraction method. Leave composed/partial strings unresolved with their component evidence; never fuzzy-match them into direct links.
- [ ] **Step 4: Implement evidence promotion only for validated paths.** Require an explicitly documented localization-call/key contract and supported operand/dataflow trace. Without that contract, emit only static call-site candidates, exact literals or unresolved observations. Preserve all duplicate English row matches, record same-key locale gaps/conflicts, and attach relevant glossary/exception/duplicate/context references without inventing speaker/order.
- [ ] **Step 5: Generate sorted `candidates.jsonl` and `four-language-comparisons.tsv`; rerun with `--check`.** Reconcile old literal-index entries with the new inventory, explaining threshold, resource and occurrence differences. Account for the earlier 16 credit-label reviews against current text without automatically adopting their conclusions.

## Task 6: Perform Bounded Read-Only Linguistic Adjudication

**Files:** Extend candidate tests/validation; create `adjudications.jsonl` and the dated audit report in the locations above.

**Interfaces:**
- `validate_adjudications(candidates: list[dict], decisions: list[dict]) -> None`: exactly one decision per candidate ID; rejects stale fingerprints, duplicate/missing IDs and undocumented proposed corrections.
- Decision fields: `candidate_id`, `disposition` (`retain`, `proposed correction`, `unresolved`), `reason`, `confidence`, `proposed_text`, `review_dimensions`, `source_conflicts`, `evidence_refs`, `input_fingerprints`.
- `retain` means no supported correction was identified in this bounded review, not proof of runtime correctness; evidence level stays unchanged.

- [ ] **Step 1: Add validation tests.** Missing/duplicate IDs, stale locale fingerprints, invalid dispositions and a proposed correction lacking same-key four-language evidence/rationale must fail. Missing locale rows remain unresolved rather than silently passing.

```python
def test_missing_decisions_fail_completion(self):
    with self.assertRaisesRegex(ValueError, "missing"):
        validate_adjudications([{"candidate_id": "example"}], [])
```

- [ ] **Step 2: Implement and run the validation suite.** Use it to validate each review batch and final aggregation, not to manufacture linguistic decisions.
- [ ] **Step 3: Review candidates in deterministic resource/key/evidence order, in batches of at most 50 unique localization keys.** English governs meaning; consult Japanese for register/voice and Chinese for supporting context. Read current Korean, full utterances, linked groups and applicable exceptions. Review terminology, omissions/additions, Korean naturalness, punctuation/layout and supported voice dimensions. Keep conflicts and insufficient context unresolved. Do not reopen unrelated translations.
- [ ] **Step 4: Have an independent reviewer check proposed corrections and evidence-level promotions.** Record disagreements and final rationale; no reviewer writes CSVs or changes the existing ledger. Literal-only findings cannot independently authorize a translation change, even if a linguistic issue is proposed.
- [ ] **Step 5: Reconcile all candidates to decisions and write the audit report.** Include exact snapshot, occurrence coverage, unique hashes, parse limitations, counts by evidence/resource/disposition, proposals, retained cases, unresolved cases, searched-but-not-established links, reproduction commands and no-runtime/no-decompilation limitations.

## Task 7: Publish Verified References And Close Safety Gates

**Files:** Modify only relevant classification/reference README files; create the confirmed-links TSV only if direct validated links exist; finish the audit report.

- [ ] **Step 1: Validate any proposed reusable links.** Every exported link must resolve to a current localization key, occurrence, hash, prototype/PC and verified key trace. Candidate-only links remain in audit outputs. If no links qualify, record that result instead of creating misleading reference data.
- [ ] **Step 2: Update canonical references only with verified reusable facts.** Link the report and any confirmed-links TSV from `work/zh_cn/translation-reference/README.md`, which is outside the frozen classification inputs. Keep all frozen classification files, glossary, exceptions and existing indexes unchanged during this review; list any proposed follow-up reference decisions in the report for a separately authorized update. If new confirmed links are generated, record their addition explicitly as an authorized output rather than silently changing the frozen input inventory. Do not turn proposals into approved rules.
- [ ] **Step 3: Run all relevant regressions.**

```bash
python3 -m unittest discover -s tools -p 'test_lua*.py' -v
python3 -m unittest discover -s tools -p 'test_analyze_lua_corpus.py' -v
python3 -m unittest discover -s work/zh_cn/audit -p 'test_probe_ffq35_lua.py' -v
python3 tools/extract_lua_scripts.py --check
python3 tools/analyze_lua_corpus.py --output-dir work/zh_cn/audit/lua-corpus-review-20261115 --check
```

- [ ] **Step 4: Verify the frozen input hashes again.** Confirm all translation CSVs, source inputs, extracted payloads and existing ledger bytes match Task 1. Compare against the initial worktree snapshot, not HEAD, because the worktree already contains user changes. Scope whitespace checks to files touched in this plan using `git -c core.whitespace=cr-at-eol diff --check -- <paths>`; inspect newly created files separately because untracked files are absent from `git diff`.
- [ ] **Step 5: Report coverage separately from resolution.** State accounted/total occurrences, supported/unsupported/malformed counts, candidate/disposition counts, proposed corrections and unresolved limits. State explicitly that no translation edits, source edits, VM execution, binary builds, package operations or commits were performed.

## Plan Self-Review

- Full payload inventory and snapshot safety: Tasks 1 and 4.
- Diverse pilot and fail-closed parser approval: Task 2; instruction/dataflow semantics: Task 3.
- Provenance and explicit unsupported states: Tasks 2-5.
- All three resources, affix variants and four-language conflicts: Task 5.
- Full-context review, proposed corrections, retains and unresolved decisions: Task 6.
- Verified reference promotion, deterministic reproduction and unchanged protected inputs: Task 7.
- Existing sample-only probe, codec plan and dirty worktree remain preserved.
- Tasks use the interfaces defined above; the pilot gate must document any interface/schema revision before dependent implementation.
