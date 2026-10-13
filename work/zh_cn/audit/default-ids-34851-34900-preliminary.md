# Preliminary Language Scan: `default` IDs 34851-34900

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 34851-34900 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 34860 | `(획득 골드 영구적으로 +5%)` | Preserve the permanent +5% Gold Looted effect and standardize the stat label. | English/Japanese/Korean preserve `+5%`; Chinese uses `5%` without the plus sign. Korean retains the value but its parenthetical wording is compressed. No value loss was detected. | Low |
| 34866 | `전쟁에 서약하고 그 조직의 일원이` for `sworn to war, one of the Order` | Determine whether `Sworn to War` is a formal status/title and identify the Order; avoid leaving the first phrase as a generic act of swearing allegiance to war if it names an institution. | Korean communicates a vow and membership in an unspecified organization. English capitalizes Order; Japanese/Chinese describe a formal order/group. The historical audit explicitly questions this phrase. | Medium |
| 34877 | `아르카나 학회` for `Scholia Arcana` | Standardize the formal name of this mage organization and distinguish its name from a generic “arcane academy/society.” | Korean translates the organization name semantically. Japanese and Chinese also render it as an academy; the English uses a Latinized proper name. Historical notes flag Scholia Arcana as a terminology decision. | Medium |
| 34884 | `테스타먼트` for `the Testament` | Confirm whether Testament is a named faction/group and standardize its Korean form; retain that Colm came to the Marches on a personal errand and was beset by it. | Korean preserves the proper-name-like form and the predicament. Japanese/Chinese translate it as a society/covenant. Historical notes list Testament among possibly named organizations. | Medium |
| 34890 | `무기 교관` for `master-at-arms` | Verify whether this role is an arms instructor, military trainer, or formal keep office; use a consistent title. | Korean describes the person's lifelong fighter training and accurately conveys the offered position in broad terms. Chinese uses “weapons master” and Japanese a guard chief; the exact office remains context-dependent. The historical log explicitly flags `master-at-arms`. | Medium |
| 34892 | `살인자의 요새` for `Murderer's Hold` | Confirm whether this is a named prison/location and standardize the name rather than translating it as a generic fort. | English capitalizes the location. Korean translates it literally as “murderer's fortress”; Japanese identifies it as Didenhil Prison and Chinese as a murderer fortress. Historical notes explicitly call out this mismatch. | High |
| 34895 | `인간의 발자취를 반기지 않을 테지. 페이도 마찬가지야.` | Preserve the idea that the forest and the Fae will not tolerate human encroachment; clarify whether “Neither will the Fae” means the Fae share the forest's resistance or are themselves likewise harmed. | Korean follows the negative sequence but leaves the second clause elliptical. Japanese/Chinese also differ in whether the people or their lands are the implied subject. The English pronoun/antecedent is context-dependent. | Medium |
| 34896 | `이드 처치!` for `The Id Was Killed!` | Determine whether `Id` is a named enemy/entity, and standardize its Korean name while preserving the event/UI tone. | All locales treat `Id` as a name (Japanese transliterates it, Chinese writes 伊德); Korean likewise transliterates it. The historical audit explicitly asks whether it is a named entity. | Medium |
| 34898 | `부탁한 것보다 훨씬 큰 공을 세웠군` for `rose above the call of service` | Preserve the likely intended idiom that the addressee exceeded the requested service/duty, while recording the source's unusual wording rather than silently treating it as a confirmed typo. | English's “rose above the call of service” is nonstandard and possibly a play on “rise above the call of duty.” Korean and Japanese interpret it as doing more than requested; Chinese mistranslates the phrase. The reward is still correctly said to exceed normal pay. | Medium |
| 34900 | `운명의 속박 풀기` for `Unbind Destiny` | Confirm whether this is a named skill/quest action and standardize `Destiny` and the verb with related ability/tutorial labels. | Korean expresses release from fate's bonds. Japanese says liberation from fate and Chinese says unbind destiny; capitalization suggests a named ability/action but context is absent. | Medium |

IDs 34851-34859, 34861-34865, 34867-34876, 34878-34889, 34891,
34893-34894, and 34897-34899 generally retain the English meaning on this
first reading. Proper names, lore, voice, and display conventions remain
integrated-pass candidates; no additional distinct wording issue was
identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 34800-34999 flags the
  Order/Sworn to War phrase (34866), Scholia Arcana (34877), Testament
  (34884), `master-at-arms` (34890), Murderer's Hold (34892), forest/Fae
  relations (34895), `the Id` (34896), and Unbind Destiny (34900). These
  were checked against active Korean and all locale references.
- The same historical entry records the permanent stat at 34860 and
  confirms that its +5% value was preserved.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 34851-34900 once
  and in identical order.
- Embedded line-break counts match across all four locales; this range has
  no multiline entries.
- No runtime-marker discrepancy was detected.
- ID 34860's `+5%` is retained in English, Japanese, and Korean; Chinese
  omits only the explicit plus sign. At ID 34898 English spells out “each
  and every one,” while Japanese uses `1人`; the count meaning is retained.
- The active Korean CSV SHA-256 remains
  `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`.
- No CSV text or source file was edited.

## Batch Status

IDs 34851-34900 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 34901.
