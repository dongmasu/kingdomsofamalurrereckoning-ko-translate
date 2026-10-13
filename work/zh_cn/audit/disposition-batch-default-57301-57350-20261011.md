# Disposition Batch: `default` IDs 57301-57350

- Date: 2026-10-11. Rechecked all 50 active Korean rows against English
  meaning, Japanese voice/register, Chinese supporting evidence, historical
  audit prompts, terminology, structure, runtime markers, and values. These
  are working dispositions, not independent final linguistic approval.
- Three accepted corrections, 38 `not an issue` IDs, and ten uncertain
  findings. One uncertain finding at ID 57347 concerns its separate proper
  name, while the House of Ballads term at that same ID is accepted.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 57307 | `이 언덕에서 본 것만 알고 있어. 페이는 야생의 종족이고 자연과 긴밀히 이어져 살아가지. 선교회에 있는 우리는 그 관계를 경이롭게 여겨.` | `이 언덕에서 본 것만 알고 있어. 페이는 야생의 종족이고 자연과의 친밀한 관계에서 영감을 얻지. 선교회에 있는 우리는 그 관계를 경이롭게 여겨.` | The English and Chinese say the Fae are inspired by their intimacy with the natural world. The prior Korean retained closeness to nature but omitted the inspiration relation. |
| 57339 | `내 선택이었다면 그 노인은 살려 줬을 거야. 하지만 용맹의 전당의 경기는 죽을 때까지 싸우는 거니까.` | `내 선택이었다면 그 노인은 살려 줬을 거야. 하지만 용맹의 집에서 벌어지는 경기는 죽을 때까지 싸우는 거니까.` | Reuse the previously accepted House of Valor form `용맹의 집` and retain the rule that Valor fights are to the death. |
| 57347 | `우리 둘이 새로운 계절을 열고, 나란히 발라드의 전당을 다스리는 거야. 윈더미어의 시녀는 이제 악역 연기를 끝냈어.` | `우리 둘이 새로운 계절을 열고, 나란히 발라드의 집을 다스리는 거야. 윈더미어의 시녀는 이제 악역 연기를 끝냈어.` | Reuse the accepted House of Ballads form `발라드의 집` (D-56286). The Maid of Windemere title remains separately uncertain. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17260 | 57306 | The unavailable fast-travel instruction is clear, but `Gallows End` has competing Korean renderings across the corpus; do not normalize this island name alone. |
| D-17262 | 57312 | The admonition not to falter in faith is preserved. English's `her` may refer to Mitharu, but Japanese and Chinese neutralize the pronoun; keep the gender/referent open. |
| D-17263 | 57323 | The political betrayal, confrontation with evidence, and report-back sequence are retained; Airancourt and Courdan spellings remain provisional. |
| D-17264 | 57328 | All three peoples, locations, and compass directions are preserved; canonical spellings for Dverga, Varani, and Ljosalfar need alignment. |
| D-17265 | 57332 | The three interests are retained, but English `brew` may mean brewing, ale, or alcohol more broadly. |
| D-17266 | 57337 | The pursuit, lair location, and need to meet Farrara are preserved; several names, titles, and `Oratory` remain unsettled. |
| D-17268 | 57341 | The isolated class label is translated semantically, but whether `Arcanist` is a formal class/title and its canonical Korean name are unresolved. |
| D-17269 | 57345 | Korean preserves the Prismere chapel/chantry sense, but the proper-material spelling and whether this refers to plural sites or a structure class require corpus/context review. |
| D-17271 | 57347 | `House of Ballads` now uses its accepted Korean form. The proper-title status and canonical rendering of `Maid of Windemere` remain open; no broader rewrite is authorized. |
| D-17272 | 57348 | The pools and their protective role are retained, but the Font's `yield` could be water, magical output, or another resource. |

## Not an Issue

The 38 IDs are 57301-57305, 57308-57311, 57313-57322, 57324-57327,
57329-57331, 57333-57336, 57338, 57340, 57342-57344, 57346, and 57349-57350.
They preserve evident meaning, register, structure, values, or source
ambiguity. This includes the Brownie quantity, all three dated journal
entries, the `{1}` speed marker, and the Fire Warding continuation fragment.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and active Korean each contain IDs 57301-57350
  once and in identical ascending order. Their full `default` key order
  matches across all 65,135 records.
- Line-break counts and normalized runtime-marker identities/order match.
  `{1}` at 57324 is preserved. The journal at 57331 retains both embedded
  line breaks in all locales.
- Values at 57316 (`3 Fish`), 57324 (`{1}`), and journal days 8, 16, and 81
  at 57331 are preserved; Chinese spells out the same day values. No
  numeric discrepancy was identified.
- Rechecked the source-keyed historical entries for IDs `57250-57349` and
  `57350-57449`. Prompts at 57303, 57306-57307, 57312, 57316, 57318,
  57323, 57326-57328, 57331-57332, 57337, 57339, 57345, and 57347-57348
  are resolved here as accepted, `not an issue`, or open uncertainty. ID
  57350's name-only prompt belongs to the next historical range and its
  locale forms were compared without finding a semantic issue.
- The preliminary report's active-CSV hash is a 2026-10-09 snapshot and
  predates the later dispositions. The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-57301/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `dfd47516558f6c69796ee462e09e914808fe8f5c3fb5e6bf5f559f968b39888b`).
  Post-edit active default SHA-256:
  `36ea4753de9b50fcd5459c76ad29ff0b7b0ca228acf43934b429fb3b22a34a4a`.
  Only the three accepted `Texto` cells changed. The UTF-8 BOM, 65,135
  records, key order, 72,045 CRLF endings, and 39 pre-existing bare-LF
  endings are preserved.

D-17260 through D-17272 record the ten uncertain findings and three accepted
corrections; D-17273 records the remaining 38 `not an issue` IDs. Direct
register totals: 1,691 accepted, 12,078 `not an issue`, and 10,707 uncertain
(24,476 total); next D-17274.

Resume at `default` ID 57351; 7,784 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-57351-57400-preliminary.md`](default-ids-57351-57400-preliminary.md).
These are working dispositions, not independent final linguistic approval.
