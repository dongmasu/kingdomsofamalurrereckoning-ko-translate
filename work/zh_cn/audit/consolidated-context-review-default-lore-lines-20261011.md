# Consolidated Context Review: Lore and Journal Lines

- Date: 2026-10-11
- Decision: D-18265
- Scope: `default` IDs 19979, 19981, 19984, 19989, 19991, 19992, 19997,
  and 19998; compare English meaning, Japanese register/detail, Chinese
  support, active Korean, repeated names/terms, and prior accepted decisions.
- Result: accept a correction at ID 19984; reclassify IDs 19979, 19981,
  19989, 19991, and 19992 as `not an issue`; retain uncertainty at IDs 19997
  and 19998 for unresolved corpus-wide terminology.

## Evidence and Decisions

| ID | Korean result | Disposition and rationale |
| ---: | --- | --- |
| 19979 | Unchanged | `not an issue`. The line correctly identifies Nesta as Olaf's fellow castaway and the victim, Cadwallon as her husband and pursuer, the narrator's need to find both, and the northward route to Siren's Den. English, Japanese, and Chinese support the names and relations. Remaining spelling preferences are global name consistency, not a local meaning error. |
| 19981 | Unchanged | `not an issue`. English appears to contain `Principle Cast` for a play, while Japanese explicitly says `"謙虚なる者"主要出演者一覧` (“principal cast list”). Korean `‘겸손한 자들’ 주연 출연진` preserves the title and cast-list function; Chinese is a divergent mistranslation and does not outweigh the explicit Japanese/context. |
| 19984 | `졸개들을 시켜 ... 탈출하고` -> `졸개들의 도움을 받아 ... 탈출해` | Accepted. English and Chinese say Tirnoch uses her pawns/minions to escape from prison herself. The prior Korean could make the minions the ones escaping. Japanese also supports using puppets to get out. |
| 19989 | Unchanged | `not an issue`. `EA Privacy Policy` is accurately rendered as `EA 개인정보 처리방침`; Japanese and Chinese provide the same branded legal-label meaning. |
| 19991 | Unchanged | `not an issue`. Korean `생명의 샘물` conveys the lifewell springing from this place; Japanese says “spring of life” and Chinese explicitly says “well of life.” `패란즈` reuses the accepted Faelands form at ID 36362 / D-11705. |
| 19992 | Unchanged | `not an issue`. Korean preserves the speaker's preference for drinking over talking, the shipment of genuine Asker's Ale, and its arrival from Ysa. Japanese and Chinese support the product/source details. |
| 19997 | Unchanged | Uncertain. The plot and promotion are conveyed, but `Savant`, `Adept`, and `Docent` are formal Scholia Arcana ranks whose Korean equivalents conflict across existing rows and remain unsettled. Do not normalize three rank terms in isolation. |
| 19998 | Unchanged | Uncertain. The standalone label identifies Cape Solace, but the active corpus has competing forms (`케이프 솔라스`, `케이프 솔러스`, and `솔라스 곶`); no row-level phonetic evidence selects one canonical form. |

## Applied Text

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 19984 | `티르노크를 막지 못하면, 그녀는 졸개들을 시켜 감옥에서 완전히 탈출하고 세상을 새로운 장난감으로 삼을 거야.` | `티르노크를 막지 못하면, 그녀는 졸개들의 도움을 받아 감옥에서 완전히 탈출해 세상을 새로운 장난감으로 삼을 거야.` |

## Verification

- Only the active Korean `Texto` value at ID 19984 changed.
- Five keys were reclassified as `not an issue`; two remain uncertain.
- The UTF-8 BOM, data rows, key order, CRLF count (72,011), bare-LF count
  (73), and all bytes outside the approved `Texto` value are preserved.
- Reversing only the approved substitution reproduces the pre-edit CSV
  byte-for-byte.
- Pre-edit SHA-256:
  `056e952ecc9c6153c2136e9c61123598171b586a88291ec14565b3534ddd3f57`.
- Post-edit SHA-256:
  `af27d91862dfdd9fbd609ea5504a6e9f7ab817aad49fb25e987950f9139250c5`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-tirnoch-escape-D18265/locatexts_zh_cn.koalocatext_default.csv`.
- Cross-resource totals through D-18265: 1,956 accepted, 23,107 `not an
  issue`, and 13,459 uncertain (38,522 unique dispositions); next decision:
  D-18266.

These are working dispositions, not independent final linguistic approval.
