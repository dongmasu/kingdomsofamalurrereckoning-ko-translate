# D-21914: Matrim Short-Name Consistency

Date: 2026-10-20

## Finding

The standalone name at `default:22845` is `Matrim`, rendered in Korean as
`마트림(Matrim)`. The same person is identified by the full name `Matrim
Hawkins` at `default:22813`. That row uses Korean
`메이트림 호킨스(Matrim Hawkins)`, Japanese `メイトリム・ホーキンス`, and
Chinese `马特里姆·霍金斯`. The confirmed `person:matrim-hawkins` glossary
form establishes the Korean stem `메이트림`.

Correct only `default:22845` to `메이트림(Matrim)`. This is a row-scoped
short-name alignment; no global alias or entity registration is added.

## Focused Verification

Manifest: `translation-correction-D21914.tsv`.

The byte-preserving editor and independent verifier passed for this single
target across 65,135 ordered rows. BOM, line endings, row order, non-target
bytes, and inverse reconstruction were preserved. No full format/residual
audit, inventory rebuild, package build, or in-game test was run.

Default SHA-256:
`440f2dc04ca2249dce2cf4dc72cee369a0e18440b590de639e39ba68f986601b` →
`268aa5dd68c04170ec60c726ce0012e34e79acfed8a9f311f5f14bda411ca622`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261020/before-proper-name-D21914/locatexts_zh_cn.koalocatext_default.csv`.
