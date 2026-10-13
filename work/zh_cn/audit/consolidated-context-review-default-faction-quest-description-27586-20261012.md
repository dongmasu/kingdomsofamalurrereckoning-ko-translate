# Consolidated Context Review: Faction Quest Description at ID 27586

- Date: 2026-10-12.
- Decision: D-19480.
- Scope: `default` ID 27586, resolving only the previously open
  `House of Sorrows` rendering.
- Compared English, Japanese source, preserved Japanese-derived Korean,
  Chinese, active Korean, and accepted House terminology by `ID_Linha`.

## Decision

| Decision | ID | Disposition | Rationale |
| --- | ---: | --- | --- |
| D-19480 | 27586 | accepted | The English list explicitly names `the House of Sorrows` as one of the game's factions; Japanese and Chinese corroborate that faction reading. English ID 39470 directly defines the House, and D-19451 establishes the Korean `비탄의 집(House of Sorrows)`. Replace only `소로스 가문` with that accepted name. |

The corrected Korean now reads:

`{*2세력 퀘스트}{LINE_LEFT}세력 퀘스트는 Kingdoms of Amalur: Re-Reckoning에 등장하는 세력과 관련된 임무입니다. 발라드의 집(House of Ballads), 비탄의 집(House of Sorrows), 아르카나 대학, 여행자들, 워스워른의 퀘스트가 여기에 포함됩니다.`

This resolves the remaining `House of Sorrows` hold at this ID. The prior
accepted `House of Ballads` correction and localized runtime-marker payload
are preserved.

## Verification

- Active default SHA-256 before edit:
  `f15516f83d38997de4411c3933b0fd826f2fc4851c66286eab0e5a8fad99a305`.
- Active default SHA-256 after edit:
  `95420271386aa20957ce75143c151dc76d3363331b57aef453886f5081e4409b`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-house-sorrows-faction-description-D19480/locatexts_zh_cn.koalocatext_default.csv`.
- Replacing the exact ID 27586 row in the backup with the verified new row
  reproduces the active CSV byte-for-byte; the reverse substitution restores
  the backup.
- UTF-8 BOM, 65,135 data rows, unique ascending IDs, 72,011 CRLF sequences,
  and 73 bare-LF sequences are preserved. `{*2...}` and `{LINE_LEFT}` remain
  in their original order.
- Totals after D-19480: **2,355 accepted / 25,139 not an issue / 11,030
  uncertain** (38,524). Resume at **D-19481** from the deduplicated
  unresolved-finding queue, not a contiguous ID scan.

These are working dispositions, not independent final linguistic approval.
