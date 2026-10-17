# D-21094: Reviewed Proper-Name Batch

Date: 2026-10-16

## Scope

Latest verified proper-name batch: D-21094 (2026-10-16).
Reviewed 50 distinct resource/ID/variant keys: {"not-an-issue"=>34, "accepted"=>16}.
Groups: {"place:esharra"=>24, "title:esharra-song"=>1, "deity:tirnoch"=>26, "artifact:eyes-of-tirnoch"=>3}. Last reviewed key: default:11114: / deity:tirnoch.
Next batch: D-21095; first unreviewed indexed key: artifact:eyes-of-tirnoch / default:12035:.
Indexed matches: 32381; accepted=21281, excluded=2189, needs-context=185, not-an-issue=8706, uncertain=20.
Remaining unreviewed indexed matches: 185, in 174 distinct CSV row keys.
Reviewed unresolved indexed holds: 20, in 18 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`.
- base: `1b7a57174c7a790c4872fdf005a144b050b2570104035ccc310bd53cf09defc8`.
- default: `c59d1fb390b601d3423480954eb6f60d56bf38796afa57d73ee913d9168d0744`.
Last batch pre-edit backups and byte validation:
- base: 3 cells; pre `b28746ba1c4c7a125d94940dc4182428b700dd441be047572996ae27973d28f5`; post `1b7a57174c7a790c4872fdf005a144b050b2570104035ccc310bd53cf09defc8`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21094/locatexts_zh_cn.koalocatext_base.csv`.
- default: 13 cells; pre `2268d1a00cb440dfb31c917083b3ae24be6de638dc730a83164afa2d3305508b`; post `c59d1fb390b601d3423480954eb6f60d56bf38796afa57d73ee913d9168d0744`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21094/locatexts_zh_cn.koalocatext_default.csv`.
base: PASS 3 cells; 4844 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 1b7a57174c7a790c4872fdf005a144b050b2570104035ccc310bd53cf09defc8
default: PASS 13 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 c59d1fb390b601d3423480954eb6f60d56bf38796afa57d73ee913d9168d0744
Last actual CSV-edit backups (retained across no-edit batches):
- base: 3 cells; pre `b28746ba1c4c7a125d94940dc4182428b700dd441be047572996ae27973d28f5`; post `1b7a57174c7a790c4872fdf005a144b050b2570104035ccc310bd53cf09defc8`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21094/locatexts_zh_cn.koalocatext_base.csv`.
- default: 13 cells; pre `2268d1a00cb440dfb31c917083b3ae24be6de638dc730a83164afa2d3305508b`; post `c59d1fb390b601d3423480954eb6f60d56bf38796afa57d73ee913d9168d0744`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21094/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `43cc0ca36e24056c4c50578dc9b80821a086a8bca994a791ab6a09004d6c9f90`.
Occurrence index: 32381 rows; SHA-256 `3ca47aeb95b0cb9804ae97748702899cff5b45dc79280c5a52f5c7ee71a10699`.
Proper-name glossary: 834 entries; SHA-256 `26dca34288f0b625a53e4f3e982055e025933e0487d89a7ccdcf063b1d001ca4`.
Report: `work/zh_cn/audit/named-scope-review-D21094-20261016.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21094-20261016.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21094.tsv`.


## Evidence

D-21094 through D-21098 review 224 distinct CSV keys for 239
entity-specific source matches: 154 `Tirnoch`, 71 `Esharra`, 13 complete
`Eye/Eyes of Tirnoch` artifact names, and one complete `Esharra's Song`
label. There are 130 edited cells, 90 unchanged rows, and four unchanged
scope exclusions. `default:18908` contains both deity and realm names,
so its single edited cell has two accepted entity dispositions. Do not
mistake the 131 accepted entity matches for 131 distinct cell edits.

The registered deity name reuses the established
`티르노크(Tirnoch)`, replacing `티아노크`, `티어노크`, `티르녹`,
and `티어녹` where explicitly supported by English `Tirnoch`, Japanese
`ティアノック`, and Chinese `提尔诺克`. English explicitly describes
Gadflow's god and the being imprisoned in the Amethyn; no new ontology,
speaker identity, or dragon description is inferred. At `21802`,
Japanese omits the subject while English and Chinese explicitly name it.
Honorific `님` and `께서` are preserved.

English `default:19147/21220` identifies the Eyes of Tirnoch as magical
scrying mirrors, not the deity's anatomical eyes. Pair this complete
artifact name atomically, preserving singular `Eye` at `base:1653`,
plural `Eyes` elsewhere, and the literal quotes at `base:3147`.
The figurative gaze at `default:2317` is not renamed as the artifact.
All 13 artifact-only name components are excluded from deity-component
rewriting; their separate artifact decisions remain recorded.

Esharra is explicitly a realm, not a new deity/person or an inferred
synonym for every "Chaos realm" mention. Preserve `에샤라(Esharra)`,
the already established Korean form. Japanese `イーシャラー` and the
variant `エシャッラ` at `61754`, and Chinese `艾莎拉`, `艾沙拉`,
and `艾萨拉` corroborate the same source name. The complete
`base:184` label becomes `에샤라의 노래(Esharra's Song)`;
its subtype is not inferred from the title alone. Existing Amman
statue/key wording and other generic descriptors remain unchanged.

Preserve the complete Qualla chants at `default:35322/46088`.
Preserve localized opaque style spans at `14088/45747` exactly as
`{*1티르노크}`; this pass does not insert a bilingual label inside those
runtime markers. These four explicit exclusions are not missing/forgotten
review rows. The latter two are lexical hits found by the source token
matcher despite a digit before the name, not ordinary word-boundary hits.
The source inventory includes one shared Tirnoch/Esharra row, explaining
the 224-row union rather than a sum of separate entity counts.

All three resources were searched. There are 14 `base` rows and 210
`default` rows, with no `affix` occurrence. The official manual's
Fae/faction background is contextual; it does not prescribe these names.
Regression tests verify source-locale exceptions, full-label separation,
quoted labels, chants, opaque markers, and exact approved substitutions.

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.
