# Disposition Batch: `default` IDs 57001-57050

- Date: 2026-10-11. Rechecked all 50 active Korean rows against the English
  meaning, Japanese voice/register, Chinese supporting evidence, historical
  audit prompts, recurring terms, structure, runtime markers, and values.
  These are working dispositions, not independent final linguistic approval.
- Two accepted corrections, 41 `not an issue` IDs, and seven uncertain
  findings.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 57032 | `아데사에서 내 경호원으로 일하던 브루튼을 추궁했다. 그를 내 감시 임무에 배정한 노움 템플러 조리엘은 실제로 그를 고용한 적이 없다는 사실을 알아냈기 때문이다. 알고 보니 브루튼은 나를 암살하려고 내 집에 잠입한 자였다.` | `아데사에서 내 경호원인 줄 알았던 브루튼을 추궁했다. 내 감시를 꾸민 노움 템플러 조리엘이 그를 임명한 적이 없다는 사실을 알게 됐기 때문이다. 알고 보니 브루튼은 나를 암살하려고 내 집에 잠입한 자였다.` | English says Bruten had never been appointed by Jorielle, who orchestrated the speaker's observation; Japanese also says he was not hired by her. The old Korean said Jorielle assigned him to surveillance and then had not hired him, creating an agency contradiction. |
| 57043 | `나… 나는… 아버지 에타이어 신부님… 내가 무슨 짓을 한 거지? 누구도 해칠 생각은 없었어. 특히 신부님은!` | `나… 나는… 에타이어 신부님… 내가 무슨 짓을 한 거지? 누구도 해칠 생각은 없었어. 특히 신부님을 해칠 생각은 없었어!` | English `Father Etair` is the clerical address, not a biological father plus `신부님`; Japanese confirms the priest reading. Remove the redundant double title and complete the panicked “especially not the father” fragment naturally. |

## Uncertain Findings

| ID | Decision | Rationale |
| ---: | --- | --- |
| 57003 | Uncertain | `{1}` is preserved once and in place, but English/Chinese say `Services` while Japanese reads it as a ritual; dynamic UI context is unavailable. |
| 57013 | Uncertain | All six poem lines and the Ysa/Ohn contrast are retained, but firstborn/fleshones, Fate Talisman, Tuatha Deohn, and Withering terminology need lore alignment. |
| 57025 | Uncertain | Korean retains the unusual “justly and with blood” wording; its intended relationship to House of Valor's leadership and mission needs context. |
| 57026 | Uncertain | The key-recovery objective is intact, but Zungars/Darkvaris may be groups or families and their canonical Korean forms remain open. |
| 57027 | Uncertain | The war-front joke is preserved, but English's capitalized `Siegebreaker` may be a formal epithet; Japanese and Chinese interpret the title differently. |
| 57028 | Uncertain | Korean's boastful reading of `trumped up` is plausible, but the English idiom can imply inflated status or fraud; Chinese and Japanese diverge. |
| 57045 | Uncertain | Korean `처형인` is a plausible generic rendering of `Headsman`, but capitalization and recurring audit decisions leave formal-title versus generic-role status unresolved. |

## Not an Issue

The 41 IDs are 57001-57002, 57004-57012, 57014-57024, 57029-57031,
57033-57042, 57044, and 57046-57050. They preserve evident meaning,
register, or source ambiguity without adding unsupported facts. The empty
row at 57047 remains empty.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and active Korean each contain IDs
  57001-57050 once in identical ascending order. Each default file has
  65,135 records and identical full key order.
- The poem at 57013 retains six lines in every locale. `{1}` at 57003 is
  retained once and in the same position; 57047 is empty in all locales.
- Historical prompts in `56950-57049` were checked, including the
  service/cadaver labels, Ohn poem, Varani prisoner, House of Valor,
  Zungars/Darkvaris, Siegebreaker, Gadflow, Bruten/Jorielle, beast pen,
  death worshippers, Warsworn commendation, Father Etair, and Headsman.
  These prompts informed the dispositions but do not independently confirm
  them. ID 57050 starts the next historical range and is included here once.
- Only the approved `Texto` cells at 57032 and 57043 changed. The active CSV
  retains its UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and
  39 pre-existing bare-LF endings. Post-edit SHA-256:
  `ad156bc1d92e5249d20c628cfda8bd8b175d4a1cee1e3acc07ce327bd62f6506`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-57001/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `04135fa3e17fc9bf24eb3ca1938fd6de0b9c462ef524f69883aa1e000fdec1c5`).

D-17180 and D-17181 record the accepted corrections; D-17182 through
D-17188 record the seven uncertain findings; D-17189 records the remaining
41 `not an issue` IDs. Direct register totals: 1,677 accepted, 12,000
`not an issue`, and 10,642 uncertain (24,319 total); next D-17190.

Resume at `default` ID 57051; 8,084 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-57051-57100-preliminary.md`](default-ids-57051-57100-preliminary.md).
These are working dispositions, not independent final linguistic approval.
