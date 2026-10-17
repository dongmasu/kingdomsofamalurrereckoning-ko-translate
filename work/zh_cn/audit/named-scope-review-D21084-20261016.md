# D-21084: Reviewed Proper-Name Batch

Date: 2026-10-16

## Scope

Latest verified proper-name batch: D-21084 (2026-10-16).
Reviewed 23 distinct resource/ID/variant keys: {"accepted"=>14, "not-an-issue"=>9}.
Groups: {"faction:scholia-arcana"=>9, "place:shieldring-keep"=>14}. Last reviewed key: default:58558: / place:shieldring-keep.
Next batch: D-21085; continue source discovery/residual checks; no unreviewed indexed keys.
Indexed matches: 31822; accepted=21092, excluded=2102, not-an-issue=8608, uncertain=20.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 20, in 18 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`.
- base: `1e5b76298e6a75257aa35dc805602c715ba4ea11c63d4d88f889d9550e5045ed`.
- default: `88edd78f8c96ecb54e83285f53ddf37c35155749760a449d6331e1f03d4f7994`.
Last batch pre-edit backups and byte validation:
- default: 14 cells; pre `5e1b5ef837a72803482ce93f0c2607be1e5423114ad8b0c5fc6b790c02d92239`; post `88edd78f8c96ecb54e83285f53ddf37c35155749760a449d6331e1f03d4f7994`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21084/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 14 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 88edd78f8c96ecb54e83285f53ddf37c35155749760a449d6331e1f03d4f7994
Last actual CSV-edit backups (retained across no-edit batches):
- base: 5 cells; pre `f0c7ce23cc13c949e4e83ee6aba5b839bb3a310a9d3d1a1b16b3b9ea673bdbd0`; post `1e5b76298e6a75257aa35dc805602c715ba4ea11c63d4d88f889d9550e5045ed`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21082/locatexts_zh_cn.koalocatext_base.csv`.
- default: 14 cells; pre `5e1b5ef837a72803482ce93f0c2607be1e5423114ad8b0c5fc6b790c02d92239`; post `88edd78f8c96ecb54e83285f53ddf37c35155749760a449d6331e1f03d4f7994`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21084/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `55b19df566de54c4b58a3cef5f6e8c3276e873737b98a2e36423aa93acfa3d2f`.
Occurrence index: 31822 rows; SHA-256 `a37f068e367aabc2bd40dc4a1754ef49a9d655313f81a5dae1275066040146bd`.
Proper-name glossary: 815 entries; SHA-256 `bba5b47ab65f3f2aae7160d3e19bc4cb7f480322b423130870d2d85cbe1f1543`.
Report: `work/zh_cn/audit/named-scope-review-D21084-20261016.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21084-20261016.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21084.tsv`.


## Evidence

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.

## Decisions

- `faction:scholia-arcana` (nine exact rows): accepted missing short-form
  labels at IDs 6162, 31685, and 42870, plus the source-shortened full-name
  label at 16755 and the narrative mention at 56941. IDs 29110, 46328,
  54028, and 56450 already preserve the applicable short or full form.
  English uses `Scholia` on the short rows; the official Korean manual
  identifies Scholia Arcana as a faction (PDF p. 7), with Japanese and
  Chinese corroborating the institution. This is row-scoped; no global
  `Scholia` alias was added.
- `place:shieldring-keep` (14 exact rows): accepted the missing bilingual
  place label at IDs 3629, 9576, 10209, 10933, 33106, 38310, 40780, 46186,
  and 58558. IDs 2499, 2881, 5216, 7563, and 56468 already carry a suitable
  form. English context identifies Shieldring as a Warsworn stronghold and
  recruitment home; Japanese シールドリング corroborates it and Chinese
  盾环 is supporting evidence. The manual supports the Warsworn context but
  does not prescribe a Shieldring spelling. No global short-name alias was
  added.
- Separate source-short-form triage: `default:27686` (`Senshir`) is already
  correctly rendered `센시르(Senshir)` and was not linked to Mel Senshir.
  `default:9360` (`Aglir`) remains an unchanged, row-scoped `uncertain`
  candidate because the isolated label does not establish Mel Aglir or
  another identity. Neither candidate was added to the glossary.

## Residual Reconciliation

The final source/index comparison found 31,621 source matches and 31,822
indexed matches across 73,430 inventory rows. The one source match absent
from the index is the previously documented standalone title
`person:phasmer-humm` at `default:13525`. All 202 contextual index extras
are documented, with zero undocumented extras. No accepted or
`not-an-issue` index row lacks a covering bilingual English label; the one
documented exception is the intentional idiomatic translation for
`monster:crudok` at `default:3851`.

The four legacy pending-discovery packages contain 1,661 distinct
entity/resource/ID/variant keys. All 1,661 are in the active occurrence
index and each entity-specific disposition matches; this is reconciliation
of historical proposals, not a new review or global tally.

The D-21084 generation test initially assumed the pre-edit inventory. It now
reconstructs that input from the verified D-21084 manifest, checks the
generated decisions against that manifest, and separately requires the
active inventory to match the post-edit values.
