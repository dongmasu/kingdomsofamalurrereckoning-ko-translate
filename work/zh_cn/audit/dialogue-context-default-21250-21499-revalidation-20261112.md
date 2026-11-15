# Sequential `default` Revalidation: IDs `21250`-`21499`

- Date: 2026-11-12.
- Compared all 250 active Korean rows with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register, terminology, names, and format.
- Rechecked 61 existing ledger records and added 189 previously unrecorded
  IDs. Five existing correction candidates were retained; one was cleared.
- Recorded 17 new correction findings and six evidence-limited holds affecting
  six IDs.
- No translation CSV, immutable source, extracted asset, or localization
  binary changed.

## Correction Candidates

These findings are proposals for separate review, not approval to edit the
translation CSV.

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `21252` | Name / title pairing | The verse names the Aster clan and the groups Ratofer, Kents, and Scaiths, but none is paired with its English source. Consider `아스터 가문(Aster clan)` and `라토퍼(Ratofer), 켄트(Kents), 스케이스(Scaiths)`. The exact-English duplicate at `39557` has the same Korean text and should be reviewed with it. | High |
| `21279` | Speech level | The line shifts from `있나` / `했네` to `하나뿐이야` / `우리겠지`; the Japanese remains colloquial. Consider one consistent plain conversational register, e.g. `가족이나 친척이 있나? 저기서 네게 무슨 일이라도 생기면 그들에게 알려 주려고 했지. 돌아올 팀은 하나뿐이야. 우리 팀이지.` | High |
| `21283` | Name pairing | The standalone name `Jamaica` appears as `자메이카` without the English label. Consider `자메이카(Jamaica)` without inferring whether it is a person or a place. | Medium |
| `21299`, `28229` | Title pairing | Both exact-English `The Sewer Run` labels are translated as `하수도 경주` without the source title. Consider `하수도 경주(The Sewer Run)` in both rows; their current Korean is identical. Only `21299` is in this batch. | High |
| `21348` | Name pairing | `Marga` is a named person, but the line says only `마르가`. Consider `마르가(Marga)` while preserving the plea and casual register. | High |
| `21353` | Place-name pairing | Capitalized `the Marches` is rendered `마치스` without the English region name. Consider `마치스(Marches)`; do not otherwise change the sentence. | Medium-high |
| `21359` | Title / terminology | The source label is `Valor Guard`, while Korean gives `용맹의 집(House of Valor) 경비병`, pairing the associated house but not the exact guard title. Consider `용맹의 집(House of Valor) 경비병(Valor Guard)` if this is the factional rank intended by the source label. | Medium |
| `21360` | Title pairing | The standalone document label `Concert Shopping List` is translated without its English title. Consider `공연 장보기 목록(Concert Shopping List)`. | Medium-high |
| `21367` | Title pairing | The standalone title `Lord of Beasts` is translated as `야수의 군주` without the source title. Consider `야수의 군주(Lord of Beasts)`. | Medium |
| `21388` | Name pairing | `Gordon Lot` is an explicitly named tavern-keeper but appears only as `고든 롯`. Consider `고든 롯(Gordon Lot)`; retain the casual instruction and tab/debt meaning. | High |
| `21389` | Proper-name pairing | The speaker explicitly calls `the Well that Wanders` the spring's true name. Korean has `떠도는 샘` but omits that exact source name. Consider `떠도는 샘(The Well that Wanders)`. | High |
| `21406`, `42577` | Name / objective format | The objective `Defeat the Krast brothers` is `크라스트 형제 처치`, without the named family label. Consider `크라스트 형제(Krast brothers) 처치하기`, matching the established action-form objective style. Both exact-English rows have matching Korean; only `21406` is in this batch. | Medium-high |
| `21438` | Name pairing | The journal pairs Walen and Daltan Eames but leaves his mother `Shalarein` as unpaired `샬라레인`; other rows use `샬라레인(Shalarein)`. Add the source name without changing the journal content. | High |
| `21439` | Title pairing | The standalone heading `Death of Solsvard` is rendered `솔스바드의 죽음` without its English title. Consider `솔스바드의 죽음(Death of Solsvard)`. | Medium |
| `21458` | Ability-name pairing | `Sceptre Ground Wave` is rendered using the established term `셉터의 충격파` but lacks the source ability label. Consider `셉터의 충격파(Sceptre Ground Wave)`. | Medium-high |
| `21465`, `36835` | Title pairing | The shared journal heading `Cycle, the Third: The Pirate` is rendered `세 번째 순환: 해적` without the title. Consider `세 번째 순환: 해적(Cycle, the Third: The Pirate)` at the start of both entries; preserve all existing paragraph breaks. Their Korean entries currently match. Only `21465` is in this batch. | Medium-high |
| `21485` | Title / name pairing | `Argine, Queen of Staves` occurs in 26 identical name-label rows, all rendered `지팡이의 여왕 아르진(Argine)`, so the English pairing omits her title. The title is separately established as `지팡이 여왕(Queen of Staves)` at `60044`. Consider `지팡이 여왕(Queen of Staves) 아르진(Argine)` for the repeated labels; this batch records only `21485`. | High |

