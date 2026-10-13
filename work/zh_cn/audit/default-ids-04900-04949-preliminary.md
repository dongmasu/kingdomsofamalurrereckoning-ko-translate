# Preliminary Language Scan: `default` IDs 4900-4949

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 4900-4949.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical `default` questions and checked meaning, voice,
  proper names, titles, and quest terminology.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 4904 | 평화를 지켜. | Translate `Keep the peace` as a warning not to cause trouble if that is the speaker's intent. | Japanese says “don't cause trouble” and Chinese says to behave. Korean's literal `평화를 지켜` can sound like a general peacekeeping order; surrounding guard/NPC context should determine the idiom. | Medium |
| 4907 | 완벽한 미사란(Mitharan) 피해 증폭 손잡이 | Standardize `Mitharan` with the official Korean `Mitharu` form and clarify the equipment modifier `Damaging Grip`. | English/Japanese/Chinese identify a Mitharan item and damaging grip. Korean's `피해 증폭 손잡이` is a plausible compound, but `미사란` conflicts with the manual-derived name and related item rows. | Medium |
| 4914 | 지혜의 희생 제단 찾기 | Confirm the phrase boundaries in `Sacrificial Altar of Wisdom`. | English/Japanese/Chinese identify an altar associated with Wisdom and sacrifice, but the English compound allows more than one attachment. Korean's `지혜의 희생 제단` is plausible; keep the object/function open pending quest context. | Low |
| 4918 | 우리는 우리 동족 하나를 아카라(Akara)에게 제물로 바쳐. 우리 중 누구도 본 적 없고, 무엇을 바라는지도 모르는 존재에게 말이야. | Preserve the speaker's uncertainty about Akara's wishes; do not treat the English grammar typo as a different meaning. | English contains `one that's desires`, evidently a possessive error. Japanese/Chinese and Korean all describe an unseen being with unknown desires, and Korean retains the disturbing sacrificial statement. | Medium |
| 4925 | 벨네(Belne) 장인이 죽었으므로 마녀 기사 아니라(Anira)를 물리치는 데 필요한 물품을 모두 구할 수 없다. 이제 아니라는 장인들을 억류하고 있는데도 그들을 풀어 주는 일을 돕지 못하게 되었다. | Recast the second sentence to preserve that the narrator is unable to help free the Master Makers; avoid the concessive `-는데도` reading. | English says Anira holds the Master Makers and the narrator will be unable to help free them. Korean's `아니라는 장인들을 억류하고 있는데도` reads “even though Anira holds them,” producing an awkward contrast with the inability. The proper status of `Master Makers` also remains open. | High |
| 4930 | 서약 방패. | Determine whether `Pledgeshield` is a rank, faction title, or personal epithet before translating the compound literally. | English capitalizes it; Japanese reads it as a mercenary rank and Chinese translates it as an oath-shield. Korean follows the literal compound, but the term recurs as a possible formal Warsworn rank. | Medium |
| 4934 | 공성 파괴자(Siege-Breaker)인 네가 여기에 왔군! 잘됐어. 이제 투아사도 우리를 두려워할 이유가 생겼겠지. 나는 굴착자들(Delvers) 중 하나인 히세너(Hicener)야. | Establish the formal title `Siege-Breaker` and group name `Delvers`. | English presents both as capitalized titles/names; Japanese/Chinese differ in rendering and segmentation. Korean preserves the title, faction label, and speaker identity, but their canonical Korean forms remain unsettled. | Medium |
| 4941 | 글쎄, 그 여자가 누군지는 몰라. 관심도 없어. 내가 신경 쓰는 건 힘이야. 이 한심한 각본을 끝낼 힘. 모든 노래에서 여름의 챔피언은 승리하고 적은 쓰러지지. | Preserve the fatalistic `pitiful design` idea and correct the final clause to say the enemy falls. | English/Japanese/Chinese say the Summer champion wins and the enemy falls in every song. Korean's `적은 쓰러지지` is ambiguous and reads as a negative (“the enemy does not fall”) or an incomplete ending, reversing/obscuring the source. `Design` also remains context-dependent. | High |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 4925, 4930, 4934, and
  4941 against active Korean and matching source rows.
- Same-numbered historical questions for `base` and `affix` remain separate;
  no cross-resource finding was merged.
- No historical disposition was treated as approval.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- Control-marker sequences and explicit line-break counts match the English
  rows in all three references and active Korean.
- No active CSV structure or text was changed.

## Batch Status

IDs 4900-4949 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
