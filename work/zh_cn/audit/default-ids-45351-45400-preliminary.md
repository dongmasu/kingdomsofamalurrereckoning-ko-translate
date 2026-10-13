# Preliminary Language Scan: `default` IDs 45351-45400

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 45351-45400 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terms, historical audit notes, line
  breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 45351 | “pick this one's pockets” / `이자의 주머니를 털자` | Confirm that the Korean demonstrative clearly refers to the target person and retains the pickpocketing sense. | English and Chinese explicitly say to pick the person's pockets; Korean uses `이자`, which can mean “this person” but may be awkward or ambiguous in isolation. | Medium |
| 45353 | Cartery Jayck / farmhand / parents | Verify Cartery Jayck's canonical Korean name and preserve the attack chronology and evasive answer about the speaker's parents. | Korean retains the arrival-after-attacks sequence and fear of the worst; proper-name spelling remains a cross-row consistency question. | Medium |
| 45356 | Lykeios / “passed under the awareness” | Preserve the source ambiguity; do not silently choose between the literal English wording and the Japanese/Chinese interpretation. | English's archaic phrase is unclear. Korean follows Japanese and Chinese in saying a blessed person does not know Lykeios. The historical audit flags this exact divergence. | High |
| 45358 | The First / `퍼스트` / Scaith | Determine whether `the First` is a person, formal title, or the first Scaith; standardize Faitir, Scaith, and Tilera forms. | English capitalizes First without giving a full name. Japanese makes the relationship explicit as “the first Scaith,” while Korean transliterates it. | Medium |
| 45361 | Tilera fell / `무너질 때` / Balor | Clarify the sense of Tilera's fall and standardize deity/name spellings. | Korean retains that the speaker stood against Balor, but `fell`/`무너지다` does not settle whether Tilera was defeated, destroyed, or otherwise lost. | Medium |
| 45364 | Mad Men / `미치광이들` | Confirm whether Mad Men is the team's formal name and preserve the taunting tone. | English capitalizes the team name; Korean renders it descriptively while retaining the claim that they are the best team. | Medium |
| 45370 | Circle of Strife / `투쟁의 마법진` | Confirm whether this names a faction, ability, or magical formation, and apply the established term. | Korean and Japanese choose a magic-circle reading; Chinese uses a conflict-cycle reading. The isolated label does not settle its function. | Medium |
| 45374 | thresh / Guardian of the Caverns of Ingress | Confirm the creature term and whether `the Guardian` is a formal title or apposition identifying this particular thresh. | Korean identifies a thresh corpse and the Caverns of Ingress guardian, but the relation between species and title is syntactically unclear. Japanese and Chinese also differ in how they attach the phrase. | Medium |
| 45375 | Bloody / `블러디` | Determine whether Bloody is a named character/creature or descriptive; preserve the urgent warning. | English, Japanese, and Korean retain Bloody as a name, while Chinese interprets it as a bloody skeleton. | Medium |
| 45382 | Crossfire / Talon Strikes ability markers | Check official Korean ability names while preserving both localized `*1` marker payloads and their order. | All four locales have two style markers in the same order; Korean localizes the names as `크로스파이어` and `발톱 강타`. | Medium |
| 45391 | Tilera Redeemed / `속죄한 틸레라` | Confirm whether this is a quest/title or description, and whether `redeemed` means atonement or restored reputation. | Korean and Japanese use a repentance/redemption sense; Chinese describes recovered reputation. The isolated capitalized label is insufficient to resolve the nuance. | Medium |
| 45395 | Hierophant's Sanctum / Bag of Winds / Missives of Sable | Verify named item, location, and document terms, preserving the choice to frame the Hierophant or betray Grim. | Korean preserves the sequence of stealing the bag, bypassing the sentry, reaching the meeting sanctums, and the two possible actions. Formal names and `sanctum` terminology remain open. | Medium |

IDs 45352, 45354-45355, 45357, 45359-45360, 45362-45363, 45365-45369,
45371-45373, 45376-45381, 45383-45390, 45392-45394, 45396-45400 generally
retain the English meaning on this first reading. Names, setting terms, and
UI labels remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 45350-45449. It flags
  Cartery Jayck, Lykeios, First/Scaith, Tilera/Balor, Mad Men, Circle of
  Strife, thresh/Ingress, Bloody, Crossfire/Talon Strikes, Adarus Hollow,
  Archsage, and the Hierophant/Sable journal.
- The historical note specifically records the unclear Lykeios phrase and
  asks whether Circle of Strife is a faction or ability, whether `thresh` is
  a species/title, and whether Tilera Redeemed is a quest/title. These remain
  open; no CSV change is authorized.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 45351-45400 once
  and in identical ascending order.
- All four locales preserve matching line-break counts. ID 45354 retains
  `{2}` and `({1}/{2})`; ID 45366 retains +15%; ID 45372 retains +50%;
  IDs 45382 and 45396 retain their runtime-marker identities and order.
- ID 45393 is `Thirty` in English, Korean, and Chinese; Japanese uses `30`.
  This is an equivalent numeric value, not a quantity discrepancy.
- No other numeric-value or hidden-formatting discrepancy was found.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 45351-45400 received one preliminary reading. The working dispositions
are recorded in
[`disposition-batch-default-45351-45400-20261010.md`](disposition-batch-default-45351-45400-20261010.md);
they are not independent final linguistic approval. Continue at `default`
ID 45401.
