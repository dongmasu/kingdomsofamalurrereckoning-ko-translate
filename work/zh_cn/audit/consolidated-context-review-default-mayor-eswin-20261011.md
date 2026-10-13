# Consolidated Context Review: Mayor Eswin

- Date: 2026-10-11.
- Scope: previously uncertain standalone labels at `default` IDs 20355 and
  24709.
- Method: compare English, Japanese, Chinese, Japanese-derived Korean,
  active Korean, and prior accepted usages by ID.
- Result: D-18243 reclassifies two existing uncertain keys as
  `not an issue`. No CSV cells changed.

## D-18243: Standalone Mayor-and-Name Labels

| ID | English | Japanese | Chinese | Active Korean |
| ---: | --- | --- | --- | --- |
| 20355 | `Mayor Eswin` | `エズウィン市長` | `艾斯文镇长` | `에스윈 시장` |
| 24709 | `Mayor Eswin` | `エズウィン市長` | `艾斯文镇长` | `에스윈 시장` |

Both rows are standalone labels identifying the same mayor. The English
name, Japanese phonetic form, and Chinese rendering support `에스윈`; all
locales include the mayor role, and Korean's `에스윈 시장` preserves the
title/name relation.

Accepted D-12956 uses `에스윈 시장` for the `Speak to Mayor Eswin` objective,
D-13755 retains it in a full dialogue line, and D-16073 confirms its word
order and possessive relation. Reclassify IDs 20355 and 24709 as
`not an issue`, with no edits. The separate full-name spelling question at
ID 57930 (`Mayor Eswin Ealfhelm`) is not resolved by these labels.

## Integrity and Checkpoint

- No `Texto` cell changed; active default SHA-256 remains
  `d2812e4d72b9d5ae24615f80475c73051fe28b4d96823dae218db4c9c4ee460a`.
- No backup was required because the active CSV was not edited.
- D-18243 reclassifies two existing uncertain keys without recounting other
  `Mayor Eswin` rows.
- Cross-resource totals through D-18243: 1,920 accepted, 23,080
  `not an issue`, and 13,522 uncertain (38,522 total); next D-18244.
- These are working dispositions, not independent final linguistic
  approval. The canonical full personal name remains open separately.
