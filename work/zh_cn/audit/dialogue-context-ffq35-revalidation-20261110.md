# FFQ35 / Menri Togh Quest Dialogue and Text Revalidation

- Date: 2026-11-10.
- Scope: all 56 `default` keys found in `1164038.quest_bxml` (`FFQ35`).
- Translation CSVs and extracted resources were not modified.
- English anchors meaning; Japanese is the primary style/register check;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains `QUEST_ID FFQ35`, the asset-level symbol
`NPC_DAL_LJO_MenriTogh`, and 17 serialized `dialog_line_*` handlers. All 56
exact-key matches were compared across the active Korean, English, Japanese,
and Chinese `default` tables. The quest concerns Menri Togh's family farm,
the spider attacks, and the discovery that the farmhand Cartery Jayck
murdered her family to avoid returning to war.

The asset link does not map a localization key to an individual callback,
speaker, branch, addressee, or playback position. The NPC symbol is
asset-level evidence, not proof that every key is spoken by Menri. The rows
also include player choices, quest-journal text, objectives, and UI labels;
dialogue-register checks are not applied to those text types.

## Revalidation Findings

These are review proposals, not approval to edit the active translation CSV.
Candidate statuses identify rows for an editor decision; they are not claims
that every row is a confirmed error.

| IDs | Dimension | Evidence and proposed direction | Confidence |
| --- | --- | --- | --- |
| `19845` | Name consistency | The second sentence says `메느리에게`, while the same row and the other quest entries consistently identify her as `멘리 토그(Menri Togh)`. Correct the typo to `멘리에게`. | High |
| `31255` | Name consistency / English pairing | The English and Japanese name Eimer, paired as `에이머(Eimer)` at `2406`, appears as `아이머` without English at `31255`. Align it as `에이머(Eimer)`. | High |
| `35256` | Naturalness | `시신 하나에서 칼날에 C. J.라는 이니셜이 새겨진 칼을 찾았다` stacks two location phrases and is difficult to parse. Consider `시신 하나에서 칼을 발견했는데, 칼날에 C. J.라는 이니셜이 새겨져 있었다.` This preserves the initials and does not assert who they identify. | High |
| `5313`, `53623` | Shared-source consistency | Both rows contain the same first two English sentences, but their Korean wording differs. Consider aligning those shared sentences as `거미 습격으로 캐너록(Canneroc)과 연락이 끊긴 멘리 토그(Menri Togh) 가족의 농장을 조사해 달라는 부탁을 받았다. 그곳에서 농장 일꾼 카터리 제이크(Cartery Jayck)가 가족을 살해했다는 사실을 알게 됐다.` Keep each row's distinct outcome. The previously recorded legal contradiction at `5313`—killing Cartery “to bring him to justice”—is retained, not reinterpreted. | High |
| `63374` | Naturalness | `부모님과 접촉해 달라고 했어` is stiff Korean for “make contact with her parents.” Consider `부모님과 연락이 닿게 해 달라고 했어.` This preserves the request without asserting that the parents have been found. | High |

ID `614` uses `분` and `고맙습니다`, while the Japanese line reads as
conversational and the English has no explicit honorific. This could be a
register mismatch, but the asset-level association does not prove the speaker
or conversation stage. Mark it uncertain and retain the current text until
that context is established.

The only fully duplicated English string in this asset is `Why did you kill
them?` at `1382` and `3086`; their Korean translations are identical. The
remaining rows showed no clearly supported meaning, naturalness, register,
address, honorific, or formatting defect in this pass. In particular, the
deliberately contradictory final clause at `5313` is preserved in keeping
with its earlier source-based review.

No embedded line breaks, runtime variables, or formatting markup were found
in the 56 Korean rows.

## Coverage and Limits

All 56 asset-linked IDs were reviewed against the same-ID English, Japanese,
Chinese, and active Korean rows. The six candidate IDs and uncertain ID `614`
are recorded with four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No translation CSV edit was applied.

The asset does not establish exact dialogue order or key-to-callback
mapping. The full ID set is:

`614`, `1382`, `2096`, `2406`, `2769`, `3086`, `4611`, `5313`, `5897`,
`5966`, `6328`, `6533`, `8496`, `8508`, `9418`, `10143`, `13380`,
`16998`, `17010`, `17828`, `19807`, `19845`, `22839`, `23917`, `24790`,
`26232`, `27197`, `29572`, `29958`, `30306`, `30552`, `31255`, `31398`,
`35256`, `35274`, `35973`, `38109`, `40745`, `43629`, `45353`, `46384`,
`49211`, `51781`, `53623`, `54007`, `54120`, `54585`, `54682`, `54712`,
`56436`, `56495`, `58242`, `62213`, `63374`, `64829`, `65030`.
