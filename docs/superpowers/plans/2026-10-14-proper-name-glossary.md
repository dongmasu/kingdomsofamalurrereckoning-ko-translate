# Proper-Name Glossary Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Establish a reusable English-indexed proper-name glossary and use it to review and standardize confirmed named entities across the active Korean `affix`, `base`, and `default` CSVs.

**Architecture:** Build a source-aligned candidate and occurrence inventory, seed a TSV glossary from already verified focused reviews, then review remaining entity groups in bounded batches. Apply only evidence-backed, resource/ID/variant-scoped `Texto` edits, record every disposition, and verify byte preservation before documenting the process in both README language sections.

**Tech Stack:** Ruby standard library (`CSV`, `Digest`, `FileUtils`), UTF-8 TSV/CSV, shell SHA-256 tools, Markdown audit records.

**Spec:** `docs/superpowers/specs/2026-10-14-proper-name-glossary-design.md`

## Global Constraints

- English rows in `src/csv/en_us/` are the primary index and semantic authority.
- Japanese rows in `src/csv/ja_jp/` help establish pronunciation, voice, and register. Chinese rows in `src/csv/zh_cn/` provide supporting corroboration.
- The official Korean manual takes precedence for established Korean terms when it covers an entity or concept.
- Do not infer a person's, place's, or creature's identity from capitalization alone.
- Apply only reviewed, ID/variant-scoped `Texto` changes.
- Before modifying each active CSV, create and record a byte-identical backup under `/private/tmp/ko-translate-backups/`.
- `src/csv/` remains read-only. Do not inspect PAK files or PAK-derived files.
- No global replacements, historical disposition recounts, or global tally recalculations.
- Preserve the UTF-8 BOM, existing line-ending sequence, headers, delimiter, record count, row order, IDs, variants, duplicate rows, tokens, markup, and all non-target bytes.
- Do not claim completion while candidate groups remain unreviewed.

---

## File Map

- Create `work/zh_cn/audit/build-proper-name-inventory.rb`: read-only aligned source/work CSV inventory and validation utility.
- Create `work/zh_cn/audit/test-proper-name-inventory.rb`: synthetic fixture checks for CSV edge cases and alignment.
- Create `work/zh_cn/audit/build-proper-name-occurrences.rb`: glossary-to-source candidate occurrence indexer.
- Create `work/zh_cn/audit/test-proper-name-occurrences.rb`: possessive, phrase, and homonym-boundary checks.
- Create `work/zh_cn/audit/proper-name-glossary.tsv`: reusable entity records and canonical forms.
- Create `work/zh_cn/audit/proper-name-occurrences.tsv`: source-aligned candidate occurrences and explicit dispositions.
- Generate the full aligned corpus at `/private/tmp/proper-name-source-inventory.tsv`; keep it out of the repository because it is reproducible source/work data.
- Create `work/zh_cn/audit/proper-name-review-D20389-YYYYMMDD.md` for inventory/seed reconciliation and subsequent bounded-batch reports/addenda/comparison TSVs.
- Modify active `work/zh_cn/locatexts_zh_cn.koalocatext_{affix,base,default}.csv` only for approved target cells.
- Modify `work/zh_cn/audit/README.md`, `work/zh_cn/audit/decision-register-20261009.md`, `work/zh_cn/TRANSLATION_PROGRESS.md`, and root `NEXT-SESSION.md` as checkpoints advance; do not change historical totals.
- Modify Korean and English translation-principles sections in root `README.md`.

## Tasks

### Task 1: Build a tested source-aligned inventory utility

**Files:**
- Create: `work/zh_cn/audit/build-proper-name-inventory.rb`
- Create: `work/zh_cn/audit/test-proper-name-inventory.rb`

**Interfaces:**
- CLI: `ruby work/zh_cn/audit/build-proper-name-inventory.rb --resource all --out /private/tmp/proper-name-source-inventory.tsv`
- Input: `src/csv/{en_us,ja_jp,zh_cn}/locatexts_*.csv` and active `work/zh_cn/locatexts_zh_cn*.csv` for the selected resource.
- Output: one UTF-8 TSV row per active target row, keyed by resource and `ID_Linha`, plus `Tipo_Variante` for `base`/`affix`; `default` has no variant column. Include aligned English, Japanese, Chinese, and Korean text; write generated corpus only under `/private/tmp/`.
- Alignment: match target `base`/`affix` rows to `zh_cn` by `ID_Linha` plus `Tipo_Variante`, and `default` rows by `ID_Linha`. Match English by ID (repeat its single English `affix` row for each target variant). For Japanese, prefer exact ID/variant matches and otherwise expose all variants for that ID as supporting context. Preserve all locale variants in the inventory; do not infer variant semantics or collapse duplicate rows.
- The utility must never write to `src/csv/` or active CSVs.

