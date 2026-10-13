# AI Project Instructions

## Project

This project creates a Korean localization for *Kingdoms of Amalur:
Re-Reckoning*. The game's original archive has no `ko_kr` localization slot.
The active Korean working CSVs are in `work/zh_cn/` and use the `zh_cn`
resource structure as the target slot. Their Korean text was migrated from
the Japanese-derived draft; the previous `work/ja_jp/` draft was deleted at
the user's direction on 2026-10-14. The user wants to keep `en_us` available.
`zh_cn` is the selected work/destination candidate; PAK compatibility and
broader in-game behavior remain unverified.

## Source of Truth

- `src/` contains immutable source CSVs and assets. Never edit, rename, move,
  or regenerate anything under `src/`.
- `references/` is immutable research material. Only
  `references/manual/` is intended for Git; the rest is Git-ignored. Do not
  edit, rename, move, or add generated files anywhere under `references/`.
- `work/zh_cn/` contains the active Korean working CSVs and audit materials.
  Edit these files, preserving the `zh_cn` keys, variants, order, and sidecars.
- `work/ja_jp/` was deleted at the user's direction on 2026-10-14. Historical
  audit references to it describe the former migration draft.
- `tools/loc_toolset/` contains the project's CSV unpackers and repackers.
  Change tooling only when explicitly requested; verify any change with
  no-edit round trips.
- `README.md` is the user-facing project overview. Edit it only when the user
  explicitly asks.
- [`TRANSLATION-ROLE.md`](TRANSLATION-ROLE.md)
  defines translator, reviewer, editor, verifier, and builder permissions.
- [`DISTRIBUTION_CHECKLIST.md`](DISTRIBUTION_CHECKLIST.md) tracks unresolved
  destination, build, and release validation gates.

## Translation References

Use the following evidence order:

1. English CSVs in `src/csv/en_us/` define the primary meaning.
2. Japanese CSVs in `src/csv/ja_jp/` are the drafting template and the main
   reference for voice, register, honorifics, and line layout.
3. Chinese CSVs in `src/csv/zh_cn/` provide a secondary meaning check.
4. `references/manual/Kingdom of Amulur 공식 한글 설명.pdf` is the authority
   for established Korean names, terms, and world context.
