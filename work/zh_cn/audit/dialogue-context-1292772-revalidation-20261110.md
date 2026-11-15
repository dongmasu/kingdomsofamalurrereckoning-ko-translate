# Drowned Forest Asset / `1292772.quest_bxml` Revalidation

- Date: 2026-11-10.
- Scope: all 70 `default` keys found in `1292772.quest_bxml`.
- English controls meaning; Japanese is the primary style/register reference;
  Chinese is supporting evidence.
- This is an expanded, asset-based review beyond the 56 priority assets.
  Findings are proposals or holds; no translation CSV was changed.

## Grouping Evidence and Limits

The asset has no extracted `QUEST_ID`. It contains the asset-level symbol
`NPC_KLU_DOK_LucentPrinn` and 87 serialized `dialog_line_*` handlers whose
generated names refer to `NQD_Region_DrownedForest`. These are asset- and
scene-level clues only: no localization key is mapped to a specific speaker,
handler, branch, or playback position. Individual speaker attribution and
dialogue order therefore remain unknown.

The 70 keys cover Drowned Forest and its swamp, the murghan and banshaen,
Mel Senshir, Adessa's Livrarium, a field surgeon, soldiers, and other
travelers. Content review treated 53 sentence-like rows as dialogue or
dialogue-like text and 17 proper-name, location, creature, or term labels as
non-dialogue for voice fields. This content classification does not establish
which asset character, if any, voices a particular row.

## Findings

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `8737` | Naturalness | `이 늪에 나오게 되어 거의 기뻐` is an awkward literal rendering of “almost glad to be out here.” English and Japanese express an unexpectedly positive feeling about coming to the swamp. Consider `이상하게 들릴지 모르지만, 이 늪에 온 게 오히려 다행이라고 생각할 정도야.` | Medium-high |
| `14824` | Naturalness / sentence structure | The last clause ends in connective `됐고` even though the source is a complete self-contained recollection. Japanese also ends the thought. Consider `한때는 스콜리아 아르카나(Scholia Arcana)의 촉망받는 수재였어. 크게 될 인물이었지. 하지만 라시르(Rathir)에서 한 번 경솔한 실수를 저지른 뒤로는 이렇게 야전 외과의로 일하고 있어.` | Medium |
| `18398` | Naturalness | `그는 비밀이 많고 혼자 지내지만` is understandable but stiff. Japanese describes someone who does not reveal much and keeps to himself. Consider `속내를 잘 드러내지 않고 혼자 지내는 사람이지만, 뭔가 특정한 걸 찾는 것 같아.` | Medium |
| `40009` | Naturalness | `그게 거기 있다는 건 확실하고, 멀지도 않아` follows English word order too closely. The voices establish that the unnamed thing is nearby. Consider `목소리가 들렸으니, 틀림없이 가까이 있어.` This avoids guessing the referent. | Medium-high |

## Holds

| ID | Dimension | Evidence and disposition | Confidence |
| ---: | --- | --- | --- |
| `39552` | Speech level | Korean offers treatment in deferential `-겠습니다`; Japanese uses plain `治療しよう`. This could be a customer-facing register choice, and the speaker is not mapped. Do not normalize without stronger speaker or scene evidence. | Uncertain |
| `50417` | Speech level | Korean `조심하게` uses a marked `-하게` command, while Japanese `用心してゆけよ` is plain. English “Take heed” can also sound deliberately grave. With no speaker or scene mapping, retain the line pending context. | Uncertain |

## Repeated Text and Formatting

Five exact-English duplicate groups occur within the 70 keys:

- `Sinon Carrag`: `18986`, `47527`
- `Drowned Forest`: `20973`, `22636`, `30571`
- `Banshaen`: `50699`, `52846`
- `Murghan`: `57118`, `59487`, `61938`
- `Mel Senshir`: `57949`, `59761`, `63551`

Each group has matching Korean, Japanese, and Chinese text. All 70 rows were
checked in English, Japanese, Chinese, and active Korean. No embedded line
breaks, brace tokens, or markup were found in any of the four locales.

The complete sorted ID set is:

`88`, `2936`, `3413`, `5719`, `5786`, `6852`, `7743`, `8737`, `9965`,
`13088`, `13157`, `13353`, `13393`, `14493`, `14824`, `14877`, `15329`,
`16045`, `18398`, `18813`, `18986`, `19844`, `20973`, `22636`, `22926`,
`23927`, `24644`, `27976`, `28583`, `30571`, `30729`, `31669`, `32968`,
`33750`, `35266`, `37403`, `38529`, `39552`, `39559`, `40006`, `40009`,
`44250`, `45741`, `47043`, `47113`, `47484`, `47527`, `48214`, `48808`,
`50417`, `50495`, `50699`, `51136`, `52846`, `54037`, `54065`, `54900`,
`56031`, `57118`, `57949`, `58068`, `58879`, `59487`, `59761`, `61605`,
`61938`, `63551`, `64265`, `64898`, `65033`.

All 70 IDs and four-language fingerprints are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
The four correction candidates and two register holds remain separate from
approval to edit the Korean CSV.
