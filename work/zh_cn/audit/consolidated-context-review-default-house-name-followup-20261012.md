# Consolidated Context Review: House Names and Membership

- Date: 2026-10-12.
- Decision: D-19487.
- Scope: previously uncertain `default` IDs 9673, 14514, 37088,
  and 58331.
- Each ID was checked across English, Japanese original, Japanese-derived
  Korean draft, Chinese original, and active Korean. D-19451 and D-19437
  provide the established House of Sorrows and House of Ballads names.

| ID | Result | English-led comparison |
| ---: | --- | --- |
| 9673 | not an issue; close D-2745 | English `Fae of my House` and Japanese's explicit House of Sorrows support the existing `우리 비탄의 집 페이들`. Chinese abbreviates the relation. The death/troubles contrast and speaker's claim are retained. |
| 14514 | not an issue; close D-4382 | English explicitly says the last member of the House of Sorrows must witness the end of one of the oldest Faelands institutions. Korean retains membership, forced witnessing, and the established House/institution names. |
| 37088 | accepted; close D-12000 | English and Japanese explicitly name the House of Ballads. Replace only `발라드의 전당으로` with `발라드의 집(House of Ballads)으로`; Korean already preserves the leadership succession, intimate address, and “our time.” Chinese confirms the group. |
| 58331 | not an issue; close D-17617 | Korean already uses the established `발라드의 집` and retains heroic legends preserved in song, the centuries-old establishment, and the House's renown. No parenthetical is needed in this running dialogue. |

These are four distinct counted keys, none of which was reclassified in the
earlier D-19437/D-19451 groups. No inference about a generic `House` or
an isolated `Sorrows` is made.

## Verification

- Only the `Texto` phrase on ID 37088 changed. It has no embedded newline
  or runtime marker. `apply-house-name-D19487.py` asserts the byte-identical
  backup, original SHA, unique source ID, and exact old phrase.
- Pre-edit SHA-256:
  `b91de2555b9bf7afc7a076bc8465a0fd2d42b1247fed066e3c100abdfd8f3642`.
- Post-edit SHA-256:
  `ba22ef09faa03f98a7c511a1f57d7dea4f900c38bd1d342b89a82535e54c09fe`.
- Byte-identical backup:
  `/private/tmp/ko-translate-backups/20261012/before-house-name-followup-D19487/locatexts_zh_cn.koalocatext_default.csv`.
- BOM, 72,011 CRLF, 73 existing bare-LF endings and all other bytes remain
  unchanged. Totals: **2,367 accepted / 25,147 not an issue /
  11,010 uncertain** (38,524). Resume at **D-19488** from grouped
  unresolved findings.

Working dispositions, not final independent linguistic approval.
