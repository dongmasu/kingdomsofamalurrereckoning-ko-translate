# Preliminary Language Scan: `default` IDs 32201-32250

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 32201-32250 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  variables, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 32203 | `호스피탈리스 병영` / `장다리들` | Standardize Hospitalis Quarters and the derogatory species term `longlegs` against active-corpus usage. | English names Hospitalis Quarters and calls the group `longlegs`; Japanese/Chinese agree on both. Korean has rendered the place as `호스피탈리스 구역`, `병원 구역`, `병동 구역`, and now `병영`. The insult also varies among `롱레그`, `긴다리`, and `장다리` forms. | High |
| 32207 | `상인 조합` for `Merchant Circle` | Confirm whether Circle is the formal name of a merchant association and standardize its title. | English capitalizes `Merchant Circle`; Japanese reads it as a merchant guild/association, while Chinese keeps a literal circle image. Korean's `상인 조합` conveys an organization but not the Circle name/image. | Medium |
| 32211 | `장인의 자물쇠따개` for `Master's Pick` | Verify whether this is a named lockpick/tool or a generic “master's pick” before translating the title. | English and Japanese leave the capitalized `Master's Pick` unexplained; Chinese reads it as a master lockpicker. Korean chooses “master lockpick,” a plausible interpretation in the jewelry-box context but not established by the isolated row. | Medium |
| 32214 | `신앙을 버린 자들` for `the renounced` | Determine whether Renounced is a named faction/status or a descriptive label; align capitalization and terminology. | English capitalizes `Renounced` and says they return to the city in large numbers. Korean interprets the term as people who abandoned their faith. The historical log flags this as a faction/term question; no locale alone establishes its formal status. | Medium |
| 32218 | `보호막 50개 해제` for `Dispel 50 wards` | Confirm the gameplay sense of `ward` and distinguish dispelling wards from removing shields/barriers. | English uses the gameplay term `wards`; Japanese says protective magic and Chinese says seals. Korean's `보호막` suggests shields/barriers. The count and dispel action are retained, but the object type needs gameplay context. | Medium |
| 32220 | `여정을 지켜 줄 수호신을 선택하세요. 계속하려면 (A)를 누르세요.` | Preserve the A-button prompt and note the Chinese fullwidth-parenthesis style. | English, Japanese, and Korean use ASCII `(A)`; Chinese uses fullwidth `（A）`. The button letter `A` is present in every locale, so this is a punctuation-width difference, not a missing control. | High |
| 32225 | `사이온` / `감시자들` | Confirm Scion and Watchers as formal titles/entities and keep capitalization distinctions consistent. | English capitalizes both names; all locales retain the protection relation. Korean uses established-corpus `사이온` and the descriptive `감시자들`; Japanese and Chinese also use named Watchers forms. The Watchers' official Korean title remains unsettled. | Medium |
| 32232 | `이몬 섬` for `Isle of Eamonn` | Standardize the Eamonn's Isle name and bilingual display convention. | English omits the possessive in this label, while Japanese/Chinese use the island name. Korean uses `이몬 섬`, consistent with the name but without the English traceability used in many other rows. | Low |
| 32238 | `가문을 전쟁으로 이끌어야 해` for `The House must be led to war` | Confirm whether capitalized House is a named faction or a generic ruling house, and preserve the speaker's demand. | English capitalizes `House`; Korean uses generic `가문`. The historical audit flags House as a setting term. The demand that someone lead it into war is otherwise retained. | Medium |
| 32240 | `용맹의 가문` for `House of Valor` | Confirm the official Korean faction name and standardize the bilingual/corpus form. | English names House of Valor. Korean translates it as `용맹의 가문`; Japanese retains the transliterated House name and Chinese uses a localized house title. The historical log flags named-house terminology. | Medium |
| 32241 | `푸른 칼날` / `인장` for `the Verdant Blades` / `the Seal` | Confirm Verdant Blades as the named item/group and standardize singular/plural and color wording. | English capitalizes both objects and gives Verdant Blades in the plural. Korean keeps the Seal as `인장` but renders the Blades as `푸른 칼날`, without the English name. Elsewhere the active corpus uses both `푸른 칼날` and `초록 칼날들` for Verdant Blades, confirming an unresolved name/number consistency issue. | High |
| 32244 | `동전의 시종 크릴가린` for `Crilgarin, Knave of Coins` | Standardize Knave of Coins as a card/title and reconcile Crilgarin's recurring epithet. | The English title is capitalized and historically flagged as a card-title question. Active Korean variants include `동전의 시종`, `동전의 건달`, `동전의 잭`, `동전의 사기꾼`, `동전의 악당`, and `동전의 악동`. Japanese and Chinese also interpret the title differently. | High |
| 32245 | `발라드 가문` for `House of Ballads` | Standardize this named faction against established corpus forms. | English names the House of Ballads. Korean uses `발라드 가문` here, while the active corpus also uses `하우스 오브 발라드` and `발라드의 집`. The character's dismissive challenge is retained. | Medium |
| 32249 | `봉헌물이란 무엇인가?` for `What is the Offering?` | Determine whether capitalized Offering means the named rite, a sacrifice, or an offered object. | English capitalizes the term; Japanese reads it as a contribution and Chinese as a sacrifice. Korean's `봉헌물` specifically asks about an object. Across the active corpus, `Offering` appears as `봉헌`, `봉헌물`, or `봉헌 의식`, so the intended sense and canonical form need context. | High |

Rows 32201-32202, 32204-32210, 32212-32213, 32215-32217, 32219,
32221-32224, 32226-32237, 32239, 32242-32243, 32246-32248, and 32250
generally retain the English meaning on this first reading. Names, faction
terms, and item/UI terminology remain candidates for the integrated pass;
no separate high-confidence wording correction was identified.

## Historical Audit Reconciliation

- The source-keyed historical log for IDs 32200-32299 flags `longlegs`,
  Court/faction names, Renounced, the Chaos Scholar/Abyss armor, sweating
  sickness, Scion/Watchers, House, Verdant Blades/Seal, Knave of Coins,
  and Offering. The relevant entries were checked against the active Korean
  and all three source locales.
- Existing active Korean uses `마법의 궁정` consistently for Court of
  Enchantments, while major faction and item names in this batch still have
  multiple competing Korean forms.
- Exact runtime variables and the gold icon at ID 32206 and the gold amount
  variable at ID 32219 are preserved in all locales.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  32201-32250 once and in identical order.
- Embedded line-break counts match throughout the range.
- `$DLC1_LordOfTheKeep.CALUM_DEBT$`,
  `#NAMED_ICON_GOLD#`, and `$SQ94.gold_amount$` are preserved with identical
  identities and order. ID 32220 retains the A-button letter in all locales;
  Chinese uses fullwidth parentheses around it.
- No other runtime-marker discrepancy was detected in this batch.
- No CSV text or source file was edited.

## Batch Status

IDs 32201-32250 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 32251.
