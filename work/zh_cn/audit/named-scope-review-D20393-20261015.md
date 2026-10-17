# D-20393: House Faction Residuals

Date: 2026-10-15

## Scope and Decisions

Reviewed all 578 active rows whose English explicitly names one of the six
Houses: 15 `base` and 563 `default`; no `affix` row matched. Corrected 265
`default` cells and retained 313 source-faithful cells as `not-an-issue`.
The reviewed forms are:

| English faction | Standard Korean form | Edited rows |
| --- | --- | ---: |
| House of Ballads | 발라드의 집(House of Ballads) | 131 |
| House of Pride | 긍지의 집(House of Pride) | 16 |
| House of Seasons | 계절의 집(House of Seasons) | 5 |
| House of Sorrows | 비탄의 집(House of Sorrows) | 55 |
| House of Valor | 용맹의 집(House of Valor) | 42 |
| House of Vengeance | 복수의 집(House of Vengeance) | 14 |

The canonical Korean forms continue D-20382/D-20386. Full English names
remain parenthesized where needed; complete bilingual compound titles do
not receive redundant short-name parentheses. Generic mentions of pride,
valor, sorrows, seasons, and ordinary uses of “house” are not changed by
this explicit-title pass.

At `default` 20293 the English explicitly says House of Pride, while Korean
had incorrectly placed House of Valor there. It is corrected to
`긍지의 집(House of Pride)`. At `default` 9032, “House of Valor” is
normalized from “하우스 오브 발로” to `용맹의 집(House of Valor)`.

See the [578-row comparison](proper-name-houses-D20393.tsv), the
[proposal set](proper-name-proposals-houses-D20393.tsv), and the
[D-20382/D-20386 glossary history](proper-name-glossary.tsv).
This is a focused follow-up, not a global tally adjustment; other implicit
or generic faction references remain outside this explicit-English scope.
Proper-name discovery and review remain incomplete.

## Integrity

See [edit addendum](named-scope-edit-addendum-D20393-20261015.md).
Only active `default` Korean `Texto` cells changed. No source, PAK, or
PAK-derived file was modified or inspected. No build or publication occurred.
