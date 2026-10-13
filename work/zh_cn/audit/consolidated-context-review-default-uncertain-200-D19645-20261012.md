# Consolidated Context Review: Uncertain Batch D-19645

- Scope: the 200 source-keyed entries in
  `uncertain-200-D2320-D2663-20261012.jsonl`, checked against the active
  four-locale CSV cells. Five (8342, 8610, 8663, 8780, 8822) were already
  closed and were not recounted.
- New dispositions: 37 accepted, 157 `not an issue`, one still uncertain
  (ID 8500). This closes 194 of 195 newly examined holds. The open key
  remains on a targeted evidence list, not in the sequential review queue.
- English governs meaning; Japanese informs voice and Chinese supports
  context. The official Korean manual extraction and source PDF (especially
  PDF pp. 1 and 7) establish the fate tapestry and the faction names
  `하우스 오브 소로우`, `스콜리아 아르카나`, and `트래블러`. The manual's
  named-faction form is why the existing `하우스 오브 소로우` in IDs 8567
  and 8749 was **not** replaced with a newly coined equivalent. No PAK
  material was used.

## Accepted Corrections

| IDs | Source/context and result |
| --- | --- |
| 8332, 8451, 8560 | Normalize Kollossae to the existing `콜로사이` spelling; retain the long rat narrative, litany, and wordplay meanings. |
| 8404, 8466, 8525, 8706, 8887, 9459 | Use the manual's `트래블러` for the faction rather than generic travelers or `트래블러스`; also align the Hierophant and Praetorians where applicable. |
| 8433, 9459 | Name the Praetorian guard consistently without losing the Decanus rank or the arrest action. |
| 8503 | English `We adore him` describes the speakers' devotion, not an inherent property of the man; restore `우리는 그분의 어떤 모습이든 사랑하지만`. |
| 8582, 8585, 8817 | Correct the Marches setting and reuse the established Hierophant office `대사제`. |
| 8601, 9035, 9330 | Preserve the Sceptre-only damage qualifiers, official `[패시브]`, and the mana meaning of gameplay `power` (compare source ID 1893 and the manual's mana explanation). |
| 8637, 8969, 9273 | Reuse the established `부름받은 자` for Beckoned, including Ethene's summons. |
| 8690, 8711, 9374 | Identify the already named Maid of Windemere, the Widow (compare ID 9371), and the Eldest, without changing their actions. |
| 8752 | Restore the English `If ... had not` conditional and the negative `her house not flourished`; retain the spring image. |
| 8845, 8984, 8997 | Restore the manual's official `스콜리아 아르카나` faction name. |
| 8866, 9459 | Contextual English uses `Missives` for the source-established `세이블의 서신` (D-18257 and IDs 4084, 8283, 11244); make the referent explicit. |
| 8920, 8926 | Reuse the approved formal Oathblade and Savant rank/name (`맹세의 칼날`, `사반트 엥가르`). |
| 8954, 9071, 9379 | Capitalized `Telling` and Japanese `伝承` indicate the Fae tradition `전승`, not generic stories; preserve ordinary `story` separately. |
| 9107, 9336 | Distinguish the House of Vengeance from a physical hall and the sealed Sorrows force from the House. |
| 9385, 9432 | Familiar lowercase `dove` is `친구`, not a gendered address; `Hollowlands` names the established region. |

Exact approved edits, including ID 9330 and the conditional at 8752, are
enumerated with original and replacement bytes in `apply-uncertain-200-D19645.rb`.
Other accepted IDs: 8582, 8585, 8637, 8690, 8711, 8817, 9107, 9336.

## Retained and Open

The 157 newly closed `not an issue` IDs are precisely the snapshot's IDs
minus the 37 approved IDs, the five earlier closures, and ID 8500. This
includes ID 8463 (a prison Warden can be `교도관`), 8567 and 8749 (manual
form of House of Sorrows), 8848 (`직조` remains faithful without imposing
the manual's longer introductory metaphor), 8852 (`fathers and mothers`
remains `부모`), and 9030/9365 (`탐굴자` remains a defensible Delver
rendering without an official alternative). No generic normalization was
made on those rows.

**Targeted open key D-2386 / ID 8500:** English `Mitharan Prismere Plumb`,
Japanese phonetic `プラム`, Chinese `赤晶锤子`, Korean `미타란 프리즈미어
배관`. `Plumb` may be a weighted tool or an item name, whereas Chinese
says hammer; neither the manual nor the located English CSV occurrence
establishes the specific item type. `배관` is suspect, but replacing it
with `추` would assert an unverified type. Do not silently count this as
`not an issue`; resolve with a primary item/category source if available.

## Integrity

- Pre-edit SHA-256: `9d866affc9eb41e46e520b5ce4ca0298ed1257e07e189b4603badf7aaf09fb05`.
- Byte-identical backup:
  `/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19645/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit SHA-256: `2ee10c3cddf17eec601215eeaba0a6862983bbf66ddbf5f194803ac3e76ca5d6`.
- Exact inverse reconstruction, BOM, all 72,011 CRLF and 73 bare LF
  endings, row order, all unapproved physical bytes, and targeted parsed
  CSV records (only approved `Texto` fields changed) verified. A malformed
  unquoted multiline record after this batch's IDs prevents use of
  whole-file strict CSV parsing; byte-level verification covers the file.
- Totals: **2,676 accepted / 26,557 not an issue / 9,291 uncertain**
  (38,524). Separate Chinese-only provisional affix holds: **55**.
  Default and affix review remain incomplete.
- Next sequential decision: **D-2664 / default ID 9480**. Prepared
  200-key multilingual snapshot:
  `uncertain-200-D2664-D3004-20261012.jsonl`. Revisit targeted open
  **D-2386 / ID 8500** separately; do not recount it.
