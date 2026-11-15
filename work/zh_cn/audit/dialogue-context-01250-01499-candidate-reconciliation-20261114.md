# Candidate Reconciliation: IDs `1250`-`1499`

- Date: 2026-11-14.
- Rechecked all 24 current `overall=candidate` ledger IDs in this interval
  against English, Japanese, Chinese, and the active Korean CSV.
- Ten candidate translations received source-supported corrections; 14 were
  already consistent with the sources or established terminology.
- The earlier full-corpus report's evidence-limited holds at `1291`, `1404`,
  and `1413` were not part of this current candidate set and remain unresolved.
- No speaker or playback order was inferred from asset association.

## Applied Decisions

The `Greater Niskaru` type name was completed at `1278` and aligned with the
related `Balor` reference at `38015`. `Font` and `Fontmaster` were paired in
Jakasen's introduction at `1312`; the same role wording was aligned at
`22907` and `24822`, and Nomeron's full role/name pairing was restored at
`25656`.

At `1255`, the road dust was made to rise naturally as it welcomes the
wanderer. At `1354`, `inner sanctum` was rendered as a private inner room
(`내실`), not a hideout. Janis's self-introduction at `1360` was reordered
around her appointed roles while retaining the full name/title and polite
register. The courtship line at `1377` now uses natural conversational
wording. At `1389`, the lenses' attunement to the subjects was clarified
without changing the journal's two-paragraph layout. At `1430`, the Scions
are described as preparing under watch rather than having completed their
preparations. The item descriptions at `1490` and `1492` were clarified
against the English and Japanese wording.

## Retained

Candidates `1282`, `1293`, `1316`, `1325`, `1334`, `1349`, `1370`, `1376`,
`1379`, `1444`, `1467`, `1488`, `1496`, and `1498` already preserve the
supported full title, name, or meaning. In particular, no unidentified
House was inferred at `1334`, and no further title was added to `1467`.

## Verification

- The 14 supported text changes were applied by ID with
  `tools/replace_text_preserve_eol.py`; only those IDs' ledger
  `source_fingerprint` fields were refreshed.
- All 24 current candidates in the interval have a recorded disposition in
  the linked machine-readable manifest:
  [`decision and edit manifest`](dialogue-context-final-edits-followup-01250-01499-20261114.json).
- CSV structure, row order, UTF-8 BOM, mixed line endings, four-language
  fingerprints, regression tests, and CRLF-aware diff checks are recorded
  after validation.
- Candidate reconciliation now covers 79 of 4,015 current candidates
  (1.97%). This is not full candidate-review completion.
- No commit was made.
