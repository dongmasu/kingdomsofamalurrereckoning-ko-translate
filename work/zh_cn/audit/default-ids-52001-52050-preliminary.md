# Preliminary Language Scan: `default` IDs 52001-52050

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 52001-52050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 52001 | `궁정의 영웅들` / boastful Court claim | Confirm which Court is meant and preserve the speaker's grandiose self-regard. | English says the speaker belongs among the Court's heroes and deserves adoration. Korean retains the boast and rhetorical question; the Court is not named in this row. Japanese refers to the heroes' court/house context. | Medium |
| 52008 | `[Female] 도적 페이블레이드` | Preserve the literal gender label and confirm the localized enemy/item terminology. | Korean retains `[Female]` exactly and localizes Bandit Faeblades. The historical audit requires preserving the literal gender marker; this is structural label text, not an invitation to translate it. | High |
| 52010 | Maybryn Wine / Gwalchmai | Confirm canonical spellings and whether the wine is being used to ply him into signing. | Korean retains that he begins drinking, improves in mood, and should be made to sign before more wine is needed. The two proper names remain open for corpus-wide spelling consistency. | Medium |
| 52011 | “chests stored in the Grand Bursar's” / `대회계관 보관소` | Clarify the incomplete possessive/source location and the exact room or office meant. | Korean interprets the Grand Bursar's as a storage/office location. Japanese and Chinese likewise supply a room/office sense; the English source is grammatically incomplete. | Medium |
| 52015 | `my brother` / `내 형제` | Keep the kinship term broad until context establishes the brother's age or gender-specific Korean term. | English does not specify older/younger brother. Korean's `형제` avoids inventing an age; Japanese and Chinese use sibling terms with potentially more specific readings. | High |
| 52020 | Armor repair / `갑옷` | Follow English “armor” while retaining the source discrepancy with Japanese. | Korean says to give Tarrick Smith armor for repair, matching English. Japanese says weapons; Chinese also says armor. The item-category conflict remains a source-reference question, not grounds to replace the English meaning. | High |
| 52022 | “Our families are all we poor souls have left” | Preserve the English plural/general family meaning rather than narrowing it to one child. | Korean says family is all that remains to people like the speaker. Japanese narrows this to “that child,” while Chinese also retains the broader family meaning. | High |
| 52024 | Neophyte / `신입자` | Confirm the formal Korean rank/title within the Order. | Korean preserves the greeting and offer of help; the exact rank may be better represented by the project's established initiatory terminology. Japanese uses a novice/trainee form, and Chinese says apprentice. | Medium |
| 52027 | Templar orders / Courdan “lost” the letter | Preserve the deliberate implication that the speaker arranged the letter's loss. | Korean retains conflicting orders and the pause before Courdan “lost” the letter. The source's dry implication is not made explicit, consistent with the English. | Medium |
| 52031 | Adept / `숙련자` | Confirm the established Korean term for this rank/category. | Korean follows the project's current provisional glossary form; the historical audit identifies it as provisional. | Medium |
| 52037 | Frost Trap stats | Preserve 45 Ice Damage, 12 Freezing Damage over 5 seconds, and 35 Mana cost. | Korean retains both damage values, the duration, the separate cost line, and one line break. | High |
| 52041 | “Burn the mayor and his selfish claims to Whitestone” | Preserve the inciting/figurative force without converting it into an unsupported literal action. | Korean follows the English imperative about the mayor and his claims. Japanese reframes it as burning the mayor and reclaiming the town; Chinese stays literal. Scene context should settle whether this is a slogan, threat, or literal command. | Medium |
| 52045 | Parry / `쳐내기`; stagger immunity | Confirm the project's standard Korean combat term and preserve 10 seconds. | Korean renders successful parrying as `쳐내기` and retains the 10-second stagger-immunity effect. The historical notes specifically call for checking this combat terminology. | High |
| 52048 | Dispelling / `마법 해제` | Confirm whether `Dispelling` names a crafting service, skill, or generic disenchantment. | Korean retains the visitor-facing offer and renders the capitalized activity as magic dispelling. English/Japanese/Chinese context does not fully establish the in-game service category. | Medium |

Other reviewed rows generally preserve the English meaning on this first
reading. Recurring names/terms remain open for consistency, including Court,
Fae Relic, Order of Ash, Jakin, Maybryn Wine, Gwalchmai, Grand Bursar,
Ansilla, Rathir, Idylla, Galette Caverns, Malwyn, Balor, Tilera, Akara,
Gallows End, Templar, Courdan, Adept, Klurikon, Tine Delfric, Florion,
Ettin, Whitestone, Entry III, Aesa Alfarinn, Oath of the Primos, and
Dispelling. Existing Korean forms were preserved.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 51951-52049. It
  flags the Court/boastful voice (52001), `[Female]` label (52008),
  Maybryn Wine/Gwalchmai (52010), the Grand Bursar's location (52011),
  unspecified brother age (52015), divided map (52016), Malwyn/Balor pact
  (52017), corrupt-being wording (52019), armor/weapons conflict (52020),
  families versus child (52022), Neophyte (52024), the lost letter (52027),
  `$SQ54.bribe_value$` (52028), Adept (52031), Frost Trap values (52037),
  mayor/Whitestone wording (52041), Entry III (52042), parry/stagger
  terminology (52045), Oath of the Primos, and Dispelling (52047-52048).
- Historical questions remain open, not review approvals.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 52001-52050 once
  and in identical ascending order.
- Physical line-break counts and detected runtime-token identities/order
  match throughout this range. ID 52004 preserves `{1}`; ID 52008
  preserves `[Female]`; ID 52028 preserves `$SQ54.bribe_value$`; ID 52037
  preserves its line break, values, and cost. No hidden format/control
  characters were detected.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

IDs 52001-52050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 52051.
