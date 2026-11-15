# Sequential `default` Revalidation: IDs `24000`-`24249`

- Date: 2026-11-12.
- Compared all 250 active Korean entries with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register, terminology, names, and format.
- Rechecked 57 existing ledger records and added 193 previously unrecorded IDs.
- Recorded 15 new correction candidates and one evidence-limited hold.
  Existing candidates `24050` and `24206` remain open; `24136` was
  reclassified from not-issue to a format candidate.
- No translation CSV, immutable source, extracted asset, or localization
  binary changed.

## Correction Candidates

These are review findings, not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `24037` | Objective form | `Kill Balthasar's Guards` is rendered as the bare noun phrase `발타사르(Balthasar)의 경비병 처치`. Use the established neutral action form, such as `발타사르(Balthasar)의 경비병 처치하기`. | High |
| `24041` | Objective form | `Talk to Ost Ordura` is rendered `오스트 오르두라(Ost Ordura)와 대화`, unlike established `-기` objectives. Consider `오스트 오르두라(Ost Ordura)와 대화하기`. | High |
| `24050` | Naturalness / objective form | Retain the earlier candidate: `Kill all the sprites` is `스프라이트 모두 처치`, while the adjacent objective uses `-기` (`스프라이트 둥지 찾기`). Consider `스프라이트 모두 처치하기`. | High |
| `24055` | Naturalness / grammar | `예정된 자들(Preordained) 광신도들에게` lacks a grammatical link between the faction and its cultists. Consider `예정된 자들(Preordained)을 따르는 광신도들에게`, preserving the Freehold entrance and mountain-hollow details. | High |
| `24092` | Format / item-name pairing | The complete source label `Flawless Mitharan Moonlight Grip` is represented only by `완벽한 미타란(Mitharan) 달빛 손잡이`. Consider pairing the complete label, e.g. `완벽한 미타란 달빛 손잡이(Flawless Mitharan Moonlight Grip)`. | High |
| `24109` | Format / item-name pairing | The complete source label `Flawless Mitharan Sunlight Rivets` is represented only by `완벽한 미타란(Mitharan) 햇빛 리벳`. Consider pairing the complete label, e.g. `완벽한 미타란 햇빛 리벳(Flawless Mitharan Sunlight Rivets)`. | High |
| `24114` | Naturalness / meaning | `징조일 수 있지만 축복일 수도 있어` leaves the card as an unclear subject and repeats the “omen” idea after explaining its prediction. Consider `이 카드는 불길한 징조일 수 있지만 축복을 뜻할 수도 있어. 죽음이 갈등을 끝내 주는 때도 있으니까.` Preserve the card's prediction of imminent death. | Medium-high |
| `24125` | Terminology / name pairing | The creature/rank phrase `Niskaru lord` is split as `니스카루(Niskaru) 군주`, unlike the complete type pairing used for comparable creature names. Consider `니스카루 군주(Niskaru Lord)` while preserving the surrounding Bloodgrin account and the uncertainty explicitly stated in the source. | Medium-high |
| `24136` | Format / name pairing | The source name is the single word `Skyblossom`, but the Korean pairs it as `Sky Blossom`. Use the exact source spelling, `하늘꽃(Skyblossom)`. The same English/Korean pair occurs at `17683`; keep the two occurrences aligned. | High |
| `24138` | Naturalness | `고통과 비극이 표지처럼 놓일 때도 있어` is a literal and awkward rendering of a path marked by suffering and tragedy. Consider `진정한 깨달음에 이르는 길에는 고통과 비극이 따를 때도 있어`. | Medium-high |
| `24154` | Format / name pairing | The armor-set name `Elemental Cloak` is rendered `원소 망토` without its English pairing, while other named places and materials in the description are paired. Consider `원소 망토(Elemental Cloak)`; preserve the description of the robes' disorienting effect. | Medium-high |
| `24155` | Objective form | `Travel to Ysa` is rendered `이사(Ysa)로 이동`, a bare action noun. Consider the established neutral objective form `이사(Ysa)로 이동하기`. | Medium |
| `24172` | Format / name and title pairing | `Maire, Queen of Cups` is rendered `컵의 여왕 메어(Maire)`, pairing only the personal name. Consider `컵의 여왕 메어(Maire, Queen of Cups)`, consistent with the prior exact-source finding at `21023`. | High |
| `24214` | Naturalness | `잘 말했어` is an awkward calque of `Well said`. Consider `옳은 말이야` or another natural acknowledgment, preserving the following admission that the speaker meddled with magic too often. | High |
| `24237` | Format / name pairing | The named location `Motus Mining Outpost` is rendered `모투스 광산 전초기지` without its English name. Consider `모투스 광산 전초기지(Motus Mining Outpost)`. | High |
| `24240` | Terminology / name pairing | `Children of the Dust` is rendered `먼지의 자손`, while related active Korean entries use `먼지의 자식들` for this named group. Align the phrase and pair the full name: `먼지의 자식들(Children of the Dust)`. | High |
| `24246` | Speech level / naturalness | Airmer's introduction shifts within one utterance from plain `-군` to archaic deferential `-소/-이오`. Japanese uses a conversational register, and the earlier Airmer dialogue review at `47557` also selected conversational Korean. Recast the whole introduction consistently in a natural conversational register without changing the chivalric relationship or self-identification. | Medium-high |

## Evidence-Limited Hold

| ID | Dimension | Reason |
| ---: | --- | --- |
| `24024` | Meaning / address | English `dove` may be an affectionate form of address or a character-specific epithet. Japanese omits it, Chinese uses `和平使者`, and Korean has the general `그대`; without the preceding exchange, do not choose a more specific Korean form. |

## Rechecked Existing Findings

- `24206` remains a meaning candidate. In the `The Flowering` context,
  Japanese explicitly asks why the addressee is still alive; Korean
  `왜 아직도 남아 있는 거지?` can instead ask why they are still present.
  Consider `왜 아직 살아 있는 거지?`.
- `24219` remains distinct from `18967` despite identical English
  `Here we are.` Japanese uses `着いたか` (“we've arrived”) at `18967` but
  `ここにいるわ` (“I'm here”) at `24219`; Korean `도착했군` and `여기 있어`
  preserve that source-supported distinction.
- `24136` is reclassified as a format candidate because `Skyblossom` is
  paired with the incorrectly spaced `Sky Blossom`. The identical
  English/Korean entry at `17683` has the same mismatch and is noted for
  ledger alignment.
- Other existing records in the range were rechecked against all four
  languages and retained; no speaker or playback order was inferred from
  asset links or key ordering.

## Duplicate And Structural Checks

- The range touches 63 exact-English duplicate groups (1,289 corpus rows).
  Korean wording is identical within the groups except `Here we are.`
  (`18967`, `24219`); the Japanese contexts support the different Korean
  readings documented above.
- Logical line-break counts and normalized runtime/control-token signatures
  match across all four languages for every ID in this range.
- The single-word `Skyblossom` spelling issue and the incomplete
  `Maire, Queen of Cups` pairing are terminology/label findings, not
  structural token errors.

After recording this range, the ledger contains 34,937 of 65,135 IDs
(53.64%), leaving 30,198. Sequential coverage reaches ID `24249`; the next
range is `24250`-`24499`.
