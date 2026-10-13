# Consolidated Context Review: `default` IDs 22801-22850

- Review date: 2026-10-11.
- Scope: all eleven previously uncertain disposition rows, aligned by ID
  across English, Japanese, Chinese, the Japanese-derived Korean draft, and
  the active Korean CSV; accepted House of Valor, Scion, and Midden usage
  was checked.
- Decisions: two accepted edits and five `not an issue`; four remain
  uncertain.

## Decisions

| Decision | ID | Finding | Disposition | Rationale |
| --- | ---: | --- | --- | --- |
| D-18491 | 22808 | Royal seal / House Gastyr | not an issue | English explicitly calls this the royal seal of House Gastyr. Korean preserves that relation, the Alfar noble-family description, and the letter's recipient; it does not need to choose between authority and ownership beyond the source wording. |
| D-18492 | 22824 | House of Valor | accepted | Change `발러의 가문(House of Valor)` to the established `용맹의 집(House of Valor)` from D-148/D-650. This is the same named Fae House, here shown as a standalone label. |
| D-18493 | 22831 | Scion | accepted | Change `후계자(Scion)` to `사이온(Scion)`, reusing the accepted formal-title correction at ID 22408 / D-7035. The quest objective names the same office, not a generic successor. |
| D-18494 | 22835 | Tuatha / Midden | not an issue | Korean preserves the speaker's recent awakening, rampant change and chaos, questions about Tuatha, and concern about Midden. `미든(Midden)` follows accepted named-place usage; unrelated lore canon is not needed to understand this line. |
| D-18495 | 22843 | Darkvari Map | not an issue | Korean retains the map label and its source term. The isolated question does not establish a different map type or a Korean meaning error. |
| D-18496 | 22844 | Order of Mitharu / eligible suitors | not an issue | Korean preserves the Order's effect on eligible men and the resulting shortage of suitors in Gorhart. Japanese supports the order/sect reading; the complaint's comic implication remains. |
| D-18497 | 22847 | Meet with the Scholia Arcana | not an issue | English and Japanese support a meeting with the institution or its representatives. Korean's objective wording preserves that meeting without adding an unsupported formal-attendance detail. |

IDs 22812, 22816, 22818, and 22848 remain uncertain: the awkward English
sermon comparison, Pledgeshield's canonical rank term, faction-versus-
description status of Preordained, and Korean localization policy for the
three `{*1...}` Destinies markers remain unresolved.

## Edits and Verification

Only active Korean `Texto` values at IDs 22824 and 22831 changed.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-22824-22831-D18492-D18493/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`154574fbaba2a172558b0ec47c10f905e2e86ddfc2690213a752179c2ef6383c`.
Post-edit SHA-256:
`a0bc31f53559fce97a3c25fe9cf1bb1176e5c2c8de97eb4340983bdd6de1031f`.
Reversing only these two substitutions reproduces the backup byte-for-byte.
The five files contain IDs 22801-22850 once in the same ascending order.
The UTF-8 BOM, 72,011 CRLF endings, 73 existing bare-LF endings, key/order,
and all non-approved cell bytes remain unchanged.

This batch resolves seven prior uncertainties: two accepted and five
`not an issue`. Totals through D-18497 are 2,035 accepted, 23,424
`not an issue`, and 13,065 uncertain (38,524 counted). Next decision:
D-18498 at ID 22851.
