# D-21690: Corrective Blood Rite Bilingual Label

## Scope

Latest verified proper-name batch: D-21690 (2026-10-18).
Corrected one missed bilingual label at default:40632, adding `(Blood Rite)` to the already translated `피의 의식`. The D-21689 indexed `not-an-issue` status/evidence is preserved; indexed counts are unchanged and not recounted.
Next batch: D-21691; continue all-resource candidate review and residual checks.
Indexed matches: 46124; accepted=30865, excluded=3011, not-an-issue=12145, uncertain=103.
Remaining unreviewed indexed matches: 0; reviewed unresolved indexed holds: 103. These bounded index counts do not measure the discovery remainder.
Sequential default review through ID 65134 remains completed and is not recounted.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`.
- base: `cd2515bd52d278f27f8a890be095038812927d6c6ab8caf3b0d08c913f0e7e27`.
- default: `4e00ee37b3a5b0aa2d563f20b512a7dbe426b51cd9ef3f1bd41c1210e08c0de6`.
Last batch pre-edit backup and byte validation:
- default: 1 cell; pre `2920f477f227ff84ce183519b1553052f88d1849e8f5d150ce028a8c3baaacf6`; post `4e00ee37b3a5b0aa2d563f20b512a7dbe426b51cd9ef3f1bd41c1210e08c0de6`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21690/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 1 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 4e00ee37b3a5b0aa2d563f20b512a7dbe426b51cd9ef3f1bd41c1210e08c0de6
Last actual CSV-edit backups (retained across no-edit batches):
- affix: 1 cells; pre `9ae001a379b766612293d076eafb5b02a27ac2de70f05f2f98a706f7aef5607c`; post `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21521/locatexts_zh_cn.koalocatext_affix.csv`.
- base: 4 cells; pre `5a5e01bc4a188260fd75719a5360be027d3abed052c0e65a03b51a5e3c9c8a82`; post `cd2515bd52d278f27f8a890be095038812927d6c6ab8caf3b0d08c913f0e7e27`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21685/locatexts_zh_cn.koalocatext_base.csv`.
- default: 1 cell; pre `2920f477f227ff84ce183519b1553052f88d1849e8f5d150ce028a8c3baaacf6`; post `4e00ee37b3a5b0aa2d563f20b512a7dbe426b51cd9ef3f1bd41c1210e08c0de6`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21690/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `d9d0aa52f35684024ba88fae568f9af45fa5f48f6b6d238e1120da3ceb567988`.
Occurrence index: 46124 rows; SHA-256 `aa9c65f980f39e43bd4b1cf86610ecffdebc886a1f6f10e554fe36d465d151e6`.
Proper-name glossary: 2210 entries; SHA-256 `53f534f8eb3b3ad49da93f59cdd70cbe8d4634b7471b76d2eeb8f9b34805b0cb` (unchanged).
Residual bilingual/index audit: PASS; Source/index key differences: missing=0, documented exclusions=0, contextual extras=1064, undocumented extras=0; Source/occurrence comparison: 45060 source matches, 46124 indexed matches, 73430 CSV rows; Terminal matches without a covering bilingual English label: 0.
Data validation: PASS 2210 unique entities; 46124 unique active-aligned occurrences
{"accepted"=>30865, "uncertain"=>103, "excluded"=>3011, "not-an-issue"=>12145}
Report: `work/zh_cn/audit/named-scope-review-D21690-20261018.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21690-20261018.md`.
Corrective source manifest: `work/zh_cn/audit/proper-name-edits-D21690.tsv`.


## Evidence

Focused corrective follow-up to D-21689: its default:40632 occurrence was marked not-an-issue without adding the missing English annotation. English identifies the named Red Legion rite; Japanese 血の儀式 and Chinese 血祭 corroborate. Add only (Blood Rite), preserve the prior terminal index status/evidence, and do not recount.
The English imperative `For the Blood rite!` refers to the same named
Red Legion ceremony as the other D-21689 rows. Korean `피의 의식` was
semantically correct but lacked the required English pairing. Only the
source-supported name span was changed; the particle and exclamation
mark remain intact.

D-21689's report said seven Blood Rite variants were standardized and
treated all eight `not-an-issue` rows as adequate. The batch actually
changed eight rows; default:40632 was the overlooked ninth unpaired
label state (two other rows already had the full pair). This correction
fixes the missed annotation and clarifies the earlier report without
reopening or recasting its terminal index decision.
