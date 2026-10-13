# Consolidated Context Review: Repeated `Counsel` Terms

- Date: 2026-10-12.
- Decision: D-19457.
- Scope: exact repeated English sentence at `default` IDs 3270, 8020, 43246,
  and 47537, with supporting lore rows.

## Finding

D-19443 already established that `The Counsel` is an adviser/person in all
four repeated English sentences. It cleared IDs 8020, 43246, and 47537;
ID 3270 remained uncertain only because its `Cipher` and `Hyperian` terms
needed alignment.

English IDs 356 and 4626 identify the Counsel as an individual prisoner and
the Cipher as the gods' icon carried by the Beckoned. Japanese transliterates
`Cipher`; Chinese uses a literal label for that same artifact. Accepted
Korean D-19060 at ID 25030 renders this carried lore object as
`사이퍼(Cipher)`, rather than generic `암호`. Repeated Counsel rows 8020 and
47537 use `사이퍼(Cipher)` and `하이페리온(Hyperian)`. Accepted Hyperian
spellings include IDs 23320 and 23874.

Only the two unsupported variants in ID 3270 were changed. Together with
D-19443's already-resolved adviser question, this closes D-662 for that key.

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 3270 | `암호(Cipher)` | `사이퍼(Cipher)` |
| 3270 | `하이페리언(Hyperian)` | `하이페리온(Hyperian)` |

## Verification

- Compared IDs 3270, 8020, 43246, and 47537 by key in English, Japanese
  source, Japanese-derived draft, Chinese, and active Korean. Checked
  supporting lore references by ID.
- Only the approved Korean `Texto` cell at ID 3270 changed.
- Pre-edit SHA-256:
  `883dd752db5f82b069188900e1cb0f340d0ec0cf112d70a639a8ba3723c1764b`.
- Post-edit SHA-256:
  `c8c688c3fb32bdd0719d8ccfa32a91f6c145eb16131030ff3dbc7127b3aa76a5`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-counsel-terms-D19457/locatexts_zh_cn.koalocatext_default.csv`.
- Reversing the exact substitutions reproduces the backup byte-for-byte.
- Totals after D-19457: **2,301 accepted / 24,999 not an issue /
  11,224 uncertain** (38,524). The three duplicate rows cleared in D-19443
  are not counted again.
