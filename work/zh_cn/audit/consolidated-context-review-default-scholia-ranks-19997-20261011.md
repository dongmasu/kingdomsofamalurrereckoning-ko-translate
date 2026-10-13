# Context Review: Scholia Arcana Ranks at ID 19997

- Date: 2026-10-11
- Decision: D-18268
- Scope: `default` ID 19997 across English, Japanese, Chinese,
  Japanese-derived Korean, active Korean, accepted institution terminology,
  and a read-only Korean-patch comparison.
- Result: correct the formal rank and institution terms; accept the row.

## Evidence and Decision

English describes a Scholia Arcana Adept, a Savant who sends the narrator on
the task, and a promotion to Docent after stopping the necromancer. Japanese
and Chinese independently support the same institutional roles and outcome,
although they translate the ranks descriptively rather than consistently
preserving their formal labels.

The current project already identifies `Savant` as a formal rank: at ID 3673
English explicitly says it is the order's second-highest rank, and the
current Korean renders that title as `사반트`. The accepted standalone
institution name at D-18238 is `스콜리아 아르카나`. A read-only comparison
with the corrected Korean patch resource also renders this quest's ranks as
`사반트`, `숙련자`, and `도슨트`, and names the institution `스콜리아
아르카나`. That alternate Korean resource is corroboration only; English
controls the meaning, while the aligned Japanese and Chinese establish the
roles and promotion.

Change only the inconsistent formal terms in the active row. `숙련자`
accurately conveys Adept in this rank context; `도슨트` preserves the
explicitly earned formal rank rather than turning it into an ordinary
instructor job. The name spellings and event sequence remain unchanged.

## Applied Text

| Previous Korean | Applied Korean |
| --- | --- |
| `학자 엥가르는 아르카나 대학의 숙련자 레르카라 펠을 찾으라고 나를 멜 아글리르 마을로 보냈다. 가는 길에 강령술사가 마을 사람들을 납치하고 있다는 사실을 알아냈다. 레르카라도 그중 하나였고, 최근 되살린 아내에게 먹이로 주려는 짓이었다. 그를 막은 공로로 강사로 승진했다.` | `사반트 엥가르는 스콜리아 아르카나의 숙련자 레르카라 펠을 찾으라고 나를 멜 아글리르 마을로 보냈다. 가는 길에 강령술사가 마을 사람들을 납치하고 있다는 사실을 알아냈다. 레르카라도 그중 하나였고, 최근 되살린 아내에게 먹이로 주려는 짓이었다. 그를 막은 공로로 도슨트로 승진했다.` |

## Verification

- Only the active Korean `Texto` value at ID 19997 changed.
- The UTF-8 BOM, data rows, key order, CRLF count (72,011), bare-LF count
  (73), and all bytes outside this `Texto` value are preserved.
- Reversing only the approved substitutions reproduces the pre-edit CSV
  byte-for-byte.
- Pre-edit SHA-256:
  `af27d91862dfdd9fbd609ea5504a6e9f7ab817aad49fb25e987950f9139250c5`.
- Post-edit SHA-256:
  `26b471e1d909b9960563e91ceb9dfa943c7b6bdf501730e04f716c097f76af74`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-scholia-ranks-19997-D18268/locatexts_zh_cn.koalocatext_default.csv`.
- Cross-resource totals through D-18268: 1,957 accepted, 23,112 `not an
  issue`, and 13,453 uncertain (38,522 unique dispositions); next decision:
  D-18269.

These are working dispositions, not independent final linguistic approval.
