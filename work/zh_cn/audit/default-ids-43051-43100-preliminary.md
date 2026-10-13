# Preliminary Language Scan: `default` IDs 43051-43100

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 43051-43100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 43052-43053 | Ljosalfar / Dverga / Varalin / `료스알브`, `드베르가`, `바랄린` | Standardize the people names and Varalin spelling with the established glossary and other occurrences. | English identifies Ljosalfar and Dverga as peoples and Varalin as their word for Gallows End; Japanese and Chinese use different phonetic forms. Korean preserves the island/name relationship. | Medium |
| 43054 | Cape Solace / `케이프 솔러스` | Confirm the canonical Korean place-name form and distinguish the cape from a generic cape/cloak reading in Chinese. | English and Japanese treat this as a place name; Chinese literally renders the words as “comfort cape.” | Medium |
| 43056, 43063, 43074, 43076, 43081, 43085, 43088, 43090 | Riagan Bhain, Atheof Cergren, Camden Wulflac, Maun Cointaker, Finola Flanagan, Isak Thorn, Agathe, Ebsol Wyvyrn-Gifre | Standardize personal and family-name spellings without inferring relationships beyond the source. | Korean phonetic forms are plausible but differ from the other locale renderings; ID 43090 identifies Ebsol as belonging to the Rathir Wyvyrn-Gifres. | Medium |
| 43058 | Truesworn / `진실서약자` | Confirm whether Truesworn is a formal rank and retain the distinction between rank and honor. | English calls it a rare rank and honor; Chinese treats it as a title, while Japanese transliterates the rank. | Medium |
| 43061 | `I know I shall` / `반드시 그래야 해` | Preserve the speaker's resolve to persevere without changing a prediction/intention into an obligation. | English repeats the future resolve (“I will persevere. I know I shall”); Korean's final clause can read as “I must,” while Chinese also shifts toward “should.” | Medium |
| 43064 | Tala-Rane verse / `두 아들은 탈라라네를 사이에 두고 남겨졌지만` | Clarify what “left with Tala-Rane betwixt them” and “neither held his share complete” mean; preserve the three-line stanza. | The English is poetically compressed. Japanese and Chinese interpret the sons as being entrusted with or ruling Tala-Rane, but that relationship is not explicit enough to settle from the row alone. | High |
| 43067 | settlers found “strewn across the cliffs” / `절벽 여기저기에 흩어진 채 발견` | Do not add that the settlers are dead unless context confirms it; retain the abrupt report-like voice. | English, Japanese, Chinese, and Korean say the settlers disappeared and were found scattered on the cliffs, without directly stating their condition. | Medium |
| 43071 | Kobold dagger / `조툰의 단검` | Check as a likely creature-name substitution: render the dagger as Kobold, not Jottun, if the English item reference is intended. | English explicitly says “Kobold dagger,” while the current Korean says “Jottun dagger.” Japanese and Chinese both identify the dagger as Kobold. The preceding clause's Jottun chieftains may have prompted the carryover. | High |
| 43072 | trap ability / values 7, 5 meters, 110, 80, 18, 120 | Preserve all quantities, costs, and the four-break layout; keep UI wording consistent for holding the attack. | All four locales retain the values and line breaks. Japanese/Korean place the 5-meter radius before the seven traps, while English/Chinese state the seven traps first; the values remain attached to the same effects. | High |
| 43073 | The Widow / `과부` | Determine whether this is the named creature/title or the common noun “widow,” consistent with earlier open occurrences. | English capitalizes the term and Japanese transliterates it; Chinese and Korean use a common-noun translation. The term's identity remains unresolved in prior reports. | Medium |
| 43077, 43083-43087, 43092, 43094, 43096-43098 | Fahrlangi, Sinsear, murghan, Scion, Orbocant, Red Legion, Oathblade, Sagecrafting, Arrivus Engine | Carry forward established-name, faction, role, and gameplay-term consistency checks. | The active Korean preserves each source reference, but the historical log and earlier reports leave the canonical forms or exact sense open; ID 43086 renders Scion as `후계자`. | Medium |
| 43080 | “They did, until the war took it from them” / `그랬지. 전쟁이 그들에게서 그걸 앗아 가기 전까진` | Resolve the antecedent of “They” and “it” from conversation context; do not treat the Korean's implied antecedent as established. | English is elliptical. Japanese and Chinese also keep or infer an antecedent differently; the Korean preserves the fragment without naming a new entity. | Medium |
| 43094 | Oathblade / `맹세검` | Confirm whether Oathblade is a formal title/rank rather than a literal compound. | English presents the standalone title. Japanese instead says “first-class mercenary,” while Chinese and Korean retain an oath/blade reading. This is a source/reference divergence, not a settled correction. | High |
| 43099 | Pearse, scribe to King Lir / `고대 왕 리르의 서기관 피어스` | Confirm the source's intended relation between Pearse and Lir; do not import the Japanese-only “Black Palace” detail. | English describes the last entry of Pearse, scribe to the ancient king Lir. Japanese adds a Black Palace reference absent from English, Chinese, and Korean. | Medium |
| 43100 | lonesome wanderers / `외롭게 떠돌던 밤` | Preserve the speaker's longing and return while checking the compressed question's time relation in context. | English's “How many nights ... have I dreamed” is syntactically compressed; Korean retains the nights of wandering, the repeated dream, and the eventual return. | Low |

IDs 43051, 43055, 43057, 43059-43060, 43062, 43065-43066, 43068-43070,
43075-43076, 43078-43079, 43082, 43089, 43091, 43093, and 43095 generally
retain the English meaning on this first reading. Proper names, register,
and recurring terminology remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical section for IDs 43050-43149 was checked.
  It flags the names and titles in this batch, the Tala-Rane verse at 43064,
  the settlers at 43067, Ragnarr's Chosen at 43071, the unresolved antecedent
  at 43080, Scion/Orbocant, Oathblade, and the Sagecrafting/Arrivus terms.
- The historical log's broad range notes are treated as review prompts, not
  approvals. The Kobold/Jottun mismatch at 43071 was confirmed directly
  against all four locale rows.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 43051-43100 once
  and in identical ascending order; each default CSV has 65,135 records.
- Embedded line-break counts match across all four locales. ID 43064 retains
  two breaks (three verse lines); ID 43072 retains four breaks and its
  paragraph separation.
- No runtime markers or markup were detected in this range.
- Numeric values are preserved. Korean writes `20` at ID 43062 where the
  other locales spell out twenty; Japanese writes `2` at IDs 43064 and
  43071 where the other versions use words. At ID 43072 Japanese/Korean
  reverse the order in which the radius and trap count are stated, but the
  5-meter radius, 7 traps, 110 damage, 80 Mana, 18 traps, and 120 Mana
  values are all retained.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 43051-43100 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 43101.
