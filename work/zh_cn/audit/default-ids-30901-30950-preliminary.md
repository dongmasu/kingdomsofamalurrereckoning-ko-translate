# Preliminary Language Scan: `default` IDs 30901-30950

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 30901-30950 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 30902 | `교만의 시종` for `Knave of Pride` | Confirm whether Knave of Pride is a formal Fate card/title or a servant/role in the House of Pride; standardize it against `자만의 악당`. | English and Chinese use a title-like form; Japanese explicitly calls the speaker a House of Pride servant. The active Korean elsewhere renders Knave of Pride as `자만의 악당`, while this dialogue uses `교만의 시종`. | High |
| 30909 | `발라드 가문` for `House of Ballads` | Standardize the formal House name against active forms `발라드의 집` and `하우스 오브 발라드`. | Korean treats the institution as a clan/family here, while many rows translate it as “House” or transliterate it. The English label is isolated but capitalized. | High |
| 30913 | `서약검` for `Oathblade Kirby` | Confirm that Oathblade is a formal rank/title and use the canonical Korean form (`맹세의 칼날` / `맹세검`) consistently. | The row is a person/title label. The corpus uses several forms for Oathblade, which also appears as a bestowed rank. Historical notes explicitly flag the title. | High |
| 30917 | `티타리온 대왕` for `High King Titarion` | Standardize the title/name order and honorific against other active forms such as `대왕 티타리온`. | The Korean name is consistent, but the title follows the name in this label and precedes it elsewhere. | Medium |
| 30920 | Four-part stone riddle: `수호자들 아래의 하나 / 운명의 투사 / 속박되지 않은 길 / 부름` | Preserve each cryptic phrase and its order; determine whether “One below the Patrons” and “Beckoning” refer to formal titles, factions, or directions. | The English is deliberately elliptical and separated by slashes. Korean retains four phrases and the sequence, but the referents are unavailable in this row. Historical notes flag this riddle. | Medium |
| 30921 | `시녀` for `the Maid` | Confirm whether Maid is the formal Windemere title here and standardize the named role's Korean convention. | English capitalizes Maid; Japanese substitutes the Windemere title, while Chinese and Korean use a generic maiden/maid form. Historical notes flag the title. | Medium |
| 30924 | `고손` for `great, great grandson`; `계승자` for `heir` | Check the exact generational relationship and whether the Caeled Coast is inherited as a title/estate or territory. | English says “great, great grandson” and heir to the coast; Korean compresses the relationship to `고손` and translates heir as successor. Japanese/Chinese also differ in generation wording. | Medium |
| 30926 | `{3}%` / `{1}` Health per Hit | Preserve the variable identities and order, and check whether “Steal Health” should use the project's standard lifesteal terminology. | Korean retains `{3}` as the chance and `{1}` as the health amount, in source order. The effect wording is consistent with other health-steal descriptions but may need a canonical UI term. | High |
| 30932 | `수녀` becoming `수도자` in the Order of Mitharu | Confirm the intended status transition and formal order name without imposing a gender mismatch. | The speaker calls Zelda “Sister” and says she can become a monk; Korean uses `수녀` for her address and the gender-neutral `수도자` for the order member, preserving both source labels. | Medium |
| 30937 | `내 앞에서 기도하는 자는 누구인가?` for `What prays before me?` | Preserve the deliberately strange/possibly accusatory source wording and the Fate-river/song-of-Amalur imagery. | Korean follows the English literally. Japanese removes the prayer verb, while Chinese also retains it. Historical notes explicitly identify this line as awkward. | Medium |
| 30940 | `홀로우랜드` for `Hollowlands` | Standardize the region spelling against active variants such as `할로우랜드`, `할로우랜드`, and `홀로랜드`. | The same region appears with multiple Korean phonetic forms. This row preserves the uncertain storm-versus-magic comparison. | High |
| 30941 | `우물` for capitalized `the Well` | Confirm that the Well is the formal Well of Souls and use the established proper-name form if supported by context. | The text explains the Well's soul-capture/body-recreation function. Elsewhere the active Korean uses `영혼의 샘(Well of Souls)` or `영혼의 샘`; this row uses generic `우물`. | High |
| 30948 | `성주` for `the Castellan` | Confirm whether Castellan is a formal office/title and standardize it against the project's Castellan terminology. | The row describes a military leader who presents himself as a simple soldier. Korean gives a generic castle-lord term; other locales also use generic castellans. | Medium |
| 30949 | `캔레인` for `Cann-Rane` | Confirm the hyphenated name's canonical Korean rendering and preserve its compound structure if meaningful. | English and Japanese visibly hyphenate the name; Korean collapses it into one phonetic unit. Historical notes call out the name for comparison with earlier appearances. | Low |

Rows 30901, 30903-30908, 30910-30912, 30914-30916, 30918-30919,
30922-30923, 30925-30931, 30933-30936, 30938-30939, 30942-30947,
and 30950 generally retain the English meaning on this first reading. Their
names, register, fragments, lore terms, and surrounding quest context remain
for the integrated pass; no separate high-confidence wording candidate was
identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 30900-30999 was checked against
  this range, including Knave of Pride, House of Ballads, St. Eadric,
  Oathblade Kirby, Maid, Caeled Coast, High King Titarion, the stone riddle,
  bribe variable, Hollowlands, Well, Farraglen, Castellan, and Cann-Rane.
- The narrower historical questions at 30902, 30914, 30920, 30924,
  30926, 30932, 30935, 30937, 30940-30941, 30945, and 30948 were reviewed.
  ID 30920's four-part riddle, ID 30937's awkward opening, the Well's
  referent, the inheritance phrase, and title/name forms remain context
  questions; prior notes are not approvals.
- The `{3}` chance and `{1}` health variables at 30926, and the
  `$SQ53.bribe_value$` variable at 30939, were checked directly.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 30901-30950 once,
  in identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match. IDs 30926 and 30939 preserve their exact variables.
- Numeric meaning is retained. The `{3}%` chance and `{1}` health amount at
  30926 match, and the dynamic gold amount at 30939 remains intact.
- No unexpected Unicode format-character or structural exception was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 30901-30950 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 30951.
