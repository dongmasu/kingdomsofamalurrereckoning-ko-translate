# Preliminary Language Scan: `default` IDs 44701-44750

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 44701-44750 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 44707 | Orison / `오리슨` | Confirm whether Orison is a named rite, prayer, or other setting-specific observance; retain the blessing and register. | English asks whether the Orison is complete. Korean transliterates the name and retains the blessing; Japanese also treats it as a named rite, while Chinese generalizes it to prayer. | Medium |
| 44709 | Counsel / `조언자` | Determine whether capitalized `Counsel` names a formal group, office, or individual adviser, then standardize it. | English capitalizes the term; Korean selects a singular adviser, while Japanese uses a generic adviser and Chinese a staff/strategist term. The source-keyed history explicitly leaves the referent open. | Medium |
| 44713 | “a day of judgment” / `오늘은 심판의 날` | Preserve the judgment-day force while checking whether “today” is justified by context. | Korean renders the line as “today is the day of judgment”; English says “This is a day of judgment,” which may be a general statement or a scene-specific declaration. | Medium |
| 44716 | potion-induced stammer / `주... 주민... 주민들` | Preserve the speaker's stumble and the potion-wearing-off cue; confirm that the interrupted word is intelligible in context. | Korean stutters through the Yolvan residents phrase and retains the potion effect. English and Japanese also stutter mid-word; Chinese has a different interrupted form. | Low |
| 44721 | “might as well be condemning the city” / `도시를 파멸로 몰아넣기라도 할 셈인가` | Confirm whether the speaker means the man is effectively pronouncing the city's doom, rather than actively driving it to ruin. | Korean can imply that he intends to destroy the city. Chinese uses a verbal “condemn” reading and Japanese describes attending the city's funeral; the English figurative meaning is context-dependent. | Medium |
| 44728 | House of Valor / `발라르 가문`; crumpled husk | Standardize the House name and check that the image of the House as a crushed husk remains distinct from the following mortal-world oppression metaphor. | Korean keeps the collapse, mortal oppression, withering, and fading, but recasts the “crumpled husk of its former self” as former glory collapsed and only a shell remaining. Japanese instead calls it an empty shell; Chinese is less clear. | Medium |
| 44730 | Lupoku / `로포쿠` | Preserve the official Korean manual form and use it consistently. | Korean follows the manual's `로포쿠`; the source-keyed historical note specifically calls for this spelling. | High |
| 44736 | Crows / Lords of Valor / `크로우들` / `용맹의 군주들` | Confirm whether both capitalized terms are formal groups and keep them distinct. | English contrasts the Crows with the Lords of Valor. Korean preserves the contrast; Japanese and Chinese render the second group differently, so names remain provisional. | Medium |
| 44742 | “sister” / `자매여` | Determine whether this is literal kinship or a religious/order form of address; preserve the formal welcome to the warrior. | English and Korean explicitly address the listener as sister. Japanese omits the address and Chinese specifies younger sister, which does not establish the relationship. | Medium |
| 44746 | Loremaster / `전승지식가`; “go straight to the top” / `최고위 인물` | Confirm the formal title and whether the line means consulting the highest-ranking Loremaster. | Korean preserves the advice to bypass an ordinary Loremaster and go to the highest authority; Japanese and Chinese support that hierarchy. | Medium |
| 44747 | deliberately misremembered threat; literal `\` before quotes | Retain the hesitation and threat wording, but verify whether the two literal U+005C backslashes immediately before the Korean opening and closing quotation marks are intended. | English contains ordinary quotation marks and the other locale values contain no literal backslashes. Korean contains exactly two backslashes, one before each quote; the previous source-keyed notes flag the line's misremembered threat but not these characters. | High |
| 44749 | mortal / `필멸자` | Preserve the setting-specific address and avoid a generic “human” sense. | Korean follows English's `mortal`; Chinese instead says “human.” The choice is supported by the English source and recurring setting terminology. | Low |

IDs 44701-44706, 44708, 44710-44712, 44714-44715, 44717-44720,
44722-44727, 44729, 44731-44735, 44737-44741, 44743-44745, and 44748
generally retain the English meaning on this first reading. Names, setting
terms, and UI labels remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical sections for IDs 44700-44749 were checked for
  fencing stolen goods, Orison, the House/mortal-army plan, Akara/Counsel,
  the potion stutter, Mel Senshir, Hexes, Kobold totem, toll insult, House of
  Valor/Pride, Lupoku, Crows/Lords of Valor, Akara-Tor, Nesta, the
  Loremaster, and the deliberately misremembered threat.
- The historical log explicitly leaves Orison, Counsel, Mel Senshir's
  wording, Hexes, House names, the “sister” address, and Loremaster rank
  open. ID 44747's unusual Korean backslashes were found in the active value
  during this batch's direct formatting check.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 44701-44750 once
  and in identical ascending order.
- No embedded line breaks, runtime markers, or hidden formatting characters
  were found. ID 44747 has two literal U+005C backslashes in Korean only.
- Japanese uses the digit `2` at 44718; this agrees with English “as a pair”
  and Korean `우리 둘`, and does not indicate a numeric-value change.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 44701-44750 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 44751.
