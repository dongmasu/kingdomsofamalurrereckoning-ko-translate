# Dialogue Context Translation Edit Batch: IDs `20500`-`20749`

- Date: 2026-11-14.
- Rechecked candidate rows against current English, Japanese, Chinese, and
  Korean. English was used for meaning, Japanese for voice/register, and
  Chinese as supporting evidence. No speaker or playback order was inferred.
- Applied seven in-range corrections. Existing ledger dispositions were
  retained; fingerprints were refreshed for the seven changed IDs.

## Applied Corrections

| ID | Correction |
| ---: | --- |
| `20504` | Added the source label to the standalone curse title: `갑옷 분쇄의 저주(Curse of Armorcrush)`. |
| `20529` | Changed the unsupported first-person intent to the source-supported prediction that the matter will soon be over. |
| `20622` | Standardized `Blacksmithing skill` as `대장기술`; the recipe and its blank-line layout remain unchanged. |
| `20674` | Recast the collection objective in the established compact action form: `농민 옷 모으기`. |
| `20675` | Removed the abrupt `-나`/casual register switch and made the request conversational. |
| `20704` | Recast `where you stand with a gnome` as knowing gnomes are trustworthy, preserving the following explanation about their lack of time for lies. |
| `20713` | Added the complete source label while retaining the existing Korean title: `수석 안내인 리아나(Master Guide Liana)`. |

## Retained Or Cleared

- `20577` already had the complete `High Fulgen` pairing and was retained.
- `20671` was cleared without a CSV edit: English `In other times` and
  Japanese `普通` support the current `평소라면`; the Chinese past-time
  reading alone does not justify changing it.
- `20742` was retained as `사그렐 부인(Lady Sagrell)`, consistent with the
  prior full Sagrell review. The newer `여사(Lady Hartwen)` decision was
  specific to Hartwen and was not generalized to other characters.
- Evidence-limited holds remain at `20502`, `20573`, `20576`, `20615`,
  `20638`, `20657`, `20696`, and `20726`.

## Verification

- The review ledger validates all 65,135 IDs against the four current
  language tables.
- The CSV retains its UTF-8 BOM, 65,135 ordered records, 71,845 CRLFs, and
  244 LF-only newlines. The recipe at `20622` retains its blank line and
  ingredient layout.
- The 11 CSV-preservation tests and nine context-index tests passed (20 total).
- `git -c core.whitespace=cr-at-eol diff --check` passed.
- Current CSV SHA-256:
  `3439fae9ef6f8561b16d7e2d008900d72b5ec78486015b40cc4e802933267626`.
- Current ledger SHA-256:
  `1c9c35c29f40dc3d2c78def291f2dc85d95a2bac5004f0bb986c7af6ed952535`.

The next sequential application range is `20750`-`20999`.
