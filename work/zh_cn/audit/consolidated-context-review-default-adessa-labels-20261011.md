# Consolidated Context Review: Adessa Labels

- Date: 2026-10-11.
- Scope: previously uncertain standalone `Adessa` labels at `default` IDs
  18653, 28075, 29549, and 48500.
- Method: align all five locale files by ID and compare the repeated label
  against established active usage and prior decisions.
- Result: D-18242 reclassifies four existing uncertain keys as
  `not an issue`. No CSV cells changed.

## D-18242: Standalone Place Name

All four rows contain only the English place name `Adessa`. Japanese uses
`アデッサ` and Chinese uses `阿德萨`; the Japanese-derived draft and active
Korean use `아데사` in all four. Across the full default resource, the exact
standalone English label occurs 57 times and the Korean name is consistently
`아데사`, with optional English parentheticals in some rows. Prior accepted
D-1424 also uses `아데사` for Adessa in connected prose.

The four current labels therefore preserve the named place, and the
cross-locale phonetic evidence supports the existing Korean form. Existing
parenthetical variation is retained; this review does not establish a global
bilingual-display rule. Reclassify IDs 18653, 28075, 29549, and 48500 from
uncertain to `not an issue`. No edits.

## Integrity and Checkpoint

- No `Texto` cell changed; active default SHA-256 remains
  `d2812e4d72b9d5ae24615f80475c73051fe28b4d96823dae218db4c9c4ee460a`.
- No backup was required because the active CSV was not edited.
- D-18242 reclassifies four existing uncertain keys; the other 53 exact
  `Adessa` labels are prior dispositions and are not recounted.
- Cross-resource totals through D-18242: 1,920 accepted, 23,078
  `not an issue`, and 13,524 uncertain (38,522 total); next D-18243.
- These are working dispositions, not independent final linguistic
  approval. Name-display and parenthetical policy remain separate questions.
