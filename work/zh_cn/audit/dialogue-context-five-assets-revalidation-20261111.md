# Five Asset Revalidation

- Date: 2026-11-11.
- Scope: 57 unique `default` IDs across five previously unrecorded assets.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Twelve correction-candidate IDs were recorded. No evidence-limited holds
  and no translation CSV changes.

## Grouping Evidence and Limits

`749750.quest_bxml`, `749752.quest_bxml`, and `749754.quest_bxml` contain
eleven IDs each. Their serialized handlers carry the respective prefixes
`FFQ23_A`, `FFQ23_B`, and `FFQ23_C`; each asset contains two quest-target
handlers, one main handler, and one `dialog_line_*` handler. None contains an
explicit `QUEST_ID` or `NPC_` symbol. These prefixes group three related
Hera Orhelm bounty-contract variants, but do not map any key to a speaker,
callback, branch, or playback order.

`1539079.quest_bxml` contains twelve IDs and conditional-handler names with a
`KVSQ06` prefix for a ledger, three quest targets, and the main quest. It has
no explicit `QUEST_ID`, `NPC_` symbol, or `dialog_line_*` handler. Its keys
are quest, journal, objective, title, and status text.

`1991469.quest_bxml` contains twelve IDs and `DLC2_SQ14` conditional quest
handlers for four targets and the main quest. It has no explicit
`QUEST_ID`, `NPC_` symbol, or `dialog_line_*` handler. Its keys are quest,
journal, objective, item-label, and status text.

All 57 rows were compared in English, Japanese, Chinese, and active Korean.
The shared Hera-death journal entry at `12725`, `38546`, and `31636` already
matches in Korean. Repeated quest-complete and quest-failed labels also
match. No embedded line breaks, runtime placeholders, or markup were found.
The quest assets do not establish a dialogue turn sequence.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `34765`, `23465`, `11896` | Consistency / naturalness | These three bounty-completion entries have the same English sentence structure and identical Japanese and Chinese wording, changing only the family name. Korean varies in sentence construction and register (`도왔다`, `힘을 보탰어`, `힘을 보탰다`) and in the rendering of `grave threat`. Align them using one natural journal-style sentence, e.g. `화이트스톤(Whitestone) 주민과 아포타이어(Apotyre) 전역을 위협하던 세력을 없애는 데 힘을 보탰다. [가문명]의 범죄 행각은 이제 끝났다.` Preserve each family's correct name. | High |
| `59562`, `37117`, `18874` | Consistency / objective style | The parallel `Terminate the [family] family` objectives use three different Korean constructions: `처단`, `제거하라`, and `처치`. Use one concise objective form across all three, such as `[가문명] 처단하기`; this also follows the established `-하기` objective style. | High |
| `13476` | Naturalness / status style | The contract-failure notice ends formally (`사망했습니다`, `이행할 수 없습니다`), unlike its terse English, Japanese, and Chinese counterparts and the surrounding plain-style quest records. Consider `계약 당사자 중 한 명이 죽었다. 이 계약은 더는 이행할 수 없다.` The wording is also comparable to the previously reviewed contract-failure entry `32309`; that ID is a comparator, not part of this asset's 12-key set. | High |
| `38771`, `40630`, `52812` | Consistency / naturalness | The parallel `Found Idol`, `Found Hammer`, and `Found Brooch` labels are rendered `발견한 우상`, `망치 발견`, and `찾은 브로치`. Japanese and Chinese identify the same short found-item labels. Align their Korean form, for example `찾은 우상`, `찾은 망치`, and `찾은 브로치`. | Medium-high |
| `5971` | Naturalness | Japanese `悲しい話さ` is a casual “It's a sad story” opening, while Korean `슬프군` sounds stiff beside the line's conversational endings. Consider a more conversational opening such as `슬픈 얘기야.` No speaker identity is inferred from the asset's handler. | Medium-high |
| `23446` | Speech level / naturalness | The reward dialogue is conversational in Japanese and Chinese and mostly casual in Korean, but `일 처리하는 법을 아는군` shifts into a stiff `-군` ending between `대단하네` and `좋겠어`. Consider `일 처리하는 법을 아는구나` or another consistently conversational phrasing. The asset does not identify the individual speaker. | High |

## Retained Text

The other 45 rows were retained after source comparison. The three repeated
quest-completion and quest-failure labels in the FFQ23 variants are already
consistent. `The Darkvari`, `The Cynrics`, and `The Zungars` are translated as
their respective family names; singular/plural wording and parenthetical
English forms vary with the exact source string. The objectives to return to
Hera Orhelm, recover the Grinning Vane armband, and return the sewer
heirlooms are semantically supported by the language references.

## Complete ID Sets

- `749750.quest_bxml` (`FFQ23_A` handler prefix): `4724`, `11398`, `12725`,
  `21063`, `30987`, `34765`, `37621`, `48597`, `58410`, `59562`, `61445`
- `749752.quest_bxml` (`FFQ23_B` handler prefix): `5971`, `13566`, `17392`,
  `22757`, `23465`, `34889`, `37117`, `38546`, `48235`, `52761`, `55204`
- `749754.quest_bxml` (`FFQ23_C` handler prefix): `1486`, `5737`, `11267`,
  `11896`, `16039`, `18874`, `23446`, `31636`, `44682`, `55388`, `57200`
- `1539079.quest_bxml` (`KVSQ06` handler prefix): `6603`, `9138`, `11961`,
  `21418`, `21994`, `25808`, `40213`, `40915`, `43544`, `52139`, `53241`,
  `65044`
- `1991469.quest_bxml` (`DLC2_SQ14` handler prefix): `6068`, `7906`,
  `13476`, `20484`, `32761`, `36453`, `38771`, `40630`, `43995`, `52812`,
  `54961`, `56933`

All 57 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
