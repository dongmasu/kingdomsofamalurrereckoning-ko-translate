# Preliminary Language Scan: `default` IDs 30351-30400

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 30351-30400 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 30351 | `기원의 설계도에 무게를 재어 ... 두 장의 널빤지`; `시드 사이로` | Preserve the creation poem's intentionally strange imagery while clarifying “weighted plans,” “two piece planks,” and whether Sidhe is a people/place/realm. | Korean follows the images closely; English itself is obscure, Japanese/Chinese interpret some phrases differently, and “through the Sidhe” may refer to a place or people. Historical audit specifically flags the weighted plans and two-piece planks. | Medium |
| 30355 | Rotelos journal; orphan `.` on its own line | Preserve the final source period and all paragraph breaks; review the wording about the three masons and their death after completing the halls. | Korean preserves the trailing period and matches English/Chinese line breaks. Japanese alone omits the final standalone-period line, so the Korean layout matches the English source here. Historical notes explicitly flag the orphan period. | High |
| 30357 | Niskaru Hunter severed appendage fashioned as a ceremonial weapon | Keep clear that the object was part of the Hunter's arm before being severed and later fashioned into a weapon; standardize Niskaru Hunter. | Korean retains the severed appendage, trophy, ceremonial weapon, and original magic. Historical audit warns not to confuse the appendage with an originally crafted weapon. | Medium |
| 30359 | `리브라리움` for `Livrarium` | Confirm the named institution/library and canonical Korean spelling. | Korean transliterates the label; Japanese/Chinese translate it as a library/institute. The source-keyed historical audit flags Livrarium. | Medium |
| 30362 | Cryamor / murghan prisoners / Bareth | Clarify whether Cryamor is a person/place and preserve the intended targets of the released prisoners' rage. | Korean follows the English pronouns and states that the murghan will turn on their persecutors, not Bareth. The row lacks antecedent context; historical notes flag Cryamor, murghan, and Bareth. | Medium |
| 30365, 30181 | `그녀` in the refugee account | Identify the antecedent of “her” from surrounding narrative; preserve that refugees receive available food and that the speaker has watched her die for ten years. | These are duplicate English lines with Korean variants that both retain the pronoun without identifying its referent. Historical audit explicitly leaves this unresolved. | Medium |
| 30369 | `그녀가 자길 원한다고` for `she desires` | Identify “she” and preserve the speaker's insistence that Creth is mistaken. | Korean follows the source pronoun and claim, but the row does not name the woman. Historical notes explicitly flag Creth and “she.” | Medium |
| 30373 | `우리가 다시 만들 거야` for `we will remake it` | Confirm the antecedent of `it` and retain the emphatic promise to rebuild/remake it. | Korean matches the source but the object is absent from the isolated row. Historical audit flags the object/context. | Medium |
| 30377 | `???` | Preserve the source placeholder exactly unless puzzle/context evidence authorizes localization. | Korean retains the three question marks unchanged. Japanese substitutes a different string; Chinese uses full-width question marks. Historical notes explicitly say to keep the source placeholder. | High |
| 30383 | `이 가문` for capitalized `this House` | Confirm whether House denotes a faction/organization or a family/household, and preserve the contrast between its formerly crowded state and present decline. | Korean uses “family/house,” which reads naturally but may blur the in-world House institution. Japanese says place; Chinese says family. Historical audit flags the House's decline. | Medium |
| 30390 | `아말루르를 영원히 떠나지 않는 한은` for `Unless ... you depart Amalur forever` | Check the negation; the Korean currently says “unless you do not leave Amalur forever,” reversing the condition. | English and Chinese say departure is the exception/condition. Korean inserts `않는`, yielding the opposite polarity. Japanese also contains a negated phrasing, so English remains the meaning authority. | High |
| 30392 | `이 공고문` for capitalized `these Notices` | Confirm whether Notices are formal military call-up notices, general public notices, or a named support mechanism. | Korean says notices; Japanese specifies call-up notices and Chinese says general notices. English capitalizes the term and ties it to supporting the army still stationed in Klurikon. Historical audit flags Notices. | Medium |
| 30398 | `남동쪽` / Hollowlands / Templar Octienne / Hugues | Confirm the route direction and standardize place/title/name spellings; retain that Octienne waits to discuss finding Hugues. | English and Korean say southeast. Japanese and Chinese say southwest. Korean follows the primary English source; the directional disagreement remains a source-reference conflict. | Medium |
| 30399 | `미타루` for `Mitharu`; `봉헌물` | Standardize the deity's Korean spelling and confirm whether this is an individual offering or a named ritual. | Korean uses `미타루`, while other active rows commonly use `미사루(Mitharu)`; the same spelling variation was noted at ID 30119. The prayer and resulting guidance of others are retained. | Medium |

Rows 30352-30354, 30356, 30358, 30360-30361, 30363-30364, 30366-30368,
30370-30372, 30374-30376, 30378-30382, 30384-30391, 30393-30397,
and 30400 generally retain the English meaning. Their proper names, voice,
idioms, lore, and UI terminology remain for the integrated pass; no separate
high-confidence wording candidate was identified in this first reading.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 30300-30399 flags the Lyria
  journal, Scav/Cartery Jayck, Flowering, Primos/Arkes/Hyperian, Medgar and
  Osgar Krast, Crossing, Drewn Ansilla, Long Winter, Architect/Sidhe,
  Rotelos, Niskaru Hunter, Livrarium, Cryamor/murghan/Bareth, Frea Almar,
  Alfar Army, Tirin, Creth, Alserund, Agarth Ulfrik, St. Eadric, Ironfast,
  and Mitharu. These were checked against the active rows where relevant.
- The narrower historical notes specifically flag the creation poem,
  Rotelos journal, Niskaru Hunter appendage, refugee “her,” Creth and “she,”
  the `???` placeholder, House winnowing, Notices, and Hugues. The
  placeholder and source line layout were checked directly; open narrative
  questions remain open.
- The Korean negation concern at 30390 and English/Japanese/Chinese route
  conflict at 30398 are additional active-row observations. They are not
  treated as resolved findings or approved edits.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 30351-30400 once,
  in identical order.
- Embedded line-break counts match except at ID 30355: Japanese has two
  embedded breaks while English, Chinese, and Korean have three. Korean
  retains the standalone period line and matches English/Chinese.
- Runtime-token identities/order match across all four locales.
- The +20% Physical and Piercing Damage Resistance value at 30388 is
  preserved.
- No Korean structural exception or unexpected Unicode format-character
  discrepancy was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 30351-30400 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 30401.
