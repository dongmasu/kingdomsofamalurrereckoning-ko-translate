# Completed-Snapshot Overlap Corrigendum (D-19716)

- Date: 2026-10-12. This is a **ledger correction, not a CSV edit**.
- Read the exact IDs in completed `uncertain-200-D4747-D5107-20261012.jsonl`
  and `uncertain-200-D5108-D5506-20261012.jsonl`, together with their
  D-19653/D-19654 completion reports. Both reports close **all 200**
  listed IDs; their accepted-ID lists exclude the re-review edits below.
  Earlier resumed reviews incorrectly treated some of these closed keys
  as newly uncertain. The edits themselves remain source-backed; they
  are upgrades from `not an issue` to `accepted`, not new closures.

| Later review | Keys in earlier completed snapshots | Newly closed keys |
| --- | ---: | ---: |
| D-19703 | 1 (16116) | 0 |
| D-19704 | 7 | 7 |
| D-19705 | 3 | 7 |
| D-19706 | 0 | 29 |
| D-19707 | 8 | 13 |
| D-19708 | 5 | 10 |
| D-19709 | 11 | 11 |
| D-19710 | 10 | 22 |
| D-19711 | 8 | 2 |
| D-19712 | 14 | 4 |
| D-19713 | 6 | 0 |
| D-19714 | 7 | 3 |
| D-19715 | 12 | 3 |

Overlap detail (D-19704 through D-19715): D-19704
16121,16128,16134,16138,16144,16145,16149;
D-19705 16154,16163,16171; D-19707
16241,16247,16250,16251,16263,16264,16271,16276;
D-19708 16290,16291,16299,16305,16312;
D-19709 16325,16337,16344,16349,16350,16354,
16365,16376,16384,16387,16389;
D-19710 16396,16399,16405,16425,16432,16434,
16448,16449,16459,16474;
D-19711 16478,16497,16499,16504,16508,16516,
16530,16541; D-19712 16545,16560,16563,
16568,16576,16582,16588,16592,16598,16599,
16608,16614,16618,16620; D-19713
16626,16674,16682,16704,16719,16722;
D-19714 16730,16745,16753,16758,16764,16765,16774;
D-19715 16784,16795,16798,16799,16802,16805,
16808,16810,16811,16832,16837,16846.

There are **92** previously completed keys across D-19703-D-19715:
91 in D-19704-D-19715 and one in D-19703. Of these, **12**
newly accepted corrections in D-19704-D-19715 and one in
D-19703 replace a previous `not an issue`. They remain
accepted edits, but require the previous `not an issue` to
be decremented instead of `uncertain`. The other 79 keys
were already `not an issue` and cause no disposition change.
All counts in D-19703-D-19715 checkpoints are historical and
**superseded by this correction**.

Corrected operative default totals:
**3,382 accepted / 33,804 not an issue / 1,338 uncertain**
(38,524). Derived from D-19715's provisional
3,382 / 33,896 / 1,246 by reversing 92 duplicate
`uncertain -> resolved` transitions (33,896 - 92;
1,246 + 92). This also reconciles D-19703's
already closed ID 16116.

Default CSV SHA-256 remains
`abe79778c10c70aa427f29505aff05bad5bd46c23d7fbc83a7faa515f5383cc1`.
Latest byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261012/before-belen-revolt-D19715/locatexts_zh_cn.koalocatext_default.csv`.
No CSV write occurred in this correction.

**Resume D-5308 / IDs 16895-16896.** D-5290-D-5307
uncertain candidates were already closed by the D-19654
200-key snapshot or explicitly resolved at first pass;
16873 was previously accepted by D-19654. Compare D-5308
against the completed snapshots before adjudication, then
process by unique ID rather than blind decision-number order.
The 55 Chinese-only affix keys remain closed (D-19565).
