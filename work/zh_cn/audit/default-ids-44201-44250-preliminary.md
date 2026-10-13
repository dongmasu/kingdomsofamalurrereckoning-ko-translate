# Preliminary Language Scan: `default` IDs 44201-44250

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 44201-44250 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 44201, 44206, 44222 | Warsworn / `워스원` | Confirm the canonical Korean faction name and use it consistently for the rank/group and its members. | English uses both `Warsworn` and `Warsworn only`; Korean transliterates the term. Chinese translates it as `誓战者`, and Japanese also transliterates it. | Medium |
| 44204 | The Three Lamps / `세 등불 여관` | Confirm the canonical Korean name and whether this is the inn's formal name. | The dialogue identifies a place and directs the player to Esme; Japanese/Chinese use different literal forms. Korean adds the generic inn category, which fits context but is not explicit in English. | Low |
| 44214 | “My brother Carloman” / `내 형 카를로만` | Avoid specifying an older brother unless context confirms the speaker's gender and relative age. | English and Chinese only say “brother”; Japanese says younger brother. Korean `형` specifically means an older brother addressed by a male speaker, adding two unsupported details relative to English. | High |
| 44218 | “The joyness is back in his pace...” / two-line Korean verse | Review the source's nonstandard `joyness`, the “pace” image, and the poem's tone while retaining the two-part layout. | The English appears intentionally poetic or malformed; Japanese and Chinese rephrase the image differently. Korean preserves return of joy/love, the wife's face, and gratitude to the gods. | Medium |
| 44220 | House of Vengeance / `복수의 집` | Confirm and standardize the formal House/faction name. | English capitalizes the House name; Chinese and Japanese also translate it literally. Korean retains the House structure and the obstacle between the speaker and Gadflow. | Medium |
| 44224 | “I hope your death is quick.” / `고통 없이 빨리 죽길 바라` | Check whether adding “without pain” is appropriate to the source's wish for a quick death. | English says quick; Japanese explicitly adds not suffering, while Chinese says die quickly. Korean follows the Japanese implication, but it is not stated in English. | Low |
| 44231 | Hall of the Firstworn / `첫 맹세자들의 전당` | Confirm the intended canonical name and how to handle the source's inconsistent `Firstworn` spelling. | Historical notes explicitly flag `Firstworn` versus `Firstsworn`. Korean interprets the term as “first sworn”; Japanese uses a Firstsworn shrine, while Chinese says hall. | Medium |
| 44233 | baptism/ordination / `세례`; `서품 의식` | Verify the religious terms against established Korean terminology and setting context. | The speaker chose a name at self-baptism and underwent ordination rites; Korean preserves both events and the claim of legitimacy as a monk. | Low |
| 44240 | Bleeding Armor [DO NOT USE] / `출혈 방어구 [DO NOT USE]` | Confirm whether this is an internal/test item or an armor effect, while retaining the warning exactly. | The source marks the entry `[DO NOT USE]`; Korean preserves that exact warning. The item/skill sense of `Bleeding Armor` remains unclear and the Chinese warning text differs. | Medium |
| 44248 | “The count is lost” / `날짜를 잊었다` | Confirm whether the speaker has lost track of days/count rather than forgotten a date. | English is elliptical; Japanese and Chinese interpret it as losing the count of days. Korean chooses “forgot the date,” which is plausible but narrows the source. The chorus and cursed-lyre imagery remain present. | Medium |

IDs 44202-44203, 44205, 44207-44212, 44215-44217, 44219,
44221-44223, 44225-44230, 44232, 44234-44239, 44241-44247, and 44249
generally retain the English meaning on this first reading. Names, faction
terms, House labels, and the poem remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical section for IDs 44199-44249 was checked for
  the Average marker; Templar Octienne; Diodores/Ettin; Three Lamps/Esme;
  Didenhil/Blood Plague; Carloman/Tancese; Henge; House of Vengeance;
  Lyria; Gravehal; Firstworn; Mitharu baptism/ordination; kobold explosives;
  Racinon/Hillared; Motus; `[DO NOT USE]`; Giran; Dramil Frink; Anokatos;
  the fate chorus/lyre; and Wencen/Telling.
- The historical log specifically asks for review of the 44218 poem and
  inconsistent `Firstworn` spelling. Both line breaks and the warning label
  are preserved. No canonical name or ambiguous lore term is treated as
  settled.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 44201-44250 once
  and in identical ascending order.
- ID 44213 contains one embedded line break in all four locales; both stat
  lines are preserved. ID 44218 is a single physical line in all four
  locales; its two-part verse meaning remains on that line.
- The +25 Physical Damage and +40% Damage values at 44213 are retained.
- No runtime-marker mismatch or hidden formatting character was found.
  English `[DO NOT USE]` is retained exactly in Korean at 44240; Japanese
  omits it and Chinese localizes its wording.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 44201-44250 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 44251.
