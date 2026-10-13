# Preliminary Language Scan: `default` IDs 12000-12049

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 12000-12049.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 12000 | Kollossae / Ethene ritual | Verify the official Korean forms for the people and deity and the name of the ritual. | Korean names the Kollossae and Ethene and preserves that the scroll describes a ritual performed in worship of Ethene. Japanese/Chinese use different phonetic forms. Historical notes already flag the names and rite. | Medium |
| 12004 | `Bag parent. Not for actual use.` → `가방 상위 항목. 실제 사용 안 함.` | Determine whether this is an internal asset/category label rather than player-facing text; preserve its placeholder-like character pending context. | English and the Korean/Japanese drafts are terse asset-style labels; Chinese is a literal rendering. Historical notes already flag its internal-looking status. | Medium |
| 12008 | Court of Winter / House of Sorrows / cycles | Verify the established Court/House names and whether “the cycles” is an explanatory apposition or a named doctrine. | Korean retains the four-line verse and renders “Sorrows, the cycles” as “비탄과 순환의 섭리.” Japanese makes the House/cycles relation explicit, while Chinese leaves the phrase fragmentary. Historical notes already flag it. | Medium |
| 12014 | `Connection failed.` → `연결에 실패했습니다.` | Confirm whether this is a player-facing error message or a diagnostic string and retain appropriate UI register. | The Korean is semantically direct; only source/context can establish whether this short message should use formal UI phrasing. | Low |
| 12024 | `Buy a bed.` → `침대 구매` | Determine whether this is an actual purchase action or an inn/bed lodging option. | English says “Buy a bed,” but Japanese and Chinese phrase it as wanting lodging/staying overnight. Korean follows the literal English and may misrepresent the menu action. | High |
| 12031 | `I can't bear to feel its weight` → `이 돈의 무게를 견딜 수가 없어` | Preserve the line's possible literal/emotional ambiguity about handing over weekly pay. | Korean retains the “weight” metaphor; English, Japanese, and Chinese do not establish whether it is figurative reluctance or a literal burden. Historical notes already flag it. | Medium |
| 12035 | Eyes of Tirnoch / `none of the Tuatha have escaped my attack` | Verify the artifact name and whether the line means the attack defeated all Tuatha or that none escaped it. | Korean preserves the broad claim and the subsequent Gadflow apparition. The isolated log entry does not settle the exact scope of “none.” Historical notes already flag it. | Medium |
| 12037 | Grave Thresh / Gorguath hollow | Verify creature/location names and the unusual claim that the beast and hollow work together like lovers. | Korean renders `hollow` as `공동`, which can sound like “cavity” rather than a lair/cavern. English/Japanese/Chinese all preserve the personified partnership metaphor. Historical notes already flag the names and image. | Medium |
| 12042 | `he seemed sorry to kill us` → `우리를 죽이면서 미안해하는 것처럼` | Clarify whether the killer appeared remorseful, reluctant, or pitying. | English is ambiguous; Japanese says he seemed regretful, and Chinese says he seemed to regret killing them. Korean also favors remorse. Historical notes already flag the reading. | Medium |
| 12044 | Three-day patrol diary and interrupted sentence | Preserve the rough diary voice, the unfinished “Looks like” fragment, paragraph breaks, and the separate note about blank pages/dried blood. | Korean retains the abrupt cutoff and following editorial description. English itself has spelling/grammar errors and a sentence fragment; those are not silently normalized into extra plot. Historical notes already flag this entry. | High |
| 12046 | `Getting Your Hands Dirty` → `몸소 나서서` | Check whether this is an idiom about doing unpleasant/manual work, a quest title, or a literal action label. | The English idiom can mean undertaking difficult or unglamorous work; Japanese renders it as “dirty work,” while Korean emphasizes personally stepping in. The isolated title lacks context. | Medium |
| 12047 | Caria Eiren / Dokkalfar / `enchantmented armors` | Verify names and whether the armor's enchantment is the intended protection; do not reproduce the source's apparent typo as a Korean error. | Korean retains the bare-chested battle image and armor below the waist. The English adjective appears malformed, while Japanese and Chinese support an enchanted-armor reading. Historical-name consistency remains open. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 12000, 12004, 12008, 12031, 12035,
  12037, 12042, and 12044 against the active Korean and all three source
  locales. They remain open; historical notes were treated as evidence, not
  approval.
- ID 12024 and ID 12046 are additional candidates from the current
  cross-locale comparison.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts and runtime-token sequences match
  across all four locales in this range. No structural exception was found.
- Proper-name parentheses remain selectively applied; this range does not
  establish a global bilingual-display convention.
- Official Korean manual terminology could not be independently searched
  during this pass. Active Korean CSV hashes match the recorded baseline;
  no active CSV was edited.

## Batch Status

IDs 12000-12049 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 12050-12099.
