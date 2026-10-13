# Preliminary Language Scan: `default` IDs 44851-44900

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 44851-44900 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 44853 | Paladin's Guard / `성기사의 수호` | Confirm whether this is a formal armor/item name, skill, or other title; standardize `Paladin`. | English capitalizes the phrase. Korean preserves its components, while Japanese and Chinese use similar guard/protection terms. The context is insufficient to settle the item category. | Medium |
| 44856 | Sparrows / `참새들` | Confirm whether capitalized `Sparrows` is a named group and standardize it with other occurrences. | English and Japanese identify the speaker as one of “We Sparrows”; Korean translates it literally as birds. Historical notes already leave this group name open. | Medium |
| 44862 | Warsworn / `워스원` | Preserve the hireling pitch while confirming the faction's canonical Korean form. | Korean retains the “fighters for hire” idea and invitation. Japanese paraphrases it as a warrior group; Chinese supports the hired-warrior meaning. | Low |
| 44863 | “humeral and physiological dissertations” / `상완골 및 생리학 논문` | Treat `humeral` as a possible source typo for `humoral`, but do not silently replace the anatomical reading; verify context. | Korean follows the literal upper-arm-bone meaning. The combination with physiology dissertations is unusual; the source-keyed log specifically leaves this word open. | High |
| 44864 | Dyth the Defender of Valor / `용맹의 수호자 디스` | Confirm Dyth's identity/title and retain the source's pronoun and “essence” wording without deciding the item's game mechanics. | English says the speaker captured Dyth's essence, refers to her, and kept her as a keepsake. Korean preserves the defender title and keepsake sense; Chinese also names the captured essence. | Medium |
| 44868 | Vengeance / `복수` | Determine whether capitalized `Vengeance` is an entity/faction name or the abstract concept, then standardize it. | Korean personifies vengeance as knowing sorrow. Japanese makes it `House of Vengeance`, while Chinese also presents vengeance as an agent; the exact referent is unresolved. | Medium |
| 44869 | Embassy / Memory Walk / `대사관` / `추억의 길` | Confirm the formal place names and retain the leisurely evening stroll and after-dark instruction. | Korean preserves the action and timing, capitalizing Memory Walk conceptually but using a generic Embassy form. Other locales localize both names differently. | Medium |
| 44872 | House of Ballads Armor / `발라드 가문의 갑옷` | Standardize `House of Ballads` and the item-name structure with related equipment entries. | Korean translates House as family and retains Armor. The source-keyed history records this among recurring House/faction terminology questions. | Medium |
| 44880 | 14-line Seelie Fae/Nyralim poem | Preserve the line-by-line imagery, threats, and addressee while reviewing the Korean syntax and recurring Seelie/Nyralim terms. | Korean retains all 13 embedded line breaks and the sequence of blood, forest, maggots, Barghest/Thresh, Seelie Fae, Nyralim, fate, oath, and corpse. Japanese and Chinese substantially reshape imagery; proper terms remain unsettled. | Medium |
| 44889 | Cross Slash / Cyclone markers | Confirm the canonical ability names and preserve both localized marker identities/order. | Korean leaves `Cross Slash` and `Cyclone` in English inside `{*1...}` markers; Japanese and Chinese localize those payloads. Both marker identities/order and the damage-over-time effect are retained. | Medium |
| 44891 | `Whatever ‒ whoever it was ‒ got him` / `그게 무엇이든... 누구든 그를 잡아갔지` | Preserve the speaker's uncertainty about whether the attacker was a thing or person, and clarify whether “let him lie” means leave the body undisturbed. | Korean retains the uncertainty and says to leave it as-is for now. The exact fate/context is not resolved by the surrounding sentence. | Medium |
| 44900 | river/azured-mist poem; literal `\` before quotation marks | Keep the seven-line poem's personification and imagery; verify whether the two literal U+005C backslashes immediately before the Korean quotation marks are intended. | Korean preserves six embedded line breaks and the river/mist/dew sequence, but contains two literal backslashes absent from English, Japanese, and Chinese. Similar Korean-only quote-adjacent backslashes were recorded at IDs 44459 and 44747. | High |

IDs 44851-44852, 44854-44855, 44857-44861, 44863, 44865-44867,
44870-44871, 44873-44879, 44881-44888, 44890, 44892-44899 generally retain
the English meaning on this first reading. Names, setting terms, and UI labels
remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical sections for IDs 44850-44924 were checked for
  Grim Onwig, Blue Saber, Paladin's Guard, Father Dynwel, Sparrows, Haxhi,
  quartermaster, the `humeral` dissertations, Dyth, Vengeance, Memory Walk,
  Helmgard, Darkvari, the 14-line corpse poem, Crows, Templar, Child of Dust,
  Elund Carth, Gorrenet/Hartwen, the river/azured-mist poem, House of Pride,
  Scion, Sojourn, Maid, and Wreath.
- The historical notes explicitly leave `humeral`, the captured essence and
  Dyth, personified Vengeance, the Seelie/Nyralim poem, and the meaning of
  “brumey brow” open. Both poems' source line layouts are noted.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 44851-44900 once
  and in identical ascending order.
- ID 44880 has 13 embedded line breaks in every locale; ID 44900 has six in
  every locale. The source's blank lines and stanza layout are retained.
- ID 44889 retains `{*1Cross Slash}` and `{*1Cyclone}` identities/order and
  their marker numeric fields in all locales. No numeric-value discrepancy
  was found.
- No hidden whitespace/format characters were found. ID 44900 contains two
  literal U+005C backslashes in Korean only, immediately before quotes.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 44851-44900 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 44901.
