# Global Tally Reconciliation Check (D-20378)

Date: 2026-10-14. Accounting investigation only: no translation decision,
CSV edit, new backup, or change to the D-20377 review endpoint.

Follow-up D-20379 verified that the 1,097-key reconstructed candidate set
was already fully dispositioned in D-19727-D-19738 (160 accepted / 937
`not an issue`). It also corrected the D-19729-D-19738 rollup from
121/784 to 131/774 based on the row-level reports. This does not establish
membership of the historical 987-key cohort; see
`reconstructed-candidate-review-D20379-20261014.md`.

## Verified

- Active default CSV SHA-256:
  `b0e554459bd40fbdd0e654a706ef7f265e5e0f6e7f62b65d6f1f851d4104dffe`.
  Last pre-edit backup:
  `/private/tmp/ko-translate-backups/20261014/before-named-scope-D20373/locatexts_zh_cn.koalocatext_default.csv`.
- The D-19725 register checkpoint records 3,419 accepted, 34,118
  `not an issue`, and 987 uncertain (38,524 total). These are historical
  operational counts, not an exact-key manifest or current totals.
- The D-19725 100-key manifest was found under its original source name,
  `uncertain-100-D6227-D6308-20261012.jsonl`; its SHA-256 is
  `0eb792594ef5c30ac96190dd501e224707cd214ebaf663044fd3f07b3487791b`.
  It has 100 unique IDs and is disjoint from D-19724's 100-key manifest.
  D-19725's apply script binds this snapshot to its edit/report and the
  byte-identical pre-edit CSV backup. This restores the exact 100 reviewed
  keys, **not** the other 987 keys represented only by the count.
- The temporary D-19726 candidate file has 1,105 unique IDs. The
  D-19727 snapshot intersects it at all 100 IDs; eight were already
  terminal in D-19303, leaving 92 dispositions. The resulting 1,097-key
  candidate inventory and later 1,005/905 manifests are reproducible, but
  none encodes membership in the historical 987 cohort.
- Running `ruby work/zh_cn/audit/reconcile-default-scopes-D19742.rb`
  against the current register finds 27,966 distinct IDs in explicit
  numeric scopes through D-18156, 922 of them appearing in multiple
  numeric records; 79 uncertain and 594 `not an issue` nonnumeric
  register rows (plus one accepted row). The D-19742 report recorded
  28,057 and 925 for its earlier run. The two results differ by 91 IDs
  and three overlaps; neither is an authoritative denominator without
  a frozen register snapshot. Nonnumeric counts are register rows,
  not distinct keys.
- D-19741 proves closure of a 1,183-key union of two source-keyed
  inventories, but does not prove membership of those keys in the
  D-19725 cohort. D-19742 also dispositioned IDs 39567/39582 without
  proving their membership. Neither permits subtracting from 987.
- Scope-level recovery can work when later reports provide exact rows:
  D-8854 resolves to IDs 28204, 28205, 28207, 28208, 28212, 28213,
  28216, 28221, 28223, 28242, 28246, 28249, and 28250. This recovers
  that finding's membership only; it does not establish whether those
  keys were counted in the D-19725 total.
- D-12877 is still ambiguous. In IDs 40951-41000, the surrounding
  decisions explicitly enumerate 24 uncertain and 18 not-an-issue IDs,
  leaving an eight-ID arithmetic complement. But “named terms in
  remaining findings” does not prove that its membership equals the
  complement rather than overlapping the explicitly listed uncertainty.
  Do not promote the eight-ID complement to a verified set.

## Remaining Accounting Blocker

The original 987 exact IDs at D-19725 have no independently verified
membership list. Early `remaining ... excluding separately dispositioned
findings` scopes cover bounded ranges only after excluding specific
overlapping findings; `named terms in IDs ...` scopes identify topics rather
than exact rows (for example D-8854). Expanding either to every ID would
double-count reviewed rows. Later translation edits and repeat review
reports cannot be added as new global dispositions. The 110 difference
between the reconstructed 1,097 candidates and historical 987 is
not a known set of 110 keys. The separate affix 55 were closed at D-19565
and are outside this calculation.

**Outcome:** Global accepted / not-an-issue / uncertain totals remain
unreconciled. No new current tally, zero-uncertain assertion, or adjustment
to the historical 38,524 is justified by the available exact-key evidence.
All requested sequential IDs 35251-65134 have been reviewed through
D-20377; that coverage is separate from the global accounting question.

To finish, reconstruct the D-19725 cohort from a frozen initial register
and each exact-key exception/snapshot in decision order, recording one
terminal outcome per unique `(default, ID)` key. Require that the derived
D-19725 status partition reproduces 3,419 / 34,118 / 987 *before*
applying subsequent decisions. If it cannot, report the concrete unmatched
keys and missing memberships instead of assigning a synthetic current
total. Do not revisit PAK files or repeat the closed affix review.
