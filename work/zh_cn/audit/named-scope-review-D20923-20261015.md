# D-20923: Scions Title-Plural Review

Date: 2026-10-15

## Scope and Decision

Reviewed the six new `candidate:scions` row keys: `default:8415`,
`default:9675`, `default:25013`, `default:25348`, `default:52422`, and
`default:53845`. The two other candidate keys, `default:1430` and
`default:21314`, were already registered and dispositioned as
`title:scion` in D-20922; neither was reopened or recounted.

English uses the regular plural `Scions` for holders of the religious office
defined in D-20922. Japanese uses `サイオン` in all six contexts. Chinese
supports the office reading in five contexts; at `default:25013` it diverges
with `子孙`, while English and Japanese identify the Gallows End Scions who
wear the ceremonial amulet. Register `Scions` as a plural English alias of
`title:scion`, canonical Korean `사이온(Scion)`.

Five cells were corrected: `default:9675`, `25013`, `25348`, `52422`, and
`53845`. `default:53845` now names the office rather than a generic
`후계자`. `default:8415` already had the canonical bilingual form and was
recorded as `not-an-issue`. The six rows yield five accepted edits and one
`not-an-issue` occurrence.

Existing exact-key dispositions were preserved rather than recounted.
D-19054's `default:25013` and D-19147's `default:25348` `not an issue`
findings remain historical outcomes; D-20923 records the new glossary-driven
title normalization only. At `default:53845`, the office-name portion is
resolved, but D-16317's separate `opacity` wording question remains open.
No global translation tally was adjusted.

## Index and Integrity

The occurrence index now has 26,028 rows: all 26,023 generated
source-aligned occurrences plus the five documented contextual Anwon-family
entries. Its status counts are 17,264 accepted, 1,578 excluded, 7,168
`not-an-issue`, and 18 uncertain. The six Scions occurrences were added
without changing any existing disposition. These are focused entity-index
counts, not global translation totals.

Active default CSV SHA-256:

| State | SHA-256 |
| --- | --- |
| Before D-20923 | `cfa8f5fab26ec2b7870c15db035077712e0d0ffee1b03ee3c2995757dd9bea4d` |
| After D-20923 | `e9a841405bb10f2567c81042d777c8e27751707898e7727c3209d5a944463767` |

Byte-identical pre-edit backup:

- `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20923/locatexts_zh_cn.koalocatext_default.csv`

The independent verifier passed all five edited `Texto` cells and 65,135
ordered `default` rows. It confirmed target values, BOM, mixed line endings,
unchanged non-target cells/bytes, and inverse reconstruction against the
backup. The complete reverse edit-chain verifier also passed all 531 stages
and reconstructed the recorded pre-D-20390 hashes. The exact manifest is
[`proper-name-edits-D20923.tsv`](proper-name-edits-D20923.tsv);
the repeatable review and apply scripts are
[`review-scion-plural-D20923.rb`](review-scion-plural-D20923.rb) and
[`apply-scion-plural-D20923.rb`](apply-scion-plural-D20923.rb).

`src/csv/` was read-only. No PAK or PAK-derived files were inspected or
modified. Sequential default review through ID 65134 remains complete and
is not recounted; proper-name discovery and residual validation remain
incomplete.
