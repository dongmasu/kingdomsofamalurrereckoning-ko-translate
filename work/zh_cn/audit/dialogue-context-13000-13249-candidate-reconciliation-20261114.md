# Candidate Reconciliation: IDs `13000`-`13249`

- Date: 2026-11-14.
- Scope: all nine current candidates in this range, compared across English,
  Japanese, Chinese, and active Korean, with the linked Gallery and Maire
  title groups checked in the current CSV.
- Eight prior corrections were confirmed. ID `13140` was corrected to restore
  the sister relationship without selecting an older/younger reading.
- No speaker or playback order was inferred from asset membership.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `13000` | Previously applied, confirmed | The two-line item description correctly shows `장검 물리 피해 +13` and separately states a 30% damage increase; the embedded line break is preserved. |
| `13015` | Previously applied, confirmed | `미술관` matches the Gravehal Gallery context and the eight linked Gallery references. |
| `13031` | Previously applied, confirmed | `그리안 셰인 성주(Castellan Grian Shane)` pairs both the rank and name; the following `맹세의 칼날 그윈 안웨이(Oathblade Gwyn Anwy)` remains intact. |
| `13041` | Previously applied, confirmed | The current form `컵의 여왕(Queen of Cups) 메어(Maire)` follows the later accepted separate title/name pairing, matching the `King of Cups` pattern. |
| `13072` | Previously applied, confirmed | The visible passive label is consistently `[패시브]`; the display wrapper and line break remain intact. |
| `13120` | Previously applied, confirmed | The line says the followers remain silent after beginning to serve; it no longer adds the unsupported location `이곳에서`. |
| `13140` | Corrected | Restored that Lila is the speaker's sibling while avoiding the conflicting older/younger readings in Japanese and Chinese. The new wording follows the project's age-neutral `형제인` form. |
| `13148` | Previously applied, confirmed | `운에 버림받은 불쌍한 사람` retains the plea's idiomatic misfortune sense in conversational context. |
| `13208` | Previously applied, confirmed | `네게 돈만 있으면 팔아 줄게` turns the merchant's quip into natural teasing Korean while retaining the condition that the player has money. |

## Related Consistency

- The eight Gravehal `Gallery` references at `859`, `13015`, `15295`,
  `27146`, `28305`, `43735`, `53065`, and `60844` all use `미술관`.
- All 19 exact-English `Maire, Queen of Cups` labels use
  `컵의 여왕(Queen of Cups) 메어(Maire)`: `1590`, `1791`, `3885`, `4027`,
  `5429`, `7079`, `8190`, `10729`, `13041`, `15037`, `21023`, `22673`,
  `24172`, `25684`, `25823`, `27984`, `28151`, `30613`, and `32542`.
  This separately paired form supersedes the earlier proposal to combine the
  title and personal name in a single English parenthetical.
- The `13072` passive label remains aligned with the accepted UI form
  `[패시브]`.

## Verification

- All nine in-range candidates are reconciled; cumulative reconciliation is
  764 / 4,015 (19.03%), with 3,251 remaining.
- Only `default:13140` was edited in this pass, using the ID-guarded
  EOL-preserving CSV tool. Its four-language fingerprint was refreshed.
- The full review ledger validates all 65,135 reviewed IDs; the generated
  quest-asset index and both catalogs reproduce exactly.
- CSV-preservation tests: 11 passed; dialogue-context index tests: 9 passed.
- The active default CSV retains 65,135 ordered rows and its UTF-8 BOM.
  Newline inventory: 71,838 CRLFs, 244 LF-only separators, and no bare CRs.
- CRLF-aware `git diff --check` passed. No source CSV or extracted asset was
  changed.
