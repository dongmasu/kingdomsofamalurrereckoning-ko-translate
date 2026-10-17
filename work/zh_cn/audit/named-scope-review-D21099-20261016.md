# D-21099: Reviewed Proper-Name Batch

Date: 2026-10-16

## Scope

Latest verified proper-name batch: D-21099 (2026-10-16).
Reviewed 2 distinct resource/ID/variant keys: {"accepted"=>2}.
Groups: {"faction:firstsworn"=>2}. Last reviewed key: default:62666: / faction:firstsworn.
Next batch: D-21100; continue source discovery/residual checks; no unreviewed indexed keys.
Indexed matches: 32381; accepted=21396, excluded=2203, not-an-issue=8762, uncertain=20.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 20, in 18 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`.
- base: `1b7a57174c7a790c4872fdf005a144b050b2570104035ccc310bd53cf09defc8`.
- default: `7ba8ec365121f4e14d5c3c1f34747e46925107200eb48122c0531ff2c34e2d7a`.
Last batch pre-edit backups and byte validation:
- default: 2 cells; pre `62c395a402b1b7a5c08c54141750350a9f64a6c10588bc0db2db44a324885c37`; post `7ba8ec365121f4e14d5c3c1f34747e46925107200eb48122c0531ff2c34e2d7a`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21099/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 2 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 7ba8ec365121f4e14d5c3c1f34747e46925107200eb48122c0531ff2c34e2d7a
Last actual CSV-edit backups (retained across no-edit batches):
- base: 3 cells; pre `b28746ba1c4c7a125d94940dc4182428b700dd441be047572996ae27973d28f5`; post `1b7a57174c7a790c4872fdf005a144b050b2570104035ccc310bd53cf09defc8`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21094/locatexts_zh_cn.koalocatext_base.csv`.
- default: 2 cells; pre `62c395a402b1b7a5c08c54141750350a9f64a6c10588bc0db2db44a324885c37`; post `7ba8ec365121f4e14d5c3c1f34747e46925107200eb48122c0531ff2c34e2d7a`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21099/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `b5a584c41ed78a705601976da8303dfe6a3a53ed50cba14819417c54f1b8e3b6`.
Occurrence index: 32381 rows; SHA-256 `d6d6cbbafadf8a044b29a57c8d6117f2cb6721d55b9e1835440feebde0cf2bff`.
Proper-name glossary: 834 entries; SHA-256 `26dca34288f0b625a53e4f3e982055e025933e0487d89a7ccdcf063b1d001ca4`.
Report: `work/zh_cn/audit/named-scope-review-D21099-20261016.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21099-20261016.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21099.tsv`.


## Evidence

This is a particle-only correction following the independent Firstsworn
review, not a new discovery or a second accepted tally. At `default:51339`,
change singular `첫서약자(Firstsworn)이` to `...가` and `...으로서` to
`...로서`; at `62666`, change `...이라` to `...라`. The canonical Korean
root ends in a vowel, unlike the replaced `퍼스트스원`. Correct plural
`첫서약자들(Firstsworn)이` forms remain unchanged.

All 32,381 occurrence rows and status counts are identical before/after:
accepted 21,396 / excluded 2,203 / not-an-issue 8,762 / uncertain 20.
The prior evidence is retained in the correction manifest and original
D-21087/D-21088 discovery manifests. The immediate pre-edit default backup
has SHA-256 `62c395a402b1b7a5c08c54141750350a9f64a6c10588bc0db2db44a324885c37`;
the exact byte/inverse verifier passed.

Final continuation validation and the D-21100 resume scope are recorded in
`proper-name-continuation-validation-D21085-D21099-20261016.md`.

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.
