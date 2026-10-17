# D-20392 Edit Addendum

Date: 2026-10-15

Two sequential, source-aligned edits were applied and independently verified.
The comparison manifests record the accepted and unchanged rows.

| Stage/resource | Pre-edit SHA-256 | Post-edit SHA-256 |
| --- | --- | --- |
| Peoples / base | `6364e52ca87486aca13f356dd55334e7fef9cd0a1ec7224c8d1feb2d42a3b127` | `8d3b30226fc9a10d51c44f23f36c5c9eed077001d00252c9af53761aab4c6e9d` |
| Peoples / default | `827fed8298fcd90b5a770a6486634634c347c76b3c81a1e387a57da5542efa67` | `078374aa5ad80f504f6406f41715dcda980a96815322d23968b79f126e716c9b` |
| Deities / affix | `516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e` | `0d323b8fc86cc44c5f5386767a3ca073afd990ed1fa7b09f6ce376a765786112` |
| Deities / base | `8d3b30226fc9a10d51c44f23f36c5c9eed077001d00252c9af53761aab4c6e9d` | `2572b912bf6aa4f7417da12b3f705178bf3b16975918c338ab3b1fb135c6be5b` |
| Deities / default | `078374aa5ad80f504f6406f41715dcda980a96815322d23968b79f126e716c9b` | `26fdd00f0e841c6206f87d15d0a0599edae029d40fa2b99dae0a1fbd29666c77` |

Byte-identical backups, created immediately before each stage:

- `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20392-peoples/locatexts_zh_cn.koalocatext_base.csv`
- `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20392-peoples/locatexts_zh_cn.koalocatext_default.csv`
- `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20392-deities/locatexts_zh_cn.koalocatext_affix.csv`
- `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20392-deities/locatexts_zh_cn.koalocatext_base.csv`
- `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20392-deities/locatexts_zh_cn.koalocatext_default.csv`

The editor and independent verifier passed for every edited resource. BOM,
semicolon/header, exact full line-ending sequence, row count/order (3,451
`affix`, 4,844 `base`, 65,135 `default`), ID/variant fields, tokens,
manifest target values, and all non-target bytes were preserved. Inverse
reconstruction reproduced each stage's backup byte-for-byte.

The people and deity manifests contain 1,068 accepted edit events, including
30 overlapping cells, for 1,038 distinct edited cells. No previous global
tally or historical terminal disposition was changed.
