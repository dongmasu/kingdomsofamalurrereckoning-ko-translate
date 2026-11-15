# Attwater Farms Antelope-Racing Revalidation

- Date: 2026-11-11.
- Scope: all 81 `default` IDs linked to `2601100.quest_bxml`.
- English was the semantic anchor; Japanese was the primary voice/register
  reference; Chinese was supporting evidence.
- Four correction candidates and three evidence-limited holds are recorded.
  No translation CSV or extracted asset was changed.
- No exact-English duplicate groups or four-language format mismatches were
  found. Line-break counts and detected runtime-token/markup sequences match
  across all four languages for all 81 IDs.

## Grouping Evidence and Limits

The asset has no explicit `QUEST_ID`, `NPC_` symbol, or `dialog_line_*`
handler. Serialized handler names contain the `AO_SQ_MW_001` prefix and
references to Anso and Fenn Attwater, while the localized text concerns
Attwater Farms and antelope racing. This supports an `AO_SQ_MW_001` topic
grouping only. It does not map individual keys to handlers, identify the
speaker of a particular line, or establish branches or playback order.

All 81 rows were compared in English, Japanese, Chinese, and active Korean.
The asset includes dialogue, player-facing options, quest objectives, and
journal text; asset membership alone does not make every row a dialogue turn.
No per-key speaker or order was inferred.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `9817` | Meaning / naturalness | `I like you` is weakened to `네가 싫진 않지만` (“I don't dislike you”). Japanese and Chinese both retain the positive statement. Restore the meaning, for example `네가 좋은데, 지금 완전히 잘못하고 있어.` | High |
| `22943` | Meaning | `assumed ownership of our dear father's business` becomes `사업을 ... 물려받았어`, which can imply inheritance not stated in English. Japanese and Chinese support taking over the business. Consider `아버지의 소중한 사업인 애트워터 농장(Attwater Farms)을 맡게 됐어.` | High |
| `46868` | Format | The capitalized standalone activity label `Antelope Racing` lacks an English pairing, unlike the named Attwater terms in the same group. If treated as the activity/title label, consider `영양 경주(Antelope Racing)`; keep this scoped to the label rather than adding parentheses to every generic use of “antelope racing.” | Medium |
| `59795` | Naturalness | `결승선을 통과하게 몬 영양` is awkward. Consider `결승선까지 몰고 간 영양이 많을수록 더 많은 보수를 받는다`, preserving the journal-style summary and reward condition. | High |

## Evidence-Limited Holds

| ID(s) | Question | Evidence and disposition |
| --- | --- | --- |
| `27418`, `37154` | Whether the speaker's brother is older or younger | English says only `brother`; Japanese specifies a younger brother, while Chinese specifies an older brother. Korean `남동생` selects one reading without agreement across the sources. Retain pending stronger context rather than silently resolving the sibling's age. |
| `60271` | `We have ancestors in the city, but they mostly ignore us.` | The English pronoun `they` has an unclear antecedent, and the Korean `우리 조상들은 ... 그들은 ...` reads as though the ancestors ignore the speaker. Japanese and Chinese do not resolve whether `they` means the city people or the ancestors. Hold rather than invent an antecedent. |

## Retained Text and Complete ID Set

The remaining 74 rows were retained after four-language comparison. In
particular, first-person player options and quest-log statements were not
treated as NPC dialogue solely because their keys occur in this asset.

Complete asset-linked ID set:

`186`, `351`, `2727`, `3343`, `4236`, `5759`, `5820`, `6349`, `7413`,
`8051`, `8821`, `9817`, `11030`, `11523`, `12529`, `14065`, `15228`,
`16276`, `16760`, `18102`, `18285`, `18691`, `19072`, `19580`, `19696`,
`20861`, `21905`, `22511`, `22748`, `22943`, `23170`, `23278`, `23438`,
`23789`, `24628`, `24791`, `25179`, `25954`, `27418`, `27847`, `29531`,
`30316`, `30554`, `31918`, `32158`, `34847`, `34995`, `35518`, `37154`,
`37643`, `39306`, `40802`, `41423`, `41647`, `42172`, `42201`, `45463`,
`46868`, `46889`, `47962`, `48495`, `48496`, `49164`, `49959`, `50228`,
`51604`, `54599`, `55587`, `56483`, `56862`, `57613`, `57632`, `58605`,
`59660`, `59795`, `59957`, `60271`, `62145`, `63279`, `64118`, `65085`.

Findings remain proposals; no translation CSV changes were applied.
