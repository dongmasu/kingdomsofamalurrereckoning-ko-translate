# Warren, House of Ballads Poem, Court, and Splitrock Review (D-19569)

- Date: 2026-10-12.
- Scope: default IDs 115, 138, 158, 174, and the exact duplicate poem at
  ID 56581 (linked to D-17051).
- Evidence: English meaning anchor; Japanese voice/register; Chinese and
  German, Spanish, French, and Italian supporting checks. The official
  Korean manual was consulted for map and faction context. No PAK or
  PAK-derived material was used.

| ID | Decision | Evidence |
| ---: | --- | --- |
| 115 | not an issue | English names `The Warren`; linked English rows 3507, 13435, and 18589 identify it as a quarry/location. Japanese transliterates the name, while German, Spanish, French, Italian, and Chinese use varying common-noun readings. `워런(The Warren)` preserves the English place identity and traceability. |
| 138, 56581 | accepted | The same English poem appears at both IDs. English, German, Spanish, French, and Italian preserve `scepter of this house` as an appositive epithet; Japanese restructures it and Chinese misreads the implement. Korean `홀을 든 주인` adds an unsupported holder relation. Replace that phrase with `이 가문의 홀` in both exact duplicate rows, retaining all other wording and line breaks. |
| 158 | not an issue | English uses the institution `Court of Enchantments`; repeated English context identifies it as the House of Ballads' court and a body of Fae heroes. Korean `마법의 궁정` preserves both the court and magical association. Other Korean renderings elsewhere are inconsistent, but do not make this row's wording materially wrong; no global replacement is authorized here. |
| 174 | accepted | English `Splitrock Depths`, Japanese's cave reading, and linked English journal/exploration context identify the same underground location. The active Korean corpus already uses `스플릿록 심층부` at IDs 1921 and 23371. Align ID 174 from `심연` to that supported form. |

The official manual's PDF page 4 explains world/region maps; page 9 lists
House of Ballads among the game's factions. Neither page gives a canonical
Korean form for The Warren, the Court of Enchantments, or Splitrock Depths.
This broad context supports treating the latter terms as setting/location
labels; the exact row decisions rely on the source CSV context.

## Edits and Integrity

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 138, 56581 | `이 가문의 홀을 든 주인` | `이 가문의 홀` |
| 174 | `스플릿록 심연(Splitrock Depths)` | `스플릿록 심층부(Splitrock Depths)` |

- Pre-edit default SHA-256:
  `df61e072092d1dafc370ffd2397900f504c8a2cd8f2b9bd4b15abacd1791fbb3`.
- Byte-identical backup:
  `/private/tmp/ko-translate-backups/20261012/before-warren-poem-depths-D19569/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit default SHA-256:
  `6d6b31f9d1fae61826541a1d3176dad6f18a896b7b87ea44e4c7c05b364fe122`.
- Reversing the three exact `Texto` replacements reconstructs the backup
  byte-for-byte. The BOM, row order, 72,011 CRLF, and 73 bare-LF endings are
  preserved.
- Default totals: **2,464 accepted / 25,368 not an issue / 10,692
  uncertain** (38,524).
- Next register hold: D-051, default ID 176 (`Plagueshield`), grouped with
  its related occurrences.
