# Grouped Context Review: House of Ballads

- Date: 2026-10-12. Decisions: D-19437-D-19440.
- Scope: previously uncertain named-House findings, grouped by the explicit
  English `House of Ballads` referent. English controls the meaning; Japanese
  supplies voice, Chinese cross-checks the named entity. The accepted
  `발라드의 집` precedent is D-711/D-10221 and subsequent corrections
  D-18892, D-19278, D-19328. IDs 24334 and 26126 were already resolved
  and are not counted again.

## Decisions

| Decision | IDs | Result | Evidence |
| --- | --- | --- | --- |
| D-19437 | 2794, 8598, 29916, 30278, 30786, 30909, 37029 | accepted (7) | Explicit English faction reference in each row; Japanese transliterates and Chinese identifies the same House. Replace only its Korean name with the established `발라드의 집`, retaining existing grammar, voice, and other details. ID 37029's “only lead” and 29916's kingship remain supported. |
| D-19438 | 605, 4261, 30980, 45808 | accepted name-only edit; **uncertain remains** (0 reclassified) | Apply the same proven name, without disposing of other questions: D-091 still includes 590 (`For House and Heartbreak!`); D-993 at 4261 retains Glendara naming; D-10038 still includes House of Valor at 30981; D-14016 at 45808 retains Sagrell naming/context. Do not count these as resolved. |
| D-19439 | 11737, 49447, 51454 | not an issue (3) | Their current Korean already uses `발라드의 집` (51454 retains its existing English parenthetical). The short label at 11737 does not need a newly invented parenthetical. No edits. |

## Follow-up D-19440 (not counted)

The same explicit English name appears at standalone `base` 621 / variant
11 and `default` 587. Both still had `발라드 가문` at the first checkpoint.
English, Japanese, and Chinese identify the same House; the earlier
accepted Korean form is `발라드의 집`. Apply that exact name at both IDs.
Neither row was an unresolved key being reclassified in the default
uncertainty total. ID 587's separate Grave Thresh/Gorguath setting
questions are not adjudicated by this name edit. Other House/Telling/
role/location holds remain separate.

## Edits

| ID | Previous House name | Applied House name |
| ---: | --- | --- |
| 605, 2794, 4261 | `하우스 오브 발라드(House of Ballads)` | `발라드의 집(House of Ballads)` |
| 8598 | `하우스 오브 발라드` | `발라드의 집` |
| 29916, 30278, 30786, 30909, 30980, 45808 | `발라드 가문` | `발라드의 집` (29916: `발라드의 집을 다스리는 왕`) |
| 37029 | `발라드의 전당` | `발라드의 집` |

## Verification

- Five ID-aligned resources consulted: English, Japanese, Chinese originals,
  preserved Japanese-derived Korean draft, and active Korean CSV. No runtime
  markers or in-cell line breaks occur in the 11 edited lines.
- Pre-edit SHA-256:
  `6f80a870f122f45d9e87553e4c76d39e547d6194843dc244b20eec82be5ec513`.
- Post-edit SHA-256:
  `548090935d9149be8ea4514afaf3d83e58cebfaded685a078f2257afa3c7a5ac`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-ballads-cluster-D19437/locatexts_zh_cn.koalocatext_default.csv`.
- Replacing only the 11 edited ID lines with their backup equivalents
  reconstructs the original **byte for byte**, including BOM, row order,
  72,011 CRLF endings and 73 bare-LF endings.
- Follow-up D-19440 default pre-edit SHA-256:
  `548090935d9149be8ea4514afaf3d83e58cebfaded685a078f2257afa3c7a5ac`;
  post-edit:
  `67215c90989cd5b530b5e5d5b9df6f7f07be264faf9f4ad65dda1438f39c861d`.
- Follow-up `base` pre-edit SHA-256:
  `3089555293d97b0bb4ecebe6b3604287f754a61ec4f2dc8f3d8262b6a7cf462c`;
  post-edit:
  `8e2abc916ec012d3322fb5a9ea23cb91c3188665c01c7b4bc8f8772b68ef7cd2`.
- Follow-up byte-identical backups:
  `/private/tmp/ko-translate-backups/20261012/before-ballads-followup-D19440/locatexts_zh_cn.koalocatext_default.csv` and
  `/private/tmp/ko-translate-backups/20261012/before-ballads-followup-D19440/locatexts_zh_cn.koalocatext_base.csv`.
  Each file reverses to its own backup by restoring only the one edited
  `Texto` line; all other bytes, BOM, row order and line endings match.
- Totals unchanged by follow-up: **2,275 accepted / 24,958 not an issue /
  11,291 uncertain** (38,524). Resume at **D-19441**, grouping remaining
  unresolved findings; do not restart a contiguous 50-ID scan.
