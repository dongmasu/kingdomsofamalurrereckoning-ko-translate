# Korean Dialogue Naturalness Re-Review Plan

> **For agentic workers:** Execute tasks in order. Use this plan as the execution checklist; do not treat previous audit classifications or candidate drops as approvals.

**Goal:** Re-review the current Korean `default` localization against same-ID Japanese and English for natural spoken Korean, correct clear defects, and produce auditable coverage.

**Architecture:** Preserve the existing audit artifacts and script changes. Create a new dated audit run from the current CSV snapshot, independently review every row for text type, Korean naturalness, and source fidelity, and combine findings without a candidate-dropping filter. Adjudicate findings against the exact source rows before making ID-scoped edits.

**Tech Stack:** Python 3 standard library, local LiteLLM semantic aliases, UTF-8 semicolon CSVs, `tools/replace_text_preserve_eol.py`.

**Spec:** User-approved scope in the conversation on 2026-11-06.

## Global Constraints

- Edit active Korean resources only under `work/zh_cn/`; never edit `src/`.
- Use the current Korean CSV as the run snapshot; do not reuse old audit decisions as current judgments.
- Review every English-source ID against same-ID Korean, Japanese, and English text.
- Judge Korean naturalness directly; matching Japanese sentence endings or register labels is not sufficient.
- Do not discard findings solely because a second model disagrees. Preserve disagreements as unresolved until source-based adjudication.
- Do not infer speakers from ID order or shared names. Apply speaker-continuity checks only when identity is evidenced.
- Preserve IDs, variants, record order, BOM, embedded newlines, and the exact line-ending distribution.
- Keep all pre-existing worktree changes and prior audit evidence.

Execution update (November 7, 2026): the initial one-batch HTTP 401 was resolved by injecting the approved local LiteLLM key into the subprocess; it did not block the completed run. Both independent reviews covered all 65,135 IDs. The 10,292-candidate union was source-adjudicated and all 4,064 proposed corrections were independently verified before application. Final dispositions are 2,785 corrected, 5,441 retained, and 2,066 unresolved.

---

### Task 1: Build a separate, resumable audit run

**Files:**
- Create: `work/zh_cn/audit/dialogue-naturalness-audit-20261106.py`
- Create: `work/zh_cn/audit/dialogue-naturalness-20261106/`
- Test: `work/zh_cn/audit/test_dialogue_naturalness_audit.py`

- [x] Load and validate all 65,135 aligned English, Japanese, Chinese, and current Korean rows by ID; hash each input snapshot.
- [x] Run two independently worded full-coverage reviews. Both must assess Korean as native dialogue, compare meaning and delivery with English/Japanese, distinguish spoken dialogue from written/UI text, and emit one result for every ID.
- [x] Save each batch atomically with prompt/version/input hashes; resume only when hashes match.
- [x] Preserve the union and disagreement of findings. Do not run a model triage step that drops candidates.
- [x] Test coverage validation, stale-snapshot rejection, finding-ID/quote validation, and resume behavior with fixtures.

### Task 2: Execute and adjudicate the complete review

**Files:**
- Modify: `work/zh_cn/locatexts_zh_cn.koalocatext_default.csv` only for approved row edits
- Create: `work/zh_cn/audit/dialogue-naturalness-20261106/adjudication/review-decisions.tsv`
- Create: `work/zh_cn/audit/dialogue-naturalness-20261106/adjudication/final-dispositions.tsv`
- Update: `work/zh_cn/audit/translation-edit-addendum-20261106.md`

- [x] Run both reviewers across every aligned ID and verify exact 65,135-row coverage for each.
- [x] Inspect every union finding against the exact Korean, Japanese, and English row; independently re-read apparent false positives and disagreements rather than automatically dropping them.
- [x] Record each candidate as corrected, retained, or unresolved, with source-based rationale and revised Korean where corrected.
- [x] Apply only clear, meaning-supported corrections through the line-ending-preserving, ID-scoped application script.
- [x] Include previously dropped findings and `default:36326` in the re-review evidence.

### Task 3: Verify and report

**Files:**
- Update: `work/zh_cn/audit/dialogue-naturalness-20261106/summary.json`

- [x] Confirm every source ID has two review results and every candidate has an adjudication.
- [x] Verify edited IDs and text against English/Japanese, then check parsed row order, UTF-8 BOM, embedded records, and unchanged line-ending counts.
- [x] Run `python3 -m unittest tools/test_replace_text_preserve_eol.py`, the new audit tests, and `git -c core.whitespace=cr-at-eol diff --check`.
- [x] Report the exact review scope, corrected/unresolved counts, verification results, and any service or coverage limitation. Do not call the work a human or in-game validation.

Final verification: 65,135 rows were reviewed twice; 10,292 candidates received source-based decisions and 4,064 correction proposals received independent verification. The final dispositions are 2,785 corrected, 5,441 retained, and 2,066 unresolved (787 initially uncertain plus 1,279 proposals held by verification). All 2,785 applied edits reverse to the exact source snapshot hash. The edited CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,858 CRLF endings, and 226 LF-only endings. All 23 relevant tests passed.
