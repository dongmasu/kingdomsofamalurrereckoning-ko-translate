# Asset Revalidation: `747925.quest_bxml` (`FFQ24`, Apotyre Death Notices)

- Date: 2026-11-11.
- Scope: all 86 `default` IDs linked to this asset; all 86 are newly recorded.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Sixteen correction-candidate IDs are recorded. No translation CSV or
  extracted game asset was changed.

## Context Evidence and Limits

The BXML explicitly identifies `QUEST_ID FFQ24`, six NPC symbols, and 42
`dialog_line_*` handlers. The localization text concerns delivery of death
notices to soldiers' families in Apotyre and related conversations. The BXML
association supports this quest/topic grouping, but does not map individual
localization IDs to a speaker, handler, branch, addressee, or playback order.
Speaker attribution therefore remains unassigned and dialogue order unknown.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `285`, `9118`, `31466` | Name consistency / format | The English role and name are `Squire Coran`. Korean alternates between `종자 코란(Coran)`, `종자 코란` and `코란 종자`, omitting the English role and varying word order. Use `종자 코란(Squire Coran)` at the first reference in each row and preserve natural particles. A cross-asset search also found the same abbreviated form at IDs `2276` and `36949`; those IDs are not part of this asset's 86-ID ledger addition and remain a separate follow-up. | High |
| `37731` | Name / format | `The Leaf` is a proper short name for the Luminary Leaf bookstore. Other rows in the same resource use `루미너리 리프(Luminary Leaf)`, while this row says only `리프`. Consider `리프(The Leaf)` here to retain the source's short form and provide the English pairing. | High |
| `15221` | Meaning | “Went for the war, too” does not explicitly say Tak volunteered, but Korean says `전쟁에도 자원했어`. Japanese likewise says he went to war and could not stay away from it. Consider `전쟁에도 나갔어` to avoid adding a specific act of volunteering. | Medium-high |
| `34113` | Naturalness / meaning | `손위 형제` is an unnatural calque. English only says `my brother`, while Japanese specifies an older brother; the speaker is not established, so do not select a gendered Korean sibling term. Consider `하지만 내가 반대한 건 형제를 집에 남겨 두고 안전하게 지키고 싶어서였어.` | Medium-high |
| `60646` | Meaning / naturalness | `baby brothers` is clarified by Japanese `弟たち` as younger brothers, not necessarily children. `세상의 어린 동생들` can instead imply that all of them are young. Consider `홀로 구덩이에 묻히는 세상의 모든 남동생을 위해` while retaining the line's grief and resolve. | Medium-high |
| `22772`, `30277`, `58764` | Name / format | The Korean refers to Ram without the English pairing in these rows. Add `램(Ram)` at the first reference in each row, following the project's row-scoped name-pairing convention. | High |
| `31767`, `40382`, `49205` | Name / format | The Korean refers to Joanne without the English pairing in these rows. Add `조앤(Joanne)` at the first reference in each row. | High |
| `48231` | Name / format | The English character/title label `The Messenger` is rendered only as `전령`. Consider `전령(The Messenger)` if this is intended as the named title rather than a generic role; the Japanese and Chinese renderings alone do not settle that distinction. | Medium |
| `44468` | Speech level | Korean uses polite `있나요?`, while the Japanese asks conversationally (`探しているのかい？`). Consider a conversational form such as `특별히 찾는 사람 있어?`. Individual speaker identity remains unknown. | Medium |
| `59300` | Speech level / naturalness | Korean shifts within one utterance from `하겠다` / `보상하지` to `될 거야`; Japanese keeps a consistent plain, solemn register. Recast the whole utterance in one register rather than changing only the final clause. | Medium-high |

## Repeated Text and Structure

Four exact-English duplicate groups cover eight rows: `Mal Dydyn` (`5697`,
`21308`), `Tak Edstar` (`13092`, `47573`), `Ram Leodwald` (`15875`,
`29080`), and `Joanne Gortan` (`24088`, `56633`). Korean is identical within
each group. All 86 IDs have matching four-language line-break, runtime-token,
and markup signatures.

## Complete Asset ID Set

`67`, `116`, `285`, `1516`, `2260`, `2461`, `3322`, `3985`, `4384`, `5697`,
`6168`, `6751`, `7756`, `8273`, `8820`, `9118`, `11117`, `12031`, `13092`,
`13245`, `14162`, `15221`, `15875`, `16744`, `16770`, `17752`, `17847`,
`19560`, `21308`, `21453`, `21712`, `22493`, `22695`, `22767`, `22772`,
`23856`, `24088`, `25119`, `26704`, `28518`, `29080`, `29212`, `29335`,
`29506`, `30277`, `30285`, `30793`, `31466`, `31767`, `32086`, `34113`,
`36475`, `37597`, `37731`, `38363`, `38851`, `39298`, `39530`, `40382`,
`40411`, `41478`, `41852`, `42235`, `44468`, `45077`, `46050`, `46898`,
`47573`, `48231`, `49205`, `50450`, `51729`, `52439`, `52659`, `52949`,
`53360`, `55933`, `56633`, `57854`, `58764`, `59283`, `59300`, `60646`,
`60653`, `63304`, and `63618`.

All 86 four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
Findings are proposals, not approval to edit the translation.
