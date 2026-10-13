# Translation and Review Role Separation

## Purpose

Separate translation drafting, review, correction, and verification so that
unreviewed or structurally unsafe edits do not flow directly into game files.
This adapts the supplied `review-edit-role-separation-design.md` to this
project's CSV localization tables and PAK workflow. This project-level
guidance is kept at the repository root so the instructions are easy to find.

The same person or AI may perform multiple roles, but each role is a distinct
pass with its own permissions and output. A translator must not approve their
own work as the independent reviewer or verifier.

## Project Scope and Source Order

- Translation language: Korean.
- Active working CSV directory: `work/zh_cn/`. The files preserve the
  `zh_cn` target resource keys, variants, and order while containing Korean.
- The user selected `zh_cn` as the non-English work/destination candidate to
  keep English available. This is not yet validated in a rebuilt PAK or
  in-game.
- Immutable references: `src/`; never edit files under this directory.
- Korean terminology authority: `references/manual/Kingdom of Amulur 공식 한글 설명.pdf`.
  Reuse its established Korean names and terms consistently.
- Primary meaning reference: `src/csv/en_us/`.
- Japanese reference: `src/csv/ja_jp/`. Use it especially to infer honorific
  level, casual/formal speech, and character voice that English may not encode.
- Chinese reference: `src/csv/zh_cn/`. Use it as an additional context and
  terminology cross-check.
