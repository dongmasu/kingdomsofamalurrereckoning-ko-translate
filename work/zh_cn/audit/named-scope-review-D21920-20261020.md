# D-21920: Horace Short-Name Consistency

Date: 2026-10-20

## Finding

At `default:23502`, the journal quest refers to Horace as possibly trapped
below and asks that his fate be investigated. This is the same missing
explorer identified as Horace Despero at `default:51670`; the English,
Japanese `ホレス・デスペロ`, and Chinese `贺拉斯·德斯佩罗` context agrees.
The established Korean full name is `호러스 데스페로(Horace Despero)`, so
the short reference should be `호러스(Horace)`, not `호레이스(Horace)`.

Correct only `default:23502`. The distinct `Horace Rheese` identity and
unrelated short-name occurrences were not changed.

## Candidates Checked Without Changes

- `Jakin` (`default:23510`) already uses `제이킨(Jakin)`, corrected under
  D-21375.
- `Lady Coriana` (`default:23509`), `Captain Canwen` (`default:23517`), and
  `Odarath` (`default:23540`) have prior terminal reviews; their existing
  forms were retained.
- `Jemshee` (`default:23588`) and `Ballegar` (`default:23589`) agree with
  their aligned Japanese and Chinese forms and related source references;
  no clear Korean content error was found.
- Other encountered scopes, including `Rhyderk`, `Niahm`, `Tirin's Rest`,
  `Secandra`, `Esharra`, and `Wildfrold's Notes`, were already reviewed and
  were not reopened.

## Focused Verification

Manifest: `translation-correction-D21920.tsv`.

Only the listed `Texto` cell was edited. The byte-preserving editor and
independent verifier checked the exact target, ordered rows, BOM, line
endings, unchanged non-target bytes, and inverse reconstruction. No full
format/residual audit, inventory rebuild, package build, or in-game test was
run.

Default SHA-256:
`268aa5dd68c04170ec60c726ce0012e34e79acfed8a9f311f5f14bda411ca622` →
`58562b49f9d98c4b123bf859ff7893accfb13458edcc944c75fa7f1a4341ccf0`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261020/before-proper-name-D21920/locatexts_zh_cn.koalocatext_default.csv`.
