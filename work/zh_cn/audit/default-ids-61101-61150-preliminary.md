# Preliminary Language Scan: `default` IDs 61101-61150

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 61101-61150 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 61101 | “raising the Hyperian” / `하이페리온을 일으켜 세워` | Confirm the lore-specific meaning of “raising” Hyperian and its relation to weaving Idylla's fate. | Korean reads this as raising/reviving Hyperian and preserves the destiny claim; the source-keyed audit asks for the lore sense. | Medium |
| 61104 | `the unmaking of Dead Kel` / `완전한 소멸` | Verify whether “unmaking” means destruction, undoing, or another setting-specific outcome. | Korean chooses complete destruction; Japanese says destruction and Chinese says ruin, but the historical question keeps the lore-specific term open. | Medium |
| 61116 | “in the open” / `탁 트인 곳에서` | Confirm whether this means living outdoors/openly or living in an exposed social arrangement. | Korean interprets it as an open-air place; the phrase is deliberately qualified by “or something close to them,” and the source-keyed audit requests context. | Medium |
| 61118 | “Another stirs in Yolvan?” / `또 누군가 깨어났나?` | Preserve the ominous ambiguity and verify what or who is stirring in Yolvan. | Korean interprets `stirs` as awakening; English, Japanese, and Chinese retain a terse, context-dependent question. | Medium |
| 61119 | `CAPITAL` | Retain the raw English key label until the UI meaning is confirmed. | Korean preserves `CAPITAL` unchanged; Japanese interprets it as half-/full-width input and Chinese as the Caps key, so translating it now would silently choose among conflicting UI meanings. | High |
| 61120 | “their” gardens/stone tea | Identify the antecedent of “their” and verify the setting-specific “stone tea.” | Korean preserves the star-lit gardens and calming stone tea without inventing an antecedent; the historical audit marks both references as setting-specific. | Medium |
| 61124 | `Flight` / `비행` | Confirm whether this capitalized label means flying or escape/flight from danger. | Korean and Chinese read it as flying; Japanese reads it as escape. The source-keyed audit explicitly records this conflict. | Medium |
| 61127 | “Bisarane has raised me against my will” / `되살렸어` | Verify whether `raised` means resurrected or another forced return to life. | Korean chooses resurrection; the English wording and the character's statement about being made part of a design leave the exact mechanism open. | Medium |
| 61129 | Archsage/spire-top history | Preserve the uncertainty about his former position and the cause of his breakdown until lore context is checked. | Korean says he held the rank immediately below the Archsage atop the spire; the source-keyed audit asks whether this is the intended history and how the spell/lover alternatives relate. | Medium |
| 61132 | Bonus Challenge `{2}` / `{1}/{2}` | Preserve the placeholder identity and order while confirming the intended display behavior. | Korean retains both `{2}` occurrences and `{1}/{2}` in source order; the historical audit flags exact variable presentation. | Medium |
| 61139 | promised “twist” / `반전` | Retain the promised surprise and verify whether it is a literal plot twist or a playful sales pitch. | Korean preserves the end-of-story twist; the source-keyed audit leaves its narrative meaning open. | Medium |
| 61142 | `Pledgeshield` / `서약방패병` | Confirm whether this is a rank/title and standardize its Korean term only after the role is established. | Korean treats it as a title; Japanese gives a mercenary rank and Chinese uses a vow-shield term. The historical audit explicitly asks for the title's sense. | Medium |
| 61144 | A-Z spider poem | Preserve all alphabet entries and the source's malformed words as evidence; resolve compressed lines and literary choices in a joint poem review. | Korean retains the A-Z progression and all 25 line breaks. English contains malformed/unclear text (`out`, `wich`, `eXpeling`), and this preliminary pass does not silently repair the poem. | Medium |

Other reviewed rows generally preserve first-read English meaning and
Japanese voice/register. The 20-unit clay/cloth/metal/wood counts, `$TRSQ02.cowl_price$`,
`{2}`/`{1}` challenge markers, +13% critical chance, 5-hit chain attack,
and combat wording are retained. Provisional names and terms include
Hyperian, Idylla, Kollossae, Adessa, Klurikon, Dead Kel, Plains of
Erathell, Gorhart, Akara, Crossing Keepers, Nuer Bedlym, Pledgeshield
Fenan, Harst, Rathir Customs House, Gwyn, Yolvan, Bisarane, Eldest,
Archsage, Scholia Arcana, Joril, Doctor's House, Caeled Coast, Tilera,
Pledgeshield, Aesa Alfarinn, and House of Pride. Existing Korean
bilingual-name formatting is retained as found; this pass does not impose a
global parenthetical-name rule.

## Historical Audit Reconciliation

- Rechecked source-keyed prompts in the archived `61050-61149` range for
  raising Hyperian/Idylla's fate (61101), unmaking Dead Kel (61104),
  open-air living (61116), what stirs in Yolvan (61118), `CAPITAL` (61119),
  the gardens/stone tea antecedent (61120), Flight (61124), the Archsage
  history (61129), variable presentation (61132), the promised twist
  (61139), Pledgeshield (61142), and the A-Z poem (61144).
- These remain unresolved historical questions, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 61101-61150 once
  and in identical ascending order.
- Embedded newline counts match throughout the batch, including all 25
  breaks in the A-Z poem at ID 61144.
- Runtime-token sequences match; the price variable at ID 61113 and both
  challenge placeholders at ID 61132 are retained in order.
- Numeric values at IDs 61115 and 61138 are preserved.
- No translation CSV edit was made.

## Batch Status

IDs 61101-61150 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 61151.
