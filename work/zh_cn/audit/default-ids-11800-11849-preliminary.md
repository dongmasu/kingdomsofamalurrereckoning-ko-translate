# Preliminary Language Scan: `default` IDs 11800-11849

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 11800-11849.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 11800 | Argine / Maun Cointaker / Grim Onwig / Hierophant | Preserve the completed hoard investigation and the separate new step in Grim Onwig's plan; note the English source's lower-case sentence start and punctuation roughness. | Korean retains the request, the hoard's being a ruse, and Grim's contact during the return. English has `while` after a sentence break and a lower-case opening, while Japanese/Chinese normalize the narrative. The exact Hierophant title remains provisional. | Medium |
| 11803 | Preordained assassins → `예정된 자들` | Align the group term with prior Preordained occurrences and retain the escape route through the assassin army. | Korean preserves Agarth, Cinderpit, Crow Peak, and the obstacle. The group name remains under corpus-wide review; historical records already flag recurring Preordained usage. | Medium |
| 11804 | Shardfall / gems → `보석 원석` | Verify whether the objective is to harvest gems or specifically rough/unprocessed stones; align the place name. | Korean follows the Japanese “raw stones” interpretation, while English says gems and Chinese says gems. The task sequence is otherwise preserved. | Medium |
| 11806 | Master Makers / Witchknight Anira → `마녀 기사 아니라` | Preserve that Gadflow placed the makers there under Anira's supervision; align the title/name spelling and avoid the Korean negation ambiguity in `아니라`. | Korean retains the supervision and secret-planning context. `아니라` is visually identical to the common Korean “not/but rather”; this repeats the already-documented Anira issue at IDs 3515, 10262, and 11794. | High |
| 11814 | `Globant Project Manager` | Confirm whether this is a developer/test label or player-facing content before deciding whether to retain it verbatim. | Korean leaves the English job label in Latin script, matching English and Japanese; Chinese translates “project manager.” The row alone does not establish its visibility. Historical notes already flag it. | Medium |
| 11815 | chalice → `성배` | Verify whether this is a generic chalice or a religious “holy grail”; retain the claimed wine-improving function. | Korean preserves that it makes poor wine taste extraordinary and looks fancy. English only says “chalice”; Chinese also uses a communion-cup term. Historical context is insufficient to establish religious significance. | Medium |
| 11818 | `Inoculation` → `예방 접종` | Verify the official Korean medical/UI term and whether the label refers to a procedure or status. | Korean provides a standard vaccination/inoculation rendering; Japanese transliterates, Chinese uses inoculation. The isolated label gives no menu or medical context. | Low |
| 11821 | Ever Glen / Lir / Hironar / Aife / step-children | Verify names and shifting pronouns; retain the servants' blocked passage and the narrator's uncertainty about the stepchildren's deaths. | Korean preserves the forest's corruption, Aife's behavior, Lir's absence, the barred servants, and the narrator's question rather than asserting a cause. Structural exception: English, Japanese, and Korean have five embedded line breaks; Chinese has four, omitting the blank separator after the opening sentence. Korean follows English/Japanese layout. Historical notes already flag this passage. | High |
| 11830 | Pledgeshield rank → `서약방패병` | Confirm whether Pledgeshield is an earned rank/title and align it with the game's Hireling progression. | Korean preserves that the player must prove themselves to earn the rank. English capitalizes the term; Chinese transliterates it as a title and Japanese identifies a mercenary rank. The exact Korean class/rank remains provisional. | Medium |
| 11833 | Frostbreak Sea / Dead Kel / Hanged Men / Alfar Merchant Navy | Preserve the urgent recruitment-poster voice, pirate threat, and call to visit Rathir. | Korean retains the return of Dead Kel, the Hanged Men crew, pursuit of the pirate king, and all calls to action. All four locales preserve six embedded line breaks. Faction and place-name forms remain candidates for corpus alignment. | Medium |
| 11835 | Blood Plague / boggarts → `혈역병` / `보가트` | Reconcile the disease form with `피의 역병` at ID 34 and other active uses; retain that boggarts spread it. | Korean follows the source's causal statement. The disease has both `피의 역병` and `혈역병` active forms, and creature spelling/number also needs a corpus-level pass. | High |
| 11840 | `No Saturnyn? No safety?` → `새터닌도, 안전도 없다고요?` | Determine what Saturnyn denotes and whether safety means security, shelter, or a safe future. | Korean preserves the repeated rhetorical questions. English leaves Saturnyn unexplained; Japanese and Chinese likewise do not establish its category, with Chinese more explicitly reading safety as shelter. Historical notes already flag it. | Medium |
| 11845 | `a spark of recognition` / `You have a love too` | Preserve the speaker's inference about the player's past or present love without converting the “spark” into agreement. | Korean reads the spark as recognition and retains the possibility of a current or former love. Chinese reads it as agreement; Japanese supports recognition/experience. The identity of “her” and the inference remain context-dependent. Historical notes already flag the line. | Medium |
| 11846 | `a damned waggish bedlam` → `고약하고 짓궂은 소동` | Retain the humorous claim that the shroud can cause useful mischief/confusion; verify the exact sense of “waggish bedlam.” | Korean renders the phrase as a mischievous commotion. Japanese calls it amusingly useful and Chinese emphasizes chaos; the unusual English phrase is not a literal technical effect. Historical notes already flag it. | Medium |
| 11849 | `that that the evidence` | Preserve the source's stutter/duplication only if intentional; otherwise do not reproduce a likely duplicate in Korean. | English contains duplicated `that`; Korean naturally omits the repetition and retains that the evidence supports the opposite conclusion. Japanese/Chinese also normalize the syntax. This appears to be a source typo, not a translation omission. | High |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 11814, 11821, 11834, 11840, 11845-11846,
  and 11852. They remain open; historical candidates were not treated as
  approved.
- Confirmed the line-break discrepancy at ID 11821: Chinese has four
  embedded line breaks, while English/Japanese/Korean have five. The missing
  Chinese break is after the opening sentence.
- Reconciled the Anira spelling at ID 11806 with documented active variants
  at IDs 3515, 10262, and 11794.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts and normalized runtime-marker
  class/order signatures match except for the documented Chinese line-break
  exception at ID 11821. No runtime markers occur in this range.
- ID 11833 has six embedded line breaks in every locale; no other
  line-break difference was found in the range.
- Official Korean manual terminology could not be independently searched
  during this pass. Active CSV hashes match the recorded baseline; no active
  CSV was edited.

## Batch Status

IDs 11800-11849 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 11850-11899.
