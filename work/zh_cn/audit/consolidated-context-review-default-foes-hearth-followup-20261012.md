# Consolidated Context Review: Remaining `Foes' Hearth` Holds

- Date: 2026-10-12.
- Decision: D-19461.
- Scope: the four explicit open findings at `default` IDs 22292, 37767,
  42313, and 61470.
- Reused the named-place evidence and exact-key comparisons documented in
  D-18216; no full corpus or contiguous range was rescanned.

## Findings

| ID | Result | Rationale |
| ---: | --- | --- |
| 22292 | Not an issue | English explicitly calls Foes' Hearth a safe place, while Japanese and Chinese also treat it as the location. Korean preserves the location and exact English name in parentheses; its personified-swamp wording follows the English source. |
| 37767 | Accepted | The standalone label is the same named place established by D-18216 and used in accepted form at IDs 65110 and 23441. Normalize the Korean label to `적들의 난롯가(Foes' Hearth)`. |
| 42313 | Accepted | English/Japanese place the old ruins at Foes' Hearth and Chinese agrees. Replace the inconsistent phonetic-only place reference with the accepted Korean place name and retain the source relation. |
| 61470 | Accepted | This is the objective to meet Cydan at the same named place. Reuse the accepted display form while retaining the Cydan name and objective. |

The concern at 22292 is closed without editing. The unrelated House
uncertainty at 63232 was closed separately under D-19460. IDs 33236 and
33534 were contextual comparisons, not open findings; ID 52900 was already
`not an issue` and its literal trailing backslash is unchanged.

## Applied Cells

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 37767 | `적의 화톳불` | `적들의 난롯가(Foes' Hearth)` |
| 42313 | `포즈 하스의 옛 유적으로 와. 안에서 만나서 이야기하자.` | `적들의 난롯가(Foes' Hearth)에 있는 옛 유적으로 와. 안에서 만나서 이야기하자.` |
| 61470 | `포즈 하스(Foes' Hearth)에서 시단(Cydan) 만나기` | `적들의 난롯가(Foes' Hearth)에서 시단(Cydan) 만나기` |

## Verification

- Compared each target key across English, Japanese source, Japanese-derived
  draft, Chinese, and active Korean; reused D-18216's location evidence.
- Only the three listed Korean `Texto` cells changed.
- Pre-edit SHA-256:
  `6f1bdca9db7a821642b2a10857284da6a7d8ebe6bc7b13639b75117585022c80`.
- Post-edit SHA-256:
  `e279b66c19bca275f0d4a16efa527aee7a223a89bffec285b49449e68a47db7d`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-foes-hearth-normalization-D19461/locatexts_zh_cn.koalocatext_default.csv`.
- Reversing the three exact substitutions reproduces the backup byte for
  byte. BOM, row order, CRLF endings, and pre-existing bare-LF endings are
  preserved.
- Totals after D-19461: **2,317 accepted / 25,006 not an issue /
  11,201 uncertain** (38,524). Resume at D-19462 from the deduplicated
  unresolved-source queue.
