# Candidate Reconciliation: IDs `41250`-`41499`

- Date: 2026-11-15.
- Rechecked all 21 candidate IDs against English, Japanese, Chinese, the
  active Korean CSV, and prior scoped decisions. `41471` had already been
  reconciled with its exact-source duplicate `39868`, so it is not counted
  twice; this pass reconciles 20 new unique candidate IDs.
- Fifteen proposed corrections were already reflected in the current Korean
  text. `41367` needed one supported name-pairing correction.
- The proposals at `41255`, `41271`, `41375`, and `41418` were not supported
  and were cleared. The separate meaning hold at `41271` remains open.

## Candidate Decisions

| IDs | Result |
| --- | --- |
| `41256`, `41262`, `41281`, `41289`, `41315`, `41318`, `41333`, `41345`, `41376`, `41395`, `41420`, `41439`, `41455`, `41474`, `41485` | Rechecked the source-supported wording and confirmed each proposed correction is already present in the active Korean CSV. |
| `41367` | Added the missing pairing `코호시(Cohosh)` in the journal entry. |
| `41255` | Retained the accepted `지팡이 여왕(Queen of Staves) 아르진(Argine)` form. All 26 exact-source label rows use this same pairing; the proposal to combine the epithet and name into one parenthetical is unnecessary. |
| `41271` | Cleared the English-pairing proposal: `master-at-arms` is an occupational description here, not a standalone name or title. Its precise Korean role meaning remains held because the locale sources differ. |
| `41375` | Cleared the casual-register proposal. This is explanatory text about a ritual, not an identified speaker's dialogue; the current written form is appropriate. |
| `41418` | Retained `제일검(First Sword)`, consistent with the established title at the other occurrences; the proposed `제1검` is unnecessary. |
| `41471` | Confirmed it matches exact-source duplicate `39868` in all four locales; it was reconciled in the earlier `39750`-`39999` pass. |

## `Cohosh` Cross-Check

- English `Cohosh`, Japanese `コホシュ`, and Chinese `升麻` refer to the same
  plant term in the journal entry. The matching Korean noun already has the
  explicit pairing `코호시(Cohosh)` in `default:21648`.
- Applied that established pairing at `41367` without changing its first-
  person journal voice or its four-paragraph layout. The row retains all
  eight embedded line breaks.
- Existing broader `Black Cohosh` recipe and item labels were not changed.

## Evidence-Limited Holds

| ID | Reason |
| ---: | --- |
| `41264` | The source fragment ends after “It would be a small matter to”; its missing continuation cannot be inferred. |
| `41271` | `master-at-arms` differs across English, Japanese, and Chinese role descriptions; retain the current Korean meaning provisionally. |
| `41275` | The isolated `Break` label does not establish whether it means a pause, UI action, or destruction. |
| `41319` | `Plagueshield` does not establish whether the referent is a preparation, effect, or named item. |
| `41426` | English `wax`, Japanese `脂`, and the quest-context `Master's Tallow` do not settle the material composition. |
| `41492` | The exact referent and name form of `the Sorrows` remain unclear across the locale sources. |

## Verification

- Reconciled 20 new unique candidates; cumulative progress is 2,699 / 4,020
  (67.14%), with 1,321 remaining.
- Only `default:41367` changed in the translation CSV. Its ledger status and
  four-language source fingerprint were updated.
- Confirmed all 26 `Argine, Queen of Staves` labels use the accepted identical
  Korean form; confirmed `39868` and `41471` match exactly.
- The CSV retains 65,135 ordered records, UTF-8 BOM, 71,840 CRLF sequences,
  242 LF-only separators, and no bare CR. The edited journal retains eight
  embedded line breaks.
- The 11 CSV-preservation tests and nine context-index tests passed.
  Ledger-fingerprint validation, regenerated index/catalog checks, and the
  CRLF-aware diff check passed.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.
