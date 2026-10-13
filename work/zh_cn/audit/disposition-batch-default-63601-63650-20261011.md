# Disposition Batch: `default` IDs 63601-63650

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, values, and structure.
- One accepted targeted correction, 37 `not an issue` IDs, and 12 uncertain
  IDs. These are working dispositions, not independent linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18079 | 63603 | `다시 말해, 대사제는 특정한 누구여서는 안 돼.` | `다시 말해, 대사제는 특정한 인물이어선 안 돼.` | English says the Hierophant must be no one; Japanese confirms that it must not be an identifiable particular person. The new Korean is natural and explicit without adopting Chinese's different “beyond anyone's reach” reading. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18080 | 63601 | `Altar of Doubt` and the objective are retained; confirm the canonical altar name and UI verb. |
| D-18080 | 63613 | The barrier potion's function is retained; Cann-Rane spelling and the potion's exclusive use need terminology/context review. |
| D-18080 | 63618 | Korean preserves the lonely-drink personification; `pint` may refer to a serving or container rather than beer generally. |
| D-18080 | 63620 | Both Pools and locations are retained; capitalization may indicate named pools and the Court/Sanctuary forms need alignment. |
| D-18080 | 63622 | `Century Plants` is retained phonetically; confirm the established plant/species or UI term. |
| D-18080 | 63627 | Korean follows the territorial reading of English `require region`, also reflected in Japanese and Chinese; the source phrasing and argument need context. |
| D-18080 | 63631 | The Delvers, Midden, and Weeping King traditions are retained; `brethren` may identify a formal group, not generic cave-exploring companions. |
| D-18080 | 63633 | The employer, Harst, Customs House, password, and Gwyn sequence are retained; Pledgeshield Fenan's status and inside/below location need context. |
| D-18080 | 63635 | `knight-hand` is rendered as a knightly companion; whether it is a formal role, squire, or poetic relationship is unresolved. |
| D-18080 | 63646 | The warding and enduring Cairns are retained; their exact physical/lore identity is unknown. |
| D-18080 | 63649 | Fynn's expected search and contact are retained; confirm the General's canonical Korean spelling. |
| D-18080 | 63650 | The Lykeios definition is retained; the institution/place and Kollossae name forms need glossary alignment. |

## Not an Issue

Decision D-18081 records these 37 IDs: 63602, 63604-63612, 63614-63617,
63619, 63621, 63623-63626, 63628-63630, 63632, 63634, 63636-63645, and
63647-63648. English and Japanese confirm that `pens` at 63606 means animal
enclosures; the Chinese wording is not imported. The two `{LINE_SPACE}`
markers and the established `장물아비` sense of `fence` are preserved at
63638.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 63601-63650 once,
  in identical ascending order.
- Embedded newline counts match for every row. ID 63638 preserves two
  `{LINE_SPACE}` markers in the same order in every locale. No other runtime
  markers occur in the batch.
- Rechecked historical questions for Hierophant anonymity, animal pens,
  Travelers' investment, Ysa ambassador, Pools, Century Plants, war/region,
  Delvers/Midden, the Fenan-Harst journal, knight-hand, fence, Cairns, and
  Fynn's Alfar camp.
- Pre-edit CSV SHA-256:
  `9379f24bcb2691d7916d93732286ad2f063a824cce050378fb65704220517ae1`.
  Post-edit CSV SHA-256:
  `44aafb7ee493c258c27eb308d6a4ffabcc53db9b770dc1fc22da86bcd20b5929`.
  Byte-level verification against the batch-start backup confirmed that only
  the `Texto` field at ID 63603 changed. The UTF-8 BOM, row/key order,
  embedded lineation, markers, and outer CRLF record separators are
  preserved. Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-63601/locatexts_zh_cn.koalocatext_default.csv`.
- D-18079 records one accepted correction, D-18080 records 12 uncertain
  findings, and D-18081 records 37 `not an issue` IDs. Totals at D-18081:
  1,818 accepted, 16,146 `not an issue`, and 12,491 uncertain (30,455
  dispositions); next D-18082.

Resume at `default` ID 63651; 1,484 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
