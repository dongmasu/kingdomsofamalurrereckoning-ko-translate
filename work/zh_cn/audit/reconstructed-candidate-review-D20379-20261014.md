# Reconstructed Candidate Review Cross-Check (D-20379)

Date: 2026-10-14. This cross-check follows the proposal to use the
reconstructed 1,097-key candidate set as the review scope. It verifies the
persisted exact-key snapshots and prior row-level dispositions; it does not
repeat translation research, create new classifications, or edit the CSV.

## Exact-Key Coverage

- `/private/tmp/uncertain-candidates-D19726.json` contains 1,105 unique IDs.
  Its exact set equals the union of the 100-key D-19727 source snapshot and
  the 1,005-key post-D-19727 manifest.
- D-19727's apply script explicitly excludes eight IDs already terminal at
  D-19303: 26354, 26367, 26369, 26371, 26372, 26381, 26391, and 26393.
  This leaves 92 eligible D-19727 keys.
- The 1,005-key post-D-19727 manifest equals the disjoint union of
  D-19728's 100-key snapshot and the D-19729-D-19738 snapshots (905 keys).
- Therefore the exact eligible inventory is a disjoint partition of
  92 + 100 + 905 = 1,097 unique `(default, ID)` keys. Each is present in the
  corresponding row-level review report. No candidate key remains without a
  recorded terminal disposition.

## Corrected Outcome Rollup

| Review records | Accepted | Not an issue | Total |
| --- | ---: | ---: | ---: |
| D-19727 | 10 | 82 | 92 |
| D-19728 | 19 | 81 | 100 |
| D-19729 | 17 | 83 | 100 |
| D-19730 | 20 | 80 | 100 |
| D-19731 | 10 | 90 | 100 |
| D-19732 | 18 | 82 | 100 |
| D-19733 | 11 | 89 | 100 |
| D-19734 | 13 | 87 | 100 |
| D-19735 | 12 | 88 | 100 |
| D-19736 | 16 | 84 | 100 |
| D-19737 | 13 | 87 | 100 |
| D-19738 | 1 | 4 | 5 |
| **D-19729-D-19738 subtotal** | **131** | **774** | **905** |
| **Total** | **160** | **937** | **1,097** |

The earlier aggregate in the D-19726/D-19738 reconciliation trail,
121 accepted / 784 `not an issue` for D-19729-D-19738, is inconsistent with
the enumerated exact-key results in those ten batch reports and register
entries. Recounting each batch's accepted rows gives 131; the remaining
774 of the 905 exact keys are `not an issue`. This correction changes no
individual disposition and does not add any key to the global cumulative
tally.

## Remaining Historical Accounting Limit

The candidate inventory is now verified as fully reviewed, with 160 accepted
and 937 `not an issue` outcomes and zero unresolved keys in this inventory.
This does **not** identify which 987 keys were included in the D-19725
historical checkpoint. The numeric difference `1,097 - 987 = 110` still
does not name 110 excluded keys, and candidate outcomes cannot be added to
the old global totals without that exact overlap. Keep 3,419 / 34,118 / 987
as a historical, unreconciled checkpoint; do not present it as a current
global total.

Active default CSV SHA-256 remains
`b0e554459bd40fbdd0e654a706ef7f265e5e0f6e7f62b65d6f1f851d4104dffe`.
No CSV edit or new backup was made. Sequential default review remains
complete through ID 65134. The separate affix 55 remain closed at D-19565.