## Evidence-Limited Holds

| ID(s) | Dimension | Reason |
| --- | --- | --- |
| `21366` | Terminology | `Siphon health` is rendered `체력 흡수`. Earlier effect review retained the 85% effect but left its exact Korean gameplay label unresolved. Preserve the current wording pending a scoped effect-term decision; do not conflate it with the general attribute `활력`. |
| `21417` | Meaning / terminology | `Socketed Items` can mean items that have sockets or items with gems already installed. Japanese supports the former, while Chinese and the Korean `보석 장착 아이템` can suggest the latter. The inventory category's exact runtime meaning is not established. |
| `21436` | Name / source discrepancy | This row spells the name `Fomorous Hughes`, while the related line at `21434` spells it `Fomorous Hugues`. Korean pairs each row with its exact English spelling. Do not silently normalize the source variation or register an alias here. |
| `21409` | Proper-name status | Capitalized `the Order` is rendered `우리 결사`; the row does not identify which organization the source means. Retain the translation pending context that establishes whether it is a named order. |
| `21384`, `21425` | Title pairing | Both rows address an `Archsage`, rendered `대현자` / `대현자님`. The term occurs broadly in the corpus, and the current material does not establish a project-wide rule to append the English title to every occurrence. Hold these two rows rather than creating an isolated pairing. |

## Rechecked Existing Findings

- `21321` remains a terminology candidate: this Teeth of Naros quest's
  ash-filled urns are called `항아리` here, while the same quest uses
  `유골함` elsewhere.
- `21338` remains a named-drink consistency candidate: `Victor's Brew` is
  `빅터의 맥주` here, while related item references use
  `빅터의 양조주(Victor's Brew)`.
- `21356` remains a local terminology candidate: its `Quarters` wording is
  `병동 구역`, while related SQ60 references support `병원 구역`.
- `21385` was cleared: `재료를 가져왔어` is a natural conversational delivery
  line and agrees with Japanese `素材を持ってきた`; no correction is needed.
- `21396` remains a place-name pairing candidate: `Hurvar's Doorsill` is
  written `허바르스 도어실`, unlike the established
  `허바르의 문턱(Hurvar's Doorsill)`.
- `21492` remains a terminology candidate: Hallidite's title `Oracle` is
  rendered `예언자`, while the same quest uses `신탁자(Oracle)`.

## Duplicate And Structural Checks

- All four language tables contain the 250 IDs in the same order. The range
  touches 59 exact-English duplicate groups (1,112 corpus rows); Korean
  wording is identical within every group.
- The total number of logical line breaks in the range is 45 in each language,
  and per-row line-break counts match across all four languages.
- Runtime-variable names and localized wrappers are present at `21488`.
  Japanese places the fate-meter marker before the button markers, while
  English, Chinese, and Korean use the order-preserving Korean sequence;
  no Korean marker is missing.
- Existing ledger fingerprints for all 61 rows were current. Asset links,
  handler order, and co-occurring NPC symbols were not used to assign
  individual speakers or playback order.

The ledger now contains 32,913 of 65,135 IDs (50.53%), leaving 32,222.
Sequential review reaches ID `21499`; the next range is `21500`-`21749`.
