# Dialogue Naturalness Hold Re-review

Date: 2026-11-15

## Scope and Method

The scope was the 2,066 rows marked `unresolved` in
`dialogue-naturalness-20261106/adjudication/final-dispositions.tsv`, divided
into non-overlapping ID ranges. This turn re-reviewed 1,323 rows directly;
the 743-row `21712-43423` tranche was carried forward from the prior-session
handoff and is disclosed separately below. Judgments used current Korean and
same-ID English, Japanese, and Chinese sources. English was used for meaning,
Japanese for tone and phrasing, and Chinese as supporting evidence. Context
was used only where supported; uncertain readings remain held.

The historical `final-dispositions.tsv` remains unchanged. The per-correction
record is
[`dialogue-naturalness-hold-rereview-corrections-20261115.tsv`](dialogue-naturalness-hold-rereview-corrections-20261115.tsv).

## Results

| ID range | Re-reviewed | Corrected | Retained | Still held |
| --- | ---: | ---: | ---: | ---: |
| 0-14000 | 429 | 20 | 347 | 62 |
| 14001-21711 | 230 | 15 | 125 | 90 |
| 21712-43423 | 743 | 1 | 548 | 194 |
| 43424-65134 | 664 | 2 | 441 | 221 |
| **Total** | **2066** | **38** | **1461** | **567** |

The `14001-21711` total treats `14075` as retained after verification; the
other 15 candidates were accepted. The `21712-43423` correction at `42073`
was already present in the active CSV before this pass and was verified, not
reapplied.

Newly applied changes are 20 accepted rows in `0-14000` and two accepted rows
in `43424-65134`. The accepted changes from `14001-21711` were already
applied. `54132` was not promoted to a correction: English and Chinese
support the proposed beneficiary, while Japanese points to a different
agent/action reading, so it remains held.

## Reconciliation Notes

- A separate 223-row candidate review overlapped the `0-14000` range and was
  not counted as additional coverage. Its proposals were checked against the
  current rows. An independent adjudication of the 18 proposals not already
  accepted found eight more clear corrections, eight additional holds, one
  existing hold (`4684`), and one retain-current decision (`5018`).
- `14712` has a user-edited current translation and a stale ledger
  fingerprint. It was not reverted or refreshed as part of this work; a
  global ledger check may continue to report this pre-existing mismatch.
- This summary does not embed per-ID hold lists. The `21712-43423` totals
  (548 retained, one correction at `42073`, and 194 held) were carried forward
  from the prior-session handoff; this turn verified the current `42073` text
  and fingerprint but did not rerun all 743 rows. No saved per-ID outcome
  report or exact hold list was found, so those counts are not independently
  reproducible from the repository artifacts.
- Counts are dispositions of the 2,066 historical unresolved rows only; they
  are not a claim that all dialogue or all translation issues are resolved.

## Validation

All 22 new edits were ID-scoped and applied with the byte-preserving CSV
editor. The CSV still has 65,135 rows, a UTF-8 BOM, 71,839 CRLF endings, 242
LF-only endings, and no CR-only endings. The 11 preservation-tool tests,
repeated-source index check, and CRLF-aware `git diff --check` passed.

All changed-row fingerprints match the current four-language rows. The full
`--check-review-ledger` command still stops at `14712`, whose stale fingerprint
belongs to the preserved user edit; no other mismatch was found. Do not
refresh that fingerprint without reconciling the user's change.
