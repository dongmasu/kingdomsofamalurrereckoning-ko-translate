# Consolidated Context Review: `default` IDs 27551-27600

- Review date: 2026-10-12.
- Scope: re-review the sixteen uncertain IDs in D-8736-D-8744.
- Result at D-19379: two IDs fully accepted, ten `not an issue`, and four
  specific uncertainties remained. ID 27586 had one accepted term
  correction and a separate House of Sorrows hold; D-19480 later resolved
  that hold using the direct faction definition and accepted Korean form.
- Compared English, Japanese source and draft, Chinese, active Korean, and
  historical decisions by `ID_Linha`. English controls meaning; Japanese
  informs voice/register; Chinese is supporting evidence.

## Decisions D-19375-D-19379

| Decision | Key | Disposition | Evidence |
| --- | --- | --- | --- |
| D-19375 | `default` 27593 | accepted | ID 64074 explicitly defines the Sorrows as a force of magical energy; ID 21656 calls the same concept `비탄의 힘`. Japanese at 27593 says Bisarane desires the Sorrows and its speakers' knowledge, while Chinese also treats them as an entity to seek. Change the unsupported House/faction reading to `비탄의 힘(Sorrows)`. |
| D-19376 | `default` 27597 | accepted | Reuse the accepted House of Valor form `용맹의 집(House of Valor)` from D-148/D-650 and later corrections, rather than `용맹의 가문`. |
| D-19377 | `default` 27586 | accepted, limited correction | Replace `발라드 가문` with the established `발라드의 집(House of Ballads)` form (D-18683, D-18892, D-19328). At that checkpoint the row remained uncertain for `House of Sorrows`; D-19480 later resolved the term. |
| D-19378 | `default` 27565, 27573-27575, 27578, 27581, 27588, 27594-27595, 27600 | not an issue | The Shoal title preserves its image; the Tower/fate-reading text preserves the card-reading function and uses the established `페이트위버`; the Mystic Hammer account and all 2/2/4 material bundles are retained. Shrine use, Cairn/Echostone instructions, the rooster fragment, the feelings observation, and Coriana Anwon's traceable name form contain no source-supported row-local defect. |
| D-19379 | `default` 27560, 27577, 27586, 27598 | uncertain at that checkpoint | The specific unresolved issues were whether capitalized `Dove` is a name or endearment; the scene-specific “scarred thoughts” image; the Korean `House of Sorrows` form at 27586; and whether `SpawnVol4` is player-facing or internal metadata. D-19480 later resolved only the 27586 term. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27586 | `발라드 가문` | `발라드의 집(House of Ballads)` | Reuse the accepted House of Ballads form; the separate House of Sorrows term was later resolved under D-19480. |
| 27593 | `비사레인(Bisarane)이 소로스 가문(House of Sorrows)을 원한다면` | `비사레인(Bisarane)이 비탄의 힘(Sorrows)을 원한다면` | English-led corpus context identifies the Sorrows here as the magical force, not the House/faction. |
| 27597 | `용맹의 가문(House of Valor)` | `용맹의 집(House of Valor)` | Reuse the established accepted House of Valor form. |

## Verification

- English, Japanese source, Japanese-derived draft, Chinese, and active Korean
  each contain the 50 IDs 27551-27600 in identical order. The preliminary
  scan's line-break and normalized runtime-marker checks were retained;
  `*2` and `{LINE_LEFT}` at 27586 are unchanged.
- Only active Korean `Texto` values at IDs 27586, 27593, and 27597 changed.
  Reversing the three exact substitutions reproduces the pre-edit backup
  byte-for-byte; all other parsed cells and row order are identical.
- UTF-8 BOM, 65,135 rows, 72,011 CRLF endings, and 73 pre-existing bare-LF
  endings are preserved.
- Pre-edit SHA-256:
  `322b1eda415b9168b885450832544c863be14e549c60ecfc90f2209d2e69eae3`.
- Post-edit SHA-256:
  `2d9e92876a48cebea2a6a719a6a916ec0faf806372fb2c7df3c6a04fb50a08b8`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-context-27551-27600-D19375/locatexts_zh_cn.koalocatext_default.csv`.
- Totals: 2,237 accepted / 24,750 `not an issue` / 11,537 uncertain
  (38,524). Resume D-19380 at ID 27601; sequentially unreviewed interval is
  27601-65134 (37,534 IDs). Specific uncertainties in the reviewed interval
  and the D-19162-D-19238 / D-18422-D-18452 register-detail gaps remain.
