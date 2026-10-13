# Preliminary Language Scan: `default` IDs 43451-43500

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 43451-43500 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 43461 | Galen / `게일런`; Gnome Templar | Standardize the name and faction terms; retain the distinct roles of armorer and enchanter. | English identifies Galen as a Gnome Templar armorer and enchanter. Korean preserves both occupations; localized name forms vary. | Medium |
| 43465 | Dokkalfar / `도크알브`; dark elves / `다크 엘프` | Align Dokkalfar and Dokkalfar/Dark Elf terminology with the project's established faction glossary. | The English appositive explains the faction as dark elves. Korean retains both the proper faction name and explanation, but phonetic and glossary forms need global consistency review. | Medium |
| 43468 | Old Mitharan; Gale Crossing / `고대 미사란어`; `게일 크로싱` | Standardize the ancient-language and location names; preserve that the scholar can translate the notes. | All locales retain the note-discovery and translation chain, while spellings differ. Korean follows the English meaning. | Medium |
| 43472 | “crack him like a shell” / `껍데기처럼 박살낼 거야` | Consider a natural Korean shell-breaking idiom while preserving the threat that Olaf will easily defeat the bard. | The Korean conveys the threat but the literal `껍데기처럼` comparison is somewhat awkward. Chinese expands the image to smashing his head; English does not specify that detail. | Medium |
| 43473 | Father Etair / `에타이어 신부` | Confirm whether “Father” is a clerical title and retain the explicit contrast that Etair is mortal. | English says “Father Etair, a mortal”; Japanese and Chinese explicitly call him a priest, and Korean follows those references. The title is plausible but should be checked against setting context. | Medium |
| 43478 | “At last, Beckoned” / `마침내 왔군, 선택받은 자여` | Confirm whether `Beckoned` is a formal title/name and align its capitalization and Korean form with other occurrences. | English capitalizes the address; Korean interprets it as “the chosen one.” Japanese has only “at last,” while Chinese also treats it as a title. | Medium |
| 43481 | Aiden O'Conor / `에이든 오코너` | Verify the source-name spelling and standardize the person's name across the diary/armor references. | English spells the surname `O'Conor`, while the Korean draft and historical audit inventory use `O'Connor`; Japanese/Chinese are transliterations and do not resolve the spelling. | High |
| 43486 | “Don't give Nanne your business” / `난네한테 물건 맡기지 마` | Reassess as a warning not to patronize/deal with Nanne, rather than specifically not to entrust her with goods. | English `give ... your business` and Chinese refer to giving her one's business; Japanese says not to get involved. Korean narrows this to leaving goods with her. | High |
| 43491 | `Loss: 130 Gold` / `손실: 금화 130` | Retain 130 as the English-source value and flag the conflicting localized references. | English and Korean say 130 Gold; Japanese and Chinese say 13. This is a material tenfold discrepancy, not a formatting variation. | High |
| 43492 | “Don't press your luck” / `괜히 더 재촉하다 운 시험하지 마` | Consider a more idiomatic Korean warning equivalent to “don't push your luck.” | English is an idiom meaning not to overreach; Korean's literal “test your luck by urging further” is understandable but unnatural. Japanese conveys not getting carried away; Chinese says not to push one's luck. | Medium |
| 43499 | Missives of Sable / `세이블의 서신` | Confirm whether this is the formal title of a document or set of documents and preserve the act of planting it on her. | English capitalizes the plural title; Korean retains the concealment action but renders the title without an explicit plural marker. | Medium |

IDs 43451-43460, 43462-43464, 43466-43471, 43474-43477, 43479-43480,
43482-43485, 43487-43490, 43493-43498, and 43500 generally retain the
English meaning on this first reading. Names, faction terms, register, and
recurring terminology remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical section for IDs 43450-43549 was checked.
  Applicable entries flag recurring names/titles and archaic-language terms,
  including Nyxaros, Rathir, Mitharan, Primos, O'Connor, and the nearby
  two-minute conversation and named ability labels.
- The historical name inventory uses `Druid Aiden O'Connor`; the active
  English source row spells the surname `O'Conor`. This discrepancy is
  retained for source/terminology review rather than silently normalized.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 43451-43500 once
  and in identical ascending order; each default CSV has 65,135 records.
- Embedded line-break counts match across all four locales.
- Runtime marker IDs/order match. ID 43469 contains the two localized `*1`
  ability-label markers in the same order and preserves both blank-line
  separators; their visible payload text is intentionally localized.
- ID 43491 is the only differing numeric value found: English/Korean have
  130, while Japanese/Chinese have 13. Numeric text in the 43469 marker
  labels was excluded from value comparison.
- No hidden formatting characters were found in this range.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 43451-43500 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 43501.
