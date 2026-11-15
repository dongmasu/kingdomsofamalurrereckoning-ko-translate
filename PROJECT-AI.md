# AI Project Instructions

## Work Order

- Complete multiple user requests one at a time in the order received unless
  the user specifies another priority.
- Do not start later work in parallel before the preceding task is complete.
- Add new requests, reports, and status questions to the queue; do not let
  them interrupt or replace the task in progress.
- Follow explicit instructions such as "stop" or "handle this first."

## Project

This project creates a Korean localization for *Kingdoms of Amalur:
Re-Reckoning*. The game's original archive has no `ko_kr` localization slot.
The active Korean working CSVs are in `work/zh_cn/` and use the `zh_cn`
resource structure as the target slot. Their Korean text was migrated from
the Japanese-derived draft; the previous `work/ja_jp/` draft was deleted at
the user's direction on 2026-10-14. The user wants to keep `en_us` available.
The sequential `default` review is complete through ID 65134, and all
zh_cn-specific `affix` variants have recorded dispositions. The user-approved
package is published as an official, non-prerelease GitHub Release. The
recorded in-game check is a smoke test, not comprehensive compatibility
coverage.

## Source of Truth

- `src/` contains immutable source CSVs and assets. Never edit, rename, move,
  or regenerate anything under `src/`.
- `references/` is read-only research material. Only
  `references/README.md` and `references/manual/` are intended for Git; the
  rest is Git-ignored. Do not edit, rename, move, or add generated files under
  `references/`. The README may be updated to document the corpus.
- `references/data/unpacked/` contains extracted game assets, including quest,
  interaction, localization, and FaceFX resources. Inspect this corpus before
  concluding that game assets are unavailable or asking the user to provide
  them; use it for analysis without modifying anything under `references/`.
- `work/zh_cn/` contains the active Korean working CSVs and audit materials.
- `work/ja_jp/` was deleted at the user's direction on 2026-10-14. Historical
  audit references to it describe the former migration draft.
- `tools/loc_toolset/` contains the project's CSV unpackers and repackers.
  Change tooling only when explicitly requested; verify any change with
  no-edit round trips.
- `README.md` is the user-facing project overview. Edit it only when the user
  explicitly asks.
- [`DISTRIBUTION_CHECKLIST.md`](DISTRIBUTION_CHECKLIST.md) records the released
  package, its validation scope, and optional follow-up checks.

## Translation Workflow

Follow [`TRANSLATION-ROLE.md`](TRANSLATION-ROLE.md) for all translation
workflow, review, editing, and verification instructions.

## Build Safety

- The inspected original `patch_0.pak` came from the user's Steam installation.
  The user confirmed that the game's main menu displays `Version: cs:15032`;
  use this as the source-game baseline. Steam AppID `1041720`, BuildID
  `10619381` in that installation's `appmanifest_1041720.acf` is secondary
  provenance information. This does not establish that a rebuilt PAK works
  in-game or that other game versions are compatible.
- The user selected `zh_cn` as the Korean work/destination to keep
  English available. `work/zh_cn/` follows the exact `zh_cn` CSV structure.
  The `ko_kr` experiment displayed `Invalid LOC Key` and crashed when
  selected; its cause remains unidentified. The supported release continues
  to use `zh_cn`.
- A 2026-10-06 key comparison found the work `base` (4,844 rows) and
  `default` (65,135 IDs) structures match `en_us`, but the work `affix` has
  3,311 Japanese-template variants while `en_us` has 586 `FF` rows. Do not
  repack the current work `affix` as `en_us`; reconcile and verify it against
  the selected target first. Russian also differs from the scaffold in
  `base` and `affix`.
- The migration preserved the exact `zh_cn` key sets and order: `base` 4,844,
  `default` 65,135, and `affix` 3,451 rows. All 140 `zh_cn`-specific `affix`
  variants have recorded dispositions in
  `work/zh_cn/audit/affix-extra-variant-review.tsv`.
- `src/lang/locatexts_en_us.koalocatext_{affix,base,default}` remain immutable
  English reference binaries. Korean `zh_cn` localization binaries were
  generated for the release package and passed CSV round-trip checks.
- The `zh_cn` release payload contains three localization binaries and 29
  Noto font resources; it omits `fontlist_common.koafontlist` and the
  characterset. The user confirmed in-game Korean rendering for the tested
  setup, and the original `fontlist_zh_cn.koafontlist` references the Noto
  font.
- A release is a patch delta, not a standalone PAK. Each user must unpack
  their own complete original `data/patch_0.pak`, overlay the release
  payload, and build a complete PAK with the game's tools. Confirm that the
  source game version matches the version used to prepare the delta.
- The release ZIP's localization binaries passed build-time round-trip and
  archive integrity checks. The user reported Korean rendering in the
  zh_cn setup without the characterset or common font list. Windows installer
  behavior, broad UI coverage, long-play behavior, and compatibility with
  other game versions remain unverified; do not imply those checks were run.
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

## Current Status

The sequential `default` review is complete through ID 65134. The historical
global tally's unidentified 987-key membership was closed at the user's
direction as an unrecoverable accounting limitation; it is not an open review
scope and must not trigger duplicate review or recounting. The package was
published to GitHub and promoted to an official, non-prerelease Release at the
user's direction. If later accepted translation edits are made, rebuild and
validate a replacement package before superseding that release.
