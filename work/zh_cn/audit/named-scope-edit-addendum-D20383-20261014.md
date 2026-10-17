# D-20383 Edit Addendum: Standalone Personal Names

Updated 462 standalone name-label cells across 339 confirmed personal-name
groups, plus two full-name contextual references, for 464 `Texto` cells total. Every
changed label now contains the Korean personal name and its exact English
source name in parentheses. The full cell-by-cell list and the English,
Japanese, and Chinese source labels are in the linked TSV manifest.

| Case | IDs | Change |
| --- | --- | --- |
| Lexical translations mistaken for names | 32950, 35016, 55721, 6204, 56978 | `회색` / `그레이` -> `그레이(Gray)`; `부두` -> `퀘이(Quay)`; `명사수` -> `데드아이(Deadeye)`. |
| English-only name labels | 21405, 8065, 5093, 63888, 24285, 63644, 4459, 58954, 64146, 59034, 63838 | Added supported Korean forms, including `베들림(Bedlym)`, `칼리두스(Callidus)`, `시리스(Cirys)`, `코드건(Codgan)`, `에게스트(Egest)`, `에일랄리(Eilaly)`, `펜다르(Fendar)`, `킬딘(Kildeen)`, `템스(Tems)`, `셀굿(Thelgood)`, and `조프(Zoef)`. |
| Context-validated forms | 63097, 14520, 14856, 19634, 31313, 49373, 49281 | Aligned labels with in-file full-name/dialogue readings: `에이드런(Aedran)`, `안웨이(Anwy)`, `하리트(Harit)`, `이알프헬름(Ealfhelm)`, `제이버(Jeibir)`, `조컬(Jokull)`, and `쿠르토릭스(Kurtorix)`. |
| Punctuation-preserving names | 32477, 42173 | Added English names while retaining the source question marks: `블러드그린(Bloodgrin)?` and `미나(Mina)?`. |
| Full-name context correction | 26788, 29279 | Corrected `어르신 케틀` and `얼신 케틀(Ursin Kettle)` to `우르신 케틀(Ursin Kettle)`, matching English, Japanese, Chinese, and the verified `Ursin` label. |

The already bilingual Green entry at ID 42465 was retained. ID 50010's
capitalized `Green` is an ordinary adjective meaning inexperienced, not a
reference to the person. Excluded ambiguous named subjects and non-person
categories are documented in the review report.

**Complete changed-cell manifest:** [person-single-word-edits-D20383.tsv](person-single-word-edits-D20383.tsv)

Initial pre-edit SHA-256:
`200c3a81b6fbe23d231d5a28e64cfd426d7f6a4e2c0b47ec2dbfc5e1675e2c89`

Initial byte-identical backup:
`/private/tmp/ko-translate-backups/20261014/before-person-single-words-D20383/locatexts_zh_cn.koalocatext_default.csv`

Backup before the contextual correction:
`/private/tmp/ko-translate-backups/20261014/before-ursin-context-D20383/locatexts_zh_cn.koalocatext_default.csv`

Final active SHA-256:
`07981d157152c8a5880c23c16c81e466a23c69a17103d2a4df37d8d63dce31c9`

The reverse substitutions restored the original bytes exactly. BOM, line
endings, CSV structure, row order, and all non-target bytes were preserved.
No disposition key was counted again and no global tally changed.
