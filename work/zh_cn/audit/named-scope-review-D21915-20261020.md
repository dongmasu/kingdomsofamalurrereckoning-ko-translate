# D-21915: Lemoure Tulle and Meyra Name Review

Date: 2026-10-20

## Findings

- `Lemoure Tulle` at `default:22892` is paired with its exact English name.
  Japanese `レミュール・チュール` and Chinese `勒摩日·图利` offer different
  phonetic renderings but do not establish a definitive Korean alternative.
  No other exact occurrence or stronger Korean reference was found; retain
  `르무르 툴(Lemoure Tulle)` absent new evidence.
- `Meyra` at `default:22931` is the innkeep collecting donations. The same
  person is called Meyra or Meyra Maun in related donation/purse lines,
  including `default:2731`, `3661`, `21763`, `53887`, and `59864`. Korean
  consistently uses `메이라` / `메이라 마운`; Japanese and Chinese support
  the name. No correction or new entity registration is warranted.

## Previously Resolved Candidates Excluded

- `Phantom Edge` at `default:22897` is already covered by D-21623.
- `Hallidite` at `default:22914` is already covered by D-20576.
- `Nyxaros` at `default:22919` is already covered by D-21314.
- `Ysa's Breath` at `default:22942` is an alchemy reagent compound, not a
  separate occurrence of the city Ysa. D-20724 and D-21270 already distinguish
  the place-name component from the reagent and standardize the ingredient.
- `Grim Onwig`, `Bruten`, `Cartery Jayck`, `Ametair`, `Albert Zoef`, and
  `Gask` have existing row/entity dispositions; none was reopened.

No Korean CSV cell, glossary entry, or occurrence-index row changed. No
editor, format/residual audit, inventory rebuild, package build, or in-game
test was needed.
