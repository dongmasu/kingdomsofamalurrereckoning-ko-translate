# D-21843: `base` Article-Bearing Label Pairing Review

Date: 2026-10-19

## Scope

Reviewed the 12 English `base` labels beginning with `The`/`the` identified by
the bounded exact-string scan, plus the directly matching articleless
Dreamworld label at base:3625. The case-insensitive comparison showed that
base:2055 already contains the complete label, with only the English article's
capitalization differing. Seven of the 12 candidate keys already have
terminal, source-scoped proper-name findings; those findings were checked and
retained without reopening or recounting them.

Added exact English label pairings to four `Texto` cells:

| Key | English | Japanese | Chinese | Korean before | Korean after |
| --- | --- | --- | --- | --- | --- |
| base:616:11 | `the Archsage's Dreamworld` | `大賢者の夢の世界` | `大贤者的梦境` | `대현자의 꿈세계` | `대현자의 꿈세계(The Archsage's Dreamworld)` |
| base:1780:11 | `the Unknown` | `未知` | `未知` | `미지의 존재` | `미지의 존재(The Unknown)` |
| base:3200:11 | `the Isles` | `アイルズ` | `群岛` | `군도` | `군도(The Isles)` |
| base:3625:11 | `Archsage's Dreamworld` | `大賢者の夢の世界` | `大贤者的梦境` | `대현자의 꿈속 세계` | `대현자의 꿈속 세계(Archsage's Dreamworld)` |

The parenthetical text records the exact English display label and does not
register a new person, place, title, or item entity. The two Dreamworld rows
retain their existing Korean wording. The Isles uses the same label-pairing
approach as D-21817; its proper-region classification and canonical Korean
form remain uncertain under D-7741/D-19539.

## Retained Findings

- `base:2055` (`the Fallen Hall`) remains the complete paired label under
  D-21217; `The Fallen Hall` is already present in Korean parentheses, so the
  exact-string candidate was only a capitalization difference.
- `base:2204` (`The Sidhe`) retains D-21297's accepted `시드(Sidhe)`.
- `base:2303` (`the House of Sorrows`) retains D-20393/D-20382/D-20386.
- `base:2348` (`the Livrarium`) retains D-20933.
- `base:2578` (`the Proving Halls`) retains D-21282.
- `base:3835` (`The Weeping King`) retains D-20970/D-20971.
- `base:4624` (`the Ruin of Aodh`) retains D-20964.
- `base:936` already pairs the name component as `디르지(Dirge)`. The
  English/Japanese versus Chinese rendering does not establish Dirge's
  referent or whether it is an entity or set name; no full-item identity or
  global alias is inferred, and the cell is unchanged.
- `base:2806` is a generic basement label in English, Japanese, Chinese, and
  Korean; no proper-name annotation is warranted.

The standalone `the Unknown` and Archsage Dreamworld labels remain
unclassified as to in-world entity type. Their exact English display strings
are now visible beside the preserved Korean meanings, without implying an
identity beyond the labels themselves. The official Korean manual extraction
and reference contain no direct entries for these labels.

## Verified State

Latest verified proper-name batch: D-21843 (2026-10-19).
Next batch: D-21844; continue fresh source discovery and residual checks.
Indexed matches remain 48,406: accepted=32,588, excluded=3,216,
not-an-issue=12,491, uncertain=111. No glossary entry, occurrence-index
status, or cumulative disposition was added, removed, or recounted.
Sequential default review through ID 65134 remains completed and is not
recounted. Full proper-name discovery/residual validation remains incomplete.

## Validation

- The bounded English scan still has 29,632 phrases versus its preserved
  29,604 baseline; this CSV edit does not affect the source-derived scan.
- The active base CSV has 4,844 ordered rows. Only the four listed `Texto`
  cells changed; BOM, mixed line-ending sequence, row order, all other fields,
  non-target bytes, and inverse reconstruction match the pre-edit backup.
- Active CSV SHA-256:
  - affix: `9dbee978d73148eeb547c2a01a58e3d8168a519824382d339179c55770492b33`
  - base: `22ae4d10e060e0df0119ab9e0d1535efc11dd4e939e6fb1b4b6dc7821139c471`
  - default: `e209d929297dced7bc78f106a59365181698d91cd9121746e0d66b2374faa12b`
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261019/before-proper-name-D21843/locatexts_zh_cn.koalocatext_base.csv`
  SHA-256: `a982e3e5cee9ecbf3eb9ef0f4c146f6693b17e1a04b9c116c799bd2975e7ca94`
- Aligned inventory: 73,430 rows; SHA-256
  `a5348b7030edb27271c588183a80e5804bf161944653a09ad6819303a46fa369`.
- Proper-name data validation: 2,338 entities and 48,406 active-aligned
  occurrences; PASS. Candidate tests: 13 runs/68 assertions, PASS.
- Inventory fixtures: PASS.
- Residual audit: 47,336 source matches, 48,406 indexed matches across
  73,430 rows; missing keys=0, undocumented extras=0, terminal matches
  without bilingual English coverage=0; PASS.
- Exact edits: `proper-name-edits-D21843.tsv`.
- Structural editor validation passed BOM, line-ending sequence, row
  count/order, target-only changes, non-target byte preservation, and inverse
  backup reconstruction.
- The full reverse edit-chain verification passed: 1,412 reviewed edit stages
  were reconstructed in reverse chronological order, including the pre-D-20390
  resource hashes.
