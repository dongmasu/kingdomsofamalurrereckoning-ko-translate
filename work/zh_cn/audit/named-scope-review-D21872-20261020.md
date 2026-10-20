# D-21872: Eilaly First-Name Spelling Residual

Date: 2026-10-20

At `default:32847`, correct the remaining `에일랠리 에어랑쿠르` to
`에일랄리 에어랑쿠르` in the complete `Eilaly Airancourt` display.
English names Eilaly Airancourt's desk; Japanese イーラリー・アイランコート
and Chinese 艾莱丽·埃兰库特 corroborate the identity. The same Korean name
appears as 에일랄리 에어랑쿠르 at `default:6896`, and the confirmed
person:eilaly glossary canonical is 에일랄리(Eilaly).

D-20597 and D-21204 established the identity and added the complete English
pairing at this desk title, but left this one spelling variant unchanged.
This supersedes only the Korean first-name spelling; preserve the surname,
title order, full English annotation and all other text. No entity, alias,
occurrence key or disposition changes. The existing occurrence row's Korean
context snapshot is refreshed; its status and evidence remain unchanged.

## Verification

Exact old/new cell and aligned locale text: `proper-name-edits-D21872.tsv`.
The existing byte-preserving editor passed BOM, newline, row/order, token,
non-target-byte and inverse checks for the one cell. Index inverse
serialization equals its backup.

- Default pre-edit SHA-256: `4318b215658f12816c1e764b14f1cd4f4362e5738958640a21ceeee87026de7b`.
- Default post-edit SHA-256: `1e670d456f14b5a87a0e6a8e5576fa6dfca325a1c10191324628afaace3f54ea`.
- Index post-edit SHA-256: `363d4c0075a2f0582862e4690cff39961801ccfcfa82ba254abe9cdb432f6d57`.
- Backup: `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21872`.

No global audit, inventory rebuild, build, release change or in-game test.
