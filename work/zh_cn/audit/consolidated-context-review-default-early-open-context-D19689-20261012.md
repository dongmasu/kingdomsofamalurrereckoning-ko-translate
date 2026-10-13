# Consolidated Context Review: Early Open Contexts (D-19689)

- Date: 2026-10-12.
- Scope: default IDs 949 and 2097, rechecked against the exact English,
  Japanese, Chinese, and active Korean rows.
- English anchors meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. The searchable official Korean manual extraction
  and prior accepted terminology decisions were consulted. No PAK material
  was used.

## Decisions

| ID | Disposition | Evidence |
| ---: | --- | --- |
| 949 | `not an issue` | English `the Marches` and Chinese `红色边境` place the labyrinth beneath the Marches; Japanese uses a generic land reference. Korean `변경지` preserves the frontier-region meaning. D-19625 / ID 4483 independently closed the same term with the same broad Korean rendering; conflicting proper-name readings do not require imposing a new regional spelling here. |
| 2097 | `accepted` | English explicitly names the House of Ballads and the capitalized Fae lore concept `the Telling`. Japanese `ハウス・オブ・バラッド` and `伝承`, plus Chinese `歌谣之家` and `讲述`, support the faction/tradition context. Reuse the accepted `발라드의 집(House of Ballads)` and `전승(The Telling)` terms; retain the source's plural seasonal cycle, Maid reference, casual register, and sentence meaning. |

## Applied Text

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 2097 | `그녀는 우리의 숙적이야. 발라드 가문(House of Ballads)이 이야기의 모든 계절을 통틀어 맞서도록 운명 지어진 악당이지. 문제가 생기면 시녀(The Maid)가 시작점이야.` | `그녀는 우리의 숙적이야. 발라드의 집(House of Ballads)이 모든 전승(The Telling)의 계절에 걸쳐 그녀를 막도록 운명 지어진 악당이지. 문제가 생기면 시녀(The Maid)가 시작점이야.` |

## Verification and Resume

- One finding was accepted and one was closed as `not an issue`; neither
  remains uncertain.
- Pre-edit SHA-256:
  `2b88478d34c309dfb7b87b905135213cfa6760ccfb250282709d203fb8e0b991`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-early-open-context-D19689/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit SHA-256:
  `07602314234297650bf9010f6a288209a6298f7abd53955636ffa854236caf48`.
- Reversing the single approved cell substitution reproduces the backup
  byte-for-byte. The UTF-8 BOM, 65,135 IDs in ascending order, 72,011 CRLF
  endings, 73 pre-existing bare-LF endings, and all other bytes are
  preserved.
- Updated totals: **3,352 accepted / 33,672 not an issue / 1,500 uncertain**
  (38,524).
- Next candidate: **D-4637 / ID 15204**, to be revalidated against later
  closure records before review. Default review remains incomplete.
