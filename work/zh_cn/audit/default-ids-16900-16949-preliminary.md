# Preliminary Language Scan: `default` IDs 16900-16949

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 16900-16949.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 16903 | Testament / Teers' medallion | Verify Testament as a group/faction name and retain uncertainty over who took the medallion. | Korean says one of the Testament members likely took it in the tunnel fight; Japanese/Chinese specify a religious group, which English leaves unnamed. | Medium |
| 16906 | `The battle has turned` -> `전세가 뒤집혔다` | Reconcile the source disagreement before finalizing the battle-state label. | Korean follows English/Chinese: the tide has turned. Japanese says the battle has ended. | High |
| 16907 | “my destiny will be to serve you” | Preserve the future service/destiny statement and grateful tone. | Korean follows English, making service the speaker's future destiny; Japanese instead says their destiny is to repay the listener. | Medium |
| 16918 | Thyrdon / God of War, Battle, and Tactics | Verify the deity's name and retain the distinct war/battle/tactics domains. | Korean preserves all three domains and a bilingual name; spellings vary across locales. | Medium |
| 16921 | Helmgard / Tala-Rane / infestation | Verify the names and retain that the reassignment is to remove creatures infesting the land. | Korean preserves the hesitant “shall we say” tone and creature-clearing purpose; place-name forms need consistency review. | Low |
| 16922 | lightning/stun/mana effect | Preserve the values `60`, `20%`, `3 seconds`, and `26 Mana`. | Korean retains all four values and the three-line layout; no numeric change was found. | High |
| 16923 | Faehunter Cuirass poem | Preserve the six-line verse and the image/quoted claim that it is like a Fae spirit. | Korean retains the armor's impostor/life-guard imagery; the “Fae-like scrolls” and “life's guard” source phrases are themselves obscure. | Medium |
| 16927 | Red “the Dead” Idward | Verify epithet punctuation/name form and preserve both the blood-drinking and soul-consuming rumors. | Korean retains the threat and both rumored actions; his title/name form needs cross-corpus consistency. | Low |
| 16930 | “when will she open her eyes?” -> `언제쯤 철이 들까?` | Check whether the idiom should remain literal or mean “come to her senses.” | Korean interprets the phrase as maturing/coming to her senses; English/Chinese are more literally “open her eyes,” while Japanese says “when will she listen?” | Medium |
| 16932 | “the force of a simple army” -> `그 정도 규모의 군대` | Check whether `simple` means an ordinary army rather than one of that size. | Korean reads it as a force of that scale; English and Japanese frame it as an ordinary/modest force and Chinese says “merely an army.” | Medium |
| 16934 | Mithrolith / Ivan / Camp Revival | Align the rune/material spelling and camp name. | Korean transliterates Mithrolith and renders Camp Revival; other batches contain multiple Mithrolith forms. | Low |
| 16940 | `Dvergan Raider` -> `드베르간 약탈자` | Determine whether Dvergan is a people/race name or a proper enemy class. | Korean retains the name and raider role; Japanese/Chinese translate the enemy class differently. | Low |
| 16946 | `Court of Enchantments` -> `마법의 궁정` | Verify the institution/region name and standardize its Korean form. | Korean gives a literal court reading; Japanese calls it a Palace of Blessings and Chinese a Magic Court. | Medium |
| 16949 | Hanged Men / Akara | Determine whether the Hanged Men is a named group and verify Akara's form. | Korean preserves the group's exclusion from the village and Akara's authority; the name is cross-batch sensitive. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 16903, 16905, 16907, 16918, 16921-16922,
  and 16949 against the active four-locale rows. They remain open; no
  historical note authorizes a translation edit.
- Related name/term candidates include Testament, Teers, Thyrdon, Helmgard,
  Tala-Rane, Mithrolith, Dvergan, Court of Enchantments, and Hanged Men.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match across all four locales, including the six-line poem and all combat
  values at ID 16922. No structural exception was found.
- The official Korean manual could not be text-searched in this environment;
  terminology candidates remain unverified against it.

## Batch Status

IDs 16900-16949 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 16950-16999.
