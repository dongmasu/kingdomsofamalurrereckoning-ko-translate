# Consolidated Context Review: Dark Maze, Missives, and Crossing (D-19701)

- Date: 2026-10-12.
- Scope: `default` IDs 16100-16101, originally flagged in D-5045.
- Compared exact English, Japanese, Chinese, and active Korean rows.
  English anchors meaning; Japanese informs register and wording; Chinese
  supplies a supporting cross-check. The official Korean manual extraction
  was consulted for setting context; it does not name these quest locations
  or the Crossing. No PAK material was used.

## Decisions

| ID | Disposition | Evidence |
| ---: | --- | --- |
| 16100 | `accepted` | English capitalizes `Missives` and the row is the search objective in the Blackened Hall quest. Japanese calls the object a book (`書`), Chinese says letters, and D-18257 plus contextual English rows establish the named book `세이블의 서신(Missives of Sable)`. Replace the under-specific `쪽지(Missives)` with that established title; retain the entrance and forward-search meaning. |
| 16101 | `accepted` | English identifies the capitalized Crossing as a power whose control is maintained by Keepers at Caer Elatha. Japanese marks the “power crossing” as a named concept and Chinese uses a pass/gateway sense. D-19661, D-19673, and D-19674 establish `크로싱` for the named magical site. Replace both generic `교차로` instances without changing the maintenance action. |

## Applied Text

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 16100 | `검게 물든 전당(Blackened Hall) 안의 또 다른 시련, 어둠의 미궁(Dark Maze) 입구에 도착했다. 쪽지(Missives)를 찾으려면 앞으로 나아가야 한다.` | `검게 물든 전당(Blackened Hall) 안의 또 다른 시련, 어둠의 미궁(Dark Maze) 입구에 도착했다. 세이블의 서신(Missives of Sable)을 찾으려면 앞으로 나아가야 한다.` |
| 16101 | `우리 수호자들은 교차로(The Crossing)의 힘이 통제된 상태로 유지되도록, 케어 엘라타(Caer Elatha) 깊숙이 정기적으로 들어가 교차로를 세밀하게 조정한다.` | `우리 수호자들은 크로싱(The Crossing)의 힘이 통제된 상태로 유지되도록, 케어 엘라타(Caer Elatha) 깊숙이 정기적으로 들어가 크로싱을 세밀하게 조정한다.` |

## Integrity and Resume

- Two evidence-backed corrections applied; no uncertainty retained in this
  group.
- Pre-edit default SHA-256:
  `1d840040301533269e1d6503bc5f9662ff76298a3928d52a1cac94d999a1ecfa`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-dark-maze-missives-crossing-D19701/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit default SHA-256:
  `75e945311d405d78924fb52ff3fe17417124ec34bbb6eee7cf3b89b4ea4d2e84`.
- The exact inverse of the two `Texto` substitutions reproduces the backup
  byte-for-byte. The UTF-8 BOM, 72,011 CRLF endings, 73 existing bare-LF
  endings, row order, and every non-target byte are preserved.
- Updated totals: **3,360 accepted / 33,711 not an issue / 1,453 uncertain**
  (38,524).
- Next unresolved group: D-5052 / IDs 16111-16114. Default review
  remains incomplete.
