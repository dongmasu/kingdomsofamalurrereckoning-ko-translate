# Consolidated Context Review: Scholia Arcana Adept Ranks

- Date: 2026-10-12; decision D-19504.
- Scope: the 31 nominated `default` holds at IDs 760, 4796, 5369, 6758,
  21664, 22135, 32458, 34679, 39071, 56163, 4862, 12865, 15397, 30681,
  31062, 36563, 43300, 44006, 44139, 44657, 48233, 49668, 52031, 56542,
  57655, 58776, 63856, 28762, 58499, 18954, and 31887.
- Compared immutable English, Japanese and Chinese, archived Japanese-derived
  Korean, active Korean, accepted terminology decisions, and the preceding
  Scholia Arcana rank review D-18268.
- English controls meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Rank Corrections

D-18268 established `Adept` as a formal Scholia Arcana rank and accepted
`숙련자`, alongside `사반트` for `Savant` and `도슨트` for `Docent`.
English explicitly identifies the rank in ID 31062, the promotion at 44139,
and the ring's promotion function at 58499/31887. Japanese generally renders
the rank descriptively as a mage; Chinese commonly uses an attendant-like
term and once misidentifies a promotion as a master title. Those renderings
do not outweigh the explicit English rank evidence.

| ID | Previous Korean fragment | Applied Korean fragment | Finding |
| ---: | --- | --- | --- |
| 760 | `견습 마법사 레르카라 펠` | `숙련자 레르카라 펠` | Correct formal title in the letter attribution. |
| 4796 | `수습생,` | `숙련자여,` | Correct the rank in direct address. |
| 4862 | `수습 마법사 레르카라 펠` | `숙련자 레르카라 펠` | Direct source check found this was a rank error, so it was moved from the nominated no-edit set to accepted. The report's investigation and uncertainty of the lead remain unchanged. |
| 5369 | `수습생(Adept)` | `숙련자(Adept)` | Correct rank in direct address. |
| 6758 | `수련자를 찾으라고` | `숙련자를 찾으라고` | Correct Lerkara Fel's rank; preserve the contact and objective wording. |
| 21664 | `수련자여,` | `숙련자여,` | Correct rank in direct address. |
| 22135 | `수련자로 마법을`; `아르카나 학회(Scholia Arcana)` | `숙련자로 마법을`; `스콜리아 아르카나(Scholia Arcana)` | Correct the rank and reuse the established institution name. The personal-history statement is otherwise source-faithful. |
| 32458 | `수습자여.` | `숙련자여.` | Correct rank in direct address. |
| 34679 | `수습 현자 이그나스` | `숙련자 이그나스` | Correct Ignas's rank; remove the unsupported junior/mage combination. |
| 39071 | `수습 마법사 펠` | `숙련자 펠` | Correct Fel's rank; retain the separate Archsage title and event sequence. |
| 56163 | `펠 수습자(Adept Fel)` | `펠 숙련자(Adept Fel)` | Correct Fel's rank; leave the separate `Neophyte` address unchanged. |

## No-Edit Closures

IDs 12865, 15397, 30681, 31062, 36563, 43300, 44006, 44139, 44657, 48233,
49668, 52031, 56542, 57655, 58776, and 63856 were checked directly in the
active CSV and source rows. Their current `숙련자` wording preserves the
English `Adept` title/rank or standalone category without a demonstrated
translation defect. IDs 52031 and 63856 are isolated labels, so this closure
does not assert their wider UI or organizational context; `숙련자` remains
valid for the visible English label.

## Partial Corrections; Uncertainty Retained

| ID | Applied correction | Remaining uncertainty |
| ---: | --- | --- |
| 28762 | `수련자여` -> `숙련자여` | The indirect English advice, Japanese imperative, and Chinese speaker-intention reading do not fully settle the sentence's pragmatic force. |
| 58499 | `현자 에이선 엥가르` -> `사반트 에이선 엥가르` | The formal `Savant` rank is normalized; the competing Creathnach Thintri/Skycrown name forms remain unresolved. |
| 18954 | `아르카나 대학의 숙련자 계급` -> `스콜리아 아르카나의 숙련자 계급` | Institution and rank terminology are normalized; English `band` versus the ring/insignia readings in Japanese and Chinese remains unresolved. |
| 31887 | `석학 에이선 엥가르` -> `사반트 에이선 엥가르` | The formal `Savant` rank is normalized; proper-name and location forms in the letter remain unresolved. |

These four keys remain counted as uncertain. The corrections do not authorize
changes to any other rows or global term replacements.

## Edit and Verification

- Dispositions: 11 accepted, 16 `not an issue`, and 4 partial accepted that
  remain uncertain. All 31 nominated keys were reviewed. ID 4862 was
  reclassified from proposed no-edit to accepted after direct active-row
  inspection.
- Pre-edit SHA-256:
  `f053125768e2383b2686dadf188d8172d65dda3f1e487b011b5835ec43bc177f`.
- Post-edit SHA-256:
  `c4f1def4843091d0a8fe9d31e618c67ab496495e922a4ed70842753220b05b2c`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-adept-rank-cluster-D19504/locatexts_zh_cn.koalocatext_default.csv`.
- The apply script asserts the backup hash, unique target IDs and exact
  replacement fragments. It preserves the UTF-8 BOM, 65,135 ID rows, row
  order, 72,011 CRLF endings, and 73 pre-existing bare-LF endings. Reversing
  only the 16 approved substitutions reproduces the backup byte-for-byte.
- No source, Japanese-work, build, or distribution file was changed.
- Totals after D-19504: **2,418 accepted / 25,227 not an issue /
  10,879 uncertain** (38,524). The separate 55 Chinese-only provisional
  `affix` uncertainties are not included. Resume at D-19505 by the next
  deduplicated unresolved source/context cluster; do not restart sequential
  scans.

These are working dispositions, not independent final linguistic approval.
