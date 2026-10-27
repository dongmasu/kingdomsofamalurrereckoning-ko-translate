# Korean zh_cn Release Snapshot: Fate Name Follow-up

Date: 2026-10-28 (JST)

## Package

- Official tag: `KingdomsOfAmalur_Korean_zh_cn_20261028012803`.
- GitHub Release title: `Korean Patch - 2026-10-28`.
- ZIP: `dist/20261028012803/KingdomsOfAmalur_Korean_zh_cn_20261028012803.zip`.
- ZIP size: 5,512,547 bytes.
- ZIP SHA-256: `105ad96ea269f8fcb0376393510fc83f239e2ba9bdaa0834c5d32a3067ab1cf6`.
- This package supersedes the earlier 2026-10-28 release.
- The ZIP is a GitHub Release asset, not a Git-tracked file.

## Changes

- Standardized the approved Fate names `그림자술사(Shadowcaster)`,
  `만능가(Polymath)`, `올마스터(Universalist)`, and
  `전천후 전투가(Jack of All Trades)`.
- Kept `Jack of All Trades` distinct from `Polymath` and added the
  approved bilingual Fate names to related labels and descriptions.
- Updated the README download link to this package.

## Validation

- `python3 tools/test_apply_script.py`: 13 tests passed.
- `python3 -m unittest tools/test_replace_text_preserve_eol.py`: 4 tests
  passed.
- `tools/build.sh` passed CSV structure and immutable-sidecar checks for
  `affix` (3,451 rows), `base` (4,844), and `default` (65,135).
- All three generated binaries were re-extracted and matched their working
  CSVs.
- ZIP integrity passed with 37 entries: three localization binaries, 29 Noto
  font resources, launcher, installer, instructions, and checksum manifest.
  The common font list and characterset are omitted.
- Windows installation and in-game validation were not performed.

## Installation

Extract the ZIP and run `RunKoreanPatch.bat`. Select `Chinese Simplified`
after applying the patch; the internal locale remains `zh_cn`. The documented
game baseline is `cs:15032`.
