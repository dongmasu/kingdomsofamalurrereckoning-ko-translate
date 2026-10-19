# D-21821: The Proud Warsworn Short-Label Review

Date: 2026-10-18

## Scope

Reviewed both bounded `The Proud Warsworn` label memberships. At
default:4852, replaced the incomplete component annotation with the complete
source label `긍지 높은 워스원(The Proud Warsworn)`, matching the already
paired label at base:1769:11.

The English source, Japanese `誇り高きウォースウォーン`, and Chinese
`骄傲的誓战者` support the “proud Warsworn” wording. D-20771's existing
`faction:warsworn` `not-an-issue` status at default:4852 remains intact.
No new entity or glossary row was registered, and no indexed status,
cumulative count, or translation-quality judgment was changed.

Next batch: D-21822; continue refreshed short-label snapshot
`proper-name-short-label-discovery-D21821.tsv` (14 bounded groups; first
`The Travelers`; not exhaustive or a completion estimate).

## Exact Label Evidence

- `default:4852:` (accepted): EN `The Proud Warsworn`; JA
  `誇り高きウォースウォーン`; ZH `骄傲的誓战者`; KO
  `긍지 높은 워스원(Warsworn)` -> `긍지 높은 워스원(The Proud Warsworn)`.
- `base:1769:11` (not-an-issue): EN `The Proud Warsworn`; JA
  `誇り高きウォースウォーン`; ZH `骄傲的誓战者`; KO
  `긍지 높은 워스원(The Proud Warsworn)` retained.

## Verification

The active default CSV changed only at `Texto` for ID 4852. Its pre-edit
byte-identical backup is
`/private/tmp/ko-translate-backups/20261018/before-proper-name-D21821/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`f454c28432d22f4351037388582067a5384ace098e08ff91b85681f84c236d55`.
Post-edit SHA-256:
`d64309a2986eb2f9c23c7b7edfa45a94d712d016bd3a3295ae5fe3591bfdf391`.
The verifier passed BOM, mixed line endings, 65,135 ordered rows, target-cell
value, unchanged non-target bytes, and inverse reconstruction.

To keep the occurrence index aligned to the active Korean CSV,
`korean_current` was refreshed only for `faction:warsworn` / `default:4852`.
The byte-identical pre-refresh index backup is
`/private/tmp/ko-translate-backups/20261018/before-proper-name-D21821/proper-name-occurrences.tsv`.
Its SHA-256 changed from
`afb2218bb9d48ea31807b668219d2019d7797c0fb03386c8e5927470dfe1bae1` to
`cf2830cbe101c49899d2a38119c99f0046a856cb31e0bf341f01b55d6bea868a`.
Independent parsed comparison confirmed exactly one changed field in one
existing row; entity status, evidence, row order, row count, and status totals
are unchanged.

Proper-name data validation passed: 2,325 unique entities and 48,321 unique,
active-aligned occurrences. Residual validation passed with no missing or
undocumented source/index keys and no terminal English matches lacking
bilingual coverage. Full proper-name discovery and residual validation remain
incomplete; this batch does not claim overall completion.
