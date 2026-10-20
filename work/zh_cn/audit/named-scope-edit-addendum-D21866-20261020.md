# D-21866 Edit Addendum

Date: 2026-10-20

Reviewed six exact source keys for `Varalin`: `base:82:11`,
`base:4363:11`, `default:17542`, `default:31946`, `default:32740`,
and `default:43053`. English identifies Varalin as the Dverga name for
Gallows End; Japanese `バラリン`/`ヴァラリン` and Chinese `瓦拉林` corroborate.
Added `Varalin` as an alias of existing `place:gallows-end`; no new
place entity was created.

Four exact rows were newly indexed. Existing `place:gallows-end`
matches at default:32740 and default:43053 retain their prior status
and evidence; their matched-English cache now also records `Varalin`.
Only the misspelling at base:82 and default:43053 was corrected from
`바랄린` to `바라린`. Other names, text, tokens, particles and line
breaks were preserved.

Existing D-20679, D-20680 and D-20851 decisions outside these six
keys were not reopened or recounted. Sequential default review and
global translation tallies remain unchanged. Full proper-name
discovery and in-game validation remain incomplete.

## Verification

- Cell edits: 2 exact `Texto` cells across base/default.
- Byte-preserving backup validation: PASS; BOM, line endings, row order/count, keys, non-target bytes and inverse reconstruction.
- - base: 1 cells; pre `244dec237c439aae31f75ae76eb3486c2944e49d2fae80c1b5928fd189a2fc94`; post `57000ac4220bc261b090585847fdae7c9f80e9e7fd680e6be169f02d18de4ed6`; backup `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21866/locatexts_zh_cn.koalocatext_base.csv`.
- - default: 1 cells; pre `ad4f3949a9a1b07e7c5643d7e7581285ad50f43a21738c149a909c6dc889b4ab`; post `6007add4aebd1a93aba3b18c43595807da324cd5983153254fa8f9e03e47a74d`; backup `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21866/locatexts_zh_cn.koalocatext_default.csv`.
- Proper-name data: 48484 indexed occurrences, 2350 glossary entities.
- Aligned inventory: 73430 rows; SHA-256 `48c33087f07b1e9c39e093cac822bfc8def33cf0ea2f37102f58c092a73fff54`.
- Occurrence index SHA-256: `6c099a931c6f157e9122b8e57befc69c4620766acf8a1430fdc258e1dd752343`.
- Glossary SHA-256: `f2fa585de680c72d8f9e5478e543977c730adcb5b864fc75c92388e976d701b1`.
- Review input: `proper-name-review-input-D21866.tsv`.
- New-occurrence manifest: `proper-name-edits-D21866.tsv`.
- Alias scope: `proper-name-alias-expansion-D21866.tsv`.
- Text corrections: `proper-name-varalin-spelling-D21866.tsv`.
