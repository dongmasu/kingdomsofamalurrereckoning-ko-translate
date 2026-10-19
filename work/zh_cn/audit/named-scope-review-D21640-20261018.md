# D-21640: Residual Source-Label Annotations

Date: 2026-10-18

## Scope

Reviewed five exact, isolated English labels across the aligned
affix/base/default source inventory. English controls the exact source
spelling; Japanese and Chinese corroborate the labels. Add only the
English annotation to the established Korean rendering. These are
source-label decisions, not claims that each item is a skill, person,
place, or other registered entity.

| Key | English | Disposition | Korean old | Korean new |
| --- | --- | --- | --- | --- |
| `default:34611:` | `Cynric Pit` | `accepted` | `신릭 피트` | `신릭 피트(Cynric Pit)` |
| `default:26209:` | `Winter's Embrace` | `accepted` | `겨울의 포옹` | `겨울의 포옹(Winter's Embrace)` |
| `default:39445:` | `WintersEmbrace` | `accepted` | `겨울의 포옹` | `겨울의 포옹(WintersEmbrace)` |
| `default:44734:` | `Aftershock` | `accepted` | `여진` | `여진(Aftershock)` |
| `default:53849:` | `Upheaval` | `accepted` | `격변` | `격변(Upheaval)` |

`Cynric Pit` remains separate from Cynric Mine/Quarry, the Cynric
family, and any individual. `Winter's Embrace` and `WintersEmbrace`
preserve their distinct source spellings despite aligned Japanese,
Chinese, and Korean renderings. Only the title-case isolated
`Upheaval` label was paired; lowercase prose at default:1085/10183 was
not edited.

`Warding Blast` was already resolved in D-21622 and is not reopened.
`Eyrie Peak` default:5973 already has its exact English annotation.
`Eryie Peak` default:58845 remains unchanged under D-17792: whether
`Peak` is within the proper name is unresolved. No equivalence between
Eyrie Peak and Eryie Peak is inferred.

## Validation

- default: PASS 5 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 d9b968df01ef814bb9bb6bc58725e9a633752768a8ec95087cb1dc2eb051e7fe
- Glossary, occurrence-index, candidate-shortlist and non-target CSV bytes remained unchanged.
- Source/index key differences: missing=0, documented exclusions=0, contextual extras=1064, undocumented extras=0
- Source/occurrence comparison: 44468 source matches, 45532 indexed matches, 73430 CSV rows
- Terminal matches without a covering bilingual English label: 0
- PASS 2165 unique entities; 45532 unique active-aligned occurrences
{"accepted"=>30458, "uncertain"=>103, "excluded"=>2966, "not-an-issue"=>12005}

No PAK or PAK-derived data was consulted. Full proper-name
discovery/residual validation remains incomplete.

<!-- current-proper-name-batch:start -->
## Latest Verified Proper-Name Batch

Latest verified proper-name batch: D-21640 (2026-10-18).
Reviewed five isolated source-label rows: five accepted Texto annotations; no entity category, identity, alias, glossary entry, or occurrence disposition was added. `Cynric Pit`, `Aftershock`, `Winter's Embrace`, `WintersEmbrace`, and the label `Upheaval` now carry their exact English source forms.
`Warding Blast` was already covered by D-21622 and was not reopened. Ordinary lowercase `upheaval` at default:1085/10183 remains prose and unchanged. `Eyrie Peak` at default:5973 retains its existing complete bilingual label; `Eryie Peak` at default:58845 remains under the historical D-17792 uncertainty and was not reopened.
Indexed matches: 45532; accepted=30458, excluded=2966, not-an-issue=12005, uncertain=103.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 103, in 98 distinct CSV row keys; these are not the complete residual discovery set.
Sequential default review through ID 65134 remains completed and is not recounted.
The separate variant-consistency shortlist has 305 terms (registered-reviewed=305); it is not exhaustive. D-21639 reconciled the all-resource heuristic refresh at 29,628 phrases versus the saved 29,604-phrase baseline; neither figure is a completion percentage.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`.
- base: `8f1af775c1a844ad3c6b35eb5e4aa75d70d706114db4deb39ef370742d8b32a8`.
- default: `d9b968df01ef814bb9bb6bc58725e9a633752768a8ec95087cb1dc2eb051e7fe`.
Last batch pre-edit backups and byte validation:
- default: 5 cells; pre `4ccadcfcce3bd1efc7592a84ff3aadff9982891b1425a52268c8e536a7a1c358`; post `d9b968df01ef814bb9bb6bc58725e9a633752768a8ec95087cb1dc2eb051e7fe`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21640/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 5 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 d9b968df01ef814bb9bb6bc58725e9a633752768a8ec95087cb1dc2eb051e7fe
Last actual CSV-edit backups (retained across no-edit batches):
- affix: 1 cells; pre `9ae001a379b766612293d076eafb5b02a27ac2de70f05f2f98a706f7aef5607c`; post `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21521/locatexts_zh_cn.koalocatext_affix.csv`.
- base: 12 cells; pre `f458e83426320483117b5448406b5bfe77f6c8ae83886b3db1edeb227e268c6c`; post `8f1af775c1a844ad3c6b35eb5e4aa75d70d706114db4deb39ef370742d8b32a8`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21635/locatexts_zh_cn.koalocatext_base.csv`.
- default: 5 cells; pre `4ccadcfcce3bd1efc7592a84ff3aadff9982891b1425a52268c8e536a7a1c358`; post `d9b968df01ef814bb9bb6bc58725e9a633752768a8ec95087cb1dc2eb051e7fe`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21640/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `84b8d287c3260c8ed4dc1219a136a21bab324053b9bbac79ef28fd435b86c702`.
Occurrence index: 45532 rows; SHA-256 `2505aea3e3b8ed5dd7294f6ddaf2bbd30684b8b1bb8e1df56b5c5a46cd12e19d` (unchanged).
Proper-name glossary: 2165 entries; SHA-256 `f684a3595316c6ad465a7fa95453f66277bf6ae7dc2b7bc1a77ceec72d7ab3be` (unchanged).
Report: `work/zh_cn/audit/named-scope-review-D21640-20261018.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21640-20261018.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21640.tsv`.
D-21639 all-resource refresh: `work/zh_cn/audit/proper-name-candidate-refresh-D21639-20261017.md`; evidence TSV: `work/zh_cn/audit/proper-name-candidate-refresh-D21639.tsv`.
Residual source/index audit: PASS; Source/index key differences: missing=0, documented exclusions=0, contextual extras=1064, undocumented extras=0; Source/occurrence comparison: 44468 source matches, 45532 indexed matches, 73430 CSV rows; Terminal matches without a covering bilingual English label: 0; Documented row-scoped Syl place labels: 5.
Data validation: PASS 2165 unique entities; 45532 unique active-aligned occurrences
{"accepted"=>30458, "uncertain"=>103, "excluded"=>2966, "not-an-issue"=>12005}
Next: D-21641; continue source-local discovery without reopening terminal decisions. Preserve the unresolved Eryie Peak scope and distinguish isolated labels from confirmed entity categories.
<!-- current-proper-name-batch:end -->
