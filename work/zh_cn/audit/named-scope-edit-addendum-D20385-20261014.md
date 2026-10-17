# D-20385 Edit Addendum: Quake Skill Terminology

Standardized 16 Korean `Texto` cells among the 17 active `Quake` source rows
reviewed in `base` and `default`. Canonical skill-name form: `퀘이크(Quake)`.

| File | IDs | Result |
| --- | --- | --- |
| `base` | 1020 | Changed `지진` to `퀘이크(Quake)`. |
| `default` skill descriptions and cost labels | 2604, 11934, 12640, 16122, 24514, 37338, 38978, 60635 | Replaced `지진`/unpaired `퀘이크` variants with `퀘이크(Quake)` at each Quake skill mention. |
| `default` damage labels | 14688, 15262, 32270, 35229, 39358, 57855 | Standardized each named skill reference as `퀘이크(Quake)`; physical-damage values and layout are unchanged. |
| `default` standalone skill label | 49183 | Changed `지진` to `퀘이크(Quake)`. |

`default` ID 17917 was already consistent and was not edited. The full
17-row multilingual comparison is in
[`quake-terminology-edits-D20385.tsv`](quake-terminology-edits-D20385.tsv).

Pre-edit `base` SHA-256:
`bbe7c14b441a077b25bead2b69fd73a14ae364d6e53523009cbbc128a4c2f55d`

Pre-edit `default` SHA-256:
`b1e6b7f727f7f924ed7fe673d87eb8abe6b362352341f5653892890b505485ef`

Byte-identical backups:
`/private/tmp/ko-translate-backups/20261014/before-quake-terminology-D20385/locatexts_zh_cn.koalocatext_base.csv`
and
`/private/tmp/ko-translate-backups/20261014/before-quake-terminology-D20385/locatexts_zh_cn.koalocatext_default.csv`

Final `base` SHA-256:
`ae076352cbf75a75b12661e06ca65032059f5c3108e495f7bd1a23b21c432e72`

Final `default` SHA-256:
`f825a2cf617a15267f9ee1c08f7d79b86b10d6df9fdcf6b42c85e1224befe10a`

All bytes outside the target `Texto` fields were preserved. BOM, CSV
structure, row order/count, line endings, and target values passed. No
unrelated disposition or global tally was changed.
