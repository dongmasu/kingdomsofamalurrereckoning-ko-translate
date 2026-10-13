# Preliminary Language Scan: `default` IDs 39551-39600

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 39551-39600 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 39551 | Children of Dust / `먼지의 자손` | Align the people-name with the established form used in the majority of the corpus, or record an approved distinction if “children/offspring” is intended. | Source-keyed uses vary among `먼지의 자손`, `먼지의 자녀`, and `먼지의 자식`. `먼지의 자손` is common in the active draft, but the entity is a named people and has no settled glossary decision in the checked historical range. | Medium |
| 39553 | English production-style sentence describing Gadflow/Alyn dialogue; Korean translates it as prose | Confirm whether this is intended as player-facing localization or an internal scene description. | The English says “Gadflow taunts the player ... and Alyn explains ...,” which reads as a content summary rather than dialogue. Japanese and Chinese also translate the same descriptive sentence, so this may be a source-side/internal label rather than a Korean-only issue. | Medium |
| 39558 | “Akara's heart” / `아카라의 품` | Confirm whether this is a figurative welcome into Akara's care/afterlife or a named religious/world concept that should retain “heart.” | English, Japanese (`アカラの心`), and Chinese (`阿卡拉之心`) all retain “heart”; Korean naturalizes it to “embrace.” The intended lore sense is not clear from this blessing alone. | Medium |
| 39562 | A Valorous Name / `용맹한 이름` | Check whether the title means a name/reputation won through valor rather than a literally valiant name. | Japanese `勇名を馳せる` means to win renown for valor; English and Chinese are more literal. This is the only occurrence of the exact English title in the active source, so title/UI context may decide the rendering. | Medium |
| 39567, 39582 | Fatesworn / `운명에 맹세한 자들`; Warsworn / `워스원` | Review faction-name rendering and bilingual marking consistently with related entries. | The corpus uses multiple forms for Fatesworn, including `운명맹세자`, `페이트스원`, and `운명에 맹세한 자들`. The 396 Warsworn rows also vary among `워스워른`, `워스원`, and `전쟁맹세단`; ID 39582 uses the shorter form. These are terminology candidates, not authorization for global replacement. | Medium |
| 39570 | “I just about choked on my tongue.” / `하마터면 혀를 깨물 뻔했어.` | Preserve the idiomatic meaning of being stunned rather than describing nearly biting one's tongue. | The English uses an astonishment idiom; Japanese and Chinese likewise describe nearly swallowing/choking on the tongue. Korean `혀를 깨물다` normally means to bite one's tongue and changes the image/implication. | High |
| 39571 | the Maid / `시녀` | Check consistent treatment of the Maid as a named title, including the project's unresolved bilingual-name display convention. | The source capitalizes `Maid`; many related Korean entries mark the title as `시녀(The Maid)`, while this dialogue line has only `시녀`. Whether parenthetical English is needed in dialogue remains a project-wide style decision. | Low |
| 39589 | House of Sorrows / `비탄의 가문` | Align with the predominant `비탄의 집` form unless the “House” sense is intentionally distinguished. | The English names the faction, while the active corpus most often uses `비탄의 집(House of Sorrows)` and also contains `비탄의 가문`. Related audit questions remain open. | Medium |
| 39595 | “Men forsake their faith and disappear into the woods, or worse.” / `신앙을 버리고 숲속으로 사라지는 이들도 있고, 더 끔찍한 일을 겪는 이들도 있지.` | Preserve the source's unresolved implication of “or worse” without asserting a particular harm unless context confirms it. | Japanese keeps the parallel “disappear into the woods, or worse” construction. Korean interprets the final phrase as people suffering something worse, which is plausible but more specific than the English fragment. | Medium |

IDs 39552, 39554-39561, 39563-39566, 39568-39569, 39572-39581,
39583-39588, 39590-39594, and 39596-39600 generally retain the English
meaning on this first reading. Other proper names and setting terms remain
subject to integrated review.

## Historical Audit Reconciliation

- No source-keyed historical question entry was found for IDs 39551-39600;
  this range falls within the documented 37700-40349 gap.
- Related unresolved terms for Children of Dust, Warsworn/Fatesworn, the Maid,
  and House of Sorrows were checked. They remain open and are not treated as
  approved terminology decisions.
- The official Korean manual could not be text-searched in this environment;
  no manual-based terminology claim is made here.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 39551-39600 once
  and in identical order.
- Embedded line-break counts match across all four locales. No runtime-marker
  identity/order or numeric-token mismatch was detected.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 39551-39600 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 39601.
