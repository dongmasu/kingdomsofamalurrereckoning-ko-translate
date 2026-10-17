# D-20394: B-Family Personal Names

Date: 2026-10-15

## Scope and Decisions

Reviewed 335 distinct active row keys matched to B-initial personal names and
their curated full-name entries, comparing the English source with Japanese,
Chinese, and recurring Korean usage in context. The scope contains five
`base` rows and 330 `default` rows; no `affix` row matched.

In `default`, 139 `Texto` cells were corrected, 190 source-faithful cells
were retained as `not-an-issue`, and one title-like match was excluded from
this personal-name pass. The five `base` rows were already consistent and
were retained. No material ambiguity remained in the reviewed personal-name
rows.

Added nine full personal names as distinct glossary entries alongside their
individual name entries:

| Full English name | Canonical Korean form |
| --- | --- |
| Bardan Tam | 바르단 탐(Bardan Tam) |
| Breid Brurek | 브레이드 브루레크(Breid Brurek) |
| Bronwen Senn | 브론웬 센(Bronwen Senn) |
| Burdick Nareen | 버딕 나린(Burdick Nareen) |
| Colm Bardan | 콜름 바르단(Colm Bardan) |
| Florian Brennac | 플로리안 브레낙(Florian Brennac) |
| Grian Brighthelm | 그리안 브라이트헬름(Grian Brighthelm) |
| Nuer Bedlym | 누어 베들림(Nuer Bedlym) |
| Rhose Badon | 로즈 바돈(Rhose Badon) |

When the source identifies a full name, the complete Korean and English
forms are paired once; the component entries do not create nested or
duplicated parentheses. Corrections also normalize established spellings,
including Bareth, Boderill, and Brun the Bard. At `default` 45445, the
Bayala match in “Bayala's Spring” was excluded because the title's
classification needs a separate decision; it was not treated as an
unresolved personal-name translation.

See the [335-row review and edit manifest](proper-name-edits-D20394.tsv),
the [B-family proposal set](proper-name-proposals-B-D20394.tsv), and the
[English-indexed glossary](proper-name-glossary.tsv). This focused pass does
not reopen historical dispositions or adjust any global translation tally.
The glossary review and candidate discovery remain incomplete.

## Integrity

See [edit addendum](named-scope-edit-addendum-D20394-20261015.md). Only
active `default` Korean `Texto` cells changed. No source CSV or PAK material
was inspected or modified; no build or publication occurred.
