# Echostone and Dialogue Review Plan

> **For agentic workers:** Execute tasks in order; do not start the dialogue audit until the terminology task is complete.

**Goal:** Standardize the Echo Stone term, then systematically review Korean dialogue register against Japanese.

**Architecture:** Treat the locale CSVs as ID-keyed data. Build source coverage from English IDs, use Japanese for register, and preserve CSV structure and line endings. Keep the existing uncommitted Sir Airmer correction.

**Tech Stack:** UTF-8 semicolon-delimited CSVs, project line-ending-preserving replacement helper, source locale CSVs.

**Spec:** User request on 2026-11-06.

## Global Constraints

- Edit active Korean data only under `work/zh_cn/`; never edit `src/`.
- Verify every text change against the same English source ID and Japanese row.
- Preserve UTF-8 BOM, CSV records, embedded newlines, row order, and line-ending distribution.
- Do not infer speaker identity from row order; classify uncertain dialogue context as unresolved.
- Preserve the existing uncommitted `default:47557` correction and its audit note.

---

### Task 1: Echostone terminology

**Files:**
- Modify: `work/zh_cn/locatexts_zh_cn.koalocatext_default.csv`
- Modify: `work/zh_cn/audit/translation-edit-addendum-20261106.md`

- [x] Use the English `default` source to enumerate all Echostone/Echo Stone IDs and verify the corresponding Japanese and Korean rows.
- [x] Standardize the Korean form to `에코스톤(Echostone)` at all source-matched occurrences, retaining sentence grammar and adding the English pairing consistently.
- [x] Confirm no source-matched variant remains as `메아리석`, `메아리돌`, or `에코 스톤`; confirm no related entry exists in `base`.
- [x] Verify target IDs, physical line count, BOM, line endings, and the focused line-ending-preservation tests; record IDs and rationale in the addendum. Full default CSV parsing is blocked by an existing malformed row at physical line 1172.

### Task 2: Japanese/Korean dialogue register audit

**Files:**
- Modify: `work/zh_cn/locatexts_zh_cn.koalocatext_default.csv`
- Create or update: `work/zh_cn/audit/` dated register-review evidence

- [x] Build the full target set from current English `default` IDs and reconcile it with current Korean and Japanese rows.
- [x] Classify dialogue separately from UI, item descriptions, journal entries, poetry, and other non-dialogue text.
- [x] Review Japanese speech level and honorific cues against Korean endings and address forms; use English to verify meaning and Chinese only as supporting evidence.
- [x] Record full coverage, machine candidate triage, corrected IDs, and review scope; do not claim speaker-level consistency where speaker identity is unavailable.
- [x] Verify complete target coverage, changed-row IDs, CSV structure, BOM, and line endings; run focused preservation tests.

Progress note: The archived 2026-10-24 and 2026-10-25 audits were based on older snapshots and are not treated as current coverage. A fresh four-language scan covered all 65,135 current IDs in 362 batches. It produced 772 first-pass candidates; independent triage dropped 461 and kept 311. All 116 kept candidates explicitly about register, address, or spoken-vs-written style were manually compared with the source rows, resulting in 58 corrections across 57 IDs. Other kept candidates concerned broader wording/translation naturalness and were not changed in this register-only pass. Full machine evidence is in `work/zh_cn/audit/full-voice-20261106-current/`; the audit files preserve the pre-edit input snapshot, and the post-audit edits are listed in the addendum.

Final verification confirmed 65,135 parsed rows in ID order, the UTF-8 BOM, and unchanged mixed line endings (71,858 CRLF; 226 LF-only). All four line-ending-preservation tests passed, as did the CRLF-aware diff check.

### Task 3: Nix at 23326

- [x] Compare `default:23326` with English and Japanese before changing any gendered reference or meaning.

### Task 4: Counter-spell and confinement terminology

- [x] Inspect English source IDs and all Korean occurrences for the counter-spell and the spell that confines Tenhwa. Compare Japanese and Chinese as supporting references; do not assume the concepts are synonyms.
- [x] Reconcile `대항 주문`, `반주문`, `감금 주문`, and other source-matched renderings; record all affected IDs and choose meaning-appropriate terms.
- [x] Update only supported rows in the active Korean data and verify them against their English source IDs.

### Task 5: White Hallam dialogue

- [x] Review `default:40273`, `19919`, and `23583` against English and Japanese, considering the user-identified speaker; apply only supported register corrections.

### Task 6: Stonewall and Brother Edwin

- [x] Add the English parenthetical for `base:2305:11` `Stonewall`.
- [x] Check whether `default:6908` and `9488` were corrected for Brother Edwin's voice; compare English and Japanese and fix only supported mismatches.

### Task 7: Brother Wulf dialogue

- [x] Check whether `default:55950` was corrected for Brother Wulf's voice; compare English and Japanese and fix only supported mismatches.
