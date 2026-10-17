# D-20392: Peoples and Deities

Date: 2026-10-15

## Scope and Decisions

Reviewed manual-supported peoples and deities in English source context
across `affix`, `base`, and `default`, using Japanese and Chinese as
corroborating sources.

The peoples pass covers Almain, Varani, Ljosalfar, and Dokkalfar. It reviewed
473 distinct source rows (13 `base`, 460 `default`), changed 365 cells
(five `base`, 360 `default`), and retained 108 source-faithful cells. The
official Korean manual's people/race section supports `알마인(Almain)`,
`바라니(Varani)`, `료스알브(Ljosalfar)`, and `도크알브(Dokkalfar)`.
Language derivatives use the same Korean stem with the English people name;
complete bilingual title/name forms remain intact.

The deity pass covers Belen, Ynadon, Mitharu, Lyria, Gaea, Ethene, Aryllia,
Njordir, Thyrdon, Vraekor, Lopoku, and Ohnshan. It reviewed 987 distinct
rows (12 `affix`, 60 `base`, 915 `default`), changing 703 cells (12 `affix`,
27 `base`, 664 `default`) and retaining 284. Korean forms follow the official
manual and English source spelling. In particular, the spellings are
Ynadon/Gaea/Thyrdon/Ohnshan, not guessed English labels from the former
reference table; `Lupoku` is retained as a source alias of menu spelling
`Lopoku`; and Mitharan is not conflated with Mitharu.

The deity menu corroborates Ynadon, Gaea, Thyrdon, and Ohnshan's roles.
`default` 11113 explicitly calls Ohnshan a goddess and uses feminine
pronouns, so the Korean goddess wording is preserved even where another
menu label says “God.” Complete bilingual item/shrine titles are preserved
without nested or duplicated English parentheses.

The two proposal sets cover 1,460 review events and 1,419 distinct row keys;
41 rows contain both a people and deity name. There are 1,068 accepted
change events, with 30 cells receiving changes from both passes, for 1,038
distinct edited cells. See the
[people comparison](proper-name-peoples-D20392.tsv),
[deity comparison](proper-name-deities-D20392.tsv), and the corresponding
[people proposals](proper-name-proposals-peoples-D20392.tsv) and
[deity proposals](proper-name-proposals-deities-D20392.tsv).

These are focused proper-name dispositions, not additions to historical or
global translation totals. Existing unrelated questions remain outside this
scope. The glossary pass is incomplete and candidate discovery is not
exhaustive.

## Integrity

See [edit addendum](named-scope-edit-addendum-D20392-20261015.md).
Only reviewed Korean `Texto` cells changed; source CSVs and other files were
not modified. Each stage used a byte-identical pre-edit backup. No PAK or
PAK-derived files were inspected; no build or publication occurred.
