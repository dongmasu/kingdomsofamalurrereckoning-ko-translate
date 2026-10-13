# Consolidated Context Review: `default` IDs 26151-26200

- Review date: 2026-10-11.
- Scope: re-review the six prior uncertain findings from the existing
  disposition for IDs 26151-26200; the earlier Keeper correction at 26151 is
  linked and not recounted.
- Result: one finding accepted, three `not an issue`, and two remain
  uncertain for specific terminology/riddle questions.
- English controls meaning; Japanese and its Korean draft inform
  voice/register; Chinese is supporting evidence.

## Decisions D-19282-D-19287

| Decision | Key | Outcome | Evidence |
| --- | --- | --- | --- |
| D-19282 | `default` 26152-26158 | accepted | The disappearance report, thanks, Theater welcome, Ysa/Wencen account, Deinir leatherworking, and item description are preserved. At 26157, normalize Kollossae from `콜로새` to the later accepted `콜로사이` (D-18878/D-18933). ID 26153's earlier ASCII-period correction is not recounted. |
| D-19283 | `default` 26162 | uncertain | English `longlegs` can be a creature/group name or a descriptive taunt. Japanese and Chinese translate the long-leg image literally, while Korean transliterates it; this isolated combat address does not establish which sense or canonical Korean form is intended. |
| D-19284 | `default` 26163-26169 | not an issue | `Room`, `Crown of the Sun`, `Weaponsmithing`, reconnaissance, warning, and Chernobog are source-traceable. `방` matches the ordinary room sense already resolved at D-18227; `체르노보그` matches repeated active Korean usage. |
| D-19285 | `default` 26174-26176 | not an issue | The weapon/user and general/army comparisons, appeal to Carth, Prismere Chantries, and Tuatha history are retained. Korean avoids imposing a gender on the English source's contradictory `she`/`his`; `카스`, `프리즈미어 성소`, and the faction names remain source-traceable. |
| D-19286 | `default` 26184-26187 | not an issue | The Warden of Light title is explicitly bestowed, the righteous-path requirement remains, and the Fateless One reference and centuries-old joint arrival/departure are preserved. `대담한 알메레` does not add an unsupported royal rank; remaining name variation alone does not show a meaning error. |
| D-19287 | `default` 26192-26193 | uncertain | The Seawatch conversation is clear, but the `Five-and-nine by night` riddle is not. Japanese gives “59,” Chinese gives “fourteen bushels,” and English's question/punchline does not establish the intended measure; retain the literal Korean without inventing an answer. |

## Accepted Text Edit

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26157 | `콜로새의 야만적인 사촌 종족인 데이니르는...` | `콜로사이의 야만적인 사촌 종족인 데이니르는...` | Reuse the later accepted Kollossae form D-18878/D-18933; leave the Deinir relationship and leatherworking description unchanged. |

## Verification

- English, Japanese source, Japanese-derived draft, Chinese, and active
  Korean each contain 65,135 unique ascending IDs in identical order.
- Only the active Korean `Texto` cell at ID 26157 changed. Reversing the
  exact substitution reproduces the pre-edit backup byte-for-byte.
- UTF-8 BOM, row order, 72,011 CRLF endings, and 73 pre-existing bare-LF
  endings are preserved. Previously accepted IDs 26151 and 26153 are linked,
  not recounted.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-26151-26200-D19282/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `2e88c2e07b9e80038ded0dbec4d8fe3b55d90a8880cc00c9add34fe1d6df2783`.
- Post-edit SHA-256:
  `2b46d9e070def1062d970ec44efb50fa28f1a0c636b707f6a85be7a92f39e504`.
- Totals: 2,194 accepted / 24,328 `not an issue` / 12,002 uncertain
  (38,524). Resume at D-19288, ID 26201.
- The D-19162-D-19238 and D-18422-D-18452 register-detail gaps remain
  explicit and unreconciled.
