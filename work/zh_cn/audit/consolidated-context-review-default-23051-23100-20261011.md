# Consolidated Context Review: `default` IDs 23051-23100

- Review date: 2026-10-11.
- Scope: all eight rows left uncertain in the earlier disposition of
  `default` IDs 23051-23100; compared English, Japanese, Chinese,
  Japanese-derived Korean, active Korean, adjacent IDs, and established
  terminology.
- Decisions: five `not an issue`; three remain uncertain. No CSV edit.

## Decisions

| Decision | ID | Finding | Disposition | Rationale |
| --- | ---: | --- | --- | --- |
| D-18541 | 23063 | Unspecified objects / `take whatever you can for them` | uncertain | Korean preserves the request to remove the items from view, but Japanese explicitly says sell them and English/Chinese do not identify the transaction. The objects' antecedent and intended exchange remain unknown. |
| D-18542 | 23064 | Cowl of the Maiden / Temple of Lyria / camp blessing | not an issue | The theft objective, source-paired item/place names, and blessing to the camp are all retained. The isolated line does not require deciding the wider category of every treasure. |
| D-18543 | 23074 | Escape Akara-Tor | not an issue | English, Japanese, and Chinese all give the same escape objective. Korean preserves the place name with its exact English form in parentheses; canonical Hangul styling is separate. |
| D-18544 | 23078 | Rathir rite / slowly fading aura | not an issue | The lifetime frequency, difficult rite, and slowly fading `aura` are preserved as `기운`. The exact rite need not be identified to render this statement. |
| D-18545 | 23080 | Sagecraft potion / White Flake / Sky Blossom / Bloodroot | uncertain | `Sagecraft` correctly uses the official/project term `마법물품 제작` (accepted at ID 8859 / D-2478, which explicitly cites this row). Recipe structure and 2/2/1 quantities match, but the Korean reagent forms lack settled canonical terminology. |
| D-18546 | 23081 | Place the Litanies | not an issue | English, Japanese, and Chinese all direct placement of the Litanies/prayer text. Korean `연도문 배치` retains that concise objective without choosing an unsupported object subtype. |
| D-18547 | 23087 | The Offering | uncertain | Korean's `봉헌물` is plausible, but repeated isolated `The Offering` labels (including IDs 13429, 13557, and 14229) remain unresolved between an object and a named rite/title. No row context selects one. |
| D-18548 | 23093 | Caer Nyralim / `him` / source quotation marks | not an issue | English, Japanese, and Chinese all retain an unnamed male referent and the southeastern Dalentarth location. Korean keeps the referent unnamed; the stray English quotation marks do not change the proposition. |

## Verification

The English, Japanese, Chinese, Japanese-derived Korean, and active Korean
default CSVs each contain 65,135 rows in the same full ID order. Reviewed
Korean text matches the Japanese-derived draft after normalizing only
embedded newline encoding. ID 23080 retains its two embedded breaks, blank
recipe line, three ingredients, and quantities 2, 2, and 1. No key, row,
runtime-marker, or line-break discrepancy was found.

No Korean `Texto` cell changed; no backup was required. Active default
SHA-256 remains
`a0bc31f53559fce97a3c25fe9cf1bb1176e5c2c8de97eb4340983bdd6de1031f`.

D-18541-D-18548 resolves five prior uncertainties as `not an issue`; IDs
23063, 23080, and 23087 remain uncertain. Totals are 2,035 accepted,
23,460 `not an issue`, and 13,029 uncertain (38,524 counted). Resume at
D-18549, `default` ID 23101.
