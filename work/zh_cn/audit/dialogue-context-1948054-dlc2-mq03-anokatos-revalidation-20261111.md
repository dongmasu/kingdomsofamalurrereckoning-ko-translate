# DLC2 MQ03 / Anokatos Revalidation

- Date: 2026-11-11.
- Scope: all 163 `default` IDs linked to `1948054.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Seven review candidates are recorded below. The active Korean translation
  CSV was not changed.

## Grouping Evidence and Limits

The asset has explicit quest ID `DLC2_MQ03`, one NPC symbol
`DLC2_NPC_IDY_KOL_Anokatos`, 54 serialized dialogue handlers, and 163 matched
localization IDs. Its content concerns Anokatos, Idylla, the Wreath of
Absolution, and Arkes's crypt. This supports a quest/character review group,
but does not map every key to Anokatos, a particular handler, dialogue
branch, or playback order. Per-key speaker attribution remains unassigned
and playback order unknown.

All 163 rows were compared across English, Japanese, Chinese, and active
Korean. Repeated English-source groups were checked in their other language
sources and Korean context; no unsupported duplicate was used to force
translation alignment. The rows contain no embedded line breaks, runtime
variables, or markup tokens. None of the 163 IDs is already recorded through
another asset in the review ledger.

## Review Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `10452` | Meaning / address | `Idylla` may be a personified address or the reveal of the place as “our great failing.” Japanese and Chinese support different readings. Recheck the dash and vocative before choosing wording; do not retain `이딜라야` as settled without that distinction. | Medium |
| `16443` | Naturalness | The English says the massive stone is alone in the wilderness and has a floating city engraved on it. Korean `황야 한가운데 놓인` shifts the emphasis to location and makes the stone sound placed; consider a more natural rendering that preserves its solitary presence. | Medium |
| `25202` | Speech level / honorifics | Korean uses `하오체` (`시작해야 하오`) while Japanese and Chinese use neutral phrasing. The key is not mapped to a speaker or scene stage, so review the register against explicit dialogue context before changing it; retain the honorific for `부름받은 자(Beckoned)` if the intended address is deferential. | Medium |
| `30336` | Terminology | `sanctum` is rendered `은신처`, while Japanese `聖所` and Chinese `圣所` support a sacred place. Consider `성소` rather than a hiding place. | High |
| `35594` | Meaning / syntax | `flesh and blood` is an appositive to Anokatos in English and Japanese, but the Korean attachment is difficult to parse. Consider recasting the contrast so it is clear that the speaker came by the will of a mortal Anokatos, not by the gods' will. | Medium |
| `63113` | Naturalness / terminology | The Wreath is nearly complete, and its gold foundation is inscribed with prayer runes. Korean `기초는 ... 금이지` is awkward for an artifact component; consider a natural component term while keeping `화관(Wreath)` aligned with the related Wreath of Absolution. | Medium |
| `63585` | Meaning / tense | The source first says the Kollossae are favored by Ethene, then corrects that to the past. Korean already uses past tense in the first clause (`총애를 받았어`), weakening the self-correction. Consider `총애를 받고 있어. 아니, 한때는 그랬지.` | High |

These are review proposals, not approved CSV edits. In particular, the
register at `25202` and the address at `10452` remain dependent on context
that the asset-level symbol does not establish.

## Complete Reviewed ID Set

`975`, `1111`, `1285`, `1408`, `1503`, `1510`, `1669`, `2000`, `2369`,
`3035`, `3227`, `3868`, `4358`, `4737`, `5059`, `5158`, `5768`, `5843`,
`6515`, `6564`, `7161`, `7794`, `7830`, `8942`, `9449`, `10452`, `10689`,
`10863`, `11372`, `11712`, `11732`, `12233`, `12313`, `12667`, `12881`,
`13694`, `14819`, `15149`, `15208`, `15832`, `15992`, `16443`, `16610`,
`16803`, `16811`, `17882`, `18757`, `18964`, `19258`, `20320`, `21544`,
`21583`, `23161`, `23215`, `23360`, `23845`, `23860`, `23871`, `24079`,
`24742`, `24794`, `24909`, `25202`, `25535`, `25847`, `26481`, `27047`,
`27264`, `28267`, `28596`, `28652`, `29325`, `29788`, `30124`, `30336`,
`30397`, `30880`, `31175`, `31323`, `31550`, `31974`, `32101`, `32649`,
`32825`, `33366`, `34225`, `34745`, `35594`, `35804`, `35967`, `36281`,
`36300`, `36483`, `36958`, `37019`, `37411`, `37946`, `38568`, `38619`,
`39391`, `39901`, `40038`, `40590`, `41078`, `41962`, `42155`, `42243`,
`44127`, `44845`, `44996`, `45266`, `45937`, `46127`, `46857`, `47110`,
`47352`, `47550`, `47752`, `48078`, `48670`, `49325`, `49737`, `50508`,
`50840`, `51039`, `51552`, `51769`, `51949`, `53234`, `54315`, `54403`,
`55270`, `55952`, `55974`, `56722`, `57171`, `57456`, `58252`, `58439`,
`59566`, `59728`, `60104`, `60137`, `60461`, `60562`, `60593`, `60692`,
`60706`, `61242`, `61375`, `61760`, `61786`, `61841`, `61897`, `62416`,
`63113`, `63462`, `63476`, `63585`, `63826`, `63845`, `64119`, `65068`.

All 163 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
