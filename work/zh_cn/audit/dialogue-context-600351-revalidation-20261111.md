# Asset Revalidation: `600351.quest_bxml`

- Date: 2026-11-11.
- Scope: all 78 unique `default` IDs linked to this previously unrecorded
  asset. All 78 were new to the review ledger.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- One line-level register candidate was recorded. No translation CSV or
  extracted game asset was changed.

## Context Evidence and Limits

The asset has 22 `dialog_line_*` handlers with an `FP02` prefix, but no
explicit `QUEST_ID` or `NPC_...` symbol. Its text concerns the House of
Sorrows, Taibreah, Bisarane, Cadoroc, Saturnyn, and the Tuatha. The handler
prefix and shared subject matter support a topic grouping only; they do not
map localization IDs to individual speakers, dialogue turns, branches, or
playback order. Speaker attribution remains unassigned and dialogue order
unknown.

## Candidate

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `44618` | Speech level / register | `そうしましょう` and the following polite forms use a conversational polite register, while Korean `좋소 ... 가로질러야 하오` shifts into marked archaic `-소/-하오` speech. Consider `좋아요. 우리가 찾는 시신이 있는 곳에 가려면 미든(The Midden)을 가로질러야 해요. 가는 길에 어려움이 있을 게 분명해요.` This is a line-level comparison only; the asset does not establish the speaker or support extending the change to other IDs. | Medium-high |

## Repeated Text and Structure

The two exact-English instances of `How can we stop the Tuatha?` (`10240`,
`13006`) have identical Korean translations. The four-language line-break,
runtime-token, and markup signatures match for all 78 IDs.

No other source-grounded meaning, Korean naturalness, register, honorific, or
format correction was supported strongly enough to record. The role terms
`Tender` and `Delver`, and references to `The Midden`, are used consistently
within this asset; this does not assert corpus-wide terminology consistency.

## Complete ID Set

`2852`, `4537`, `6113`, `6184`, `7002`, `7338`, `7962`, `9030`, `9199`,
`9475`, `9916`, `10240`, `11248`, `11979`, `12255`, `12548`, `13006`,
`13455`, `13648`, `14172`, `14202`, `14260`, `14987`, `15880`, `16066`,
`17189`, `23756`, `23904`, `24159`, `24842`, `26669`, `27152`, `27817`,
`27840`, `28351`, `29389`, `31300`, `31429`, `31885`, `32717`, `33941`,
`34027`, `34735`, `38447`, `39438`, `40819`, `41053`, `41736`, `41971`,
`42448`, `42555`, `43335`, `44618`, `45518`, `45540`, `47162`, `47801`,
`49450`, `49902`, `50294`, `51883`, `52563`, `53357`, `53648`, `55201`,
`56300`, `58495`, `59426`, `59488`, `60093`, `60927`, `61408`, `62174`,
`62200`, `62291`, `62374`, `64254`, and `64883`.

The complete source fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
This candidate is a review finding, not approval to edit the translation.
