# D-20393 Edit Addendum

Date: 2026-10-15

Applied 265 House-name edits to `default`; 313 of the 578 reviewed explicit
House-name rows remained unchanged. Manifest:
[`proper-name-houses-D20393.tsv`](proper-name-houses-D20393.tsv).

| Resource | Pre-edit SHA-256 | Post-edit SHA-256 |
| --- | --- | --- |
| default | `26fdd00f0e841c6206f87d15d0a0599edae029d40fa2b99dae0a1fbd29666c77` | `9227d08704aa95e3d64f481f3ac00a6fb479591665586d07c8ee8e380ebadb79` |

Byte-identical backup created immediately before the write:

- `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20393-houses/locatexts_zh_cn.koalocatext_default.csv`

The editor and independent saved-byte verifier passed. BOM, header,
complete line-ending sequence, all 65,135 ordered rows, IDs/variants,
tokens, target values, and every non-target byte were preserved. Reversing
the target-field patches reproduced the backup byte-for-byte. Affix and base
were unchanged in this stage.

No historical terminal disposition or global tally was reopened or changed.
