# D-20386: House-Name Follow-Up in `base` and `affix`

Date: 2026-10-14

## Scope and Decision

Extended D-20382's House-name standardization beyond `default`. Searched all
4,844 active `base` source rows for House/faction names and reviewed all 51
English rows containing `Ballads`, `Sorrows`, `Valor`, `Vengeance`, `Pride`,
or `Seasons` in context. Compared each selected row with Japanese and Chinese
references. English remained the meaning anchor; Japanese supplied
institutional context where an English title was abbreviated, and Chinese
was supporting evidence.

Standardized 21 `base` `Texto` cells to the accepted forms from D-20382:

| House | IDs |
| --- | --- |
| House of Ballads | 32, 621, 1597, 2921, 3092, 3159, 3304, 3333, 3975, 4160, 4475, 4513 |
| House of Seasons | 219, 973, 2799, 3678 |
| House of Vengeance | 869 |
| House of Pride | 1035 |
| House of Valor | 1729 |
| House of Sorrows | 2303, 4151 |

The scope includes explicit `House of ...` names and strongly supported
shortened compounds. Japanese identifies the House affiliations for the
Seasons Sanctuary, Ballads Sanctuary, and Ballads Library; ID 2799's Seasons
Tunnel aligns with the explicit House of Seasons Tunnel at ID 3678. The
user-identified `Ballads Signet Ring` at ID 3333 is now
`발라드의 집(House of Ballads) 인장 반지`. All House names use the same
Korean-English form, including labels that previously omitted the English
name.

The other 30 English rows containing the same broad faction words were
checked and retained because their meanings are ordinary sorrow/vengeance,
season-themed equipment, other proper names, or locations whose House
affiliation is not established by the source context: IDs 85, 317, 568, 658,
732, 876, 911, 1148, 1213, 1400, 1403, 1688, 1838, 2091, 2222, 2533, 2864,
2975, 2997, 3109, 3174, 3177, 3222, 3403, 3415, 3888, 3960, 4287, 4455,
and 4757.

Reviewed the complete localization `affix` inventory as well: English has
586 rows, Japanese 3,311 variants, and Chinese/Korean 3,451 variants each.
No House or target faction-name references occur in those source or active
affix rows, so no affix edit was warranted. No PAK data was consulted.

## Verification

- Pre-edit active `base` SHA-256:
  `ae076352cbf75a75b12661e06ca65032059f5c3108e495f7bd1a23b21c432e72`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261014/before-house-base-affix-D20386/locatexts_zh_cn.koalocatext_base.csv`.
- Final active `base` SHA-256:
  `437986dea9000fca2fa96fee0dd98b71c678bc12db0c3e11ff45a7904e22cd70`.
- All 21 edited IDs, source-language text, and before/after Korean values are
  recorded in [`house-base-edits-D20386.tsv`](house-base-edits-D20386.tsv).
  The byte-preserving editor is
  [`apply-house-base-affix-D20386.rb`](apply-house-base-affix-D20386.rb).
- Inverse byte reconstruction, UTF-8 BOM, CSV parsing, all 4,844 ordered
  base IDs, line-ending counts, target `Texto` values, and unchanged
  non-target rows passed verification. `affix` was not modified.
- This is a terminology follow-up, not a new disposition batch. Previously
  resolved default keys and global tallies were not reopened or recounted.