5. The [Namu Wiki article on Kingdoms of Amalur](https://namu.wiki/w/%ED%82%B9%EB%8D%A4%20%EC%98%A4%EB%B8%8C%20%EC%95%84%EB%A7%90%EB%9F%AC)
   may help with setting, character, faction, and event context. Treat it as
   a community-maintained tertiary source, not an authoritative translation
   or terminology source; verify relevant claims against the English source,
   game evidence, and official Korean manual. A saved copy is available at
   `references/wiki/킹덤 오브 아말러 - 나무위키 (2026_10_7 9：58：29).html`;
   read it without modifying `references/`.
6. Russian CSVs are not a translation reference. Consult them only when
   checking compatibility if `ru_ru` is selected as a destination resource.

Reuse terminology from the official Korean manual. Do not silently resolve
materially ambiguous English, conflicting references, unclear speaker
context, or uncertain names. Continue with clear rows and record unresolved
items in `work/zh_cn/audit/` for consolidated review.

## Editing Invariants

- Edit only the `Texto` field of assigned rows in `work/zh_cn/`.
- Preserve `ID_Linha`, `Tipo_Variante`, row order, row count, and duplicate
  variant rows. Never merge or discard variants because their text looks
  identical.
- Preserve the CSV delimiter, encoding, quoting, and multiline record
  structure.
- Current working CSVs use semicolons, a UTF-8 BOM, and CRLF record endings.
  Preserve these unless the actual source format is deliberately changed.
- Treat `Tipo_Variante` as structural data. Its runtime selection semantics
  remain unverified; do not treat hypotheses about grammatical gender or
  number as authoritative rules for transforming variants.
- Preserve game variables, control tokens, markup, and their order. Translate
  the contents of localized markers only when the locale references show
  those contents are translated.
- Preserve intentional line breaks using the Japanese-derived template,
  except where the English meaning or a documented source conflict requires
  a different layout. Record such exceptions in the audit.
- Do not edit sidecar `estrutura_hashes*.bin` files by hand.
- Do not edit generated localization binaries or PAK files during translation
  or review.

## Roles and Gates

Follow
[`TRANSLATION-ROLE.md`](TRANSLATION-ROLE.md)
for the full permissions and hand-offs:

1. **Translator:** drafts Korean text and logs uncertainty; does not approve
   their own work as an independent review.
2. **Reviewer:** performs a consolidated, read-only assessment after all
   drafts are complete. Findings go to `work/zh_cn/audit/` with source
   evidence, proposed correction, rationale, confidence, and disposition.
3. **Editor:** changes only rows accepted by the review; does not make
   unapproved global replacements.
4. **Verifier:** checks the editor's diff, meaning, terminology, structure,
   tokens, and encoding independently.
5. **Builder:** builds only verified inputs and makes no translation edits.

Linguistic quality review and binary/locale compatibility are separate gates.
A structurally valid CSV is not proof of a good translation; a good
translation is not proof that it can be repacked or displayed correctly.

## Build Safety

- The inspected original `patch_0.pak` came from the user's Steam installation.
  The user confirmed that the game's main menu displays `Version: cs:15032`;
  use this as the source-game baseline. Steam AppID `1041720`, BuildID
  `10619381` in that installation's `appmanifest_1041720.acf` is secondary
  provenance information. This does not establish that a rebuilt PAK works
  in-game or that other game versions are compatible.
- The user selected `zh_cn` as the Korean work/destination candidate to keep
  English available. `work/zh_cn/` follows the exact `zh_cn` CSV structure.
  The Korean comparison PAK's `en_us` filenames do not establish that the new
  `zh_cn` candidate works in-game.
- A 2026-10-06 key comparison found the work `base` (4,844 rows) and
  `default` (65,135 IDs) structures match `en_us`, but the work `affix` has
  3,311 Japanese-template variants while `en_us` has 586 `FF` rows. Do not
  repack the current work `affix` as `en_us`; reconcile and verify it against
  the selected target first. Russian also differs from the scaffold in
  `base` and `affix`.
- The migration preserved the exact `zh_cn` key sets and order: `base` 4,844,
  `default` 65,135, and `affix` 3,451 rows. The 140 `zh_cn`-specific `affix`
  rows have provisional Korean sibling fallbacks and are listed in
  `work/zh_cn/audit/affix-extra-variant-review.tsv`; review them before
  treating the text as final.
- `src/lang/locatexts_en_us.koalocatext_{affix,base,default}` are byte-identical
  to the original archive's English resources, not the final Korean
  binaries. The Korean comparison PAK's corresponding resources are separate
  reference artifacts. Do not claim the distributable localization binaries
  have been generated.
- The historical Korean comparison PAK differs from the inspected original
  by 34 files: three localization binaries, 30 font resources, and
  `locatexts_en_us.characterset`. The current `zh_cn` test payload instead
  contains three localization binaries and 29 Noto font resources; it omits
  both `fontlist_common.koafontlist` and the characterset. The user confirmed
  in-game Korean rendering for that tested setup, and the original
  `fontlist_zh_cn.koafontlist` references the Noto font.
- A release is a patch delta, not a standalone PAK. Each user must unpack
  their own complete original `data/patch_0.pak`, overlay the current test
  payload, and build a complete PAK with the game's tools. Confirm that the
  source game version matches the version used to prepare the delta.
- `locatexts_en_us.characterset` is absent from the original PAK and present
  in the Korean comparison PAK. Its format, purpose, and generation method
  remain unknown. Preserve the reference file as-is; do not synthesize or
  edit it.
- No final localization binaries or rebuilt PAK have been produced, and no
  rebuilt PAK has been tested in-game. Do not describe the package as
  verified until output archive validation and representative game checks
  pass.
- In `tools/loc_toolset/`, the three unpackers were changed to decode strings
  as UTF-8; the three repackers remain unchanged. No-edit CSV round trips
  passed for `base`, `default`, and `affix`, and one Korean `base` string
  survived a repack/re-extract check. This does not validate full PAK building
  or in-game behavior.
- Known pre-existing differences before `default` ID 64150 include 34
  newline-count and 57 runtime-marker-order differences between the Japanese
  draft and its template/source comparison. Review these individually; do not
  bulk-normalize them.
- The translation map and working `default` CSV differ at IDs 51421, 51603,
  and 63500. Treat the working CSV as the current draft and preserve these
  differences until the user resolves them; do not resynchronize blindly.
- Run the matching resource-specific repacker only after the relevant review
  and structural gates pass. Keep build outputs separate from source and
  working files.
- Do not unpack, repack, build, replace, or install a game PAK unless the user
  explicitly requests that operation.

## Current User-Directed Sequence

The translation drafts are complete, but the consolidated linguistic review
is pending. Two read-only review/edit batches exist for `default` IDs 0-49
and 50-99; they are not a full-resource review or user sign-off. The user has
set these preparatory steps before the consolidated review:

1. Create this `PROJECT-AI.md` with project instructions.
2. Update the bilingual `README.md` introduction, project context, and source
   links (completed 2026-10-07; the user plans further README updates).
3. Resolve the distribution gates in `DISTRIBUTION_CHECKLIST.md`, prepare
   the distribution candidate, and document its installation/application
   procedure.
4. Publish the project to GitHub.
5. Resume the consolidated translation review.

Do not create a release package, initialize or change Git/GitHub, publish
files, or begin the consolidated review ahead of this sequence without the
user's explicit direction. Complete one step at a time and report its scope
and validation before moving on.

Because the user-directed sequence prepares a distribution before the
consolidated review, label any pre-review package as an unreviewed candidate.
Do not represent it as linguistically approved; later accepted review findings
may require rebuilding the package and updating its release notes.
