# D-21899: Gelda Name-Spelling Consistency

Date: 2026-10-20

## Finding

At `default:36239`, English names Gelda Tash, Japanese uses
`ゲルダ・タッシュ`, and Chinese uses `盖尔达·塔什`. Korean had
`게르다 타시`, unlike the repeated full name `겔다 타시` at
`default:690` and `default:2911`. The short name Gelda is also consistently
`겔다` at `default:9527` and `default:51964`.

Correct only `게르다` to `겔다` at `default:36239`, preserving the rest of
the funding sentence. D-11667 previously judged this row's shrine-repair
and funding meaning `not an issue`; that decision remains valid for those
questions. New cross-row name evidence supersedes it only for the Korean
spelling of Gelda. Fate Shrine terminology, the source's loan/funding
nuance, and all other sentence content remain outside this correction.
No occurrence-index entry existed for this name at the target key; none was
added.

## Focused Verification

The byte-preserving editor and independent manifest verifier passed for one
`Texto` cell across 65,135 ordered rows. BOM, mixed line endings, row order,
non-target bytes, and inverse reconstruction against the byte-identical
backup were preserved.

- Manifest: `proper-name-edits-D21899.tsv`.
- Backup: `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21899/locatexts_zh_cn.koalocatext_default.csv`.
- Default SHA-256 before: `ed06bd6d5ee46ac0f0d2e1db3dc8e4fa6e09b812ab3bc340365736a2a0463e4b`.
- Default SHA-256 after: `55042218b4282fb372c0f5fd4674934f81028472883cba141a545f7415eaa461`.

No glossary, occurrence-index, other resource, or release artifact changed.
No full residual/format audit, package build, or in-game validation was run.
