# Preliminary Language Scan: `default` IDs 2100-2149

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 2100-2149.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical `default` questions and checked titles, names,
  terminology, dialogue voice, and paragraph structure.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 2102 | 생각 없이 싸우는 정신 나간 병사들. 실은 야생 마력이 시체를 이리저리 움직이는 것뿐이야. | Replace or reconsider `정신 나간`, which means “crazy,” rather than “mindless/without thought.” | English says “without thoughts”; Japanese and Chinese also describe thoughtless soldiers. The first Korean sentence shifts from lack of thought to mental instability. | High |
| 2103 | 크로우즈의 핸디캡 | Determine whether `Crows` is a proper group/team name and what `Handicap` labels in context. | English capitalization and Japanese phonetic rendering support a named Crows, but do not identify the item/event. Korean transliterates the title without resolving either term. | Medium |
| 2109 | 대사제 | Confirm the title `Hierophant` and its canonical Korean form. | English/Chinese support a high priest, while Japanese reads it as a guide/leader. Korean follows the priestly interpretation; retain the source-locale difference as unresolved. | Medium |
| 2111 | 씨스틸(Seasteel) 꾸러미 | Confirm whether `Seasteel` is an established material name and whether its Korean form should be translated or transliterated. | English/Chinese preserve a name-like material; Japanese calls it “sea iron.” The current transliteration is traceable but may be inconsistent with other crafting-material names. | Medium |
| 2116 | ... 그의 수행자들 말로는 과거뿐 아니라 미래도 안다고 해. | Determine whether `tenders` is a formal office/title or generic attendants and use a consistent Korean term. | Historical audit flags `Tenders` as a possible House of Sorrows role. Japanese says guards/attendants; Korean `수행자들` may be too generic if this is a capitalized position. | High |
| 2119 | 그냥 대왕에게 가서 이야기해. | Confirm the formal title `High King` and align it with the project's other occurrences. | English and Japanese identify a title, while the Korean `대왕` is understandable but may not match the established title form used elsewhere. | Medium |
| 2121 | 시어든(Thyrdon)의 돌격 | Determine whether `Charge` is an attack, mission, or title and reconcile the name spelling with other `Thyrdon/Thrydon` rows. | English/Japanese/Chinese support a charge/attack reading, but the source name varies elsewhere. Korean selects one plausible sense and retains the English spelling. | Medium |
| 2129 | 심장을 치기 전에 살을 도려내고 뼈를 가르라. | Preserve the anatomical metaphor but translate `fat` as fat, not flesh. | English and Japanese explicitly say to trim the fat; Korean `살을 도려내고` changes it to removing flesh. The following bones/heart imagery supports a surgical/butchering metaphor. | High |
| 2130 | ... 페이에게는 문자 언어조차 없어. 그들이 아는 것은 돌 자체에 새겨져 있지. 필멸자의 눈에는 보이지 않아. | Make the claim about the Fae having no written language and the stone's knowledge readable without implying it is physically inscribed. | English says the Fae have no written language and knowledge is embedded in the stone; Japanese says it cannot be read by mortals. Korean's `문자 언어` and `새겨져` may imply a conventional written inscription. | Medium |
| 2134 | 바다 건너에 있는 우리 자매를 구해. 아니면 그 자매와 함께 죽어라. | Resolve whether `sister across the sea` means a person/sister or a city/ally before fixing the referent. | English and Chinese say “sister”; Japanese says “that city.” Korean follows English/Chinese and may be a literal kinship reading or personification. | Medium |
| 2138 | ... 선구적인 학자였던 에드윈나 안바스 ... | Check `student` against `학자`; preserve the dedication's named Order and historical era. | English says “pioneering student of the Order of the Ash”; Japanese likewise says student/disciple. Korean `학자` changes student/member to scholar. The Order/Age terms remain corpus terminology questions. | High |
| 2147 | +20% 마법 공격 대미지 | Align the UI term for `Damage` with the project's established Korean stat wording. | The numeric value is retained, but this row uses `대미지` where other active strings often use `피해`. This is a consistency candidate, not a numeric error. | Medium |
| 2149 | 죽지 않도록 조심해, 먼지 인간. | Retain the dismissive tone while checking whether `dustling` is a coined species/rank insult. | English uses the diminutive slur `dustling`; Japanese drops it and Chinese gives a literal dust-person phrase. Korean is understandable but may not preserve the coined, belittling force. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 2111, 2116, 2121, 2124,
  2138, 2146, and 2149 against the active Korean and source locales. The
  material term, formal Tenders role, name/`Charge`, fragment, institution/
  era, map text, and insult questions remain open or provisional.
- Same-numbered historical `base` findings were kept separate from these
  dialogue and lore rows.

## Other Checks

- ID 2125 preserves `{LINE_CENTER}`, `{*1abilities}`, `{LINE_SPACE}`, `{1}`,
  and `{*1storm bolt ability}`. ID 2146 retains both additional map
  fragments and the named languages.
- The remaining inspected entries preserve their main meaning and Japanese-
  aligned register; no runtime tokens or line breaks were changed.

## Batch Status

IDs 2100-2149 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
