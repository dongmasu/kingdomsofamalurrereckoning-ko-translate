# Consolidated Context Review: Early Frontier and Warsworn Contexts (D-19690)

- Date: 2026-10-12.
- Scope: default IDs 15204, 15208, 15233, 15235, 15358, and 15359.
- English meaning, Japanese voice/context, Chinese cross-check, the official
  Korean manual extraction, and established active-corpus terminology were
  compared directly by ID. No PAK material was used.

## Decisions

| ID | Disposition | Evidence |
| ---: | --- | --- |
| 15204 | `not an issue` | All sources identify the cavern as a tomb/memorial to Arkes and those who followed him to ruin. Korean preserves that relationship and the memorial sense; the established active corpus already uses `아르케스(Arkes)`. |
| 15208 | `not an issue` | The direct question `Where is Arkes' tomb?` is accurately rendered as `아르케스의 무덤은 어디 있지?`; existing corpus usage confirms the name form. |
| 15233 | `accepted` | Japanese explicitly identifies the founder as Warsworn, English capitalizes `Order`, and Chinese identifies the collective. Official Korean manual page 7 names the faction `워스원(Warsworn)`. Replace generic `교단` with the established faction name; retain the Firstsworn heroes, ballads, and casual voice. |
| 15235 | `accepted` | This standalone English faction label is `Warsworn`; Japanese transliterates it and Chinese gives the same faction semantically. The official Korean manual establishes `워스원(Warsworn)`, matching repeated active-corpus usage. |
| 15358 | `not an issue` | English `Bulwark` is rendered as `방벽`, a direct Korean meaning. Japanese transliteration and Chinese's literal `壁垒` do not establish a mandatory proper-name reading; uncertain player-facing status does not demonstrate a translation defect. |
| 15359 | `not an issue` | `Male Quest Giver` is accurately rendered `남성 퀘스트 제공자`, parallel to active ID 36106's `여성 퀘스트 제공자`. Whether the label is internal or player-facing does not affect its correct meaning. |

## Applied Text

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 15233 | `우리 교단의 창립자지. 최초의 맹세자 영웅들의 옛이야기와 발라드쯤은 들어 봤겠지.` | `우리 워스원(Warsworn)의 창립자지. 최초의 맹세자 영웅들의 옛이야기와 발라드쯤은 들어 봤겠지.` |
| 15235 | `전쟁의 맹세자들` | `워스원(Warsworn)` |

## Verification and Resume

- Two findings were accepted and four closed as `not an issue`; no holds
  remain from this group.
- Pre-edit SHA-256:
  `07602314234297650bf9010f6a288209a6298f7abd53955636ffa854236caf48`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-early-frontier-warriors-D19690/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit SHA-256:
  `c01e7cb778db0296191402b50f868b474d585ca50f4e6e613ecd196ca47dcb5d`.
- ID-scoped inverse reconstruction is byte-identical. The UTF-8 BOM,
  65,135 IDs in ascending order, 72,011 CRLF endings, 73 pre-existing
  bare-LF endings, and all bytes outside the two approved `Texto` cells
  are preserved.
- Updated totals: **3,354 accepted / 33,676 not an issue / 1,494 uncertain**
  (38,524).
- Next unresolved group begins at **D-4980 / ID 15959**. Verify any later
  closure before disposition; default review remains incomplete.
