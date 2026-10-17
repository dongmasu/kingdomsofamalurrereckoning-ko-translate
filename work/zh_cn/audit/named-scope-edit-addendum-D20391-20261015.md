# D-20391 Edit Addendum

Date: 2026-10-15

Applied 154 reviewed `Texto` edits (one `base`, 153 `default`) with the
byte-preserving proper-name editor. The 272-row comparison manifest records
all accepted, unchanged, and excluded decisions:
[`proper-name-edits-D20391.tsv`](proper-name-edits-D20391.tsv).

| Resource | Pre-edit SHA-256 | Post-edit SHA-256 |
| --- | --- | --- |
| base | `cebf707b2d8d18a59a113059980798010612d18e13d229a0b08b21dc651e8cfa` | `6364e52ca87486aca13f356dd55334e7fef9cd0a1ec7224c8d1feb2d42a3b127` |
| default | `bb38115eaef16232eb7e3875f038d587496f3c0769740a3e7f9f46410966af37` | `827fed8298fcd90b5a770a6486634634c347c76b3c81a1e387a57da5542efa67` |

Byte-identical backups created immediately before writes:

- `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20391/locatexts_zh_cn.koalocatext_base.csv`
- `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20391/locatexts_zh_cn.koalocatext_default.csv`

The editor and independent saved-byte verifier passed. BOM, semicolon
delimiter/header, exact complete line-ending sequence, row count/order
(4,844 `base` / 65,135 `default`), ID/variant fields, game tokens, target
values, and all non-target bytes were preserved. Reversing the encoded target
field patches reproduced each pre-edit backup byte-for-byte. The unchanged
affix SHA-256 is
`516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e`.

No historical terminal disposition or global tally was reopened or changed.
No source file, PAK, or PAK-derived file was modified or inspected.
