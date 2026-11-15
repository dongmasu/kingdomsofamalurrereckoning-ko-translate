# Candidate Reconciliation: IDs `16000`-`16249`

- Date: 2026-11-14.
- Scope: all five current ledger candidates in this range, compared with
  English, Japanese, Chinese, and the active Korean translation.
- All five supported corrections were already present; no CSV or fingerprint
  edit was needed.
- Asset associations do not establish individual speakers or playback order.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `16000` | Previously applied, confirmed | English `silver`, Japanese `銀`, and Chinese `白银` refer to the material, not coins. The current `은을 좀 팔고 싶어` preserves that meaning. |
| `16010` | Previously applied, confirmed | `우리는 돌이자 살이며, 검이자 신앙이다` preserves the deliberate parallel rhetoric without the awkward literal `바위이자 살덩이`. |
| `16052` | Previously applied, confirmed | English, Japanese, and Chinese identify Scholia Arcana initiates. The current `입문자` follows the established group term rather than `수련생`. |
| `16106` | Previously applied, confirmed | The House of Valor context supports `투기장`, and `강제로 맞붙게 했어` explicitly preserves the Champion's coercion. |
| `16171` | Previously applied, confirmed | The current `선택받은 자들(Chosen)` pairs the capitalized title. Korean follows the English meaning; the divergent Japanese and Chinese labels do not establish a reason to change it. |

## Verification

- All five in-range candidates are reconciled; cumulative reconciliation is
  903 / 4,015 (22.49%), with 3,112 remaining.
- No translation CSV or review-ledger fingerprint changed in this range.
- The full ledger and generated index/catalogs validate. The preservation
  tests (11) and context-index tests (9) passed in the preceding validation
  run.
- The active CSV's BOM, record order, and existing mixed line endings remain
  unchanged; the CRLF-aware diff check passed.
- Source CSVs and extracted game assets were not changed.
