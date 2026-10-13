# Preliminary Language Scan: `default` IDs 27901-27950

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 27901-27950 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 27901, 27903-27905, 27907-27908, 27910-27912, 27914-27921, 27925-27927, 27930-27933, 27936-27938, 27940-27942, 27944-27945, 27947-27949 | Dialogue, names, objectives, equipment, and concise UI | Recheck tone, established terms, and proper-name display consistency in the integrated pass. | Korean generally preserves the source meaning. The Tirin poem, Arcadium, chapterhouse, Fate, Windstone, and other setting terms remain open terminology/context questions where noted below. | Medium |
| 27902, 27906, 27917, 27922, 27941, 27946 | Greeting, Hierophant threat, Lyria invocation, wedding reaction, and request register | Match the speaker's politeness, threat, sarcasm, and deity-address tone to the scene. | Korean is understandable. `Salutations` is rendered as a formal greeting; the Hierophant threat and Lyria invocation follow the source. ID 27922's “What a wedding! Glad I wasn't invited” is likely sarcastic, while `정말 대단한 결혼식` can sound admiring without vocal context. | Medium |
| 27909 | Six-line Tirin/Jottun/Keloren/Bayala poem | Preserve the poem's six-line structure, named peoples, and heavy-step imagery; verify terms and literary voice. | Korean retains the stanza sequence and Jottun/Keloren/Bayala identities. The English has a stray space before the period in its first line; the Korean does not reproduce that apparent source typo. All locales retain matching line-break counts. | Medium |
| 27913, 27919, 27923, 27929, 27935, 27943, 27950 | Unnamed “she” / Murghan prisoners / Crossing Keepers / chapterhouse and stones / Windstones / past-tense fragment / Seelie and Unseelie | Preserve unresolved source referents and align lore, faction, and location terms. | Korean avoids adding gender where Korean grammar does not require it, retains the named groups and places, and leaves the fragment at 27943 short. The Crossing Keepers, Windstones, and Seelie/Unseelie terms remain corpus-wide glossary questions. | Medium |
| 27922 | `정말 대단한 결혼식이었어! 초대받지 않아 다행이야.` | Preserve the apparent sarcasm rather than reading “What a wedding!” as straightforward praise. | English and Chinese make the speaker glad not to have been invited; Japanese retains an exclamatory reaction. Korean's `대단한` may read positively unless the second sentence supplies the sarcasm. | Medium |
| 27924 | Letter to Britt Hagni / unmarked crates / destination | Preserve the crates' destination as the subject of the promised follow-up and retain the letter's courteous register. | English says the owners will be in touch regarding where the unmarked crates are to go, likely within a few weeks. Korean says they will respond within a few weeks but does not explicitly restate that the follow-up concerns the crates' destination. This may be a mild omission. | Medium |
| 27928 | `Crudok 트리거 1` | Confirm whether this is a developer/test trigger and retain its number and raw identifier. | English/Japanese/Chinese use a numbered trigger label. Korean preserves `Crudok` and `1`, translating only “Trigger”; the historical log says to preserve the numbered trigger. | Medium |
| 27931 | `총 방어도가 50% 증가합니다` | Preserve the exact armor statistic and 50% value. | English, Japanese, Chinese, and Korean all specify a 50% increase to total armor. No numeric discrepancy was found. | High |
| 27939 | `<Unnamed Region>` unchanged | Retain the explicit source placeholder without inventing a region name. | All four locales contain the same placeholder string. | High |
| 27950 | `겨울의 쇠락` / Seelie / Unseelie | Reconcile the winter-decline terminology and Korean names for the two Fae groups across related lore. | Korean preserves the contrast between winter's decay and the normally non-capturing Fae; capitalization and faction forms remain glossary questions. | Medium |

## Historical Audit Reconciliation

- The 27900-27999 source-keyed inventory includes Flashing Blade,
  Southern Alfar, Laboratories, the Hierophant threat, Master Byrnes, the
  Tirin poem, an unnamed `she`, the match/store wording, Lyria invocation,
  Murghan, Crossing Keepers, the Hagni letter, Crudok trigger, Caledus and
  the stones, Windstones, Arcadium, speech potion, `<Unnamed Region>`, the
  past-tense fragment, the Sanctuary box, Seelie/Unseelie, and the First.
- Historical notes specifically require preserving `<Unnamed Region>` and
  the numbered trigger. Other entries remain questions, not approvals.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 27901-27950 once,
  in identical order.
- Actual embedded line-break counts and normalized runtime-token identities
  and order match across all four locales. The six-line poem at 27909 keeps
  matching lineation.
- `<Unnamed Region>` at 27939 is unchanged, the numbered `1` in the trigger
  at 27928 is preserved, and the 50% armor value at 27931 matches.
- No unexpected Unicode format character or structural exception was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 27901-27950 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 27951.
