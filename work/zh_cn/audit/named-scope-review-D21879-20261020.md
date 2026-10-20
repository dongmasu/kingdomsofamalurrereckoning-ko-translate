# D-21879: Singleton Name-Ending Outlier Screen

Date: 2026-10-20

## Scope

Compared accepted indexed name annotations grouped by exact English label,
looking for a singleton final Korean Hangul token one character from a
repeated form (at least five occurrences). The screen returned five
all-category candidates; aligned source cells and existing glossary notes
were checked only for those exact candidates.

## Findings

- `people:mitharan`, `Mitharan`: `미타란족` at `default:13305` is a source-
  appropriate people/ethnonym form. The aligned English says “Mitharan
  chieftain”; Japanese `ミサール人の族長` and Chinese `米萨鲁首领` also mark
  the people form. The glossary already records `미타란족` and `미타란인`
  as Korean variants.
- `people:dverga`, `Dverga`: `드베르가어` at `default:37926` names the
  language in ancient Dverga writing; Japanese explicitly has `ドゥバーガ語`.
- `people:dverga`, `Dverga`: `드베르가인` at `default:47369` is the
  expected demonym; English says “The Dverga” and Chinese uses `迪维尔干人`.
- `organization:praetorians`, `Praetorians`: `근위대원` at `default:1553`
  refers to the members in a list of the gnomish society's three pillars.
  Japanese `兵士` and Chinese `禁卫军` support the member/unit reading; this
  is not a competing spelling of the organization's name.
- The fifth outlier was the same `미타란족` form in the Mitharan group,
  counted against both the common people-name token and its established
  language derivative. It is not an additional source error.

These are grammatical or referential forms, not misspellings. No source
change is warranted.

## Outcome

No CSV, glossary, occurrence-index, or release-artifact change. No full
format validation or residual audit was run; this was a read-only review of
five exact candidates.
