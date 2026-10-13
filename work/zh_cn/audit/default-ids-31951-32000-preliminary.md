# Preliminary Language Scan: `default` IDs 31951-32000

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 31951-32000 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, and recurring
  terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 31952 | `크루독`, `브라우니`, `룬다미르`, `시드헤`, `시트릭 봄` | Standardize the creature, brownie group, place names, and Sihtric Vorm; preserve the reward as a later conversation rather than an assumed award. | English says the defeated Crudok can no longer send Rundamir's brownies to terrorize travelers of the Sidhe. Korean retains the causal sequence and asks Sihtric whether he will give a reward. | Medium |
| 31960 | `퍼스트스원` | Determine whether the Firstsworn is a deity, oath, or formal order and use the appropriate Korean honorific. | It appears as an entity invoked in a blessing. Korean treats the name respectfully; no row context defines it. | Medium |
| 31966 | `티린의 안식처 성가집` for `Tirin's Rest Hymnal` | Confirm Tirin's Rest and Hymnal terminology against the game's established item/location names. | English uses a possessive title; Korean translates the item type and transliterates the place/name. | Medium |
| 31969 | Heste Grastar's letter; 11 line breaks | Preserve the full letter, voice, paragraph/signature layout, names, and source claims; standardize the family, places, institutions, and titles during integrated review. | The letter describes Whitestone/Apotyre, the Grastar mining family, Tine's illness and Snaketail water, the gnomes' tests, the appeal to Mayor Eswin, Basilica Gnostra, and Motus Mining Scholars. Korean retains the 11-break structure and the request without filling in beyond the source. | Medium |
| 31974 | `프리모스께서 신하들의 말을 들어 주신 지가 아주 오래됐어` | Recheck the direction of the sentence: English says the Primos has not spoken to his subjects for ages, while Korean says he has not listened to them. | English's “has not graced the ears of his subjects” describes the ruler's speech reaching the subjects. Japanese paraphrases this as the ruler not saying anything pleasant; Chinese shares the listening interpretation in Korean. English is the semantic anchor, so the apparent direction shift is a high-confidence candidate. | High |
| 31980 | Hyperion/Ethene seven-line verse and prayer | Preserve the poem/prayer separation and the contrast that some lost life while many lost faith; review the compressed English syntax and proper names. | English, Japanese, and Korean agree on the fate of life and faith. Chinese reverses/garbles that clause. Korean follows English and retains six line breaks, including the blank separation before the prayer. | Medium |
| 31987 | `아믄시안 반지` / `오나락` / `데르펠` | Standardize Amrynthian Band and the Onarach/Derfel/Hendi names. | English gives a completed reconstruction and return objective. Korean preserves the sequence; name spellings remain candidates for glossary review. | Medium |
| 31988 | Four-line Alfar/Tywili poem; `글레어 라스웬`, `리리아의 눈물방울` | Review the compressed English syntax, proper names, and celestial imagery together; preserve all four lines. | English has a subject/verb mismatch in its opening and a dense image of the bluffs, Tywili, Gleir Rathwen, and Lyria's teardrop. Korean preserves the four-line sequence and main imagery; Japanese/Chinese also diverge in how the names and relationships attach. | Medium |
| 31992 | `{3}`, `{3}`, `{1}`, `{6}` placeholder sequence | Preserve the English/Chinese placeholder order in Korean and verify runtime argument semantics; note that Japanese reorders `{1}` before the second `{3}`. | English, Chinese, and Korean have the sequence `{3},{3},{1},{6}`; Japanese has `{3},{1},{3},{6}`. Korean preserves the English/Chinese sequence and all four placeholders. The two `{3}` values describe nested chance wording in an awkward source tooltip. | High |
| 31999 | `the Counsel` as `조언자` | Determine whether Counsel is a formal office, council/body, or individual advisor; standardize the term. | English capitalizes Counsel as a title/name. Japanese and Chinese render it as advisor/strategist; Korean uses the generic singular “advisor.” The sentence also reports the slaves' impending execution. | Medium |

Rows 31951, 31953-31959, 31961-31965, 31967-31968, 31970-31973,
31975-31979, 31981-31986, 31989-31991, and 31993-31998 generally retain
the English meaning on this first reading. Names, register, and setting
terminology remain candidates for the integrated pass; no separate
high-confidence wording correction was identified.

## Historical Audit Reconciliation

- Historical entries for IDs 31900-31999 specifically flag Primos at 31974
  and the Counsel at 31999. The Primos row was read against all four
  locales; the English/Korean direction difference is recorded above.
- The inherited audit flags ID 31980's awkward English and discordant
  Chinese verse, and ID 31988's compressed syntax and names. Both poems
  retain their original line counts and blank-line layout in Korean.
- ID 31992 is not listed as an old wording question, but a direct structural
  comparison found the Japanese-only placeholder reordering. The Korean
  token sequence matches English and Chinese.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  31951-32000 once and in identical order.
- Embedded line-break counts match, including 11 breaks in Heste Grastar's
  letter at ID 31969, six in the Hyperion/Ethene text at ID 31980, and
  three in the four-line poem at ID 31988.
- Placeholder identities are preserved. At ID 31992, English/Chinese/
  Korean order is `{3},{3},{1},{6}`; Japanese order is `{3},{1},{3},{6}`.
- No inspected row contains a locale-specific BOM, NBSP, zero-width space,
  or directional formatting character.
- No CSV text or source file was edited.

## Batch Status

IDs 31951-32000 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 32001.
