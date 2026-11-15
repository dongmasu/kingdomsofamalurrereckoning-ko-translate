# SQ96 Motus Mining Asset Revalidation

- Date: 2026-11-11.
- Scope: all 66 `default` IDs linked to `744464.quest_bxml`.
- English was the semantic anchor; Japanese was the primary voice/register
  reference; Chinese was supporting evidence.
- Four correction-candidate IDs and one evidence-limited speech-level hold
  were recorded. No translation CSV or extracted game asset was changed.
- Eight exact-English duplicate groups have matching Korean translations.
  Line-break counts and detected runtime-token/markup sequences match across
  all four languages for all 66 IDs.

## Grouping Evidence and Limits

The asset explicitly identifies `SQ96`, contains the NPC symbols
`NPC_DET_GNO_VincernHelvern` and `NPC_DET_VAR_BorAnjar`, and has 31
`conditional_quest_vmc_nqd_dialog_line_*` handlers. The keys cover Motus
Mining's mine-opening and renovation work, profit collection, and the
associated conversation and status text. The asset does not map individual
localization keys to dialogue handlers, branches, or playback order.

Four rows explicitly identify a speaker in first-person introductions:
`8357`, `20890`, and `58255` name Vincent Helvern; `64413` introduces Bor
Anjar as the speaker. The matching NPC symbols corroborate those explicit
names. Other lines are not assigned to either person solely from asset
membership. Standalone name rows `6454` and `64352` are not treated as spoken
lines. Fourteen first-person requests and payment responses are classified as
player-choice text from their wording (`21006`, `21292`, `22734`, `24943`,
`26845`, `28405`, `29829`, `31751`, `44752`, `46201`, `48041`, `49860`,
`58374`, and `65109`); this does not establish their order or branch
placement. The short options `33363`, `42943`, and `45276` remain unassigned
because their wording alone does not distinguish player choices from NPC
responses.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `2792` | Naturalness | `이 허름한 곳을 ... 효율적으로 굴러가게 해줄게` uses the place as an object of `굴러가다`. Rephrase so the mine is the subject or make the operation explicit, e.g. `금 조금만 주면 에드거 아론(Edgar Aron) 때보다 훨씬 효율적으로 이 허름한 광산을 운영해 줄게.` | High |
| `49860`, `58374`, `65109` | Naturalness / consistency | These player responses say `I'll pay you.` with `$VMC_NQD.cost_mine$`; the parallel rows `44752`, `46201`, and `48041` use `$VMC_NQD.cost$`. Japanese and Chinese use the same wording for both groups, while Korean uses `돈을 내겠어.` versus `돈을 낼게.` Align the Korean response wording while preserving each distinct runtime token. | High |

## Evidence-Limited Hold

| ID(s) | Question | Evidence and disposition |
| --- | --- | --- |
| `42660` | Speech level / honorifics | `Hail, friend. Is there anything I can do for you?` is rendered `반갑소, 친구. 도와줄 일이라도 있소?`. Japanese and Chinese are less archaic in tone, but the asset contains two NPCs and does not map this key to either one. Retain as a possible register issue; do not assign a speaker or normalize the ending without stronger evidence. |

## Repeated Text and Retained Rows

The eight exact-English duplicate groups are `1551`/`45815`,
`18012`/`62020`, `20890`/`58255`, `21006`/`22734`,
`21292`/`28405`/`29829`, `24943`/`26845`/`31751`,
`44752`/`46201`/`48041`, and `49860`/`58374`/`65109`.
Each group has matching Korean text; comparison did not reveal an
unsupported divergence.

The reviewed asset also contains names, the `Miners` label, player choices,
and quest/status text. Their presence in this asset does not make them
dialogue turns. No other clear meaning, terminology, English-pairing, or
format correction was supported by the four-language comparison.

## Complete ID Set

`359`, `1433`, `1551`, `1870`, `2792`, `6265`, `6454`, `7641`, `8357`,
`9123`, `9408`, `11147`, `11284`, `12761`, `13420`, `15567`, `17915`,
`18012`, `20303`, `20890`, `21006`, `21009`, `21292`, `22734`, `24943`,
`25899`, `26378`, `26845`, `28405`, `29829`, `31751`, `33363`, `36872`,
`37611`, `42033`, `42660`, `42943`, `44752`, `44983`, `45214`, `45276`,
`45678`, `45815`, `46201`, `48041`, `48321`, `49248`, `49860`, `49916`,
`50231`, `51945`, `52187`, `53063`, `54789`, `55384`, `57271`, `58255`,
`58374`, `58565`, `60153`, `60449`, `62020`, `64352`, `64413`, `64901`,
`65109`

All 66 IDs are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv)
with four-language source fingerprints. Findings remain proposals and have
not been applied to the translation CSV.
