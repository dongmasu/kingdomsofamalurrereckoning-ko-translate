# D-21569: Japanese Parenthetical Fragment Review

Date: 2026-10-17

## Scope and Classification

Latest verified proper-name batch: D-21569 (2026-10-17).
Japanese parenthetical scan: 113 candidates classified; 77 `Texto` cells corrected; existing proper-name decisions were not reopened or recounted.
Next batch: D-21570; continue source-discovery/residual closure checks; no unreviewed indexed keys.
Indexed matches: 44016; accepted=29416, excluded=2876, not-an-issue=11628, uncertain=96.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 96, in 93 distinct CSV row keys.
These are focused entity/row index states, not global translation totals. The documented uncertain matches remain reviewed holds, not unreviewed work.
Sequential default review through ID 65134 remains completed and is not recounted.
Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive; it does not establish an overall completion percentage.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`.
- base: `895ff1e3eb03341d7c026ce3bfbd4cea355705956a1e494e04eed5a2014b1567`.
- default: `7f7c49432b4141e8a0301182fd907d7f536de1694468d25fd231a72d46e927f5`.
Last batch pre-edit backup and byte validation:
- default: 77 cells; pre `9c07c64ee4762a840d15e0cbaba0e19ae2dbb6babcd73fe6292de5ade0d57ad4`; post `7f7c49432b4141e8a0301182fd907d7f536de1694468d25fd231a72d46e927f5`; backup `/private/tmp/ko-translate-backups/20261017/before-default-parenthetical-D21569/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 77 changed cells; 65135 ordered rows; BOM, mixed line endings, exact row keys/order, opaque tokens, non-target bytes, and inverse backup reconstruction verified. Index: PASS 16 current-text caches updated; all keys, statuses, and evidence unchanged.
Last actual CSV-edit backups (retained across no-edit batches):
- affix: 1 cells; pre `9ae001a379b766612293d076eafb5b02a27ac2de70f05f2f98a706f7aef5607c`; post `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21521/locatexts_zh_cn.koalocatext_affix.csv`.
- base: 1 cells; pre `ab0619937fbb187b356253b9916f3676d2002f8017b25b71cc53be29307aee10`; post `895ff1e3eb03341d7c026ce3bfbd4cea355705956a1e494e04eed5a2014b1567`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21557/locatexts_zh_cn.koalocatext_base.csv`.
- default: 77 cells; pre `9c07c64ee4762a840d15e0cbaba0e19ae2dbb6babcd73fe6292de5ade0d57ad4`; post `7f7c49432b4141e8a0301182fd907d7f536de1694468d25fd231a72d46e927f5`; backup `/private/tmp/ko-translate-backups/20261017/before-default-parenthetical-D21569/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `9c67a88ce998bf8cb60c5df5c103f7fb0c0900cf5514cde8821a680ebf6e8018`.
Occurrence index: 44016 rows; SHA-256 `8406e714bd989cfb42bcf31afca1156914640b91502dfe766e50a3dcc615b8ef`.
Proper-name glossary: 1838 entries; SHA-256 `693bc8fd6e3a4fd4da14d4898db4d534c740aba9ddc18d453f8386d75e338bf4`.
Report: `work/zh_cn/audit/named-scope-review-D21569-20261017.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21569-20261017.md`.
Full Japanese-parenthetical candidate manifest: `work/zh_cn/audit/japanese-parenthetical-review-D21569.tsv`.


Japanese full-cell pattern: `;\(.*\)$`, applied to read-only aligned
locale inventory for `default`. Reviewed 113 matching rows:
79 short
condition/weapon/target/location fragments; 3 spawn-action
fragments; 1 purpose
fragment; and 30 English-parenthesized
asides, stage directions, UI states, or explanatory notes. The latter
already had matching Korean parentheses and were left unchanged.

## Changes

Standardized 77 short fragments as parenthetical qualifiers,
preserving English meaning and all opaque tokens. Six other short
fragments already had the requested form. Time labels are `(야간)` /
`(주간)`; target/weapon/location labels use compact Korean conditions.
Familiar level labels consistently use 사역마, 사역마 강화 and 사역마
숙련도, retaining all original levels and the Upgrade/Mastery distinction.
Sceptres follows 셉터 in the official Korean manual (extracted text
lines 287-289; reference glossary entry Sceptres). The Hunter-Gatherer
spawn label's doubled literal quotes were normalized.
At default:45697, `while parrying` / パリィ中 becomes `(받아치기 중)`,
distinguishing a timed parry from ordinary blocking using the
explanations at default:41891, 51696 and 52709.
At default:10487, localized `Sleight of
Hand` as `손재주` by the same-file label at default:16773. At
default:26982, followed English `to stun enemies` rather than Japanese's
conflicting `versus paralyzed enemies`; only outer formatting changed.
At default:58894, English's unworn-boots condition conflicts with
Japanese's undamaged-boots condition. The existing English-led Korean
was retained with outer parentheses; runtime semantics are unresolved.
Existing occurrence keys, statuses, and evidence were not changed.
No source CSV, PAK, or PAK-derived resource was modified or inspected.
