# Consolidated Context Review: `default` IDs 27401-27450

- Review date: 2026-10-12.
- Scope: Re-review previous uncertainty keys at 27404, 27411, 27416-27417,
  27421, 27425, 27430, 27434, 27441-27442, 27446, 27448, and 27450.
- English controls meaning; Japanese informs voice/register; Chinese is
  supporting evidence.

## Decisions D-19362-D-19364

| Decision | Key | Disposition | Evidence |
| --- | --- | --- | --- |
| D-19362 | `default` 27404 | accepted | English says the Hirelings died to a foe; it does not say they were fighting at the moment of death. Remove the unsupported `적과 싸우다`, retain the clipped ellipses and oath meaning. |
| D-19363 | `default` 27411, 27416-27417, 27425, 27430, 27434, 27441-27442, 27446, 27448, 27450 | not an issue | The translations remain source-traceable. The official-looking but hastily scribbled document is preserved as ambiguous; the bodies and furnace-room referents are supported by neighboring/source strings; and the apparent tension at 27448 is retained rather than repaired. Praetorians, Interest, Maid, chapterhouse, Blades and Seal, Sister Zelda, and Hierophant are plausible row-level renderings; global terms remain glossary work. |
| D-19364 | `default` 27421 | uncertain | English plural `Risbergs` may mean the Risberg family, while Japanese explicitly says a married couple and Chinese gives only the surname. Korean `부부` may over-specify the relationship; preserve pending quest context. |

## Accepted Text Edit

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27404 | `그들은 맹세를 지키며… 적과 싸우다… 죽었다…` | `그들은 맹세를 지킨 채… 적에게… 죽었다…` | Remove the unsupported claim that they died while fighting; retain the source fragment and ellipses. |

## Verification

- Existing four-locale key/order, value, line-break, and runtime-marker checks
  remain valid. The `+25`/`+40%` values at 27429 and the Adessa price
  variable at 27361 are outside this edit and remain unchanged.
- Only the authorized Korean `Texto` cell at ID 27404 changed. Reversing the
  exact substitution reproduces the pre-edit file byte-for-byte.
- UTF-8 BOM, 72,011 CRLF endings, and 73 bare-LF endings remain.
- Pre-edit SHA-256:
  `499513202eedc841d94943b8e1e0710c2ff94e3da7073722aa65a7b1ec384e60`.
- Post-edit SHA-256:
  `378a7da73dc8ed13930d1d5d99f754068d9c968179b25d271a00250116a72fb5`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-context-27401-27450-D19362/locatexts_zh_cn.koalocatext_default.csv`.
- Totals: 2,228 accepted / 24,717 `not an issue` / 11,579 uncertain
  (38,524). Resume at D-19365, ID 27451.
