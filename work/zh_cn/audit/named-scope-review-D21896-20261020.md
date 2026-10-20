# D-21896: Tarric Name-Stem Consistency

Date: 2026-10-20

## Finding

The standalone English label `Tarric` at `default:51200` was translated as
`태릭(Tarric)`. The exact same English name stem appears in the complete
labels `Maslow Tarric` at `default:2471` and `default:13044`, both translated
as `매슬로 타릭(Maslow Tarric)`. Japanese renders the stem as `タリック` in
both the full and standalone labels; Chinese uses `塔里克` in the full-name
labels. A separate confirmed name, `Tarrick Smith`, is also established as
`타릭 스미스` with Japanese `タリック・スミス` and Chinese `塔瑞克·史密斯`.

Correct only `태릭` to `타릭`, retaining the exact source-local label
`(Tarric)`. Do not infer that Tarric and Tarrick are the same person or
register a global alias. D-20098's grouped `not an issue` disposition
covered the row's evident meaning and structure; this new cross-row
pronunciation evidence narrows and supersedes it only for the Korean name
stem at `default:51200`.

## Focused Verification

The byte-preserving editor and independent manifest verifier passed for one
`Texto` cell across 65,135 ordered rows. BOM, mixed line endings, row order,
non-target bytes, and inverse reconstruction against the byte-identical
backup were preserved.

- Manifest: `proper-name-edits-D21896.tsv`.
- Backup: `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21896/locatexts_zh_cn.koalocatext_default.csv`.
- Default SHA-256 before: `0a0c1737e59da72651429c4667579292d9e29195c0997be803511ee9644f7ef8`.
- Default SHA-256 after: `ed06bd6d5ee46ac0f0d2e1db3dc8e4fa6e09b812ab3bc340365736a2a0463e4b`.

No glossary, occurrence-index, other resource, or release artifact changed.
No full residual/format audit, package build, or in-game validation was run.
