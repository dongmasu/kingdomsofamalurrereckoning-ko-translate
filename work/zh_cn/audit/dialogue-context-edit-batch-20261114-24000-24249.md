# Dialogue Context Translation Edit Batch: IDs `24000`-`24249`

- Date: 2026-11-14.
- Rechecked every correction candidate in the range against the current
  English, Japanese, Chinese, and Korean rows. English established meaning,
  Japanese guided voice and register, and Chinese provided supporting
  evidence.
- Applied 16 supported corrections in the range; `24154` already had the
  complete `Elemental Cloak` pairing. The evidence-limited address at `24024`
  remains held.
- Also corrected 21 linked IDs: three matching action objectives, 17
  identical `Maire, Queen of Cups` labels, and the exact `Skyblossom` spelling
  at `50873`. The matching `Maire` label at `21023` was already aligned.
- No speaker identity or dialogue order was inferred from asset associations.

## Applied Corrections

| ID(s) | Correction |
| --- | --- |
| `24037` | Changed the quest objective to the established `-하기` action form. |
| `20541`, `24041`, `25128` | Aligned the identical `Talk to Ost Ordura` objectives as `오스트 오르두라(Ost Ordura)와 대화하기`. |
| `24050`, `42745` | Aligned the identical sprite-killing objectives as `스프라이트 모두 처치하기`. |
| `24055` | Added the grammatical link in `예정된 자들(Preordained)의 광신도들`. |
| `24092`, `24109` | Paired each complete Flawless Mitharan item label with its exact English name. |
| `24114` | Clarified that the card can be either an ill omen or a blessing, retaining the death prediction and the thought that death can end a conflict. |
| `24125` | Paired the complete creature/rank name as `니스카루 군주(Niskaru Lord)`, preserving the surrounding account and paragraph breaks. |
| `50873` | Corrected `Sky Blossom` to the exact source spelling `Skyblossom`; `24136` and `17683` already matched. |
| `24138` | Rephrased the awkward path-marker metaphor as suffering and tragedy accompanying the path to understanding. |
| `24155` | Changed the travel objective to the established `-하기` form. |
| `1590`, `1791`, `3885`, `4027`, `5429`, `7079`, `8190`, `10729`, `13041`, `15037`, `22673`, `24172`, `25684`, `25823`, `27984`, `28151`, `30613`, `32542` | Aligned all 18 exact-source `Maire, Queen of Cups` labels as `컵의 여왕 메어(Maire, Queen of Cups)`. `21023` already used that form. |
| `24206` | Changed “why do you remain?” to “why are you still alive?”, supported by the SQ04 context and Japanese `生き残っている`. |
| `24214` | Replaced the awkward calque `잘 말했어` with the natural acknowledgment `맞는 말이야`. |
| `24237` | Added the full English pairing for `Motus Mining Outpost`. |
| `24240` | Rendered the group as `먼지의 자식들(Children of the Dust)` and smoothed the conversational sentence. Other English forms without `the` were not globally normalized. |
| `24246` | Recast Airmer's full introduction in consistent conversational plain speech, retaining both knightly titles and names. |

## Verification

- Refreshed only the 37 changed IDs' `source_fingerprint` values; all other
  ledger fields, rows, and bytes were preserved.
- The ledger validates all 65,135 IDs against the current four language
  tables. The quest index and both context catalogs reproduce byte-for-byte.
- The default CSV retains its UTF-8 BOM, 65,135 ordered rows, and existing
  71,845 CRLF / 244 LF-only newline inventory.
- The 11 CSV-preservation tests and nine context-index tests passed.
- `git -c core.whitespace=cr-at-eol diff --check` passed.

The next sequential candidate range is `24250`-`24499`.
