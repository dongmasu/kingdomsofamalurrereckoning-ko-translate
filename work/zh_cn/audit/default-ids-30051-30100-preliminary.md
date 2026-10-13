# Preliminary Language Scan: `default` IDs 30051-30100

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 30051-30100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 30053 | `마르티니크` for `Martinique` | Confirm whether this isolated label names the island/place or a person and retain the appropriate label form. | English is only the proper name; Japanese explicitly adds “island,” while Chinese and Korean transliterate the name without that classifier. Context is not present in this row. | Medium |
| 30058 | `일 페탈`, `이사의 숨결`, `씨플랙스` | Standardize reagent names and preserve the Lightning Resistance effect, Alchemy Workbench, and quantities. | Korean preserves the 2/2/1 values and paragraph layout. Reagent spellings are provisional; the historical audit already flags this recipe and its named ingredients. | Medium |
| 30060 | `널 너무 눈에 띄니까` | Check the subject-case error; candidate sense is “네가 너무 눈에 띄니까.” | English says the addressee is too conspicuous, Japanese calls them famous, and Chinese says they draw too much attention. The Korean `널` is an object form where the clause requires a subject form. | High |
| 30061 | Rivener Tarsus / Gloamfrost / Ender's Fire / Lord Callor | Standardize the three Fae staff names and Callor's title/name; preserve that the staffs were reforged and returned to their rightful protector. | Korean retains the sequence and bilingual staff names. Japanese transliterates the names and Chinese localizes them, so English spellings remain useful for traceability. | Medium |
| 30066 | `페이`, `알파르`, “옛 땅” | Check canonical Fae/Alfar terminology and preserve the claim that this is the last of the old places left to the Fae. | Korean conveys the west/east human-Alfar contrast and the remaining old land. Historical audit flags the Fae woods and Alfar terms. | Medium |
| 30069 | `시련의 전당`, `사투르닌` | Standardize Proving Halls and Saturnyn; preserve the warning about bolgan in the corridors and Saturnyn's move against the speakers. | Korean retains the events and warning. Proper-name renderings remain subject to the corpus-wide glossary pass. | Medium |
| 30075 | `바보들의 소박한 즐거움` for `the mirth of the witless` | Check whether `소박한` softens the speaker's contemptuous or ironic description of the village. | English uses a pointedly disparaging phrase; Korean keeps “fools” but adds a gentler “simple pleasures” nuance. Japanese also softens the phrase, while Chinese retains a more demeaning sense. Historical audit calls out this wording. | Medium |
| 30076 | `바티칸 시국` / Chinese `瓦提坎城` | Preserve the Korean place-name candidate and investigate the Chinese text's trailing format character separately from translation. | English is “Vatican City.” The Chinese row ends in U+FEFF; Korean has no corresponding format character. This is a source-locale format discrepancy, not a Korean wording defect. | High |
| 30077 | `방패 자매여` for `Shieldsister` | Confirm whether this is a formal address/title or a generic kinship address and use the established term consistently. | Korean preserves the shield-and-sister components. Japanese generalizes it to “companion,” while Chinese retains a literal shield-sister form. | Medium |
| 30080 | `그가 해 온 봉사에 걸맞은 방식으로` | Retain as provisional pending context for the source's malformed phrase, “one of his service”; do not infer a more specific punishment or honor. | Korean conveys that the manner was fitting to Elswin's service. English is grammatically unclear, and the historical audit explicitly flags this sentence. | Medium |
| 30083 | `물론 손실이긴 하지만` | Clarify what “It is a loss” refers to and preserve the speaker's restrained response before asking what happened. | Korean follows the English wording; the isolated row does not identify the lost person or thing. Historical audit flags the capitalized Telling and related context. | Medium |
| 30087 | `티린의 안식처(Tirin's Rest)` | Standardize the location name and its Korean rendering. | The active corpus also uses `틸린의 안식처` and `티린의 쉼터`; English/Japanese/Chinese differ in transliteration or semantic rendering. Historical audit flags Tirin's Rest. | Medium |
| 30089 | `테스타먼트` for `The Testament` | Confirm whether the faction/institution label should follow the English `Testament` or the Belen naming used by the other references; preserve the alarmed announcement. | English capitalizes Testament; Japanese names the Belen organization and Chinese uses a Belen covenant form. Korean follows the English label. This is a recurring cross-locale naming conflict, not a confirmed error. | Medium |
| 30091 | Hillared / Castle Gastyr / Piers; intimate farewell letter | Preserve the restrained affection, the distinction between friendship and adoration, and the letter's single-paragraph structure; standardize names. | Korean retains the unrequited affection, battle outlook, mission home, and sign-off. The historical audit requests narrative-context review; the isolated row cannot settle the addressee context. | Medium |
| 30094 | `먼지의 자손` for `Children of Dust` | Standardize the group/people name and retain the contrast between their few possessions and short lives. | Korean preserves the contrast and ironic final sentence. Related `Dustlings` wording and Children of Dust terminology remain open in historical notes. | Medium |
| 30097 | `에테네(Ethene)` | Use one Korean spelling for the deity and blessing label across the corpus. | This row uses `에테네`, also the dominant form, but the active CSV contains `에세네(Ethene)` at other IDs, including 2369. Historical audit flags Ethene terminology. | High |

Rows 30051-30052, 30054-30057, 30059, 30062-30065, 30067-30068,
30070-30074, 30078-30079, 30081-30082, 30084-30086, 30088, 30090,
30092-30093, 30095-30096, and 30098-30100 generally retain the English
meaning. Their register, isolated fragments, names, and UI terminology remain
for the integrated pass; no separate high-confidence wording candidate was
identified in this first reading.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 30000-30099 explicitly flags
  Martinique, Venris/Midden, the 30058 alchemy ingredients, named Fae staffs,
  Arland, old Fae woods, Ellova/Fateweaver, Proving Halls/Saturnyn, Weaver,
  Gardens of Ysa, Shieldsister, Windemere/Elswin/Creth, Telling, Nerotelos,
  Testament, Hillared/Gastyr, Children of Dust, and Ethene. These were
  checked against the active rows in this batch.
- Historical structural notes call out the 30058 alchemy recipe, 30061 staff
  names, the ironic village wording at 30075, capitalized Telling at 30083,
  and the 30091 farewell letter. Recipe quantities/layout and the letter
  paragraph structure are preserved.
- The 30060 Korean subject-case concern and the Chinese-only U+FEFF at 30076
  were observed in the active cross-locale comparison. Neither changes the
  historical audit or authorizes a CSV edit.
- Repeated-term spot checks found variant Korean forms for `Tirin's Rest`
  and `Ethene`; these remain terminology candidates, not global replacement
  instructions.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 30051-30100 once,
  in identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match across all four locales. This includes the recipe at 30058,
  `{LINE_CENTER}` at 30090, and `$(0)` at 30092.
- The numeric reagent quantities at 30058 match across locales: 2, 2, and 1.
- Chinese ID 30076 alone contains trailing U+FEFF. No corresponding Korean
  format character or other Korean structural exception was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 30051-30100 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 30101.
