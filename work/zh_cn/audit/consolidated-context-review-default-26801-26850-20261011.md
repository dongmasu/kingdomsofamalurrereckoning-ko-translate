# Consolidated Context Review: `default` IDs 26801-26850

- Review date: 2026-10-11.
- Scope: the 22 unique prior uncertainties in D-8626-D-8627 within IDs
  26801-26850. The overlapping ID 26815 is counted once.
- Result: one accepted correction and twenty-one `not an issue`; no new
  unresolved uncertainty remains in this range.
- English controls meaning; Japanese source and its Korean draft inform
  voice/register; Chinese is supporting evidence.

## Decisions D-19326-D-19327

| Decision | Key | Outcome | Evidence |
| --- | --- | --- | --- |
| D-19326 | `default` 26815 | accepted | English `Dverga pieces`, Japanese `切れ端` (fragments), and Chinese `碎片` all describe pieces/fragments without establishing relics. Korean `유물` over-specifies the inventory category; use the source-neutral `조각`. |
| D-19327 | `default` 26805-26806, 26808-26811, 26821-26824, 26828, 26830-26833, 26837-26838, 26846-26849 | not an issue | The Aster family, item, factions, people, lore, objectives, and labels remain source-traceable. The source typo `Clairty` at 26806 is preserved in the audit while Korean follows intended `Clarity`; name variants and capitalization do not prove local semantic errors. |

The separate non-uncertain disposition at 26812/26840-26841/26844 remains
unchanged. ID 26837's six embedded line breaks and numeric values remain
intact.

## Accepted Text Edit

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26815 | `...마지막 드베르가 유물은 섬 동쪽에 있을 것 같아.` | `...마지막 드베르가 조각들은 섬 동쪽에 있을 것 같아.` | Match all three source locales' nonspecific piece/fragment reading; do not assert these are relics. |

## Verification

- English, Japanese source, Chinese, Japanese-derived Korean draft, and
  active Korean each contain IDs 26801-26850 exactly once in ascending order.
- The active Korean `Texto` cell at 26815 is the only content change.
  Reversing the exact substitution reproduces the pre-edit backup byte-for-byte.
- UTF-8 BOM is retained. The file retains 72,011 CRLF and 73 pre-existing
  bare-LF endings.
- The preliminary scan checked embedded line breaks, runtime-token
  signatures, six breaks at 26837, and all combat values. This review
  independently confirmed 50 ordered IDs in each of the five files.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-26801-26850-D19326/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `26f103c961c0bf576e6f070f6fd043030abbbca3e92fa925797e62292f8181ef`.
- Post-edit SHA-256:
  `3c8eac63846bd2c7a765d5b39688cc32797eeba41f13994e05a604161c2652ca`.
- All 22 prior uncertainties in this range were resolved: one accepted and
  twenty-one `not an issue`. Totals: 2,212 accepted / 24,585 `not an issue` /
  11,727 uncertain (38,524). Resume at D-19328, ID 26851.
