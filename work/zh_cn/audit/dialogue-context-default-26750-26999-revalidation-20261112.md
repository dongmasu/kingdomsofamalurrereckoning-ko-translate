# Sequential `default` Revalidation: IDs `26750`-`26999`

- Date: 2026-11-12.
- Compared all 250 active Korean entries with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register where applicable, names,
  terminology, and format.
- Rechecked 57 existing ledger entries and added 193 IDs. Nine correction
  candidates were recorded (eight newly flagged and one reclassified from
  `not-issue`), along with one evidence-limited hold. Four prior candidates
  were retained after rechecking.
- The translation CSV, source files, and extracted game assets were unchanged.

## Correction Candidates

These are review findings, not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `26762` | Name / format | `Ainmhi` is the named character from the Wandering Well quest, already paired as `아인미(Ainmhi)` elsewhere, including IDs `901`, `5542`, and `11750`. Add the English pairing to `아인미`. | High |
| `26781` | Meaning | `Anyone who learned too much had to die` describes what happened to those people; Korean `죽여야 했지` instead says the speaker or their group had to kill them. Consider `너무 많은 걸 알아낸 자는 누구나 죽어야 했어`, preserving the source's passive/necessity construction without assigning an unstated agent. | High |
| `26783` | Naturalness / names / format | This long Apotyre history is semantically complete and its logical paragraph breaks match the references, but several established names are unpaired (`Tyrenium`, `Scholar Joson`, `Basilica Gnostrum`, `Motus Mining Interests`, and `trec`). Use the established `티레니움(Tyrenium)` spelling and pair the other names at first mention. `보기 좋은 반사광의 돌` is awkward, `커다란 회색석` is an unnatural rendering of `great graystone`, and `위대한 티레니움 붐` is an overly literal rendering of `The great Tyrenium boom`; refine these phrases without changing the historical claims. | High |
| `26884` | Name / format | `Dartan` is rendered `다탄` without pairing, while this same name appears as `다르탄(Dartan)` at IDs `11388`, `28619`, and `39667`. Consider `다르탄(Dartan)` here, retaining the source's reference to his shop and gems. | High |
| `26897` | Terminology / format | `the Sorrows` is rendered only as `비탄`. In the related House of Sorrows storyline, the same capitalized term names the magical force, distinguished from the faction `House of Sorrows` (for example, IDs `60298` and `64074`). Consider `비탄의 힘(Sorrows)` here; apply this only to the force in this context, not as a global replacement. | Medium-high |
| `26921` | Meaning / terminology | `the Testament` refers to Belen's death-cult faction, not a literal testament. The references confirm the faction, and the active translation consistently calls it `벨렌의 성약단(Belen's Testament)`. Replace `유언단` with that established form. | High |
| `26933` | Name / format | `The Burn` is a named location, rendered here as unpaired `번트`. The accepted location form is `번(The Burn)` at IDs `7284` and `26473`; align this occurrence while preserving the military-access meaning. | High |
| `26939` | Meaning / naturalness | `Enconeg has rewarded me for my help` is rendered `엔코네그는 도와준 보답을 했다`, an awkward construction that obscures who received the reward. Consider `엔코네그(Enconeg)가 도와준 보답으로 내게 보상을 줬다`, keeping the journal's first-person perspective. | High |
| `26940` | Objective format | `Search Nuala Ignas` is an action objective, but `누알라 이그나스(Nuala Ignas) 수색` is a bare noun phrase. Align with the project's action-objective form: `누알라 이그나스(Nuala Ignas) 수색하기`. | High |

## Evidence-Limited Hold

| ID | Dimension | Reason |
| ---: | --- | --- |
| `26912` | Meaning / source conflict | English and Chinese say `Very noble`, while Japanese says `ありがとう` (“thank you”). Korean `마음은 고맙지만` follows the Japanese gratitude reading and does not clearly preserve the English/Chinese evaluation. Keep on hold until the exact scene or a stronger source resolves whether this is praise or thanks. |

## Rechecked Existing Findings

- `26866`: retain the naturalness/register candidate. English `Hunt well` and
  Japanese `うまくやれよ` are casual; Korean `사냥 잘하게` is stiffer and
  less natural than an imperative such as `사냥 잘해`. No speaker is assigned.
- `26880`: retain the Syllareta spelling/name-consistency candidate; the row
  remains an objective, not a speaker-attributed line.
- `26916`: retain the shared-source consistency candidate for the final
  sentence `There are plans being made to seize this city.` The line's
  current meaning is understandable; the candidate concerns alignment with
  the same English sentence elsewhere.
- `26929`: retain the spacing/terminology candidate for `Witch Knight`,
  rendered `마녀기사` here while the established form is `마녀 기사`.

No individual speaker or playback order was assigned from asset membership,
numeric ID order, co-occurring names, or serialized handler order.

## Duplicate And Structural Checks

- Fifty-nine exact-English duplicate groups touch this range (714 corpus
  rows); all Korean translations match within each group.
- Embedded logical line-break counts match across English, Japanese, Chinese,
  and Korean for all 250 IDs. The paragraph layout of the long text at `26783`
  follows the source layout.
- Runtime-variable and localized-markup token signatures match across all
  four languages for the range.
- The ledger records current four-language fingerprints for every ID in the
  range; the existing 57 rows retain their prior evidence links.

After recording this range, the ledger contains 36,999 of 65,135 IDs
(56.80%), leaving 28,136. Sequential coverage reaches ID `26999`; the next
range is `27000`-`27249`.
