# D-21547 Edit Addendum

Resume verification (2026-10-17): all 28 edits passed inverse byte validation
against the D-21547 backup, using the D-21548 backup as the exact subsequent
state. The earlier single-batch check against post-D-21548 active bytes is
superseded. See `proper-name-chain-validation-D21548-20261017.md`.

Latest verified proper-name batch: D-21547 (2026-10-17).
Reviewed 50 distinct resource/ID/variant keys: {"uncertain"=>6, "excluded"=>15, "accepted"=>28, "not-an-issue"=>1}.
Groups: {"title:paragon-fate"=>21, "item:fae-cairn"=>29}. Last reviewed key: default:38082: / item:fae-cairn.
Next batch: D-21548; first unreviewed indexed key: item:fae-cairn / default:38793:.
Indexed matches: 43311; accepted=28827, excluded=2829, needs-context=29, not-an-issue=11531, uncertain=95.
Remaining unreviewed indexed matches: 29, in 29 distinct CSV row keys.
Reviewed unresolved indexed holds: 95, in 92 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive; it does not establish an overall completion percentage.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`.
- base: `1c5b7cfe9fc2021dd82cef0b1e658fda4db36c45ade91b578a58f53d76c57dd4`.
- default: `0336a409e36b5e35ba3125ef01c1e3416b4fa4ae5f5a4bfd272e0eb229abdefe`.
Last batch pre-edit backups and byte validation:
- default: 28 cells; pre `ccbe1b9511fea3fd28116ba43188619fd35b0a12bdc83ca99ab6762602cf824f`; post `0336a409e36b5e35ba3125ef01c1e3416b4fa4ae5f5a4bfd272e0eb229abdefe`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21547/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 28 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 0336a409e36b5e35ba3125ef01c1e3416b4fa4ae5f5a4bfd272e0eb229abdefe
Last actual CSV-edit backups (retained across no-edit batches):
- affix: 1 cells; pre `9ae001a379b766612293d076eafb5b02a27ac2de70f05f2f98a706f7aef5607c`; post `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21521/locatexts_zh_cn.koalocatext_affix.csv`.
- base: 2 cells; pre `0eed77cf350e9095b722dfd42a37ddd7cada7b4ee890825785d9c20e076f6e3d`; post `1c5b7cfe9fc2021dd82cef0b1e658fda4db36c45ade91b578a58f53d76c57dd4`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21540/locatexts_zh_cn.koalocatext_base.csv`.
- default: 28 cells; pre `ccbe1b9511fea3fd28116ba43188619fd35b0a12bdc83ca99ab6762602cf824f`; post `0336a409e36b5e35ba3125ef01c1e3416b4fa4ae5f5a4bfd272e0eb229abdefe`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21547/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `a0b51c4f46bf38e42e054b1a289f0a353daee12797c4e1305ad29eba770b45d6`.
Occurrence index: 43311 rows; SHA-256 `d4888b768cd1a13d535770bff27ffd9539a491ea226826872c6211624bce4c0f`.
Proper-name glossary: 1812 entries; SHA-256 `b8552a04763ff36dbd2f2c7361e43dd7d56db0ff154e060a9fd1d68aaf76fef2`.
Report: `work/zh_cn/audit/named-scope-review-D21547-20261017.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21547-20261017.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21547.tsv`.


The byte-preserving editor and separate verifier checked BOM, the exact
mixed line-ending sequence, headers, row count/order, keys/variants,
target Texto values, unchanged non-target cells/bytes, and inverse
reconstruction against byte-identical pre-edit backups.


### D-21547-D-21548: Fae Cairns And Paragon

Registered `item:fae-cairn` as `페이 케언(Fae Cairn)` and
`title:paragon-fate` as `파라곤(Paragon)`. Reviewed 79 distinct
resource/ID/variant keys in consecutive 50/29-key batches: 51 Cairn
source keys and 28 Paragon candidate keys. The Fae objects are explicitly
defined as magical Lorestones in the English corpus; Japanese ケルン and
Chinese 灵球/灵族堆石标 corroborate. Standardized full and contextual
short labels without nesting `Fae` inside the complete `Fae Cairn` name.
The separate Tinniat burial cairn at base:3658 is excluded.

The standalone Paragon fate/title at default:32495/default:62731 is
paired. Existing `Paragon Barghest` and `Paragon Thresh` compound monster
names remain atomic and are excluded from the new title scope. No
generic `paragon` use is treated as this title. The six `Paragon's`
affix variants remain uncertain because the isolated label and aligned
translations do not settle whether they name this fate or describe a
generic exemplar.

Prior dispositions for other entities on shared rows remain intact.
Full proper-name discovery remains incomplete; this candidate pass is
not an exhaustive completion claim.
