# Preliminary Language Scan: `default` IDs 34901-34950

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 34901-34950 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 34901 | Korean notice for new downloadable content | Confirm the established Korean UI term for downloadable content and whether this text is platform-specific; preserve the instruction to return to the title screen. | Korean communicates availability and the required title-screen action. The Chinese source row duplicates English verbatim; this does not provide independent Chinese-language evidence. | Low |
| 34916 | `템플러 옥티엔느` / `그자가 후원자야` | Standardize Templar as a formal rank/title and verify whether `patron` means sponsor, patron, or the person behind the events. | Korean follows the English “patron” wording. Japanese interprets him as the mastermind, which is stronger; Chinese agrees with sponsor/patron. The row does not resolve whether he funds or directs the affair. | Medium |
| 34919 | `역병 방패` for `Plagueshield` | Confirm whether Plagueshield is a named craftable item and standardize its Korean name; retain that she is the only living person able to make more. | Korean translates the compound literally and preserves the ability claim. English capitalization and the historical log suggest a formal craftable item/faction term; Japanese transliterates it and Chinese translates it descriptively. | Medium |
| 34926 | `용맹의 하우스` / `계절의 하우스` | Standardize House of Valor and House of Seasons as named Houses/factions and make their naming pattern consistent. | Korean translates one name's modifier but leaves `House` transliterated, and translates Seasons as “House of Seasons” literally. Historical notes flag both named Houses for terminology consistency. | Medium |
| 34928 | `탐험꾼` for `Delvers` | Determine whether Delvers is a named group/role or a generic description of explorers; standardize the term, including Taibreah's membership. | English capitalizes Delvers and describes a shared talent. Korean uses the generic “explorer”; Japanese/Chinese also choose generic role words. The historical audit explicitly questions Delvers as a possible group name. | Medium |
| 34929 | `초대받은 자` for `Beckoned` | Standardize Beckoned as the protagonist's title/form of address and preserve the question about egg-hunting progress and the lack of a clear lead. | Korean retains the question and the explicit absence of a clear lead, while rendering the capitalized title generically. The historical notes flag Beckoned as a recurring title. | Medium |
| 34930 | `모든 방어구 수치` for `all your armor` | Confirm whether the potion raises the character's total armor rating or the armor of every equipped piece; preserve its temporary effect and both ingredient quantities. | Korean makes the stat interpretation explicit. English is broad; Chinese says “all your armor,” and Japanese paraphrases it as an overall defense increase. Historical notes specifically ask whether this means total armor rating. | Medium |
| 34934 | Frost Trap: `25` damage, `35%`, `4초` | Preserve the additional damage, stun chance, target effect, and duration; standardize the Frost Trap and Stun terms. | Korean retains 25 additional damage, 35%, and 4 seconds; all four locales preserve these values. | Low |
| 34936 | `조직` for `the Order` | Determine whether this capitalized Order is the formal organization and use the same Korean term as related Order references, including the oath/member wording at 34866. | Korean renders it generically as organization. English capitalizes Order and the historical audit flags this organizational term elsewhere in the range. | Medium |
| 34940 | `풍음석` for `Windstone` | Confirm the established item name for Windstone and distinguish the last required stone from generic wind/chime stones. | Korean uses a semantic compound; Japanese uses a “wind-sound stone” form and Chinese a generic windstone. The historical terminology inventory explicitly asks whether Windstone has a fixed Korean name. | Medium |
| 34942 | `+10` Physical Damage / `+25%` Damage with Longswords | Preserve both Longsword scopes, damage types, values, and the two separate stat lines. | Korean retains +10 Physical Damage and +25% Damage with Longswords, with one line break matching English. Japanese/Chinese reorder the label but preserve the same stats. | Low |
| 34949 | `참사회 예배당` for `chantries` | Confirm the religious/institutional sense of chantries and standardize the Korean term; avoid implying a “council” unless the setting supports it. | English refers to chantries in plural. Japanese/Chinese render them as chapels, while Korean's `참사회 예배당` introduces a council/chapter meaning. The historical audit lists chantries among unresolved religious terms. | Medium |

IDs 34902-34915, 34917-34925, 34927, 34931-34933, 34935, 34937-34939,
34941, and 34943-34948 generally retain the English meaning on this first
reading. Proper names, lore, voice, and display conventions remain
integrated-pass candidates; no additional distinct wording issue was
identified.

## Historical Audit Reconciliation

- The source-keyed historical inventory flags the potion recipe at 34913,
  House of Valor/House of Seasons, Delvers (34928), the armor-stat
  interpretation (34930), Windstone (34940), and chantries (34949). These
  were checked against active Korean and all locale references.
- The same inventory records Templar/rank and Order terminology as
  unresolved; ID 34916 and ID 34936 were cross-checked with the earlier
  Order/Sworn to War discussion.
- At ID 34901 the Chinese `Texto` field is exactly the English notice, so
  it is not independent evidence for Korean wording.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 34901-34950 once
  and in identical order.
- Embedded line-break counts match across all four locales. The potion
  recipes at IDs 34913 and 34930 retain their ingredient-list layouts; ID
  34942 retains two separate stat lines.
- No runtime-marker discrepancy was detected.
- Values match at ID 34934 (25 damage, 35%, 4 seconds), ID 34942 (+10 and
  +25%), and recipe quantities at IDs 34913 (3, 2, 1, 1) and 34930 (2, 1).
  The Japanese version writes `Lesson III` as `3`; the Korean `제3과`
  preserves the equivalent lesson number.
- The active Korean CSV SHA-256 remains
  `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`.
- No CSV text or source file was edited.

## Batch Status

IDs 34901-34950 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 34951.
