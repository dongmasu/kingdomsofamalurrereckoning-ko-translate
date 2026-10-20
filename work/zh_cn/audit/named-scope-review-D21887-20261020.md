# D-21887: Confirmed-Name Probe in Affix

Date: 2026-10-20

## Scope and Result

Screened the 586 English `affix` rows for confirmed glossary entities with
multiword English canonical labels or aliases. For each match, compared the
Korean rows sharing that exact `ID_Linha`; the source uses `FF` variants
while the working Korean file has its own variant set, so variant values
were not assumed to correspond across locales. Excluded exact Korean
occurrence-index entries and looked only for a known Korean canonical or
variant absent from the matched Korean text.

No unindexed candidate lacking its established Korean name form was found.
Five sample name-bearing IDs surfaced in an earlier positional candidate
probe; direct ID-based comparison confirmed their active Korean strings
match the source meanings. No new content error or edit resulted.

This was a bounded glossary-driven screen, not a full affix audit or
validation of cross-locale variant semantics. Do not zip the English and
Korean affix arrays by row position; use the `ID_Linha` and inspect all
active target variants without assuming `Tipo_Variante` equivalence.

## Outcome

No CSV, glossary, occurrence-index, or release-artifact change. No format
or residual audit was run.
