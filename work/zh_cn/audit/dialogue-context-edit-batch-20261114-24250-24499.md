# Dialogue Context Translation Edit Batch: IDs `24250`-`24499`

- Date: 2026-11-14.
- Rechecked all 18 correction candidates against the current English,
  Japanese, Chinese, and Korean rows. English established meaning, Japanese
  guided voice/register, and Chinese provided supporting evidence.
- Applied all 18 supported corrections and four linked-ID updates. Five
  evidence-limited findings remain held.
- No speaker identity or dialogue order was inferred from asset associations.

## Applied Corrections

| ID(s) | Correction |
| --- | --- |
| `24256` | Clarified that the Warsworn would be retained by paying in advance to secure their availability; kept the cost-effectiveness conclusion. |
| `24282` | Made the addressee the person who risks trouble if the speaker is discovered, as stated by English and Chinese. |
| `24314` | Changed the polite ending to a direct conversational instruction, retaining the blessing. |
| `24326` | Replaced literal physical kicking with driving the refugee away, supported by Japanese. |
| `24345` | Corrected `blade` to the sword pulled from the rock and retained the paired Tywili Coast name. |
| `24349`, `1312` | Standardized the `Steward of Tinctures and Elixirs` title as `팅크제와 영약 관리인(Steward of Tinctures and Elixirs)`; `6072` already used the established form. |
| `24354` | Removed the redundant armor phrase `장갑 흉갑` and clarified the flexible chestpiece description. |
| `24356` | Recast Fynn's complete self-introduction in consistent conversational plain speech while retaining his rank, unit, and military action. |
| `24359`, `37473` | Replaced the inconsistent literal `거대한 등뼈` / `대척추산` with the paired place name `그레이트 스파인(Great Spine)`. |
| `24422` | Corrected `charter` to `칙허장` and made the consequence of burning it natural Korean. |
| `24433` | Standardized `imprisonment spell` as `감금 주문(imprisonment spell)` and rendered the awaited magic words naturally. |
| `24436` | Paired the complete `Flawless Mitharan Flamed Bindings` item label. |
| `24448`, `4446`, `25441` | Standardized this quest's `heartvine(s)` references as `하트바인`, consistent with the other same-plant references. |
| `24469` | Paired the complete `Flawless Mitharan Prosperous Lining` item label and clarified the Korean item-name construction. |
| `24471` | Strengthened the mild `건달` to `비겁한 놈들`, supported by Japanese and Chinese. |
| `24485` | Used the Japanese-supported `라이라(Lyra)` form for this reference. Other Lyra characters were not conflated. |
| `24488` | Corrected `Kollossae households` from noble `가문들` to the homes of Kollossae residents. |
| `24494` | Removed unsupported groaning and retained the boy's restless sleep, muttering, and frightening dreams. |

## Holds

The meaning of `blarmy` (`24366`), the referent of `Tilera` (`24372`), the
mechanic in `encounter hit` (`24417`), the relationship implied by `Dear
Prickly Bear` (`24440`), and the identity/title of `the First` (`24455`)
remain unresolved because the available sources do not settle them.

## Verification

- Refreshed only the 22 changed IDs' `source_fingerprint` values; all other
  ledger fields, rows, and bytes were preserved.
- The ledger validates all 65,135 IDs against the four current language
  tables. The quest index and both context catalogs reproduce byte-for-byte.
- The default CSV retains its UTF-8 BOM, 65,135 ordered rows, and existing
  71,845 CRLF / 244 LF-only newline inventory.
- The 11 CSV-preservation tests and nine context-index tests passed.
- `git -c core.whitespace=cr-at-eol diff --check` passed.

The next sequential candidate range is `24500`-`24749`.
