# Korean zh_cn Release Snapshot - Follow-up

Date: 2026-10-27 (JST)

## Package

- Official tag: `KingdomsOfAmalur_Korean_zh_cn_20261027233949`.
- GitHub Release title: `Korean Patch - 2026-10-27`.
- ZIP: `dist/20261027233949/KingdomsOfAmalur_Korean_zh_cn_20261027233949.zip`.
- ZIP size: 5,511,577 bytes.
- ZIP SHA-256: `15ee6fd6e47b2d813f9e2a457eab52892472f9e7017b8318057b1b9cb570cac1`.
- This follow-up package supersedes the earlier 2026-10-27 package
  `KingdomsOfAmalur_Korean_zh_cn_20261027232605`.
- The ZIP is a GitHub Release asset, not a Git-tracked file.

## Changes

- Completed the omitted Destiny-card stat rows for stun duration and damage
  while in stealth.
- Standardized the term as `기절 지속 시간`, placing each percentage after
  the stat name; retained the unused row's `[사용 금지]` marker.
- Standardized `Damage While in Stealth` as `은신 중 피해량` and placed the
  percentage after the stat name.
- Documented the ID-scoped follow-up in
  `translation-edit-addendum-20261025.md`.

## Validation

- `tools/build.sh` passed 13 installer regression tests and CSV structure and
  immutable-sidecar checks for `affix` (3,451 rows), `base` (4,844), and
  `default` (65,135).
- All three generated binaries were re-extracted and matched their working
  CSVs.
- ZIP integrity passed with 37 entries: three localization binaries, 29 Noto
  font resources, launcher, installer, instructions, and checksum manifest.
  The common font list and characterset are omitted.
- Four line-ending preservation tests passed. Exact ID-scoped replacements
  preserved the CSV's BOM and mixed line endings.
- Windows installation and in-game validation were not performed.

## Installation

Extract the ZIP and run `RunKoreanPatch.bat`. Select `Chinese Simplified`
after applying the patch; the internal locale remains `zh_cn`. The documented
game baseline is `cs:15032`.
