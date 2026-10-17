# D-21090: Reviewed Proper-Name Batch

Date: 2026-10-16

## Scope

Latest verified proper-name batch: D-21090 (2026-10-16).
Reviewed 50 distinct resource/ID/variant keys: {"accepted"=>24, "not-an-issue"=>23, "excluded"=>3}.
Groups: {"person:eamonn"=>22, "place:eamonn-path"=>1, "person:nyralim"=>28, "item:nyralim-grace"=>1, "item:shard-of-nyralim"=>1, "place:eamonn-isle"=>10, "place:eamonn-fortress"=>1}. Last reviewed key: default:23229: / person:eamonn.
Next batch: D-21091; first unreviewed indexed key: person:eamonn / default:24101:.
Indexed matches: 32137; accepted=21186, excluded=2162, needs-context=117, not-an-issue=8652, uncertain=20.
Remaining unreviewed indexed matches: 117, in 95 distinct CSV row keys.
Reviewed unresolved indexed holds: 20, in 18 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`.
- base: `d22c8e946a0760e6aa2600890071fc153f9321658136e7998b13c6fa5f18b9ff`.
- default: `ef159c3b9cf08ff5098e124cc87eec6ec6e10cd0523115b104e6b0c42d790555`.
Last batch pre-edit backups and byte validation:
- base: 6 cells; pre `1e5b76298e6a75257aa35dc805602c715ba4ea11c63d4d88f889d9550e5045ed`; post `d22c8e946a0760e6aa2600890071fc153f9321658136e7998b13c6fa5f18b9ff`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21090/locatexts_zh_cn.koalocatext_base.csv`.
- default: 18 cells; pre `a030a10090e451145390c105a022cdb7c3d7cace4390f62ec88314a3c556dded`; post `ef159c3b9cf08ff5098e124cc87eec6ec6e10cd0523115b104e6b0c42d790555`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21090/locatexts_zh_cn.koalocatext_default.csv`.
base: PASS 6 cells; 4844 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 d22c8e946a0760e6aa2600890071fc153f9321658136e7998b13c6fa5f18b9ff
default: PASS 18 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 ef159c3b9cf08ff5098e124cc87eec6ec6e10cd0523115b104e6b0c42d790555
Last actual CSV-edit backups (retained across no-edit batches):
- base: 6 cells; pre `1e5b76298e6a75257aa35dc805602c715ba4ea11c63d4d88f889d9550e5045ed`; post `d22c8e946a0760e6aa2600890071fc153f9321658136e7998b13c6fa5f18b9ff`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21090/locatexts_zh_cn.koalocatext_base.csv`.
- default: 18 cells; pre `a030a10090e451145390c105a022cdb7c3d7cace4390f62ec88314a3c556dded`; post `ef159c3b9cf08ff5098e124cc87eec6ec6e10cd0523115b104e6b0c42d790555`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21090/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `c6499e24acf5ccde4bd2e10b444935146816099dacfc036089101ee46aa84774`.
Occurrence index: 32137 rows; SHA-256 `5a977984b66365b8860b0e8396c81d7a48766ffe65dc66317f6590d72e0331b6`.
Proper-name glossary: 825 entries; SHA-256 `69d44b35babe9a261fbf4e37b4f1e4b8a40151c6e137a5e6645836b444faaeb7`.
Report: `work/zh_cn/audit/named-scope-review-D21090-20261016.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21090-20261016.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21090.tsv`.


## Evidence

D-21090 through D-21092 review 145 distinct CSV keys (six `base`,
139 `default`, no `affix`) for seven newly registered entities and 181
entity-specific occurrence keys. There are 98 accepted cell edits,
43 unchanged `not-an-issue` rows, and four unchanged Caer-only exclusions.
No historical global translation tally or prior unrelated entity decision
is reopened.

`Eamonn` is Eagonn's father and Caerwyn's grandfather, explicitly confirmed
in English at `default:40361/57612`, Japanese `イーモン`, and Chinese
`埃蒙`. The 31 person-reference rows previously contain 16 `이먼`,
10 `이몬`, and seven `에이먼` spans. Reuse `이먼(Eamonn)`; do not
conflate it with `이곤(Eagonn)`. At `default:9342`, Korean repeats the
named speaker where English says "him"; retain and pair both already
present references without adding a new identity.

The island has 31 exact source keys using `Eamonn's Isle`,
`Isle of Eamonn`, `The Isle of Eamonn`, or `Eamonn Isle`. Use the common
Korean `이먼의 섬` with each row's complete English form. `Eamonn's Path`
and `Eamonn's Fortress` remain separate places. Person-component matches
in complete place labels are excluded from person normalization.

`Nyralim` is the named sentient mortal tree, not a Fae or a new place.
The 74 applicable person/tree rows previously contain 63 `니랄림`,
11 `니라림`, two `나이랄림`, and one `나이라림` spans. Reuse
`니랄림(Nyralim)`. Japanese `ニラリム` and Chinese `尼拉利姆`
corroborate; four poem rows use the Chinese variant `奈拉利姆`.
Japanese omits the explicit subject at `default:58604`, but its oldest
mortal description and the English/Chinese subject establish the identity.
At `56692`, Japanese uses the place name while English explicitly names
the tree; keep English as the meaning authority.

The already reviewed `Caer Nyralim` labels are preserved byte-for-byte.
Four Caer-only rows are excluded; `default:28854` contains both a person
and a place and retains both already correct labels. The two `base` item
labels receive complete `Nyralim's Grace` / `A Shard of Nyralim`
parentheticals, without inventing their full titles in ordinary sap/wood
descriptions. Honorific particles, father/son references, tokens, and line
breaks are explicitly tested. Manual PDF p. 7 provides Warsworn faction
context but no personal-name spelling; its non-exhaustiveness is not a hold.

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.
