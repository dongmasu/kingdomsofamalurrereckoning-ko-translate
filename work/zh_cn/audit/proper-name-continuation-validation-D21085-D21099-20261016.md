# Proper-Name Continuation Validation: D-21085-D-21099

Date: 2026-10-16

## Scope And Outcome

The continuation reviewed 497 distinct CSV row keys in 504 discovery-row
events, plus two explicitly corrective particle-row events. There are
305 edit events on 298 distinct cells: 291 `default` events and 14 `base`
events; `affix` is unchanged. Repeated cells reflect separately documented
entity work or the final particle correction, not new globally unique rows.
Nineteen new definitions bring the glossary from 815 to 834 entities.

- D-21085/D-21086: 59 row-scoped Motus candidates, 37 edits, 19 unchanged,
  three exclusions; no global Motus alias.
- D-21087/D-21088: 69 Firstsworn rows / 73 entity keys, 31 edits, two
  unchanged, 36 complete-place exclusions. Forge/Shrine remain separate.
- D-21089: two existing Hall-place extensions for source plural/typo forms.
- D-21090/D-21092: 145 Eamonn/Nyralim rows / 181 entity keys, 98 edits,
  43 unchanged, four Caer-only exclusions; seven new definitions.
- D-21093: five complete Motus document titles, all accepted.
- D-21094/D-21098: 224 Tirnoch/Esharra rows / 239 entity keys, 130 edits,
  90 unchanged, four chant/opaque-marker exclusions; four new definitions.
- D-21099: correct three singular Firstsworn particles on two already
  accepted rows. No new key and no status-count increase.

Independent read-only review matched all 69 Firstsworn source rows and
found the three particle errors, now corrected at D-21099. It also matched
all 145 Eamonn/Nyralim and all 224 Tirnoch/Esharra source rows, with no
further identity or compound-name boundary findings. The Tirnoch/Esharra
review observed an intermediate application state; final regression and
byte checks subsequently verified every final value.

## Verification

The existing 693-stage reverse verification through D-21084 completed
successfully, reconstructing the recorded pre-D-20390 files. The new
15-batch reverse verification through D-21099 also passed and reconstructs
the exact D-21084 active hashes:

- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`
- base: `1e5b76298e6a75257aa35dc805602c715ba4ea11c63d4d88f889d9550e5045ed`
- default: `88edd78f8c96ecb54e83285f53ddf37c35155749760a449d6331e1f03d4f7994`

Every new edited batch has an immediate byte-identical backup and passed
ordered-row/key/variant checks, exact BOM and mixed line-ending sequence
checks, non-target cell/byte masking, target Texto comparisons, and inverse
reconstruction. Row counts remain affix 3,451 / base 4,844 / default 65,135
(73,430 total). Source CSVs were read-only. PAKs and PAK-derived resources
were not investigated; sidecars and unrelated files were not edited.

`verify-proper-name-continuation-D21085.rb` reconstructs all 31,822 prior
index rows, restoring only their then-current Korean text. The reconstructed
index SHA-256 is exactly
`a37f068e367aabc2bd40dc4a1754ef49a9d655313f81a5dae1275066040146bd`.
Thus all prior entity keys, dispositions, evidence, and order are preserved,
including the reconciled 1,661 legacy pending-package keys.

Final data validation: 834 unique glossary entries, 32,381 unique aligned
entity/row keys; accepted 21,396 / excluded 2,203 / not-an-issue 8,762 /
uncertain 20. D-21099 leaves these counts unchanged.

Final source/index comparison: 32,119 source matches, 32,381 indexed
matches, one documented exclusion (`person:phasmer-humm`, default 13525),
263 documented contextual extras, zero undocumented extras, and zero
terminal rows missing a covering bilingual label. The one intentional
Crudok idiom remains documented. The residual checker now fails if missing
bilingual labels are found, rather than merely printing them.

All newly added batch regression tests passed, as did the D-21084
short-form test and scout-normalization test. Historical tests use exact
later-manifest replay where needed, so subsequent independent terminology
edits on a shared cell are not mistaken for drift.

Final active SHA-256:

- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`
- base: `1b7a57174c7a790c4872fdf005a144b050b2570104035ccc310bd53cf09defc8`
- default: `7ba8ec365121f4e14d5c3c1f34747e46925107200eb48122c0531ff2c34e2d7a`

Last actual pre-edit backups:

- base: `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21094/locatexts_zh_cn.koalocatext_base.csv`
  (SHA-256 `b28746ba1c4c7a125d94940dc4182428b700dd441be047572996ae27973d28f5`).
- default: `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21099/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `62c395a402b1b7a5c08c54141750350a9f64a6c10588bc0db2db44a324885c37`).

## Resume

Next batch: **D-21100**. Last corrected key: `default:62666`, at D-21099;
last new-discovery key: `default:64994`, at D-21098. There is no next
sequential default ID: the sequential review already completed ID 65134.

There are zero unreviewed indexed keys. The 20 reviewed indexed holds
occupy 18 distinct rows; they are not the total extent of remaining
unregistered-name discovery. Do not reopen them without new evidence.
The separate unregistered `default:9360` Aglir candidate remains uncertain;
`default:27686` Senshir remains correctly paired and was not linked to Mel
Senshir. Neither is a global alias.

Continue English-anchored source discovery across all three resources.
Reconcile heuristic full-name/title candidates against existing component
entities and historical decisions before registering or counting anything.
The scout's generic words and lexical crosslinks are candidates, not
identities or an exhaustive remaining-work count. Do not claim overall
proper-name discovery complete.

No build, ZIP replacement, game installation, commit, push, or release was
performed. These are verified working-CSV changes, not an updated release.
