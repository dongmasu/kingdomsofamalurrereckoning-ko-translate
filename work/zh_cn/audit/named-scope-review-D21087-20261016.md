# D-21087: Reviewed Proper-Name Batch

Date: 2026-10-16

## Scope

Latest verified proper-name batch: D-21087 (2026-10-16).
Reviewed 50 distinct resource/ID/variant keys: {"excluded"=>25, "accepted"=>24, "not-an-issue"=>1}.
Groups: {"faction:firstsworn"=>50, "place:forge-of-the-firstsworn"=>3, "place:shrine-of-the-firstsworn"=>1}. Last reviewed key: default:49934: / faction:firstsworn.
Next batch: D-21088; first unreviewed indexed key: faction:firstsworn / default:49935:.
Indexed matches: 31954; accepted=21153, excluded=2134, needs-context=19, not-an-issue=8628, uncertain=20.
Remaining unreviewed indexed matches: 19, in 19 distinct CSV row keys.
Reviewed unresolved indexed holds: 20, in 18 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`.
- base: `1e5b76298e6a75257aa35dc805602c715ba4ea11c63d4d88f889d9550e5045ed`.
- default: `881d253077c1843a49c43002f7704f97d0bd381a338603edb943772b3ca7bf56`.
Last batch pre-edit backups and byte validation:
- default: 24 cells; pre `fc2ea58aa06f09b78924c44bb5433fde1a1a52398b95430a67d917fdbf658c64`; post `881d253077c1843a49c43002f7704f97d0bd381a338603edb943772b3ca7bf56`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21087/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 24 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 881d253077c1843a49c43002f7704f97d0bd381a338603edb943772b3ca7bf56
Last actual CSV-edit backups (retained across no-edit batches):
- base: 5 cells; pre `f0c7ce23cc13c949e4e83ee6aba5b839bb3a310a9d3d1a1b16b3b9ea673bdbd0`; post `1e5b76298e6a75257aa35dc805602c715ba4ea11c63d4d88f889d9550e5045ed`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21082/locatexts_zh_cn.koalocatext_base.csv`.
- default: 24 cells; pre `fc2ea58aa06f09b78924c44bb5433fde1a1a52398b95430a67d917fdbf658c64`; post `881d253077c1843a49c43002f7704f97d0bd381a338603edb943772b3ca7bf56`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21087/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `d23f3ea9e348bb5ed581eebaaf1c3f93f8cb3e52d48c7b18f9b6b844b298c672`.
Occurrence index: 31954 rows; SHA-256 `34eae27b8d51403137ebc7fa5eb5fd49f555c0b2cb26699728443d6d8c38fa76`.
Proper-name glossary: 818 entries; SHA-256 `09f148ef54d8d2c4e302e69133a1db05fda6f71ab59695a35e816cac4ee468a0`.
Report: `work/zh_cn/audit/named-scope-review-D21087-20261016.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21087-20261016.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21087.tsv`.


## Evidence

Post-application independent review found three singular-particle errors
introduced by the consonant-final `퍼스트스원` to vowel-final `첫서약자`
change. These are corrected explicitly at D-21099 on `default:51339`
(`이` to `가`, `으로서` to `로서`) and `default:62666` (`이라` to
`라`). The historical D-21087/D-21088 manifests remain unchanged;
the correction has a separate immediate backup, manifest, and regression
test and does not increase occurrence or accepted-status counts.

Together with D-21088, this registers and reviews `Firstsworn` as the
historical Warsworn group, not a synonym of the modern guild. English
`default:23047` explicitly defines the early Niskaru hunters; Japanese
`ファーストスウォーン` and Chinese `首誓者` corroborate the identity.
Manual PDF p. 7 provides Warsworn faction context, not a Firstsworn spelling.
Reuse the already established `첫서약자` root rather than alternating among
`퍼스트스원`, `최초의 맹세자`, and spaced `첫 서약자`.

There are 69 distinct CSV keys and 73 new entity-specific occurrence keys:
69 group matches, three complete `Forge of the Firstsworn` place matches,
and one `Shrine of the Firstsworn` place match. Of these, 31 cells change,
two already canonical group references stay unchanged, and 36 complete
Hall/Halls references stay unchanged in this pass. The group disposition
is `excluded` for all 40 complete place-name hits, including the four
Forge/Shrine cells separately accepted under their own place entities.
Previously terminal Hall-place index keys are not reopened or recounted.

`default:51339` contains three `Firstsworn` spellings and one
`Firstworn` source typo in its Eagonn sentence. Japanese and Chinese
confirm all four group references. `Firstworn` appears only there and in
the Hall travel objective at `default:44231`; both source keys were
checked. The English source remains immutable.

Male/female dialogue at `default:44286/48850`, honorific `께서` at
`31960`, plural `들`, particles, and all four references in the long book
at `51339` are preserved by explicit tests. `default:42039` corrects
ordinary `초대 서약` to the historical group name, and `59273` restores
the missing proper group identity in the `선서자` comparison. Descriptive
forge-room/chapel references keep the group label; the capitalized Forge
and Shrine names instead receive atomic complete English labels.

The plural Hall place at `default:40118` and source-typo objective at
`44231` are explicitly excluded here and continued as a separate
existing-place extension at D-21089. Across all three resources, there
is one applicable `base` row and no applicable `affix` row.

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.
