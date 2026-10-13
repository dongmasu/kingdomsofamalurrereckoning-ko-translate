# Consolidated Context Review: House of Valor Short Lines

- Date: 2026-10-12; decision D-19489.
- Compared `default` IDs 280, 4157, 6156, 7878, 22824, and 23574 by
  ID in English, Japanese source, Japanese-derived Korean draft, Chinese,
  and active Korean. D-148/D-650 established `용맹의 집(House of Valor)`.

| ID | Result | Reason |
| ---: | --- | --- |
| 280 | not an issue; close D-063 | English explicitly identifies Engard as Fae Champion of Valor and locates his defeat at the House. Korean preserves the fight, Varani opponent, time, and established House name. |
| 4157 | not an issue; close D-959 | English `Valor grounds` is not an explicit House-title claim, but Japanese says the House's grounds and Chinese locates the merchants at the House; Korean `용맹의 집(House of Valor) 구역` preserves the place and resale offer without inventing a named institution. |
| 6156 | not an issue; close D-1656 | Standalone English `House of Valor` is already `용맹의 집`. The short UI label need not carry a parenthetical. |
| 7878 | accepted; close D-2169 | Correct the standalone `용맹의 전당(House of Valor)` to the established `용맹의 집(House of Valor)`. |
| 22824, 23574 | already accepted | Previously corrected by D-18492 and D-18662. No recount. |

The scene-specific House of Valor/Engard findings with independent lore
questions are not settled by this label review.

## Verification

- Only `Texto` at ID 7878 changed. The target has no runtime marker or
  embedded newline.
- Pre-edit SHA-256:
  `8a3beb7092fc2f329ae49ad6ac165765411a7d42e63052eb784445fe10859021`.
- Post-edit SHA-256:
  `bcf03c641fadd72441a42a1ca1c0abd491794cfada675bbe4e7d9176a9d843f2`.
- Byte-identical backup:
  `/private/tmp/ko-translate-backups/20261012/before-valor-label-D19489/locatexts_zh_cn.koalocatext_default.csv`.
- `apply-valor-label-D19489.py` verifies the old hash, exact ID row,
  and backup bytes before replacing the row. BOM, 72,011 CRLF and 73
  existing bare-LF endings remain unchanged.
- Totals: **2,375 accepted / 25,152 not an issue / 10,997 uncertain**
  (38,524). Resume at **D-19490** by unresolved finding clusters.

Working dispositions, not final independent linguistic approval.
