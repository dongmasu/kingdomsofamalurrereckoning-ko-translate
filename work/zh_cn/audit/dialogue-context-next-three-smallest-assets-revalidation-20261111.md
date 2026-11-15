# Three Smallest Unrecorded Asset Revalidations

- Date: 2026-11-11.
- Scope: all 207 `default` IDs linked to three previously unrecorded assets.
- English was the semantic anchor; Japanese was the primary voice/register
  reference; Chinese was supporting evidence.
- Eleven correction-candidate IDs and one evidence-limited speech-level hold
  were recorded. No translation CSV or extracted game asset was changed.
- The three assets contain 23 exact-English duplicate groups; none has
  divergent Korean translations. Line-break counts and detected runtime-token
  and markup sequences match across all four languages for all 207 IDs.

## Grouping Evidence and Limits

- `1364459.quest_bxml` has 69 IDs, no explicit `QUEST_ID` or NPC symbol, and
  45 dialogue handlers with an `NQD_City_MelSenshir_BossBattle` prefix. The
  text identifies the Mel Senshir battle, wounded soldiers, and the Tuatha
  assault. The prefix and text support topic grouping only.
- `1961287.quest_bxml` has 69 IDs, no explicit `QUEST_ID` or NPC symbol, and
  32 dialogue handlers with a `DLC1_SQ01` prefix. The text concerns the
  castaways, Nesta Gwynedd, Cadwallon Gwynedd, and Olaf Asvaldsson. The prefix
  and text do not map any key to a speaker or playback position.
- `482304.quest_bxml` explicitly identifies `MQ17`, has no NPC symbol, and
  contains 79 `Generic_Crime` dialogue handlers. Its rows include generic
  guard lines, arrest outcomes, crime options, and UI/status text. The quest
  ID and handler names do not establish per-key speakers, branch placement,
  or order.

All speaker attribution and playback order remain unknown. The clear
`Pay Fine`, `Bribe`, `Go to Jail`, and `Resist Arrest` action labels in the
`MQ17` asset are classified as player-choice text, not spoken lines.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `62249` | Naturalness | `Keep on him!` is `계속 그를 압박해!`, which sounds like psychological pressure. In this combat context, use a natural attack command such as `계속 몰아붙여!`; Japanese also means not to let up. | High |
| `22247` | Meaning / format | The name is misspelled as `오라프(Olaf)` while the rest of the same asset uses `올라프`. Correct it to `올라프(Olaf)`. | High |
| `30778`, `32135`, `33679`, `39292`, `42528`, `43472` | Format | These rows name Olaf without the English pairing used in the other mentions in this asset. Add `(Olaf)` to the direct name occurrence, preserving the existing sentence and any other pairings. | High |
| `16391` | Naturalness / speech level | One sentence shifts from `위안이 되는군` to `달린 건 아니야`. Align the register, for example `모든 것이 신이나 미치광이 손에 달린 건 아니지.` | High |
| `36831`, `56375` | Meaning / naturalness | `Don't let me catch you making trouble again` is reduced to `다시는 말썽 피우지 마`, omitting the warning about being caught. Consider `다음에 또 말썽을 피우다 걸리면 가만 안 둬.` | High |

## Evidence-Limited Hold

| ID(s) | Question | Evidence and disposition |
| --- | --- | --- |
| `31894` | Speech level / honorifics | The Korean uses `-겠네` and `자네 ... 맡아 주게` for `I'll fight on from here. You deal with whatever is past that door.` Japanese also gives a firm military-style command. With no NPC symbol or per-key mapping, retain the register as context-dependent rather than treating it as a confirmed voice error. |

## Repeated Text and Retained Rows

The five exact-English duplicate groups in `1364459.quest_bxml` and the 18
groups in `482304.quest_bxml` all have identical Korean translations within
each group. `1961287.quest_bxml` has no exact-English duplicate group.
Across all three assets, no repeated English source has divergent Korean
text.

The crime asset's `FAIL LINE` rows match the English and Japanese source
strings and are retained as source text; the Chinese source's localized
diagnostic wording does not justify changing them. `Arrested` remains a
status label, and the arrest action labels remain player choices. The battle
and castaway assets also mix spoken lines with headings, objectives, journal
text, and status strings; asset membership alone does not make them dialogue.

## Complete ID Sets

- `1364459.quest_bxml` (69 IDs): `1464`, `2448`, `4120`, `4767`, `6762`,
  `6920`, `7446`, `7537`, `7803`, `8965`, `9126`, `9266`, `9612`, `10741`,
  `11793`, `12647`, `12932`, `16047`, `18771`, `19713`, `20770`, `21081`,
  `23106`, `23792`, `23892`, `24020`, `24763`, `25907`, `26109`, `26377`,
  `27783`, `29242`, `31792`, `31894`, `32488`, `33543`, `34406`, `34440`,
  `35257`, `36785`, `37558`, `38685`, `41006`, `42800`, `44317`, `45499`,
  `47673`, `49517`, `50376`, `50392`, `50760`, `50764`, `52133`, `52549`,
  `52662`, `53068`, `54121`, `54752`, `56571`, `57534`, `59092`, `59099`,
  `59943`, `60051`, `60185`, `61797`, `62084`, `62249`, `64380`
- `1961287.quest_bxml` (69 IDs): `330`, `872`, `1515`, `1532`, `3812`,
  `4079`, `4380`, `4649`, `4940`, `5854`, `7197`, `7476`, `7963`, `8170`,
  `9687`, `10347`, `12210`, `12698`, `13879`, `13899`, `14124`, `14164`,
  `15107`, `15902`, `16391`, `16981`, `17078`, `17811`, `18980`, `19979`,
  `20006`, `22247`, `26510`, `27385`, `28367`, `28640`, `30778`, `32135`,
  `33679`, `33693`, `34033`, `34696`, `36472`, `37023`, `38671`, `39065`,
  `39292`, `42309`, `42528`, `43472`, `44439`, `44874`, `48520`, `48839`,
  `49173`, `49516`, `49940`, `50423`, `50813`, `52336`, `56808`, `57689`,
  `57693`, `60423`, `60661`, `60719`, `60863`, `61584`, `64616`
- `482304.quest_bxml` (69 IDs): `1862`, `2379`, `3416`, `3798`, `5025`,
  `5930`, `7186`, `7296`, `7702`, `8767`, `9059`, `13035`, `13561`, `14471`,
  `15023`, `15117`, `16680`, `18649`, `21137`, `21300`, `21809`, `22592`,
  `22959`, `23247`, `23605`, `23987`, `24774`, `25369`, `26387`, `26633`,
  `26839`, `27008`, `27582`, `27867`, `29151`, `33933`, `34123`, `34484`,
  `34939`, `36831`, `37266`, `37595`, `39594`, `40305`, `40523`, `41098`,
  `41373`, `41422`, `42030`, `42034`, `42179`, `43507`, `43828`, `43949`,
  `44842`, `45149`, `47399`, `48805`, `50829`, `51017`, `51139`, `51933`,
  `54719`, `55490`, `56076`, `56375`, `58417`, `62740`, `64611`

All 207 IDs are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv)
with four-language source fingerprints. Findings remain proposals and have
not been applied to the translation CSV.
