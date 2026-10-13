# Preliminary Language Scan: `default` IDs 35051-35100

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 35051-35100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 35055 | `원소 화염 에너지를 저장하는 능력을 높이도록` | Preserve that the magically attuned cloth handwraps feed/replenish the wearer's mana pool and elemental-fire reserves, not merely increase storage capacity. | English uses “feed the wearer's mana pool and reservoirs.” Korean can read as improving the capacity to store mana/fire, shifting replenishment into storage ability. Japanese/Chinese describe increasing/replenishing the pools. Historical notes flag the elemental-fire handwraps. | Medium |
| 35062 | `아드레날린 파동` for `Adrenaline Surge` | Confirm the canonical skill name and use it consistently in the +15% Critical Hit chance condition. | Korean preserves +15% and the active-effect condition. `Surge` is translated as “wave,” while the English capitalization indicates a named ability; historical notes flag Adrenaline Surge. | Medium |
| 35065 | `웬센 왕과 그 일족` / `위대한 페이 가문의 시조` | Confirm `brood` as the royal lineage and whether “first of the Great Fae Houses” means founder/origin or foremost among the Houses; standardize Great Fae Houses. | Korean preserves the self-proclaimed-hero claim but resolves “first of” as the Houses' ancestor/founder. Japanese/Chinese likewise infer an origin/founding sense. The source alone leaves the exact hierarchy ambiguous. | Medium |
| 35067 | `요람의 수호자` / `지켜 왔어` | Confirm the full named entity/place `Cradle` (historical notes suggest Summer's Cradle) and preserve Callor/Terenia's role and the contrast that it had never needed protection until now. | Korean retains the guardian title and contrast but does not include “Summer” in the name. English capitalizes Cradle and the historical log identifies Summer's Cradle as a likely full term. | Medium |
| 35070 | `성배의 왕` for `King of Cups` | Standardize the card title/suit for Cups; confirm whether the established Korean card-game term is “Cup(s)” or “Chalice.” | Korean uses “chalice,” which may imply a different suit label from the English card title. Japanese/Chinese retain the literal cups suit. The historical audit lists Irion's card title for review. | Medium |
| 35076 | `정해진 자들` for `the Preordained` | Determine whether Preordained is a formal faction/collective and use its canonical Korean name rather than a generic “those whose fate is set.” | English capitalization suggests a named group. Korean uses a descriptive phrase; Japanese/Chinese also render it as destiny-chosen people. Historical notes flag Preordained. | Medium |
| 35077 | `블러디` for `Bloody` | Confirm whether this is the named entity Bloody Bones and use a consistent form with ID 34994 (`블러디 본즈`). | English shortens the name to Bloody; Japanese and Korean likewise use `Bloody` alone here, while Chinese uses a literal blood/bone name. Korean's earlier rendering adds “Bones,” creating an intra-corpus name variant. Historical notes flag Bloody/Bloody Bones. | Medium |
| 35079 | `자비의 빛` for `a shine of generosity` | Preserve the unusual “shine” image and distinguish generosity/magnanimity from mercy/compassion; retain the speaker's offer to do anything to witness it. | Korean renders generosity as `자비`, which can shift the virtue toward mercy. The English question/conditional is unusual; Japanese reads it as a little generosity, while Chinese retains a literal ray/light image. The historical audit asks what “a shine of generosity” means. | Medium |
| 35080 | `번역은 잘돼 가?` for `How goes the translation?` | Preserve the deliberately self-referential/meta translation question and the casual register. | Korean conveys the question naturally. Japanese/Chinese do the same; it is a meta string, not an instruction to edit or report progress. Historical notes identify it as a translation meta-joke. | Low |
| 35098 | `레코닝 모드` / `페이트시프트` / `운명의 실이 풀린 적` | Preserve the Reckoning-mode condition, the instruction to defeat as many enemies as possible before Fateshifting one, destruction of ALL unraveling enemies, and the large XP bonus; standardize ability terms. | Korean retains the sequence, all-enemies emphasis, and reward. English capitalizes Reckoning/Fateshift/ALL; Korean transliterates the mode/action and localizes “unraveling.” The historical audit flags the tutorial terminology. | Medium |
| 35100 | `이사는 ... 종말을 맞으리라는 게 언제나 정해져 있었어` | Preserve the certainty of Ysa's eventual end beneath Prismere blades, the speaker's limited ability to hold back the tide, and the addressee's possible power to change the currents. | Korean keeps the prophecy and water-current metaphor; it explicitly says the outcome was always predetermined, a natural reading of “has always been certain.” Named terms should remain consistent. | Low |

IDs 35051-35054, 35056-35061, 35063-35064, 35066, 35068-35069,
35071-35075, 35078, 35081-35097, and 35099 generally retain the English
meaning on this first reading. Proper names, lore, voice, and display
conventions remain integrated-pass candidates; no additional distinct
wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 35000-35199 flags the
  elemental-fire handwraps (35055), Adrenaline Surge (35062), Wencen's
  brood/Great Fae Houses (35065), Summer's Cradle and Callor/Terenia
  (35067), Irion's King of Cups title (35070), Preordained (35076),
  Bloody (35077), the generosity phrase (35079), the translation
  meta-question (35080), and Reckoning/Fateshift terminology (35098).
  These were checked against active Korean and all locale references.
- The historical audit's statement that `Cradle` likely refers to
  Summer's Cradle is a candidate context clue, not a confirmed expansion
  of the English source string at ID 35067.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 35051-35100 once
  and in identical order.
- Embedded line-break counts match across all four locales; this range has
  no multiline entries.
- No runtime-marker discrepancy was detected.
- Numeric values match: ID 35062 retains +15% Critical Hit chance; ID
  35066 retains the 4-6 range; ID 35082 retains +7% Critical Hit chance.
- The active Korean CSV SHA-256 remains
  `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`.
- No CSV text or source file was edited.

## Batch Status

IDs 35051-35100 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 35101.
