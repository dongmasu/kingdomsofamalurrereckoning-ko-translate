# Preliminary Language Scan: `default` IDs 27401-27450

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 27401-27450 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 27401-27403, 27405-27410, 27413-27415, 27418-27420, 27422-27429, 27431-27433, 27435-27440, 27443-27447, 27449 | Dialogue, lore, quest, and concise UI/item text | Recheck voice, context, names, and established gameplay terms during integrated review. | Korean generally retains English meaning and Japanese tone. ID 27429 preserves `+25` Physical Damage and `+40%` Greatsword Damage. | Medium |
| 27404, 27411, 27416-27417, 27421, 27441-27442, 27446, 27450 | Hireling / Praetorians / Interest / Maid / Risbergs / chapterhouse / Blades and Seal / Sister Zelda / Hierophant | Standardize institutional, faction, rank, character-title, and quest-item terminology. | Korean renders Hirelings as `고용 용병`, Praetorians as `근위대`, Interest as `회사`, the Maid as `시녀`, chapterhouse as `지부 회관`, and Hierophant as `대사제`. Historical questions group all these forms for context and glossary review. | Medium |
| 27418 | `my brother` -> `오빠` | Avoid inferring the speaker's gender and sibling's age unless surrounding context confirms them. | English only says “my brother”; Korean `오빠` specifies a female speaker and older brother. Japanese instead specifies a younger brother, while Chinese says older brother. | High |
| 27425, 27430, 27434 | hurried official-looking document / bodies in the Midden / furnace room | Preserve the document's uncertain status and check what was put into the furnace room; retain the source fragment's referents. | Korean retains the hastily scribbled document and the bodies spread throughout the Midden. At 27434, it identifies the object with “other bodies/corpses,” an inference supported by surrounding corpse/remains context but not explicitly named in that English row. | Medium |
| 27448 | “Yes, and find out what's wrong. Now that I've found it, I've no desire to investigate further!” | Keep the source's apparent contradiction visible pending context; do not silently repair which investigation is meant. | English first directs someone to find out what's wrong, then says the speaker has no wish to investigate further. Korean preserves both clauses and the tension. Historical audit flags the grammar/context. | High |
| 27404, 27434, 27442 | oath/death fragment / furnace-room action / Blades and Seal | Preserve clipped syntax and mission object names; determine the target/context in integrated review. | Korean keeps the broken oath/death utterance, retains the furnace-room action, and renders the named objective as `칼날과 인장`. Source-keyed questions group these for context. | Medium |

## Historical Audit Reconciliation

- The historical log groups Hireling, Praetorians, Arrivus Engine, Interest,
  Maid, Risbergs, Silkfarmer remains, Midden, chapterhouse, Blades and Seal,
  the Zelda line, the contradictory investigation sentence, and Hierophant.
- It separately flags until-then wording, greatsword stats, the furnace room,
  pronouns, and title/fragment context. These notes remain issue inventory,
  not approved translation decisions.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 27401-27450 exactly
  once and in identical order.
- Actual embedded line-break counts and normalized runtime-token identities
  and order match. ID 27429 has one actual embedded line break in each locale.
- The `+25` and `+40%` values at 27429 match all locales. No unexpected
  Unicode format character was found.
- No structural exception was found. Korean wording and all CSVs were not
  edited.

## Batch Status

IDs 27401-27450 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 27451.
