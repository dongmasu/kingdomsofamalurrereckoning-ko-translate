# `SQ81` / `1339422.quest_bxml` Context Review Completion

- Date: 2026-11-11.
- Scope: the 110 IDs not included in the November 10 Brio pilot, completing
  ledger coverage for all 122 keys linked to this asset.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Findings are review proposals or evidence-limited holds. No translation
  CSV was changed.

## Grouping Evidence and Limits

The asset contains `QUEST_ID SQ81`, five NPC symbols
(`NPC_YSA_SEE_Brio`, `NPC_YSA_SEE_Gorrenet`, `NPC_YSA_SEE_Hartwen`,
`NPC_YSA_SEE_Setter`, and `NPC_YSA_SEE_Whenery`), and 69 serialized
`dialog_line_*` handlers. The 122 key matches establish an SQ81 asset
association, not a per-key speaker, callback, branch, addressee, or playback
position. The earlier pilot linked 12 IDs to Brio using the user's
identification and limited script evidence; see
[`dialogue-context-regroup-and-review-20261110.md`](dialogue-context-regroup-and-review-20261110.md).
This completion does not extend that speaker attribution to the other 110
keys.

The new 110 rows were compared in English, Japanese, Chinese, and active
Korean. Six repeated-English groups (24 rows) have identical translations in
all four languages: `What was your preference again?` (`3680`, `7359`,
`10445`, `15267`), `How did I do?` (`5993`, `7690`), `Yes, yes...` (`1416`,
`29995`), `How do you really feel?` (`17029`, `20915`, `28026`, `30739`,
`34978`, `39610`, `44403`, `46052`), `Thanks for talking.` (`49991`,
`52341`, `54955`, `56795`), and `In what order should you enter?` (`50192`,
`55020`, `57676`, `61347`). No embedded line breaks, runtime placeholders,
or markup occur in these 110 rows.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `34512` | Meaning / naturalness | `She is particular like that` is softened to `원래 그런 분이니까`. Chinese explicitly supports “picky,” while Japanese says the role suits Hartwen. Consider `그분은 그런 데 깐깐하니까` to retain the demanding/fussy nuance without losing the deferential reference. | Medium |
| `47756` | Format / title pairing | `Lady of the Red Sands` is translated as `붉은 모래의 여주인` but has no English pairing, while `Warlord Whenery` is paired. Consider `나는 전쟁군주 웨너리(Warlord Whenery), 붉은 모래의 여주인(Lady of the Red Sands)이다.` | High |
| `58337` | Meaning / terminology | The speaker rejects the required procession `order`; Japanese uses `順番`. Current `질서` suggests social order rather than sequence. Consider `순서? 난 그런 건 신경 쓰지 않아. 그런 어리석은 허례를 고집하는 건 다른 자들이지.` | High |
| `9298` | Speech level / naturalness | Korean `미안하네` / `것 같군` uses a marked `-네/-군` register. Japanese `悪いな、友よ` and the rest of the utterance are conversational plain style. Consider a plain conversational form such as `미안, 친구. 실패한 것 같아. 그 순서는 그들이 못마땅해할 거야.` This is a row-level comparison, not a claim about the speaker's identity elsewhere. | Medium-high |

## Holds and Retained Text

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `11591` | Meaning / title | Preserve the existing uncertainty for `The Indignitaries`: English suggests a coined name or source error, while Japanese and Chinese give materially different readings. Keep the current transliteration pending context. |
| `58570` | Meaning / source conflict | English and Chinese say the player was able to help Squire Brio; Japanese says the opposite. Korean follows English. Retain that reading, but keep the cross-language source conflict recorded rather than silently changing it. |

Other rows were retained after source comparison. Honorifics and speech levels
vary across this multi-NPC asset; they were not normalized across rows without
per-key speaker evidence.

## Complete Asset ID Set

The 110 newly reviewed IDs are:

`758`, `1416`, `2873`, `3374`, `3680`, `4258`, `4456`, `5993`, `6787`,
`7359`, `7688`, `7690`, `7988`, `8275`, `8438`, `9298`, `9517`, `10445`,
`11247`, `11591`, `12708`, `12842`, `15267`, `16614`, `17029`, `18278`,
`20590`, `20915`, `22423`, `22739`, `23978`, `25255`, `25902`, `27066`,
`28026`, `29499`, `29932`, `29995`, `30294`, `30422`, `30647`, `30739`,
`31641`, `32377`, `32762`, `33896`, `34325`, `34512`, `34565`, `34978`,
`35145`, `35338`, `35665`, `35842`, `36546`, `37805`, `38201`, `39059`,
`39610`, `41286`, `42835`, `42989`, `43589`, `43682`, `43842`, `44045`,
`44403`, `44453`, `44797`, `44858`, `46052`, `46285`, `46437`, `47030`,
`47622`, `47756`, `48148`, `48274`, `49547`, `49991`, `50192`, `50209`,
`50610`, `51375`, `52341`, `53636`, `54170`, `54955`, `55020`, `55831`,
`56183`, `56795`, `57676`, `58337`, `58570`, `58750`, `59639`, `59764`,
`60433`, `60568`, `60673`, `60846`, `61347`, `61492`, `61732`, `62063`,
`63440`, `63750`, `64850`, `64856`.

Together with the 12 SQ81 IDs in the earlier pilot, all 122 asset-linked IDs
now have review-ledger records. This closes the asset's coverage count only;
it does not establish a complete speaker or playback-order map.
