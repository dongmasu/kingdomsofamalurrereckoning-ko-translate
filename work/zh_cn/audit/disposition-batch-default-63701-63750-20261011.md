# Disposition Batch: `default` IDs 63701-63750

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, values, and structure.
- One accepted targeted correction, 40 `not an issue` IDs, and nine uncertain
  IDs. These are working dispositions, not independent linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18084 | 63708 | `{*1\\\"징벌\\\"}과 {*1\\\"야만의 날개\\\"} 특수 공격으로 운명을 추가 획득한다.` | `{*1징벌}과 {*1야만의 날개} 특수 공격으로 운명을 추가 획득한다.` | Remove literal backslashes and quotes from the two runtime-marker payloads. English/Chinese omit them, and the same Korean ability labels already appear without quotes at ID 10890. Both `{*1...}` markers and their order are preserved. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18085 | 63703 | The English clause asking what the addressee did to make Gadflow send troops is malformed; Korean follows Japanese's likely reading, while Chinese differs. |
| D-18085 | 63704 | English/Chinese say cove or bay, Japanese says cave, and Korean uses `만`; confirm Rast and the location from quest context. |
| D-18085 | 63720 | The House of Valor narrative is retained; Hroth Magnus, Engard, and related setting forms need glossary alignment. |
| D-18085 | 63723 | The rightful-heir claim is retained; Dolve Arne may be a house, territory, or seat. |
| D-18085 | 63731 | The English “thrown violently from the owner” is awkward; Korean preserves the apparent discarded-pack scene without resolving who threw it. |
| D-18085 | 63737 | Korean follows Japanese in reading `him and his` as Harst and his followers; Chinese differs. `Rathiri` may also be a group label. |
| D-18085 | 63743 | Korean retains the waterfalls/river-walk image; whether it is literal leisure or ironic understatement depends on context. |
| D-18085 | 63748 | `Authority` may be a divine title, an official, or generic authority; the source does not settle the referent. |
| D-18085 | 63749 | Korean retains generic `our order`; Japanese identifies the Travelers, while English alone does not establish the referent. |

## Not an Issue

Decision D-18086 records these 40 IDs: 63701-63702, 63705-63707,
63709-63719, 63721-63722, 63724-63730, 63732-63736, 63738-63742,
63744-63747, and 63750. They preserve available meaning, voice, labels,
values, and structure. Korean follows English/Chinese's `Cycle, the First`
at 63715 rather than Japanese's conflicting title, and follows the English
Whenery/Setter staging at 63750.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 63701-63750 once,
  in identical ascending order.
- Embedded newline counts match for every row. Both `{*1...}` markers at
  63708 retain their identity and order; only the Korean payload's literal
  backslash/quote characters were removed. No numeric-value differences
  occur in the range.
- Rechecked historical questions for Gadflow's troops, Rast/cove,
  localized attack labels, the Latin heading, Alfar cycle title, House of
  Valor chronicle, Dolve Arne, Ratofer's duplicated verb, the merchant's
  pack, Captain role, Mad Harst/Rathiri, Ysa-pass phrase, Authority, and
  “our order.”
- Pre-edit CSV SHA-256:
  `44aafb7ee493c258c27eb308d6a4ffabcc53db9b770dc1fc22da86bcd20b5929`.
  Post-edit CSV SHA-256:
  `ff85c0bde3c2e577f690e25742121272b3aaa871fc13d8c8b21a44b62a5641da`.
  Byte-level verification against the batch-start backup confirmed that only
  the `Texto` field at ID 63708 changed. The UTF-8 BOM, row/key order,
  embedded lineation, marker identities/order, and outer CRLF record
  separators are preserved. Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-63701/locatexts_zh_cn.koalocatext_default.csv`.
- D-18084 records one accepted correction, D-18085 records nine uncertain
  findings, and D-18086 records 40 `not an issue` IDs. Totals at D-18086:
  1,819 accepted, 16,224 `not an issue`, and 12,512 uncertain (30,555
  dispositions); next D-18087.

Resume at `default` ID 63751; 1,384 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
