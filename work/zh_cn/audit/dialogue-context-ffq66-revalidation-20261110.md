# FFQ66 / Harriset Donnel Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 33 `default` keys found in `1511548.quest_bxml` (`FFQ66`).
- Translation CSVs and extracted resources were not modified.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains `QUEST_ID FFQ66`, the asset-level symbol
`NPC_KLU_Alm_HarrisetDonel`, and 15 serialized `dialog_line_*` handlers. Its
text concerns Harriset Donnel, a tinker at Sun Camp who asks for iron
components to support his trade.

All 33 exact-key matches were compared at the same ID across the active
Korean, English, Japanese, and Chinese `default` tables. The asset-level NPC
symbol does not map individual keys to Harriset, other speakers, callbacks,
branches, addressees, or playback positions.

## Revalidation Findings

These are read-only reviewer findings and proposed text, not permission to
edit the active translation CSV. `candidate` means an editor decision is
warranted; `uncertain` records a source reading that should not be guessed at.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `4671` | Meaning | The Korean says the speaker is looking for a seer to lead a band of thieves. English and Japanese instead describe a seer who wants to lead the thieves. Preserve the rhetorical question while making the seer's intent explicit: `그러니까 아르진(Argine)이 처음부터 대사제(Hierophant)였군... 도적 무리를 이끌고 싶어 하는 전지전능한 예언자를 아는 건 아니겠지?` | High |
| `9682` | Naturalness / objective form | `Collect Iron Components` is an objective label. Japanese uses the noun-form `鉄の部品を集める`; the active Korean imperative `철 부품을 모아라` differs from the project's established `-하기` objective form. Consider `철 부품 모으기`. | High |
| `10985` | Terminology / format | `Star` and `Moon` refer to the named Travelers camps, confirmed by the existing glossary entries `별 야영지(Star Camp)` and `달 야영지(Moon Camp)`. The current `별 야영지나 달 야영지` omits both English pairings. Use `별 야영지(Star Camp)나 달 야영지(Moon Camp)`. | High |
| `58868` | Naturalness | `Tinkerer here.` is a self-introduction; Japanese says `鋳掛け屋だよ` and Chinese says `我是工匠`. The Korean `여기 땜장이야` reads like a literal rendering of “here.” Consider `난 땜장이야.` | Medium-high |
| `64954` | Meaning / unresolved | `custom` is rendered as `장사`, but the aligned Japanese says the speaker does not want to hinder the new leaders, while Chinese reads it as a tradition/custom obstructed by the new regime. The English can support a trade reading in this merchant context, but the references do not settle it. Keep the Korean unchanged pending stronger context. | Uncertain |

The other 28 rows showed no clearly supported meaning, Korean naturalness,
register, address, honorific, terminology, or formatting defect in this pass.
The apparent dialogue uses informal/plain speech; no abrupt honorific shift
was found. `철 부품` is consistent across the quest. Person terms such as
`땜장이` and activity descriptions such as `잔손질` or `땜질` were not
mechanically unified because they occur in different grammatical contexts.
The localized title `땜장이의 일` at `24810` preserves the meaning of
`Tinker's Task`.

No exact English duplicate group, embedded line break, runtime brace token,
or markup was found among the 33 rows in any of the four locales.

## Coverage and Limits

All 33 asset-linked IDs were reviewed for content type, meaning, Korean
naturalness, speech level, address, honorifics, terminology, and format as
applicable. The findings and four-language fingerprints are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No translation CSV or extracted game asset was changed.

The key-to-callback mapping, individual speakers, branch flow, addressee, and
playback order remain unknown. Asset membership and callback serialization
order are not treated as proof of those details.

The full ID set is:

`57`, `1368`, `4671`, `7546`, `7721`, `9682`, `10985`, `11576`, `11577`,
`13737`, `14288`, `17665`, `24810`, `25101`, `26189`, `26752`, `32151`,
`32515`, `34066`, `37552`, `41013`, `46702`, `48617`, `48640`, `52671`,
`52712`, `55581`, `58868`, `60594`, `60657`, `60894`, `62927`, `64954`.
