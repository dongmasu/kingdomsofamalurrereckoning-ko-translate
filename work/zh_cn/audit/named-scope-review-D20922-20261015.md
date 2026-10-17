# D-20922: Scion Title Review

Date: 2026-10-15

## Scope and Decision

Reviewed all 149 distinct source row keys matched by `title:scion`: three
`base` rows and 146 `default` rows. English is the meaning anchor; Japanese
`サイオン` and Chinese `赛恩`/`司祭` support the title reading. The aligned
English records at `default:1641` and `default:26150` explicitly identify
Scion as, respectively, Gallows End's spiritual leader and the Ljosalfar
religious leader, equivalent to the Justicars' high priestess. Register
`Scion` as `title:scion`, canonical Korean `사이온(Scion)`. This office is
distinct from its officeholders and from ordinary descendants, heirs, and
successors.

Of the 149 rows, 147 are title/office uses. Two lower-case instances,
`default:33884` and `default:40025`, mean a descendant/heir of the Rathir
Kent family; retain their existing Korean and exclude them from the title
entity. No other match is a generic lineage use.

The reviewed manifest records 82 accepted `Texto` edits (three `base`, 79
`default`), 65 already-canonical `not-an-issue` rows, and two exclusions.
The edits standardize the title across existing dialogue, labels, the
Ljosalfar history entry, the Scion poem, and Scion-associated base labels.
Scion's Guard labels are aligned as `사이온(Scion)의 경비병`. No `affix`
match was found.

Prior exact-key dispositions, including the established D-19496 and
D-20172 Scion findings, were not reopened or recounted. Their accepted
terminology was reused as evidence; this batch adds the English-led
title-category definition and records the new indexed entity/row matches.

## Index and Integrity

The occurrence index now has 26,022 rows: 25,873 preserved existing
occurrences plus 149 Scion matches. Its status counts are 17,259 accepted,
1,578 excluded, 7,167 `not-an-issue`, and 18 uncertain. The five documented
contextual Anwon-family entries absent from source-only regeneration were
preserved exactly; the generated source inventory has 26,017 rows. There are
zero unreviewed indexed matches; 18 reviewed holds remain across 16 row keys.
These are occurrence-index states, not global translation totals.

Active CSV SHA-256:

| Resource | Before | After |
| --- | --- | --- |
| `base` | `37af347b74b00ba65ce028c02081726ba76e3d7db70261d36631056e0791e1eb` | `ad579e00bae956442e66bd4580e4b0eaa2c52752ddbf76c7768c8a4c22a4d92e` |
| `default` | `5f43c4d7d9e0d14ffed51cc73fef79deb58e99e3218a9b156b55eaf3ba5928d1` | `cfa8f5fab26ec2b7870c15db035077712e0d0ffee1b03ee3c2995757dd9bea4d` |

Byte-identical pre-edit backups:

- `base`: `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20922/locatexts_zh_cn.koalocatext_base.csv`
- `default`: `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20922/locatexts_zh_cn.koalocatext_default.csv`

The independent verifier passed all 82 edited cells, 4,844 ordered `base`
rows and 65,135 ordered `default` rows. It confirmed target values, BOM,
mixed line endings, unchanged non-target bytes, and inverse reconstruction.
The manifest is [`proper-name-edits-D20922.tsv`](proper-name-edits-D20922.tsv);
review logic is [`review-scion-title-D20922.rb`](review-scion-title-D20922.rb).
No PAK or PAK-derived file was inspected or modified; `src/csv/` remained
read-only.

Sequential default review through ID 65134 remains complete and is not
recounted. Proper-name discovery and residual validation remain incomplete.
Next: D-20923, review the eight `candidate:scions` rows, preserving exact-key
dispositions already recorded for overlapping rows `default:1430` and
`default:21314`.
