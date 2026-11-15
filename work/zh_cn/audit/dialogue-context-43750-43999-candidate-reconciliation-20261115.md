# Candidate Reconciliation: IDs `43750`-`43999`

- Date: 2026-11-15.
- Rechecked the 18 candidates currently marked in this range against English,
  Japanese, Chinese, the active Korean CSV, and earlier findings. English
  anchors meaning; Japanese is the primary voice and style reference; Chinese
  is supporting evidence.
- The earlier sequential report listed 19 candidates, including `43799` and
  `43838`; those Korean rows already contain the supported corrections and
  are not current candidates. ID `43918`, which the earlier report cleared,
  remains a candidate in the current ledger and was re-evaluated below.

## Candidate Decisions

| IDs | Result |
| --- | --- |
| `43760`, `43768`, `43773`, `43791`, `43795`, `43849`, `43875`, `43894`, `43919`, `43926`, `43941`, `43966`, `43974` | Retained as already correct. The current text has the requested name/title pairing, natural plain speech, supported meaning, or natural rarity wording. |
| `43811` | Changed the archaic 하오체 greeting to natural plain speech, matching the direct Japanese wording. |
| `43873` | Changed the greeting from marked 하오체 to the casual `안녕.`, supported by Japanese `どうも` and Chinese `你好啊`. |
| `43918` | Rechecked rather than relying on the earlier clearance. English and Japanese address the Templar directly and make a defiant promise; replaced the stilted subject-style sentence with `성전사, 두고 봐. 맹세할게.` |
| `43954` | Replaced the marked 하오체 question with natural direct speech, retaining the address and paired title. |
| `43984` | Added the missing creature-type pairing `불의 스프라이트(Fire Sprite)`; the warning itself was retained. |
| `60899` (linked) | Aligned the same Fire Sprite type and corrected the quest objective to the established `-하기` form: `불의 스프라이트 챔피언(Fire Sprite Champion) 처치하기`. |

## Linked Terminology Checks

- `43984` and `60899` both refer to the Fire Sprite type. Other Sprite labels
  use the established `스프라이트(Sprite)` form; the linked objective now
  uses the full source name and keeps its action-objective style.
- `43919` uses `흔하지 않은` for `Infrequent`, matching `14967`. ID `14967`
  was already reconciled in its earlier range and was not counted again.
  The inventory rarity label at `35567` uses the corresponding noun form
  `흔하지 않음`.
- `43799` already reads `잘 지내, 낯선 이.`, and `43838` already preserves
  the conditional meaning of convincing Hillared; neither needed another
  edit.
- No speaker attribution or dialogue order was inferred from asset
  associations.

## Changes and Verification

- Korean rows `43811`, `43873`, `43918`, `43954`, `43984`, and linked
  candidate `60899` changed using the line-ending-preserving CSV tool.
- The 18 current in-range candidates and linked candidate `60899` were
  reconciled. Linked `14967` was already counted. Cumulative candidate
  reconciliation is 2,954 / 4,028 (73.34%), with 1,074 remaining.
- The active CSV retains 65,135 ordered records and its UTF-8 BOM, with
  71,839 CRLF record endings, 242 LF-only separators, and no bare CR.
- All 65,135 review-ledger fingerprints, index/catalog reproducibility checks,
  11 CSV-preservation tests, nine dialogue-context tests, and the CRLF-aware
  diff check passed.
- No immutable source CSV, extracted game asset, or game binary was changed.
  No commit was made.
