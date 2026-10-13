# Historical Default Membership Audit (D-19741)

Date: 2026-10-13. No translation CSV edit or new backup in this batch.
This is an inventory reconciliation, not a new linguistic disposition.
No PAK or PAK-derived evidence was consulted.

## Exact Source-Keyed Coverage

The persisted post-D-19727 manifest has 1,005 distinct IDs. The D-19727
snapshot has 100 distinct IDs, disjoint from those 1,005; eight of its IDs
(26354, 26367, 26369, 26371, 26372, 26381, 26391, 26393) were already
terminal in D-19303 and were correctly excluded by D-19727. Thus the
**pre-D-19727 reconstructed candidate inventory is 1,097 exact keys**:
1,005 + 100 - 8. D-19727 closed 92; D-19728-D-19738 closed 1,005
(the 100 in D-19728 plus the 905 in the post-D-19728 manifest).

The original D-17843 legacy snapshot has 98 distinct exact keys. Its
intersection with the 1,097 is precisely 12: 53452, 53453, 53455, 53460,
53463, 53465, 53474, 53479, 53481, 53486, 53491, 53493. All 12 were
closed in D-19728. Of the other 86, ID 59429 was closed by D-19739 and
the remaining 85 by D-19740. The union of these two *known exact-key
inventories* is therefore **1,183 distinct keys**, all with recorded
terminal dispositions. This establishes coverage of those inventories,
not coverage of every member of the older operational uncertainty count.

The 100-key snapshots D-19728-D-19737 and the five-key D-19738 snapshot
have 1,005 distinct IDs and cover the 1,005 post-D-19727 keys exactly.
The D-19740 snapshot has 85 distinct IDs and covers the 85 legacy-only
keys remaining after D-19739. These checks compare ID sets, not merely
reported batch sizes.

## What the 110 Difference Does Not Establish

The last pre-D-19727 operational count was 987 uncertain (3,419 accepted /
34,118 not an issue; 38,524 total). The number 1,097 - 987 = 110 is a
**difference between two counts**, not an identified set of 110 false
positives or a proof that 987 is a subset of the 1,097. Indeed, the
legacy-only 86 show that the original reconstruction missed exact
source-keyed holds. It is not valid to remove an arbitrary 110 keys from
the reconstructed list or to subtract the 1,183 closed keys from 987.

The register has group and bulk-remainder dispositions as well as exact
IDs; cumulative checkpoints do not enumerate the 987 members. Neither
the heuristic D-19724 queue nor the two reconstructed manifests encode
the complete historical state at D-19725. No independently reproducible
987-member manifest or unique-key terminal ledger has been located. The
historical 987 remains a count without verified membership. **Default
uncertainty completion is not established.**

## Next Audit

D-19742: reconstruct the earlier 38,524-key decision cohort from the
register's initial exact-ID and bounded bulk-remainder scopes, applying
terminal decisions in decision order and excluding explicit exceptions.
Compare its exact remaining-ID set to the 1,183 closed source keys above,
then check any genuine residual IDs against the active English, Japanese,
Chinese, and Korean rows, official Korean manual, and accepted terminology.
Do not select an ID from the D-19724 heuristic queue or re-review already
closed keys. If bulk-remainder membership cannot be resolved from recorded
exceptions, identify the specific ambiguous source scopes and do not
invent an exact 987-member cohort.

Active default SHA-256:
`3f862aeda41678f71ceb3cce3ab4bbc9298dfb2bdbc6695223847378ccabf964`.
Last byte-identical pre-edit backup (D-19740; SHA-256
`efcc82a6f550773a19bd731999ba2b14f4f0913f317a6c194de2f798355de1a7`):
`/private/tmp/ko-translate-backups/20261012/before-legacy-85-D19740/locatexts_zh_cn.koalocatext_default.csv`.
The separate 55 Chinese-only affix holds remain recorded closed at D-19565.
