# Disposition Batch: `default` IDs 57351-57400

- Date: 2026-10-11. Rechecked all 50 active Korean rows against English
  meaning, Japanese voice/register, Chinese supporting evidence, historical
  audit prompts, terminology, structure, runtime markers, and values. These
  are working dispositions, not independent final linguistic approval.
- Three accepted corrections, 36 `not an issue` IDs, and 11 uncertain
  findings.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 57356 | `이 대상에 새로 합류했나? 내 충고를 듣게. 항상 한쪽 눈은 뜨고 있어. 이 오합지졸은 아무도 믿지 마.` | `이 상단에 새로 합류했나? 내 충고를 듣게. 항상 경계를 늦추지 마. 이 오합지졸은 아무도 믿지 마.` | Translate `caravan` as a merchant group (`상단`), not the ambiguous `대상`, and render `keep one eye peeled` as the supported vigilance idiom rather than a literal eye instruction. |
| 57368 | `모두 잘 들어라! 이미 들었겠지만, 발라드의 전당에 드문 자리가 하나 비었다!` | `모두 잘 들어라! 이미 들었겠지만, 발라드의 집에 드문 공석이 생겼다!` | Reuse the accepted House of Ballads term `발라드의 집` and make the announced vacancy read as an open position rather than a physical seat. |
| 57396 | `물약 이름은 기억나지 않아요. 놀랍지도 않죠. 제 이름조차 기억하지 못하니까요. 그게 erron… erroni… 거짓말쟁이가 치르는 대가예요.` | `물약 이름은 기억나지 않아요. 놀랍지도 않죠. 제 이름조차 기억하지 못하니까요. 거짓... 거짓말쟁이가 치르는 대가예요.` | Localize the English false start so the hesitation and self-correction to “liar” remain in Korean, as in the Japanese and Chinese references. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17274 | 57351 | Canneroc's danger and the request to investigate Castle Yolvan are preserved; both proper-name forms remain provisional. |
| D-17275 | 57355 | Archiving and safekeeping are retained; the scholar Ivan Hugues' canonical Korean spelling needs terminology alignment. |
| D-17277 | 57365 | The source begins as a fragment and Korean preserves that fragment; the established term for `Finesse Abilities` is unresolved. |
| D-17278 | 57367 | Reflection and amplification are retained, but English/Chinese say “rings” while Japanese identifies a chakram; the object category is unresolved. |
| D-17280 | 57370 | The route and hope of finding the woman alive are clear, but `Virki`'s status/name and the group's origin wording need context. |
| D-17281 | 57372 | The three tasks and Lyria's blessing are preserved, but the capitalized Orison task names may be formal rites and are translated as ordinary descriptions. |
| D-17282 | 57375 | Both Wells and the salvage condition are retained; the awkward source clause does not fully clarify the sequence of project completion and renewed need. |
| D-17283 | 57382 | Korean compresses `the oppressor, he who was cast down` into `몰락한 압제자`; whether the appositive carries a separate epithet is unresolved. |
| D-17284 | 57388 | The restriction and condition are preserved, but “the high court” may be a named institution or a generic royal court. |
| D-17285 | 57391 | The reunion and three-year interval are correct; `star-crossed lovers` may mean ill-fated lovers rather than simply separated/mismatched lovers. |
| D-17287 | 57400 | Killing the root golem to restore beach access is clear; “open up the beach” may be an objective/access label, so retain it pending game-context review. |

## Not an Issue

The 36 IDs are 57352-57354, 57357-57364, 57366, 57369, 57371,
57373-57374, 57376-57381, 57383-57387, 57389-57390, 57392-57395,
57397-57399. They preserve evident meaning, register, values, or source
ambiguity. This includes the five-/ten-year timeline, Alabastra's smaller
groups, the Chaos Sight tutorial markers, and the three-year reunion interval.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and active Korean each contain IDs 57351-57400
  once and in identical ascending order. Their full `default` key order
  matches across all 65,135 records.
- Line-break counts and runtime-marker identities/order match. ID 57380
  retains two line breaks and the ordered `{*1...}`, `{*1...}`,
  `{LINE_SPACE}`, `{1}` markers; localized marker labels are not treated as
  structural differences.
- Numeric values at 57353 (10 years), 57372 (three tasks), and 57391
  (three years) are preserved. Repeated `1` values at 57380 are runtime
  markers/placeholders, not additional quantities.
- Rechecked the source-keyed historical entry for IDs `57350-57449`.
  Prompts at 57351, 57353, 57355-57368, 57370-57372, 57375, 57380,
  57382-57384, 57388, 57390-57391, 57396-57397, and 57399-57400 are
  resolved here as accepted, `not an issue`, or open uncertainty. ID 57350
  was counted in the previous batch and is not counted again.
- The preliminary report's active-CSV hash is a 2026-10-09 snapshot and
  predates the later dispositions. The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-57351/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `36ea4753de9b50fcd5459c76ad29ff0b7b0ca228acf43934b429fb3b22a34a4a`).
  Post-edit active default SHA-256:
  `c9e190f6d25a07ad6cc935f83387f99ab85ed7ca74fbdd827bae35bd3f950d2e`.
  Only the three accepted `Texto` cells changed. The UTF-8 BOM, 65,135
  records, key order, 72,045 CRLF endings, and 39 pre-existing bare-LF
  endings are preserved.

D-17274 through D-17287 record the 11 uncertain findings and three accepted
corrections; D-17288 records the remaining 36 `not an issue` IDs. Direct
register totals: 1,694 accepted, 12,079 `not an issue`, and 10,718 uncertain
(24,491 total); next D-17289.

Resume at `default` ID 57401; 7,734 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-57401-57450-preliminary.md`](default-ids-57401-57450-preliminary.md).
These are working dispositions, not independent final linguistic approval.
