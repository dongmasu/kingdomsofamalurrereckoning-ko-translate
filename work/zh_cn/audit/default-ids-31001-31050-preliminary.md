# Preliminary Language Scan: `default` IDs 31001-31050

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 31001-31050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 31001 | `수정들이 내게 말을 걸어` for `It speaks to me` | Confirm whether “it” refers to the music or the crystals; Korean currently makes the crystals themselves speak. | The preceding English says the crystals give off music, then uses singular `It`. Korean repeats plural crystals as the speaking subject. Japanese/Chinese also retain a singular pronoun, so the intended antecedent is not certain. | Medium |
| 31003 | `더는 찾아보지 않겠어` for `I'm done looking` | Preserve whether the speaker has finished searching or refuses to keep looking. | English is a short contextless fragment; Korean expresses a decision to stop looking. Japanese says “not here,” while Chinese says the speaker has searched. | Low |
| 31005 | Disease-cure potion; Embereyes (2), Ysa's Breath (2) | Preserve both reagent identities, quantities, Alchemy Workbench, and blank-line-separated recipe structure; standardize reagent names. | Korean retains the two ingredients and 2/2 values. Locale forms for Embereyes and Ysa's Breath vary. | High |
| 31011 | `그대여` for `dove` | Confirm whether this is an intimate/affectionate nickname and preserve it consistently with the other `dove` addresses. | English directly addresses the addressee as `dove`; Korean uses a formal/literary `그대여` without the bird nickname. The historical audit flags this form of address. | Medium |
| 31012 | `통지서` for `notices` | Determine whether these are conscription notices or another kind of notice and retain the question about delivery destination. | Korean treats them as documents to be delivered; the source alone does not identify the notices' institution or recipient. | Medium |
| 31021 | `도슨트` for `Docent`; `신입생` for `Neophyte` | Confirm the formal academic rank and standard Korean titles for Docent and Neophyte. | Korean transliterates Docent and renders Neophyte as a new student. English presents both as named institutional roles. The active corpus contains Docent as a formal rank. | Medium |
| 31027 | Three alternative readings of a single line | Preserve all three possible translations without selecting one before the poem/riddle context is known. | The English explicitly lists “Reaching to the sky,” “We strain,” and “We stretch.” Korean retains three parallel alternatives, matching the row's uncertainty. | High |
| 31030 | `스콜리아 아르카나` for `Scholia Arcana` | Standardize the organization name against `아르카나 학회`, `숄리아 아르카나`, and other active forms. | The Korean uses a phonetic form while the corpus contains multiple spellings and a semantic rendering of the same organization. | High |
| 31034 | `내가 한 말보다 훨씬 더 깊은 뜻이 있어` for `More truth to that than you know` | Preserve the claim that the statement is truer than the listener realizes, rather than only saying it has a deeper meaning. | English emphasizes truth; Korean shifts to depth/meaning. Japanese says the preceding words have deep meaning, while Chinese says the truth is broader than the listener knows. | Medium |
| 31045 | `운명의 극장` for `The Theater of Fate` | Confirm whether this is a formal location name and standardize it as such. | English capitalizes the proper site; Korean translates it semantically. The same sentence identifies it as a former Erathi stronghold. | Medium |
| 31046 | `먼지의 아이` for `Child of Dust` | Standardize the formal title against active forms such as `먼지의 자식` and `먼지의 자손`. | Korean uses “child”; the same capitalized title has multiple Korean forms across the draft. | High |
| 31048 | `희생 제단들` for `circles of sacrifice` | Confirm whether these are ritual circles/sites or altars; preserve their location and the accusation that they affront the gods. | English says circles of sacrifice embedded in the city and lands. Korean translates them as sacrificial altars, potentially narrowing the physical form. | Medium |
| 31049 | `앨린 셔` for `Alyn Shir` | Standardize the character-name spelling against earlier appearances. | The label is a note attributed to a named character. Historical notes flag Alyn Shir spelling and note context. | Medium |

Rows 31002, 31004, 31006-31010, 31013-31020, 31022-31026,
31028-31029, 31031-31033, 31035-31044, 31047, and 31050 generally retain
the English meaning on this first reading. Their names, register, fragments,
lore terms, and surrounding quest context remain for the integrated pass; no
separate high-confidence wording candidate was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 31000-31099 was checked against
  the relevant rows, including the recipe at 31005, Fate replacing sin,
  `dove`, Docent, alternative readings, Lie marker, Theater of Fate,
  Child of Dust, sacrifice circles, and Alyn Shir.
- The narrower historical questions at 31005, 31010-31011, 31021,
  31027, 31032, 31045-31046, and 31048-31049 were reviewed. ID 31027
  remains explicitly undecided; no alternative was selected.
- ID 31005 preserves both reagent quantities and the blank-line recipe
  layout. ID 31032's parenthetical `(Lie)` is retained as visible text.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 31001-31050 once,
  in identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match. No runtime token was found to be missing or reordered.
- Numeric meaning is retained. ID 31005 preserves two ingredients at 2
  each; ID 31018's “one gladiator” is expressed with a Korean counter.
- No unexpected Unicode format-character or structural exception was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 31001-31050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 31051.