- The [Namu Wiki article on Kingdoms of Amalur](https://namu.wiki/w/%ED%82%B9%EB%8D%A4%20%EC%98%A4%EB%B8%8C%20%EC%95%84%EB%A7%90%EB%9F%AC)
  may help with setting, character, faction, and event context. It is
  community-maintained and is not an authoritative translation source; verify
  claims against English, in-game evidence, and the official Korean manual.
- Korean text was migrated from the Japanese-derived draft in
  `work/ja_jp/`; that folder is preserved as a migration archive. Use Japanese
  for voice/register evidence, but edit only `work/zh_cn/`.
- Repack compatibility is a separate build-stage check. The work CSV keys,
  variants, order, and multiplicity now match `zh_cn`; runtime locale and font
  behavior still require validation before repacking or release.

If the English meaning is ambiguous or the language references conflict, record
the exact row and evidence in `work/zh_cn/audit/`. Do not
silently resolve a material ambiguity by choosing one reference. Continue
translating clear entries and defer consolidated linguistic review until the
`base`, `affix`, and `default` drafts are complete.

## CSV and Resource Boundaries

Localization is split across `affix`, `base`, and `default` CSVs. Rows are not
interchangeable between resource types.

- Translate the `Texto` field only.
- Preserve `ID_Linha`, `Tipo_Variante`, row order, row multiplicity, CSV
  delimiter, and encoding.
- Preserve game variables, markup, control tokens, and intentional line
  breaks. Translate token contents only when the existing locale references
  show that those contents are localized.
- Keep each `affix` variant. Do not collapse variants merely because two
  current strings look identical.
- Preserve all `estrutura_hashes*.bin` sidecars needed by the matching
  repacker. Do not edit them by hand.
- Never edit or overwrite `src/` reference CSVs, font assets, or language files.

### Current Structural Gate

`work/zh_cn/` uses the target locale's exact CSV structure. Its Korean text
was seeded from the Japanese-derived draft in `work/ja_jp/`, retained as an
archive. The migration preserved the `zh_cn` keys and order:

- `zh_cn`: `base` has 4,844 rows and `default` has 65,135 IDs. All 3,451
  `affix` keys, variants, and their order match the `zh_cn` target.
- The original Japanese-derived draft has 3,311 `affix` rows. The additional
  140 `zh_cn` variants received provisional Korean sibling fallbacks and are
  listed with cross-locale evidence in
  `work/zh_cn/audit/affix-extra-variant-review.tsv`. Review them before
  treating those strings as final.
- `en_us` has 586 `FF` rows and does not match the `zh_cn` work structure.
  Do not repack the `zh_cn` CSVs under `en_us` filenames.
- `ru_ru`: `default` has 65,135 matching IDs, `base` has 2,241 differing
  variant values, and `affix` has 3,311 work rows versus 3,449 Russian rows.
  The key sets differ in `affix` as well.
- The three `estrutura_hashes*.bin` sidecars in `work/zh_cn/` were copied
  byte-for-byte from `src/csv/zh_cn/` and verified. Sidecar equality alone
  does not make different CSV key/variant layouts interchangeable.
- Structural compatibility with the original `zh_cn` CSV key layout passed
  during migration. This does not prove runtime locale selection, font
  rendering, or rebuilt-PAK compatibility.

Preserve the `zh_cn` target's IDs and variant codes. Use English for meaning,
Japanese for voice/register, Chinese as a supporting check, and the official
Korean manual for established terms. If a target variant has no exact
Japanese counterpart, consult other locales and game context, and record
uncertainty rather than silently dropping or inventing a row. Do not repack
until linguistic review and runtime/build gates pass.

## Roles

### Translator

The translator drafts Korean text in `work/zh_cn/` using the target order above.
The translator may edit only the scoped `Texto` cells in working CSVs.

The translator must:

- work on an explicitly assigned resource, ID range, or review batch;
- follow the official Korean manual's established terminology;
- use English as the semantic anchor, Japanese especially for register and
  character voice, and Chinese as an additional supporting reference;
- preserve row keys, variant structure, tokens, tags, and formatting;
- flag uncertain context, missing variants, or conflicting references for
  review instead of guessing silently.

The translator must not edit `src/`, sidecars, generated localization
binaries, or PAK files during the drafting pass.

### Reviewer

After all three resource drafts are complete, the reviewer performs one
consolidated read-only assessment of the working CSVs against the English
source, Japanese and Chinese references, the Korean manual, and the project
glossary/decisions recorded in documentation. Do not create a separate
linguistic review cycle after every small translation range.

The reviewer checks:

- meaning, omissions, additions, tone, and Korean readability;
- reuse of official Korean terminology and consistency across related rows;
- correct handling of `ID_Linha` and every `Tipo_Variante`;
- game variables, markup, line breaks, UI length, and potential truncation;
- whether the ja/zh reference actually supports the proposed interpretation.

The reviewer must not edit CSVs, source references, sidecars, or generated
files. Consolidated findings belong in `work/zh_cn/audit/` and identify the
resource type, `ID_Linha`, `Tipo_Variante` (if present), current Korean,
suggested Korean, English source, supporting references, rationale,
confidence, and disposition. Use `accepted`, `uncertain`, or `not an issue`;
an uncertain item remains open.

### Editor

The editor applies accepted findings only. The review report defines the
approved scope.

The editor must:

- change only approved `Texto` cells;
- preserve all unlisted rows and structural fields;
- avoid global replacement or glossary-wide normalization unless every
  affected row is explicitly approved;
- inspect the CSV diff immediately and stop if it exceeds the approved scope.

If the proposed correction requires changing an ID, variant code, row count, or
resource structure, stop and request a separate structural decision. Do not
smuggle structural changes into a translation edit.

### Verifier

The verifier independently checks the editor's diff against the accepted
review report and the reference CSVs.

Required checks:

- no unapproved text rows changed;
- each destination file has the expected selected-locale key set and
  multiplicity (`(ID_Linha, Tipo_Variante)` where the CSV has variants);
- no IDs or variants were lost, duplicated, reordered, or silently added;
- variables, tags, encoding, delimiter, and multiline CSV records remain valid;
- terminology and meaning match the Korean manual and English meaning, with
  ja/zh used as supporting evidence;
- no-edit round-trip and structural checks pass before edited files are
  repacked;
- in-game checks cover representative UI, dialogue, item names, and variant
  cases before a release build is approved.

Passing structural checks does not establish translation quality. Passing
linguistic review does not establish binary or in-game correctness.

### Builder

The builder handles only verified source. It runs the matching resource
repackers and, when explicitly requested, the game's PAK builder. It must not
make translation edits. Build output is separate from source and work CSVs
until verified.

## Workflow

1. Record the full `base`, `affix`, and `default` scope and confirm `src/` is
   unchanged.
2. Keep the Japanese-derived draft keys and variants during linguistic
   translation; destination-locale compatibility is a later build gate.
3. Translate all clear entries across the three work CSVs, changing only
   `Texto`. Record ambiguities in `work/zh_cn/audit/` and
   continue with other entries.
4. Once all three drafts are complete, perform one consolidated read-only
   linguistic review and add its findings under `work/zh_cn/audit/`.
5. Review the accumulated audit items together; only accepted findings
   authorize a separate editor pass.
6. Editor applies only the accepted corrections and inspects the diff.
7. Verifier checks semantic quality, CSV structure, tokens, and encoding.
8. Validate the selected `zh_cn` slot's locale selection, font behavior, and
   compatibility with its actual resources before repacking.
9. Builder repacks only verified resources and only when explicitly requested.
10. Report changed resource files, coverage, checks run, and unresolved items.

## Stop Conditions

Pause an uncertain entry and record it in the ambiguity audit when:

- the target locale slot or approved scope is unclear;
- English and supporting references conflict and context does not resolve it;
- confidence is too low to distinguish a translation defect from a source-data
  or game-context issue.

Stop all affected resource edits when:

- an edit would alter IDs, `Tipo_Variante`, multiplicity, ordering, or sidecars;
- a tool changes rows outside the translation scope or its output is
  unexplained;
- round-trip, structural, or in-game validation fails;
- the work CSV's structure is unexpectedly changed during drafting.

Keep unresolved findings in the audit documents for the later consolidated
review. Do not silently change the source structure or broaden the edit to
make checks pass.
