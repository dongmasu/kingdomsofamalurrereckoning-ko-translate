# Translation Finding Disposition and CSV Edit Plan

**Goal:** Decide which documented Korean translation findings are sufficiently supported for correction, apply only accepted `Texto` changes, and verify the resulting CSVs.

**Architecture:** Treat review, disposition, editing, and verification as separate passes. Use English as the meaning authority, Japanese for voice and affix structure, Chinese as supporting evidence, and the official Korean manual for established terms. Record every decision; unresolved context remains `uncertain` and is not edited.

**Tech Stack:** Existing semicolon-delimited UTF-8-BOM/CRLF localization CSVs; repository source CSVs and audit Markdown; a record-preserving local edit procedure.

**Spec:** `TRANSLATION-ROLE.md`, `PROJECT-AI.md`, and the user's instruction to confirm findings and apply them.

## Global Constraints

- Edit only `Texto` in `work/zh_cn/`.
- Never edit `src/`, `references/`, `work/ja_jp/`, sidecars, build outputs, or distribution files.
- Preserve every `ID_Linha`, `Tipo_Variante`, row order, row multiplicity, delimiter, encoding, quoting, line ending, token, markup, and intentional line break.
- Only findings with disposition `accepted` authorize a CSV edit.
- Material ambiguity, conflicting evidence, missing runtime context, and uncertain names remain `uncertain`.
- Do not build, repack, install, publish, or claim independent approval.

## Tasks

### Task 1: Freeze and inventory

- [ ] Record active CSV hashes, structural counts, and current audit report inventory.
- [ ] Locate every candidate finding and its English, Japanese, Chinese, Korean, and manual evidence.
- [ ] Separate first-pass findings from combined-name follow-up findings to prevent duplicate decisions.

### Task 2: Disposition

- [ ] Create a decision register with resource, ID, variant, current Korean, proposed Korean, disposition, evidence, rationale, and confidence.
- [ ] Mark a correction `accepted` only when source meaning and Korean defect are clear and the correction does not depend on unverified runtime pairing.
- [ ] Mark unresolved meaning, name identity, item category, or source conflict `uncertain`.
- [ ] Mark supported current wording `not an issue`.
- [ ] Cross-check every repeated/global terminology issue against all affected rows before approving any multi-row change.

### Task 3: Edit accepted rows

- [ ] Apply only accepted changes to `Texto` in the active `base`, `affix`, and `default` CSVs.
- [ ] For `affix`, apply an accepted wording decision to every target variant for the same ID unless source evidence explicitly requires distinct wording; preserve all variant rows.
- [ ] Preserve the original CSV bytes outside the approved text cells.
- [ ] Record old and new text and the exact accepted decision ID for every edit.

### Task 4: Verify and hand off

- [ ] Re-read every changed record and compare its source meaning with the decision register.
- [ ] Verify unchanged keys, variants, order, multiplicity, row counts, BOM, delimiter, line endings, quoting, multiline records, tokens, and markup.
- [ ] Verify no CSV cell outside accepted decisions changed and recompute all three hashes.
- [ ] Update progress, audit index, decision register, and `NEXT-SESSION.md` with accepted count, uncertain count, validation results, and exact remaining scope.
- [ ] Report incomplete corpus coverage and blockers honestly; never mark the full review or edit pass complete until its entire declared scope has passed verification.
