# Consolidated Context Review: `default` IDs 24901-24950

- Date: 2026-10-11.
- Re-reviewed prior uncertain findings against English meaning, Japanese
  voice/register and draft, Chinese supporting evidence, active Korean,
  linked corpus uses, and earlier audit decisions.
- Resolved all 20 prior uncertain IDs: four accepted corrections and 16
  `not an issue`. No hold remains in this interval.

## Decisions D-19029-D-19041

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19029 | 24902 | not an issue | English and Japanese explicitly describe a draw of three cards. The parallel card entry at ID 1723 confirms `The Running Man` is a named Fate card; the Korean keeps all three card identities. |
| D-19030 | 24903-24904 | not an issue | Relief troops, officers from Mel Senshir, travel to Seawatch, and joining Alyn Shir remain; Korean place/person forms recur in the active corpus. |
| D-19031 | 24912-24913 | mixed | ID 24912 is `not an issue`: the Scion successor is selected months before the ceremony to contemplate the duties. ID 24913 is accepted: `창백한 지팡이` names the specific Paling Wand, so identify it as `창백한 지팡이(Paling Wand)`; the hopeless reaction, Fate image, Arick address, and uncertain departure remain. |
| D-19032 | 24915 | not an issue | All three sources describe Midden as the people's origin and the destination where all things die; Korean preserves both sides of the creation-myth claim. |
| D-19033 | 24917, 24922 | not an issue | `맨발 하콘` represents Hakon Barelegs. `거칠게 살아 보다` and `배짱을 키우다` convey roughing it and developing a spine as a Warsworn recruit. |
| D-19034 | 24924 | not an issue | Villagers seeking wisdom from the Scion are retained; the title form `사이온` is used consistently in this context. |
| D-19035 | 24925 | accepted | English names Uriel Brugnar; add the complete source spelling to Korean `우리엘 브루그나르` while preserving the Fae sorcerer's craft attribution, cowl, and aggressive-spellcasting purpose. |
| D-19036 | 24928 | not an issue | Buried Dvergan treasure, Aubrey Gilcrest, return, and the conditional map-fragment inquiry are preserved. |
| D-19037 | 24932 | not an issue | The Alfar army's forced seizure, Urlik's exception, planned return, and birthright claim remain without resolving what “everything” comprises. |
| D-19038 | 24939-24941 | mixed | IDs 24939 and 24941 are `not an issue`: the Missives of Sable book title and Adept's Ring acquisition are intelligible and supported by recurring corpus uses. ID 24940 is accepted: ID 931 identifies Rialte Brocaire as a wine vintage and uses the prevailing Korean `리알테 브로케어`; standardize this occurrence. |
| D-19039 | 24942 | not an issue | The arena-entry-before-match sequence, Brogan Adair, and his warrior team remain; the Korean name form recurs in the tournament text. |
| D-19040 | 24944-24946 | not an issue | Brio's stewardship, the Blood Plague allegation, Kahrunk's defeat, Secandra report-back, and the Southern Passage entity's work are all retained. `혈역병` is an intelligible disease rendering; no local referent change is indicated. |
| D-19041 | 24950 | accepted | Standardize Witchknight Anira to the recurring `마녀 기사 아니라(Anira)` form, making the personal name explicit and avoiding an unmarked spelling variant. Her continued occupation and tentative alternative plan remain. |

## Edits

| ID | Before | After | Rationale |
| ---: | --- | --- | --- |
| 24913 | `창백한 지팡이` | `창백한 지팡이(Paling Wand)` | Identify the named artifact using its source title. |
| 24925 | `우리엘 브루그나` | `우리엘 브루그나르(Uriel Brugnar)` | Restore the complete English personal name. |
| 24940 | `리알테 브로케르` | `리알테 브로케어` | Match the recurring Korean name for the identified wine vintage. |
| 24950 | `마녀기사 아나라` | `마녀 기사 아니라(Anira)` | Match the established faction/person form and distinguish Anira from the Korean negation word. |

## Verification

- English, Japanese, Chinese, Japanese-derived Korean draft, and active
  Korean each contain IDs 24901-24950 exactly once and in identical order.
- A byte comparison against the pre-edit backup proves only the four
  approved `Texto` cells at IDs 24913, 24925, 24940, and 24950 differ.
  UTF-8 BOM, row order, 72,011 CRLF endings, and 73 pre-existing bare LF
  endings remain unchanged.
- No runtime markers occur in the edited cells; the existing batch check
  confirms no runtime-marker or line-break discrepancy in this range.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-24901-24950-D19029/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `33402ae212e395fd7001404a0b976bcfd46f17e0e229688566fc97cad31b791e`.
- Post-edit SHA-256:
  `c9e4bde6b55074652f978af990d8a07c740becb72499ca42867a1cf7b2e0b2eb`.
- Totals: 2,137 accepted / 23,897 `not an issue` / 12,490 uncertain
  (38,524 counted keys). Resume D-19042 at ID 24951. Sequential IDs
  24951-65134 remain (40,184), along with earlier specific holds and the
  D-18422-D-18452 register backfill.
