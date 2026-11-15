# Sequential `default` Revalidation: IDs `24750`-`24999`

- Date: 2026-11-12.
- Compared all 250 active Korean entries with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register, terminology, names, and format.
- Rechecked 69 existing ledger records and added 181 previously unrecorded
  IDs. Ten new correction-candidate IDs and one evidence-limited hold were
  recorded.
- Cleared existing findings at `24771` and `24959` because their proposed
  terminology/name-pairing corrections are already present in the active
  Korean text. Retained the other four existing candidates and both existing
  holds after checking their cited evidence.
- No translation CSV, immutable source, extracted asset, or localization
  binary changed.

## Correction Candidates

These are review findings, not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `24753` | Meaning / terminology | The standalone `Retainer` is rendered `고용 대기`, which reads as a hiring status. Japanese `従者` and Chinese `家臣` support a person serving another; use a context-appropriate role such as `수행원(Retainer)` rather than a status label. | High |
| `24754` | Format / item-name pairing | The complete item label `Flawless Mitharan Executioner's Handle` is paired only at `Mitharan`. Consider `완벽한 미타란 처형자의 손잡이(Flawless Mitharan Executioner's Handle)`; do not infer a different item slot. | High |
| `24765` | Name pairing | The line names Fara, Syl, Shirin, and Raf. Korean pairs Syl and Shirin but leaves Fara and Raf unpaired. Add the source spellings, e.g. `파라(Fara)` and `라프(Raf)`, while preserving the list of victims and the speaker's helpless tone. | High |
| `24780` | Meaning / naturalness | `As a token` means the daughter was sent as a sign or token of the alliance; `답례로` instead suggests a returned favor or reward. Consider `그 증표로` or `동맹의 증표로`, retaining the following name. | High |
| `24824` | Meaning / omission | The source says an empty bottle is worth around 20 (gold pieces); Korean `20개쯤 한다` leaves out the currency and makes the amount read as a count. State that the empty bottle is worth about 20 gold pieces, preserving the comparison with the full bottle. | High |
| `24846` | Meaning / clarity | In context, `them` refers to the confiscated supplies held in the armory, not the Gnomes. Korean `모두 파괴하라` leaves the object implicit, while Chinese reads it as the Gnomes. Make the supplies explicit, e.g. `그 물자를 모두 파괴하라`, preserving the no-one-gets-them rationale and reward. | Medium-high |
| `24874` | Terminology / objective form | `Baresarks` is a named creature type, but `광폭한 야수` turns it into a generic description. Use the Japanese-supported creature name with the established neutral objective form, e.g. `베어사크(Baresark) 처치하기`. | High |
| `24907` | Name / terminology | `Prime Justicars` names the arcane assassins; Korean `수석 재판관들` reads as generic senior judges and omits the English name. Preserve the group/title as a named term, e.g. `수석 재판관(Prime Justicars)`, without changing the explanation of their vengeance against the Durek. | Medium-high |
| `24939` | Format / title pairing | The title `The Missives of Sable` is paired as `세이블의 서신(Missives of Sable)`, omitting `The` from the English title. Use the exact source title in the parenthetical: `세이블의 서신(The Missives of Sable)`. | High |
| `24966` | Format / creature-name pairing | `The Niskaru Lord, Balor` is split as `니스카루(Niskaru) 군주 발로르(Balor)`, pairing only the species name. Pair the complete rank/type, e.g. `니스카루 군주(Niskaru Lord) 발로르(Balor)`. | High |

## Evidence-Limited Hold

| ID | Dimension | Reason |
| ---: | --- | --- |
| `24958` | Meaning / reference | `Orison` is capitalized, but the short line and the Japanese/Chinese renderings do not establish whether it is a named rite, a prayer, or another concept. Korean treats it as something one can receive. Do not replace it with a guessed meaning until the referent is supported. |

## Rechecked Existing Findings

- Retained candidates `24788`, `24798`, `24937`, and `24993`. The first
  continues to read `To Adarus` as a person rather than travel to a place;
  `24798` still lacks the established `샘(The Font)` pairing; `24937` remains
  part of the same alchemical-formula terminology inconsistency; and
  `24993` still uses `병기 교관` rather than the established `무기 교관`.
- Retained the uncertainty at `24772` about the Korean spelling of `Aster`,
  and at `24786` about the addressee/register relationship. Neither was
  resolved by the same-ID source comparison.
- Cleared `24771`: the active text already uses the established
  `마법사 보초` term recorded in the earlier SQ69 review.
- Cleared `24959`: the active text already pairs the complete name
  `루인 이마스(Ruin Imas)`.

## Duplicate And Structural Checks

- The range touches 54 exact-English duplicate groups (1,134 corpus rows).
  Korean text matches within those groups; Japanese variants for short
  prompts remain source evidence and were not used to infer speakers.
- Logical line-break counts and normalized runtime/control-token signatures
  match across all four languages for every ID in this range.
- Asset links, NPC symbols, handler counts, row adjacency, and numeric ID
  sequence were not treated as proof of an individual speaker or playback
  order.

After recording this range, the ledger contains 35,492 of 65,135 IDs
(54.49%), leaving 29,643. Sequential coverage reaches ID `24999`; the next
range is `25000`-`25249`.
