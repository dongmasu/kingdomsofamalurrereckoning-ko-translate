# Disposition Batch: `default` IDs 64251-64300

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, values, and structure.
- Two accepted targeted corrections, 33 `not an issue` IDs, and 15 uncertain
  findings. These are working dispositions, not independent linguistic
  approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18113 | 64284 | `서쪽으로 행군한 지 얼마 안 되어 버림받은 평원에서 죽었다고 하더군. 유명한 아조의 반지와 함께 묻혔다는 소문이 있어. 그거라면 일 년은 먹고살 수 있을 텐데.` | `서쪽으로 행군한 지 얼마 안 되어 버림받은 평원에서 죽었다고 하더군. 유명한 아조의 반지들과 함께 묻혔다는 소문이 있어. 그 반지들이라면 일 년은 먹고살 수 있을 텐데.` | English explicitly uses plural `rings` and `those`; make the Korean number reference consistent instead of narrowing it to a single ring. |
| D-18113 | 64300 | `용기들의 마법 해제하기` | `보관함의 마법 해제하기` | English/Japanese/Chinese identify containers or boxes whose magic is dispelled; `용기` can instead mean courage and obscures the UI object. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18114 | 64251 | English's “in their stead” has an unclear antecedent and relation to the offered item; Japanese/Chinese interpret the thanks differently. |
| D-18114 | 64252 | Capitalized `Higher` may be a rating/value or spatial position; Korean uses “high” without UI context. |
| D-18114 | 64254 | The Cycle/afterlife and Sorrows referents are preserved, but locale readings differ on whether the Sorrows are a group/faction or power. |
| D-18114 | 64256 | `Warden` may be a formal civic/prison title; Korean's generic manager term needs context. |
| D-18114 | 64258 | `Oathblade` may be a formal title, weapon name, or mercenary rank; retain the English-derived form pending glossary review. |
| D-18114 | 64264 | The “figure” offering true freedom is not identified in the row; preserve the contrast with true Chaos pending context. |
| D-18114 | 64269 | `Chancellor of Windemere` conflicts with Japanese minister and Chinese clan leader; Korean follows the political-office reading but needs title context. |
| D-18114 | 64270 | Korean conveys discreetly gathered information but the “ear to the ground” idiom and the guest's status/wealth distinction warrant a voice check. |
| D-18114 | 64273 | `Undersea Fasting` may be a named location or passage; Japanese explicitly reads it as an underground passage. |
| D-18114 | 64276 | English/Chinese say the Pit while Japanese says a staging area; confirm the official venue and direction. |
| D-18114 | 64278 | `Pledgeshield` may be a formal rank/title; Japanese assigns a different rank, while Korean preserves the English title. |
| D-18114 | 64283 | `Dove` is likely an endearment, but Chinese reads it as a peace messenger and Japanese omits it; Korean uses an affectionate address. |
| D-18114 | 64285 | The dark irony is preserved, but whether `Faehunter` is a surname or title and the canonical Fae term need review. |
| D-18114 | 64287 | Lyenna Crosse, Mithroliths, and the meeting junction are retained; locale spellings and the official lore term are unsettled. |
| D-18114 | 64294 | The poem retains all eight breaks and the source narrative, but its final image/clause remains awkward and merits a dedicated poetic pass. |

## Not an Issue

Decision D-18115 records these 33 IDs: 64253, 64255, 64257, 64259-64263,
64265-64268, 64271-64272, 64274-64275, 64277, 64279-64282, 64286,
64288-64293, and 64295-64299. They preserve available meaning, voice,
values, and structure.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 64251-64300 once,
  in identical ascending order.
- Embedded newline counts match for every row. The Belmaid poem at 64294
  retains eight embedded line breaks.
- No runtime markers or numeric-value differences were found.
- Rechecked source-keyed historical questions covering Higher, Cycle/Sorrows,
  Warden, Oathblade, Undersea Fasting, Pit, Pledgeshield, dove, Azo's rings,
  Anshelm Faehunter, Mithroliths, murghan, the Belmaid poem, and Containers.
- Only the `Texto` cells at IDs 64284 and 64300 changed. UTF-8 BOM, record
  count, key order, embedded lineation, and outer CRLF record separators
  are preserved. Pre-edit SHA-256:
  `11a39473ba5d892362a397bbbf34c78e43c7774dc2a5e791ac2074b705f5f1f1`.
  Post-edit SHA-256:
  `91991b444d52ac7e65a3bc606afc39fde32ed42b5b3371eec79026b9c6310952`.
  Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-64251/locatexts_zh_cn.koalocatext_default.csv`.

- D-18113 records two accepted corrections, D-18114 records 15 uncertain
  findings, and D-18115 records 33 `not an issue` IDs. Totals at D-18115:
  1,830 accepted, 16,597 `not an issue`, and 12,678 uncertain
  (31,105 dispositions); next D-18116.

Resume at `default` ID 64301; 834 IDs remain through ID 65134. These are
working dispositions, not independent linguistic approval.