- [x] Add synthetic fixtures covering BOM, semicolon-delimited quoted values, embedded newlines, escaped quotes, duplicate IDs with different variants, and English-to-zh_cn `affix` one-to-many variant alignment.
- [x] Implement `read_rows(path)`, `index_by_id(rows)`, `index_by_id_and_variant(rows)`, and `build_inventory(resource, en_rows, ja_rows, zh_rows, work_rows)` using Ruby's standard `CSV` library; preserve source fields exactly in output.
- [x] Implement `--resource all|affix|base|default` and `--out PATH`; reject unknown resources, missing files, duplicate ambiguous keys, and missing required mappings with nonzero exit status and a diagnostic naming the file and key.
- [x] Match `default` by ID, `base`/`affix` by ID and variant against `zh_cn`, and English by ID; replicate a single English `affix` source across target variants without collapsing rows.
- [x] Fail with a useful diagnostic on missing or ambiguous required ID mappings; do not silently drop records.
- [x] Run `ruby work/zh_cn/audit/test-proper-name-inventory.rb`; expect PASS for all fixtures and FAIL for deliberately missing/duplicate mapping fixtures.
- [x] Run `ruby work/zh_cn/audit/build-proper-name-inventory.rb --resource all --out /private/tmp/proper-name-source-inventory.tsv`; verify emitted rows equal the parsed active `affix`, `base`, and `default` work record counts.
- [x] Test `ruby work/zh_cn/audit/test-proper-name-occurrences.rb`; require English possessives and multiword entities to match their own glossary keys without bleeding into homonyms.

### Task 2: Seed the glossary from verified decisions

**Files:**
- Create: `work/zh_cn/audit/proper-name-glossary.tsv`
- Modify: `work/zh_cn/audit/proper-name-occurrences.tsv`
- Read only: D-20382 through D-20388 reports, edit addenda, and existing comparison TSVs.

**Interfaces:**
- Consumes: Task 1 aligned inventories and verified prior focused decisions.
- Produces: a TSV glossary with stable entity keys and a row-level occurrence inventory.

- [x] Define and validate TSV columns: `entity_key`, `english_canonical`, `category`, `korean_canonical`, `english_aliases`, `korean_variants`, `evidence_ids`, `status`, and `notes`.
- [x] Import only supported decisions from D-20382-D-20388, including the House, standalone personal-name, Thresh, Quake, Sagrell, and jewelry work; preserve distinctions already established by those reviews.
- [x] Write `proper-name-review-D20389-YYYYMMDD.md` using the actual review date and record imported entity counts, source/work record counts, source CSV hashes, and any conflicts found during reconciliation.
- [x] Link each imported occurrence by resource and ID, adding variant for `base`/`affix`; do not infer that a reviewed term covers unseen rows.
- [ ] Mark homonyms and ordinary-word lookalikes as distinct or excluded records rather than aliases.
- [x] Validate unique entity keys, allowed categories/statuses, bilingual confirmed forms, and referential integrity from occurrences to glossary keys.
- [ ] Compare seeded records to their original reports and record provenance; do not reopen their completed decisions or recalculate any global total.
- [x] Generate the occurrence index with `ruby work/zh_cn/audit/build-proper-name-occurrences.rb --glossary work/zh_cn/audit/proper-name-glossary.tsv --inventory /private/tmp/proper-name-source-inventory.tsv --out work/zh_cn/audit/proper-name-occurrences.tsv`; include possessive and phrase matches.

### Task 3: Review remaining candidates in bounded entity batches

**Files:**
- Modify: `work/zh_cn/audit/proper-name-glossary.tsv`
- Modify: `work/zh_cn/audit/proper-name-occurrences.tsv`
- Create per batch: `work/zh_cn/audit/named-scope-review-D<number>-YYYYMMDD.md`
- Create per edited batch: matching edit addendum and `proper-name-edits-D<number>.tsv`
- Modify active CSVs only when the batch has approved edits.

**Interfaces:**
- Consumes: validated inventories and seeded glossary from Tasks 1-2.
- Produces: reviewed entity records and exact per-resource/ID/variant dispositions.
- Entity categories: people, places, factions, peoples/species, deities, monsters, skills, and unique named items.

