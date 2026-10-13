# Legacy Chantry Context Review (D-19739)

- Date: 2026-10-12.
- Scope: exact source-keyed legacy hold at `default` ID 59429.
- Disposition: accepted correction.
- English is the meaning anchor; Japanese informs register and Chinese is a
  supporting cross-check. The official Korean manual was checked for setting
  context; it does not provide a specific `Chantry` rendering.

| ID | Previous Korean | Applied Korean | Evidence |
| ---: | --- | --- | --- |
| 59429 | `사그렐은 찬트리에 있다.` | `사그렐은 예배당에 있다.` | English `Chantry`, Japanese `礼拝堂`, and Chinese `礼拜堂` identify the chapel. The Korean corpus renders the same English term as `예배당` at IDs 7675 (`The Chantry`), 58879 (`Chantry`), 19326, 20663, 37849, and 43228. `찬트리` was an unsupported transliteration here. |

The rest of the quest update preserves destroying the crystals, ending the
Maid's enchantment, returning to Sagrell, and seeking entry to Castle
Windemere. The Maid reference is rendered `시녀`; prior row-level rulings
establish this as the accepted Korean title component without requiring a
blanket change or a lore claim. Japanese uses a Windemere epithet and Chinese
uses “girl,” but neither contradicts English's recurring Maid referent.

## Applied Text

Only the `Texto` cell at ID 59429 changed:

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 59429 | `수정들을 파괴하고 시녀의 마법을 끝냈으니 사그렐에게 돌아가야겠다. 사그렐은 찬트리에 있다. 부탁받은 일을 마쳤으니 보상으로 윈더미어 성 입장을 요구해야겠다.` | `수정들을 파괴하고 시녀의 마법을 끝냈으니 사그렐에게 돌아가야겠다. 사그렐은 예배당에 있다. 부탁받은 일을 마쳤으니 보상으로 윈더미어 성 입장을 요구해야겠다.` |

## Verification

- English, Japanese, Chinese, active Korean, and the preserved Japanese-derived
  Korean row were checked by exact ID.
- Pre-edit SHA-256:
  `4c5652dfe78be4388133d9e7f53be78af37fbd2c6d210670ec42a896a7558ec2`.
- Post-edit SHA-256:
  `efcc82a6f550773a19bd731999ba2b14f4f0913f317a6c194de2f798355de1a7`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-chantry-D19739/locatexts_zh_cn.koalocatext_default.csv`.
- Replacing only the old ID 59429 text with the applied text reconstructs the
  active CSV byte-for-byte. The UTF-8 BOM, row order, 72,011 CRLF endings, and
  73 pre-existing bare-LF endings are unchanged.
- D-19729-D-19738's 905-key candidate set remains fully closed. This legacy
  key was outside that manifest, and its membership in the historical
  operational 987 is unproven; do not alter that unreconciled cumulative
  tally by subtraction.
- The source-keyed legacy snapshot had 98 entries. D-19728 already closed 12
  of them; after this exact-key correction, 85 remain for D-19740, beginning
  at ID 58599. This subset is not asserted to be the historical 987 cohort.

Default review remains incomplete.
