# Disposition Batch: `default` IDs 59401-59450

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- One accepted correction, 48 `not an issue` IDs, and one uncertain ID.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The active CSV was backed up byte-for-byte before editing.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17842 | 59421 | `광포수에게 광부 세 명을 벌써 잃었어.` | `바게스트(Barghest)에게 광부 세 명을 벌써 잃었어.` | English and Japanese name barghests; the Chinese descriptive translation is secondary. The active Korean corpus consistently uses `바게스트(Barghest)` for this creature, while `광포수` changes the name/category. Preserve the three miners lost. |

## Uncertain Finding

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17843 | 59429 | The quest progress and reward are retained, but `Maid` is a recurring unresolved title and `Chantry` may be a named location or a generic chapel. Do not normalize either term from this row alone. |

## Not an Issue

Decision D-17844 records these 48 IDs: 59401-59420, 59422-59428, and
59430-59450. At 59402, the blood-red ring stone and self-consuming serpent
image are retained; 59412 preserves the dry reversal of the favor offer;
59420 preserves the signed note and paragraph breaks while following the
intended Starfall Elixir meaning despite the English typo `Eilixir`; and
59450 distinguishes the Hyperian Complex from the Hyperian artifact in line
with English and the source-keyed historical note.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain all 50 target IDs in
  ascending order. The full resources contain 65,135 records with matching
  key order.
- Rechecked the source-keyed historical prompts for IDs 59450-59549 that
  apply to this batch, especially the Hyperian Complex/artifact distinction.
  The historical note's Japanese “dungeon” reading does not override the
  English `Complex`; Korean retains the distinction.
- Rechecked embedded line breaks, runtime markers, and numeric values; no
  mismatch was found in this batch. The accepted edit changes only `Texto`.
- Pre-edit CSV SHA-256:
  `56463e8babc814428ff5e17402d0e6d5c4e4d6f8c3f53ab8e9ba166405801e5f`.
- Post-edit CSV SHA-256:
  `d3073fb282cecf05b2e351b270b83272642cacc52dfb86057cfdda6e4d07a731`.
  Byte comparison against the backup confirms only ID 59421 changed.
  UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
  pre-existing bare-LF endings are preserved.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-59401/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `56463e8babc814428ff5e17402d0e6d5c4e4d6f8c3f53ab8e9ba166405801e5f`).

D-17842 records one accepted correction, D-17843 records one uncertain ID,
and D-17844 records the remaining 48 `not an issue` IDs. Direct register
totals: 1,730 accepted, 13,192 `not an issue`, and 11,304 uncertain
(26,226 total); next D-17845.

Resume at `default` ID 59451; 5,684 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
