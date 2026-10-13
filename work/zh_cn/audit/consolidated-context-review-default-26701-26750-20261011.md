# Consolidated Context Review: `default` IDs 26701-26750

- Review date: 2026-10-11.
- Scope: the 25 unique prior uncertainties in D-8617-D-8618 within IDs
  26701-26750.
- Result: one accepted correction and twenty-four `not an issue`; no new
  unresolved uncertainty remains in this range.
- English controls meaning; Japanese source and its Korean draft inform
  voice/register; Chinese is supporting evidence.

## Decisions D-19322-D-19323

| Decision | Key | Outcome | Evidence |
| --- | --- | --- | --- |
| D-19322 | `default` 26735 | accepted | English says the Dverga trained indigenous beasts and put them into service; Japanese specifically supports training and military use, and Chinese also describes their use in service. Korean `부역` can add forced-labor connotations not stated by the sources. Replace it with a neutral description of training the beasts and putting them to work. |
| D-19323 | `default` 26704, 26708, 26711-26714, 26717, 26719-26720, 26722, 26725-26726, 26730-26732, 26734, 26736-26737, 26742-26743, 26747-26750 | not an issue | The names, ranks, artifacts, skill labels, quest text, and lore remain traceable to the English source. In particular, `보호막` at 26720 is a conventional metaphor for protection in the justice/information-access context, not an assertion of a literal combat shield. Name transliteration variation and unresolved proper-name conventions alone do not show a local semantic defect. |

The accepted Gadflow verse correction at 26705 (D-8614) and the validated
values/runtime wrapper at 26737 (D-8616) remain unchanged and are linked,
not recounted.

## Accepted Text Edit

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26735 | `드베르가는 이 섬에 사는 토착 야수를 수십 마리나 부렸다. 야수들을 길들여 부역에 동원했지.` | `드베르가는 이 섬 토착 야수 수십 마리를 훈련해 자신들을 위해 일하게 했다.` | Preserve the training and service meaning without adding an unsupported forced-labor implication. |

## Verification

- English, Japanese source, Chinese, Japanese-derived Korean draft, and
  active Korean each contain IDs 26701-26750 exactly once in ascending order.
- The active Korean `Texto` cell at 26735 is the only content change.
  Reversing the exact substitution reproduces the pre-edit backup byte-for-byte.
- UTF-8 BOM is retained. The file retains 72,011 CRLF and 73 pre-existing
  bare-LF endings.
- The preliminary scan checked embedded line breaks, runtime-token
  signatures, the three-break verse at 26705, reagent counts at 26737, and
  the +30% value at 26746. This review independently confirmed 50 ordered
  IDs in each of the five files.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-26701-26750-D19322/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `db85756a1b919985fb49fa0bb4a1ff4066513b66b2b9fd2939bffc61ae5bf040`.
- Post-edit SHA-256:
  `1057624d5e2dba12082120f33f320ae46050dd81f691eb407979dba81eb455a7`.
- All 25 prior uncertainties in this range were resolved: one accepted and
  twenty-four `not an issue`. Totals: 2,210 accepted / 24,540 `not an issue` /
  11,774 uncertain (38,524). Resume at D-19324, ID 26751.
