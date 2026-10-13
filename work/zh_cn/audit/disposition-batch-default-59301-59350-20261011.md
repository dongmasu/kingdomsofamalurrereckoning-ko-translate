# Disposition Batch: `default` IDs 59301-59350

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- One accepted correction, 43 `not an issue` IDs, and six uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The active CSV was backed up byte-for-byte before editing.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17834 | 59310 | `+20% 방어 효율` | `+20% 막기 효율` | Reuse accepted decisions D-147 and D-1359: `Block Efficacy` is the blocking stat, not general defense efficacy. Preserve +20%. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17835 | 59307 | The named `Shroud of Omission` is rendered as `망각의 수의`; whether “omission” means forgetting, concealment, or another lore effect is unresolved. |
| D-17835 | 59314 | The stacked item name `Master Mitharan Energizing Rivets` is preserved, but the roles of `Master`, `Mitharan`, and `Energizing` are unclear across locales. |
| D-17835 | 59329 | `Craft Core` may be a UI label or a feature name; Korean `핵심 제작` does not settle its grammatical/category function. |
| D-17835 | 59333 | The doubt and lack of belief are preserved, but the antecedent of `him` is absent and should not be inferred. |
| D-17835 | 59334 | The `Maid of Windemere` title is rendered differently from related Korean usage at 59005; prior decisions leave the canonical title unresolved. |
| D-17835 | 59349 | The tentative wedding-planning question is retained; whether this is a proposal, shared plan, or ironic assumption depends on speaker context. |

## Not an Issue

Decision D-17836 records these 43 IDs: 59301-59306, 59308-59309,
59311-59313, 59315-59328, 59330-59332, 59335-59348, and 59350. At 59303,
the bag, family-event setting, and cheering action make `보가트 칩` readable
as a snack; no narrower food type is added. At 59332, `주 무기` is supported
by accepted UI terminology at D-484.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain all 50 target IDs in
  ascending order. Existing full-resource checks record 65,135 matching keys
  and order.
- Rechecked the source-keyed historical prompts for Boggart Chips,
  Shroud of Omission, Keen, Block Efficacy, Mitharan Energizing Rivets,
  Bristletongue/Understyle, the bride boast, Craft Core, Primary, the
  pronoun at 59333, Maid of Windemere, the memoir, and wedding context.
- The +20% value at 59310 remains unchanged. The Maid title mismatch is
  recorded as uncertain rather than locally normalized; the established
  `주 무기` rendering at 59332 is retained.
- Pre-edit CSV SHA-256:
  `28388ecc40ead328283e0d75b8224f5da6f8c3656131713ef4e4be64a94b6b5d`.
- Post-edit CSV SHA-256:
  `2e52cecf80077f8041fd80ac890053de10feee2cc37f33ddfd7d1b81d728e5ff`.
  Byte comparison against the backup confirms that only the approved 59310
  `Texto` cell changed. UTF-8 BOM, 65,135 records, key order, 72,045 CRLF
  endings, and 39 pre-existing bare-LF endings are preserved.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-59301/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `28388ecc40ead328283e0d75b8224f5da6f8c3656131713ef4e4be64a94b6b5d`).

D-17834 records one accepted correction, D-17835 records six uncertain IDs,
and D-17836 records the remaining 43 `not an issue` IDs. Direct register
totals: 1,726 accepted, 13,106 `not an issue`, and 11,294 uncertain
(26,126 total); next D-17837.

Resume at `default` ID 59351; 5,784 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