- [ ] Partition unreviewed candidate groups by category, then English canonical spelling; process no more than 25 entity groups in one D-number batch.
- [ ] Build the candidate queue from every English source row, including title-cased spans at sentence starts, repeated title/name spans, labels, and occurrences linked by existing Korean spelling variants; explicitly disposition candidates found to be generic words.
- [ ] Name each report `named-scope-review-D<number>-YYYYMMDD.md`; allocate numbers sequentially beginning with D-20390 and use the actual review date in the filename and report.
- [ ] For each group, inspect English source context first, then applicable Japanese and Chinese rows, existing Korean occurrences, and the official Korean manual when it covers the term.
- [ ] Record confirmed canonical forms as `한글(English)`; record ordinary-word matches, unresolved names, source aliases, and distinct homonyms explicitly.
- [ ] Enumerate every matching occurrence in all three active resources by source ID and, for `base`/`affix`, target variant; distinguish generic uses from named-entity uses.
- [ ] Before each CSV file's first edit in a batch, verify its current SHA-256 and create a byte-identical backup under `/private/tmp/ko-translate-backups/YYYYMMDD/`, using the actual edit date.
- [ ] Edit only reviewed `Texto` cells. Do not run global Korean substring replacement.
- [ ] Write a per-ID comparison manifest containing resource, ID, variant, English/Japanese/Chinese evidence as applicable, old Korean text, new Korean text, and disposition.
- [ ] Independently scan edited resources for known Korean variants and inspect every remaining hit against its English source; retain valid generic homonyms and log them.
- [ ] Reconstruct each pre-edit CSV by reversing the manifest and compare byte-for-byte with its backup; verify BOM, row count/order, delimiter, line-ending pattern, target cells, non-target bytes, and final SHA-256.
- [ ] Add the D-number report/addendum and update the decision register, audit README, translation progress, and `NEXT-SESSION.md` without altering historical sequential totals.
- [ ] Repeat this task for the next alphabetized batch until every candidate group has a disposition. Use the next unused D-number after D-20389; never skip a group without an explicit unresolved/excluded disposition.

### Task 4: Run a cross-resource residual and bilingual-form audit

**Files:**
- Read/modify: all three active CSVs and both TSV inventories.
- Create: final residual-scan report and any required D-number correction addenda.

- [ ] For each confirmed entity, compare its glossary key against every English-source occurrence in `affix`, `base`, and `default`, including phrases and title forms.
- [ ] Search the Korean CSVs for every recorded variant and inspect each hit with its aligned English source; distinguish unresolved or generic matches from missed corrections.
- [ ] Check that confirmed named occurrences use the canonical bilingual form, allowing only explicitly documented grammatical/token exceptions.
- [ ] Add missed occurrences to a correction batch with a byte-identical pre-edit backup for every CSV changed; rerun the full structural and inverse-byte checks.
- [ ] Require zero unreviewed candidate groups before marking the consistency pass complete; unresolved groups remain counted and listed, not treated as completed.

### Task 5: Document the glossary workflow in README and handoff records

**Files:**
- Modify: root `README.md` Korean and English translation-principles sections.
- Modify: `work/zh_cn/audit/README.md`, `work/zh_cn/audit/decision-register-20261009.md`, `work/zh_cn/TRANSLATION_PROGRESS.md`, and root `NEXT-SESSION.md`.

- [x] Explain the supported entity categories, English-first discovery, Japanese/Chinese supporting checks, contextual disambiguation, and canonical `한글(English)` form in both README language sections.
- [x] Link the reusable glossary and occurrence/audit records using repository-relative paths; do not refer to ignored `references/data/` material.
- [ ] State the final reviewed-through D-number, unresolved candidate count, edited resource hashes, and last pre-edit backup paths consistently in all active handoff summaries.
- [ ] Make clear that sequential review through `default` ID 65134 is historical completed work and is not being reopened or recounted.
- [ ] Run Markdown/link/path checks available in the repository and `git diff --check`.

## Final Verification

- Parse the glossary and occurrence TSVs and confirm all references, categories, statuses, and confirmed bilingual forms are valid.
- Re-run the inventory utility in read-only mode to `/private/tmp/` and reconcile candidate/occurrence totals against all three source and work CSVs.
- Re-run residual spelling searches for every recorded alias and inspect remaining hits against English source rows.
- Verify each modified CSV's BOM, delimiter, exact line-ending sequence, record count/order, target `Texto` cells, non-target byte preservation, inverse reconstruction, SHA-256, and backup path.
- Confirm `src/csv/` is unchanged and no PAK or PAK-derived file was consulted.
- Review all current handoff documents for one consistent last D-number, candidate completion state, unresolved count, active hashes, and backup paths.
- Do not build a patch, publish, or claim in-game validation.
