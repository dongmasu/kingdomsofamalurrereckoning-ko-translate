# Preliminary Language Scan: `default` IDs 3200-3249

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 3200-3249.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled source-keyed historical questions and checked long-form lore,
  item types, titles, and terminology consistency.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 3201 | ... '비틀거림 전투(Battle of Staggers)' ... 투아사는 거대한 체구의 상급 니스카루(Greater Niskaru) 발로(Balor)를 깨우려 했고 ... | Confirm the proper Korean title for the Battle of Staggers and whether the Tuatha planned to awaken, summon, or otherwise raise Balor; preserve the account's three-paragraph chronology and named battles. | English says the Tuatha “devised to raise up Balor”; Japanese says they awakened him, while Chinese says they planned to activate him. Korean chooses an attempt to awaken him. The battle title also differs across the references. This repeats the historical question. | Medium |
| 3205 | `{*1[Passive]}` | Confirm whether the bracketed skill category should be localized consistently with the Japanese/Chinese labels, while preserving the indexed markup token. | English and Korean show `[Passive]`; Japanese localizes it as passive and Chinese uses its localized equivalent. The Korean body is translated, but the English category label may be untranslated UI text or a deliberate game label. | Medium |
| 3212 | 병동 구역 | Align the Korean rendering with ID 3056's `Hospitalis Quarters` (`병원 구역`) after confirming whether it is a named district or a hospital ward. | English repeats the same place term; Japanese says aid/relief district, Chinese says hospital district. Korean's `병동 구역` is plausible but inconsistent with its earlier rendering at ID 3056. This repeats the historical question. | Medium |
| 3215 | ... 사후 연구학부의 명예교수 앱스콘두스(Abscondus)지. | Verify whether `Abscondus` is a name, rank/title, or part of the professorship style; clarify the academic field and natural Korean title order. | English uses `Professor Emeritus Abscondus of Postmortem Studies`; Japanese calls the speaker emeritus professor of postmortem research, and Chinese interprets the field as autopsy studies. Korean retains Abscondus but phrases the institution as a department, which is not explicit in English. This repeats the historical question. | Medium |
| 3221 | 내 가장 오래된 제자야. | Confirm whether `eldest` refers to the disciple's age or seniority/length of service; prefer an unambiguous term once context is known. | English says eldest, Japanese explicitly says the oldest, while Chinese says the most senior disciple. Korean `가장 오래된` can mean longest-serving rather than oldest in age. | Medium |
| 3227 | 아르케스(Arkes)의 관 | Use a precise Korean item term for `circlet` (a narrow ornamental headband/circlet), rather than the broader `관`, and verify Arkes's name form. | English and Japanese identify a circlet, a specific head ornament; Chinese says a golden ring/circlet. Korean `관` may suggest a crown or funerary coffin, so the item type is not sufficiently clear. This repeats the historical question. | High |
| 3230 | 예전엔 용맹의 전당(House of Valor)에서 투사로 생계를 꾸렸어. | Align `House of Valor` with the corpus decision used in related rows (for example, `용맹의 집` at ID 3159); preserve the speaker's casual register. | English names the same House/faction, Japanese transliterates it, and Chinese translates it differently. Korean uses `용맹의 전당`, creating a new form for a recurring proper name. | Medium |
| 3237 | 난 시녀(The Maid)에게 완전히 짓밟혔어. 구전(Telling)의 수많은 세월도... 거의 기억나지 않아. 내 모든 영광이 더럽혀졌어. | Reassess `compromised` against the surrounding loss of Telling memories and tainted glory; `짓밟혔어` may overstate physical humiliation rather than corruption/impairment. Confirm the formal lore sense of `Telling`. | English says the speaker's whole being was “compromised,” and the rest of the passage describes memory loss and tainted glory. Japanese says the speaker could only yield to the Maid; Chinese says fully controlled. Korean chooses “trampled,” which is vivid but may shift the type of harm. This repeats the historical question. | Medium |
| 3247 | ... 알세룬드(Alserund)를 나르카(Narca)의 고통에서 해방할 수 있어. | Identify `Narca affliction` as a curse, disease, or other lore-specific condition before choosing a Korean noun; preserve the conditional theory. | English says “affliction,” Japanese calls it a curse, and Chinese says suffering. Korean follows the broad suffering sense and keeps the conditional, but the nature of the affliction remains unresolved. This repeats the historical question. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 3201, 3212, 3215, 3223,
  3227, 3237, and 3246-3247 against active Korean and source rows.
- Same-numbered historical questions about armor at IDs 3211, 3229, and
  3242, crafting components at 3223, and Chaos recipes at 3238 belong to
  `base`/other resources and were not merged into these `default` entries.
- No historical disposition was treated as approval.

## Other Checks

- ID 3201 retains three paragraphs and the named regions, generals, battles,
  and factions; no chronology or numeric values were altered.
- ID 3223 preserves the four-day attempt, the failed Boggart summoning, and
  the prayer for success. ID 3248 retains both the goal of securing Gravehal
  Keep and the beasts occupying its halls.
- No structural changes were made.

## Batch Status

IDs 3200-3249 received one preliminary reading against the stated references.
At the time of this read-only scan, findings were candidates/questions only.
They were subsequently dispositioned in
[`disposition-batch-default-03200-03249-20261009.md`](disposition-batch-default-03200-03249-20261009.md):
two supported corrections were applied, one finding was marked
`not an issue`, and nine remain uncertain and unchanged. This does not
constitute independent final linguistic approval.
