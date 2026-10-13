# Consolidated Context Review: House of Sorrows Mission at ID 27152

- Date: 2026-10-12.
- Decision: D-19481.
- Scope: `default` ID 27152; resolve only the House of Sorrows terminology
  hold from D-19351.
- Compared English, Japanese source and preserved draft, Chinese, active
  Korean, and accepted House terminology by `ID_Linha`.

## Decision

| Decision | ID | Disposition | Rationale |
| --- | ---: | --- | --- |
| D-19481 | 27152 | accepted | English and Japanese identify the audience chamber as belonging to the House of Sorrows and say the first mission is to save that same House from Tuatha attacks; Chinese corroborates the faction reading. Reuse the established `비탄의 집(House of Sorrows)` at both references, replacing the unsupported phonetic name and generic `가문`. |

Applied Korean:

`비사레인(Bisarane)이 비탄의 집(House of Sorrows)의 접견실에서 만나자고 했다. 그곳에서 투아사의 공격으로부터 비탄의 집을 지키기 위한 첫 임무를 논의할 예정이다.`

The decision concerns only the faction name. The audience-chamber relation,
first-mission sequence, and defense against the Tuatha are retained.

## Verification

- Active default SHA-256 before edit:
  `95420271386aa20957ce75143c151dc76d3363331b57aef453886f5081e4409b`.
- Active default SHA-256 after edit:
  `11793c84b5d2ca2983b7bd0f9abf5f4b5a490b75e988f3095eec4cba655f4ce8`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-house-sorrows-mission-27152-D19481/locatexts_zh_cn.koalocatext_default.csv`.
- Replacing only the exact ID 27152 row in the backup reproduces the active
  CSV byte-for-byte; reversing the substitution restores the backup.
- UTF-8 BOM, 65,135 data rows, unique ascending IDs, 72,011 CRLF sequences,
  and 73 bare-LF sequences are preserved. No runtime marker or embedded line
  break occurs in this row.
- Totals after D-19481: **2,356 accepted / 25,139 not an issue / 11,029
  uncertain** (38,524). Resume at **D-19482** from the deduplicated
  unresolved-finding queue, not a contiguous ID scan.

These are working dispositions, not independent final linguistic approval.
