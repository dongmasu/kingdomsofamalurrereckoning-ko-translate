# D-20382: Focused Default House-Name Standardization

Date: 2026-10-14

## Scope and Decision

Compared active Korean `default` entries with English-led context for the
Houses of Ballads, Sorrows, Valor, Vengeance, Pride, and Seasons. The sweep
included explicit House names and clear contextual references such as
capitalized `Pride`/`Valor`, named House members, and later mentions of `the
House`; Japanese was used only to corroborate the English-led identification.
Reused the previously accepted faction names:

| English name | Standard Korean form |
| --- | --- |
| House of Ballads | `발라드의 집(House of Ballads)` |
| House of Sorrows | `비탄의 집(House of Sorrows)` |
| House of Valor | `용맹의 집(House of Valor)` |
| House of Vengeance | `복수의 집(House of Vengeance)` |
| House of Pride | `긍지의 집(House of Pride)` |
| House of Seasons | `계절의 집(House of Seasons)` |

Normalized 94 unique `Texto` cells containing competing translations such as
`하우스 오브 발라드`, `슬픔의 집`, `용맹의 전당`, `복수의 가문`,
`프라이드 가문`, and `계절의 가문`. This includes 82 direct House-name
variant cells and 12 additional English-contextual House references found in
a residual corpus scan. IDs 25971, 13629, 23793, and 31067 each contain
multiple House names and are counted once per changed cell. Already
standardized `발라드의 집` cells were retained, including where no English
parenthetical was present. Korean particles were aligned to the Korean name
at 11 edited cells after adding parenthetical English forms.

Two similar-looking Sorrows references were deliberately left unchanged:
ID 33482's `the Sorrows` and ID 49738's `the Sorrows` refer to the distinct
magical force, not the House. This focused terminology pass did not create or
recount finding dispositions and did not change global totals.

The source distinguishes other contexts: `House of Ansilla` and `House of
Gastyr` refer to family lines, so their family wording was retained. House
of No Doors and generic uses of “house” were not changed.

The canonical forms follow the accepted House of Ballads D-19440, House of
Sorrows D-19451, House of Valor D-19463, House of Vengeance D-6926, House of
Pride D-19488, and House of Seasons D-11323 decisions.

## Verification

- Pre-edit active CSV SHA-256: `a6d4ca210ce202df25052ba30355d8c5a798d7d16fa11946fea2de5cc03b3fff`.
- Byte-identical pre-edit backup: `/private/tmp/ko-translate-backups/20261014/before-house-name-standardization-D20382/locatexts_zh_cn.koalocatext_default.csv`.
- Byte-identical backup before the contextual follow-up:
  `/private/tmp/ko-translate-backups/20261014/house-name-followup-D20382/locatexts_zh_cn.koalocatext_default.csv`.
- Last pre-edit byte-identical backup, before particle adjustments:
  `/private/tmp/ko-translate-backups/20261014/before-house-name-particle-adjustments-D20382/locatexts_zh_cn.koalocatext_default.csv`.
- Final active CSV SHA-256: `8a6023224bdae122d15b2e724790a22f6120398d1065578da47263183c56879a`.
- Parsed CSV structure, 65,135 ordered IDs, UTF-8 BOM, and line-ending counts were preserved.
- Exactly 94 `Texto` cells changed. Every other logical CSV record is byte-identical; no non-target field or row was changed.
- Re-scanning found no remaining competing faction-name forms; the only similar lexical matches are the two separately identified Sorrows-force references.
