# Consolidated Context Review: `default` IDs 26751-26800

- Review date: 2026-10-11.
- Scope: 26 unique prior uncertainties in D-8622-D-8623 within IDs
  26751-26800. ID 26783 appears in both findings and is counted once.
  ID 26796 was already accepted at D-8619 and is linked, not recounted.
- Result: one accepted correction and twenty-four `not an issue`; no new
  unresolved uncertainty remains in this range.
- English controls meaning; Japanese source and its Korean draft inform
  voice/register; Chinese is supporting evidence.

## Decisions D-19324-D-19325

| Decision | Key | Outcome | Evidence |
| --- | --- | --- | --- |
| D-19324 | `default` 26770 | accepted | English says Grim was “set up by the Hierophant”; Japanese says he was trapped by the `導き手`, and Chinese says he was framed by the High Priest. Change the awkward Korean agent construction to explicitly state that the Hierophant trapped Grim. |
| D-19325 | `default` 26751, 26756, 26762-26765, 26767-26769, 26772-26774, 26780-26783, 26786-26788, 26791, 26795, 26797-26799 | not an issue | The poem, names, faction/race and profession terms, lore and objective text remain traceable to English and are supported by the parallel translations where applicable. `티레니움` at 26783 matches the same-mine spelling affirmed by accepted D-9199; Fateweaving at 26786 preserves the sense accepted at D-18208; `도박장` at 26786 is supported by Japanese `賭博場` and Chinese `赌场`. Remaining variants do not prove a local translation error. |

D-8619's accepted correction at 26796 is linked without recounting. The
nine embedded line breaks in the Apotyre chapter at 26783 and the layout
markers/cost variable at 26763/26780 remain unchanged.

## Accepted Text Edit

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26770 | `...그림이 대사제에게 함정에 빠졌다는 충격적인 소식도...` | `...대사제가 그림을 함정에 빠뜨렸다는 충격적인 소식도...` | State the source-supported agent/action clearly and repair the awkward passive construction. |

## Verification

- English, Japanese source, Chinese, Japanese-derived Korean draft, and
  active Korean each contain IDs 26751-26800 exactly once in ascending order.
- The active Korean `Texto` cell at 26770 is the only content change.
  Reversing the exact substitution reproduces the pre-edit backup byte-for-byte.
- UTF-8 BOM is retained. The file retains 72,011 CRLF and 73 pre-existing
  bare-LF endings.
- The preliminary scan checked ID 26783's nine embedded line breaks, ID
  26763's ordered layout markers, and the cost variable at ID 26780. This
  review independently confirmed 50 ordered IDs in each of the five files.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-26751-26800-D19324/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `1057624d5e2dba12082120f33f320ae46050dd81f691eb407979dba81eb455a7`.
- Post-edit SHA-256:
  `26f103c961c0bf576e6f070f6fd043030abbbca3e92fa925797e62292f8181ef`.
- All 25 not-previously-resolved uncertainties in this range were resolved:
  one accepted and twenty-four `not an issue`. Totals: 2,211 accepted /
  24,564 `not an issue` / 11,749 uncertain (38,524). Resume at D-19326,
  ID 26801.
