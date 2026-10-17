# D-20385: Focused Quake Skill Terminology Review

Date: 2026-10-14

## Scope and Decision

Reviewed every active `base` and `default` row whose English source names
the `Quake` skill: one `base` row and 16 `default` rows. English establishes
that these capitalized occurrences name the skill; Japanese consistently
uses クエイク and Chinese uses 震地 as supporting evidence. Per the user's
confirmation, the canonical Korean display form is `퀘이크(Quake)`.
Ordinary `earthquake` references and lowercase poetic verb uses of `quake`
are not the skill and remain outside this terminology change.

Updated 16 `Texto` cells: `base` ID 1020 and `default` IDs 2604, 11934,
12640, 14688, 15262, 16122, 24514, 32270, 35229, 37338, 38978, 39358,
49183, 57855, and 60635. `default` ID 17917 was already consistently
rendered and was retained. All Quake skill mentions within each reviewed
cell now use `퀘이크(Quake)`, including standalone skill labels and
descriptions/cost labels.

This focused terminology review does not extend the sequential default
review, which remains complete through D-20377 / ID 65134. The prior
uncertain terminology questions at D-4452 / ID 14688 and D-17426 / ID 57855
are resolved by this evidence and the user's identification of Quake as a
skill; their specific dispositions are updated without recalculating any
global tally.

## Verification

- Pre-edit `base` SHA-256:
  `bbe7c14b441a077b25bead2b69fd73a14ae364d6e53523009cbbc128a4c2f55d`.
- Pre-edit `default` SHA-256:
  `b1e6b7f727f7f924ed7fe673d87eb8abe6b362352341f5653892890b505485ef`.
- Byte-identical pre-edit backups:
  `/private/tmp/ko-translate-backups/20261014/before-quake-terminology-D20385/locatexts_zh_cn.koalocatext_base.csv`
  and
  `/private/tmp/ko-translate-backups/20261014/before-quake-terminology-D20385/locatexts_zh_cn.koalocatext_default.csv`.
- Final `base` SHA-256:
  `ae076352cbf75a75b12661e06ca65032059f5c3108e495f7bd1a23b21c432e72`.
- Final `default` SHA-256:
  `f825a2cf617a15267f9ee1c08f7d79b86b10d6df9fdcf6b42c85e1224befe10a`.
- The manifest
  [`quake-terminology-edits-D20385.tsv`](quake-terminology-edits-D20385.tsv)
  records the English, Japanese, Chinese, and Korean before/after text for
  all 17 reviewed source rows. The byte-preserving editor is
  [`apply-quake-terminology-D20385.rb`](apply-quake-terminology-D20385.rb).
- Inverse byte reconstruction, UTF-8 BOM, CSV parsing, row count/order,
  line-ending counts, target `Texto` values, and unchanged non-target cells
  passed verification. Source files under `src/csv/` were read-only; no PAK
  or PAK-derived data was consulted.
- No prior terminal disposition was duplicated and no global tally was
  recalculated.
