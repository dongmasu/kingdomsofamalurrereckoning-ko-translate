# Preliminary Language Scan: `default` IDs 33451-33500

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 33451-33500 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 33452 | `먼지 태생이여` for `dustling` | Confirm whether `dustling` is a species name, a derogatory address, or both; retain the speaker's dismissive command. | English and Japanese use an evocative dust-born term; Chinese generalizes it to “mortal.” Korean preserves the insult/image, but its canonical in-world sense remains open. | Medium |
| 33466 | `그건 이해할 만한 불의야` for `That is an injustice I can understand` | Preserve that the speaker can empathize with or understand the injustice, without making the injustice itself sound acceptable or justifiable. | English and Japanese frame the injustice as something the speaker understands; Korean's `이해할 만한 불의` can instead describe an understandable/justifiable injustice. | Medium |
| 33468 | `먹음직한 한 점` for `A tasty morsel` | Preserve the leering, objectifying metaphor and the speaker's boast; verify whether a literal food image is intended or simply the source's predatory innuendo. | English, Japanese, and Chinese all retain a tasty-morsel/food image. Korean is close to the wording, while the intended degree of sexual menace depends on scene context. | Medium |
| 33473 | `슬픔들` for `the Sorrows` | Verify whether `Sorrows` names a people/entity, and standardize its Korean form; preserve the speaker's uncertainty about remaining in Esharra and surviving. | English capitalization and “break free” indicate a named plural entity. Japanese transliterates it and Chinese uses a spirit-like name; Korean's abstract plural `슬픔들` may obscure the referent. | High |
| 33474 | `시험이 시작되니 ... 하라` for the camp warning | Preserve the warning that the camp is under scrutiny to identify traitors, the alternatives of professing loyalty or staying silent, and the threat of hanging; check whether the source's couplet/rhyme can be reflected naturally. | English is a deliberately compressed rhyming warning. Korean retains the threat and alternatives but changes the line's syntax and has no corresponding rhyme; Japanese and Chinese also paraphrase the verse. | Medium |
| 33479 | extended chicken treatise / `산란 생리`, `세계 인구` | Preserve all five paragraphs and the mock-scholarly voice, including the invented Latin-like terms and absurd oceanic-origin/ownership theories. Review `grossia major/minor`, `vestigial rest`, and `ovipositor matricula` as parody or source anomalies; consider whether `종족의 세계 인구` clearly means the worldwide chicken population. | The Korean keeps the five-paragraph progression, major jokes, named pseudo-technical terms, and conclusion. The English itself contains unusual pseudo-scientific wording (`vestigial rest`); Korean's `세계 인구` is potentially anthropocentric/unclear for a chicken species. | Medium |
| 33480 | `도크알브와 료스알브` for `Dokkalfar and Ljosalfar` | Standardize both Alfar group names and the language term against the project glossary while preserving the shared-root claim. | The row's meaning is retained, but the Korean transliterations are terminology candidates; Chinese translates the group names and Japanese also transliterates them. | Medium |
| 33491 | `노움 학자` for `Gnome Scholar` | Confirm the established Korean rendering of the species/title and the book-title treatment for `Voices of the Isle`. | Korean follows the English role and identifies Ares Helvern as author; named-group and publication conventions remain corpus-wide consistency questions. | Low |
| 33498 | `입문자 세 명` / `지부` for `three initiates` / `chapter house` | Preserve that three named initiates went missing after a disturbance at the Scholia Arcana chapter house; verify the institution-specific Korean terms. | All versions identify three people and a chapter-house disturbance. Japanese writes the quantity as digit `3`; the other versions spell it out. Korean calls the missing members initiates and the building a branch, which may flatten the named institution's structure. | Medium |

IDs 33451, 33453-33465, 33467, 33469-33472, 33475-33478, 33481-33490,
33492-33497, 33499, and 33500 generally retain the English meaning on this
first reading. Proper names, lore, register, and display conventions remain
integrated-pass candidates; no additional distinct wording issue was
identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 33400-33499 explicitly flags
  `Sorrows` as a possibly named faction/place/concept and asks for a detailed
  review of ID 33479's pseudo-academic satire, invented terms, and argument
  structure. Both questions were checked against the active Korean and all
  three locale references.
- The historical entry for IDs 33500-33599 was checked for the endpoint row
  33500. It identifies Alfar terminology among the names requiring
  consistency review; no specific historical concern about the escort
  statement was recorded.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 33451-33500 once
  and in identical order.
- Embedded line-break counts match across all four locales throughout the
  range. ID 33479 retains four newline characters, separating five
  paragraphs, in every locale.
- No runtime-marker mismatch was detected.
- Numeric-value scan found no gameplay-value discrepancy. At ID 33498,
  Japanese writes the count of three initiates as digit `3`; the other
  locales spell out the same count.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 33451-33500 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 33501.
