# Preliminary Language Scan: `default` IDs 42101-42150

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 42101-42150 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 42103 | Hospitalis Quarters / `병원 구역` | Confirm the formal facility name and standardize it with other Hospitalis Quarters occurrences. | Korean selects a generic hospital area; English capitalizes the facility name. Japanese/Chinese also vary between a care area and medical quarters. | Medium |
| 42105 | Burning Damage +140%; Mark of Flame +60% | Preserve both separate damage modifiers and confirm the named effect term. | Korean retains +140% Burning Damage and +60% Mark of Flame damage; all locale values agree. | High |
| 42111 | `Had death in his cards` / `그의 패에 죽음이 적혀 있었지` | Preserve the idiom that death was foretold/in his fate without making literal playing cards central unless context supports that image. | English marks the card phrase as an idiom (`if you will`); Korean keeps a literal card image, while Japanese resolves it as fate and Chinese spells out the card metaphor. | Medium |
| 42115 | Socketed Gems / `보석 장착` | Determine whether this is an inventory/menu category and settle a concise Korean UI label. | The isolated label can mean gems already socketed; Korean reads as an action/state label. Historical notes explicitly ask whether it is an interface label. | Medium |
| 42122 | St. Eadric's / `성 에이드릭 선교관` | Confirm the location type/name and retain the official saint spelling. | Korean identifies a mission building, while the English possessive is incomplete without context; Chinese calls it a mission/chapel. | Medium |
| 42128 | answer to the Hyperian / `히페리안의 답` | Clarify what part of or question about the Hyperian is meant by “the answer ... below our feet.” | Korean preserves the discovery metaphor but leaves the referent unspecified, as English does; the historical question log requests contextual identification. | Medium |
| 42130 | Akara “guides” / `아카라가 우릴 이끄는 한` | Preserve the quotation-mark skepticism and clarify which “he” is called a tyrant without assigning a new identity. | Korean retains the accusation and captive status while omitting the English quotation marks around `guides`; the antecedent/context remains open. | Medium |
| 42132 | Paragon Barghest / `최상급 바르게스트` | Confirm whether Paragon is a creature rank or a proper enemy name and standardize it. | Korean interprets it as a high-tier Barghest; the source-keyed history asks about the named creature. | Medium |
| 42136 | Cradle / `요람` | Determine whether Cradle is a proper location/name or the ordinary noun. | Korean translates it literally as a cradle; English capitalization suggests a named place, and historical notes leave this open. | Medium |
| 42139 | `If the two of you ever meet` / `그 둘이 만나더라도` | Ensure the “two” means the addressee and the woman, not two other people. | English addresses the listener and refers to a meeting with “her”; Korean's `그 둘` can sound like “those two,” making the participants less direct. | Medium |
| 42141 | `FAIL LINE 2` (unchanged) | Preserve the literal diagnostic label. | Korean retains the exact English diagnostic as directed by the historical audit. | Medium |
| 42147 | moderate Mana-pool increase / `마나 최대치를 보통 수준으로 증가` | Preserve an increase by a moderate amount, not an increase to a moderate final level. | English says the total Mana pool increases “by a moderate amount”; Korean can be read as raising it to an average level. | High |
| 42149 | Dverga fortress / Gravehal Keep / `드워가 요새`, `그레이브홀 킵` | Confirm the people/faction and fortress name; preserve the intended “more glorious than ever” comparison despite the source's missing `than`. | Korean retains the restoration and Gallows End triumph and resolves the apparent English grammar omission as “more than before.” | Medium |

IDs 42101-42102, 42104, 42106-42110, 42112-42114, 42116-42121,
42123-42127, 42129, 42131, 42133-42135, 42137-42138, 42140, 42142-42146,
42148, and 42150 generally retain the English meaning on this first reading.
Proper names, register, and recurring terminology remain subject to
integrated review.

## Historical Audit Reconciliation

- Source-keyed historical questions for IDs 42111-42149 were checked. They
  specifically flag the death-in-the-cards idiom, Socketed Gems, St. Eadric's
  site, Skycrown/Hyperian, Akara, Paragon Barghest, Cradle, `FAIL LINE 2`,
  prophetess, and Gravehal Keep.
- The archived progress log confirms `{*1[Weapon Attacks]}` at 42150,
  `{1}` at 42074, and the +140%/+60% effects at 42105. The active rows'
  values and marker structure were checked again.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 42101-42150 once
  and in identical ascending order.
- Embedded line-break counts and numeric values match across all four locales.
- ID 42150 retains one localized `{*1[...]}` marker with the same `*1` ID
  and order, followed by the charge-attack description.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 42101-42150 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 42151.
