# Disposition Batch: `default` IDs 60101-60150

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary
  report, source-keyed historical audit, terminology, and structure.
- Two accepted corrections, 30 `not an issue` IDs, and 18 uncertain
  findings. These are working dispositions, not independent final linguistic
  approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17886 | 60101 | `...죽기 전에 고문(Counsel)을 찾을 것인가... 고문을 찾기로 했다.` | `...죽기 전에 조언자(Counsel)를 찾을 것인가... 조언자를 찾기로 했다.` | English frames “the Counsel” as a person to find, and Japanese/Chinese use adviser/consultant terms. Clarify the role in Korean while retaining the source title. |
| D-17887 | 60130 | `이렇게 사람들이 돌아다니는데, 열쇠를 잃어버렸을 때 아무도 도와주지 않았다니.` | `이렇게 사람들이 많은데, 열쇠를 잃어버렸으면 누군가는 도와줄 줄 알았지.` | Restore the source's expectation that someone would help after the keys were lost; remove the unsupported factual assertion that nobody helped. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17888 | 60104 | Pteryx's canonical creature name varies across locales; retain the question rather than substitute another creature. |
| D-17888 | 60105 | “Raised Travelers” may mean raised within a faction or raised as skilled thieves; preserve the current wording pending lore context. |
| D-17888 | 60106 | Faebourn, Children of Dust, and the quoted Hand of Ynadon/Hem of Lyria may be formal names or poetic inscriptions. |
| D-17888 | 60111 | Rose-of-Shadows may be a named item, place, or plant; current descriptive Korean is provisional. |
| D-17888 | 60114 | Derfel and Mattix Dace spellings remain project-wide canonical-name questions; the delivery task is intact. |
| D-17888 | 60117 | The antecedent of “it” before “destroy it” is unstated in English and Korean; retain that ambiguity. |
| D-17888 | 60124 | Prismere's canonical Korean material/name form varies by locale; preserve the destruction/rebeginning claim. |
| D-17888 | 60126 | The relationship between the failed task and expected reimbursement remains ironic or self-serving but unresolved across locales. |
| D-17888 | 60131 | The object/resource supplied as an olive branch is unnamed; Korean correctly leaves its referent open. |
| D-17888 | 60132 | “Pet mortal” may be deliberately demeaning, possessive, or affectionate; Korean softens it, but intent needs lore/voice context. |
| D-17888 | 60136 | `Shaper`, `gnosticant`, Eleanor Brea being “blinded by darkness,” and the founders' formal titles need a dedicated lore/terminology pass; preserve the existing 12-part account. |
| D-17888 | 60137 | English `vanes` may specifically mean the flat feather portion; Korean's technical reading is plausible but not settled by the other locales. |
| D-17888 | 60138 | The nature of the complex beneath Sun Camp and the Erathi naming remain context-dependent. |
| D-17888 | 60140 | Shadow of Enfamanir may be a formal proper name; canonical spacing/transliteration is unresolved. |
| D-17888 | 60143 | The Weeping King title varies across the corpus; preserve the statue's impassive face and melancholy. |
| D-17888 | 60144 | English breaks off mid-word before correcting itself; Korean and Japanese/Chinese normalize the interruption differently. |
| D-17888 | 60145 | `Blight` may mean plague, disease, corruption, or withering; Korean's plague reading is plausible but not conclusive. |
| D-17888 | 60148 | Phasmer and Hierophant forms remain provisional; the speaker's “perhaps” qualification is preserved. |

## Not an Issue

Decision D-17889 records these 30 IDs: 60102-60103, 60107-60110,
60112-60113, 60115-60116, 60118-60123, 60125, 60127-60129, 60133-60135,
60139, 60141-60142, 60146-60147, and 60149-60150. These rows preserve
evident meaning, register, and structure without unsupported lore changes.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 60101-60150 once
  and in identical ascending order; each default resource has 65,135 rows.
- ID 60101 retains four newline characters in English/Japanese/Korean; the
  additional Chinese newline remains source-specific and was not copied into
  Korean. ID 60136 retains its long multi-paragraph structure.
- No runtime markers occur in the batch. The ten-year quantity at 60105,
  seven-year rebellion and other quantities at 60136 remain present.
- Source-keyed questions were rechecked in
  `work/zh_cn/audit/from-ja_jp/open-questions.md`, the preliminary scan, and
  `work/zh_cn/audit/preliminary-work-20261007.md`. The observed meaning shift
  at 60130 and the ambiguous role term at 60101 are corrected; other lore
  questions remain uncertain.
- Pre-edit CSV SHA-256:
  `09c2194038314e7842351349607b05a62266816b7d8e85beca79e0471509a5c6`.
- Post-edit CSV SHA-256:
  `5fa172635c879c74e23e78edcd04fa26c9b6213b7d8537171d01de120c2fd645`.
  Only IDs 60101 and 60130 changed. Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-60101/locatexts_zh_cn.koalocatext_default.csv`.
  UTF-8 BOM, key order, 72,045 CRLF endings, and 39 pre-existing bare-LF
  endings are preserved.

D-17886 and D-17887 record two accepted corrections, D-17888 records 18
uncertain findings, and D-17889 records 30 `not an issue` IDs. Direct
register totals: 1,747 accepted, 13,688 `not an issue`, and 11,497
uncertain (26,932 dispositions total); next D-17890.

Resume at `default` ID 60151; 4,984 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
