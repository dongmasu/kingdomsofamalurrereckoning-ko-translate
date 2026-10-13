# Consolidated Context Review: `default` IDs 22001-22050

- Date: 2026-10-11; decisions D-18365-D-18368.
- Revisited the four source-keyed uncertainties that can be resolved from
  aligned locale evidence and repeated rows. English governs meaning;
  Japanese source informs voice/register, its Korean draft is a comparator,
  and Chinese is supporting evidence.
- IDs 22001, 22014, 22021, and 22032 remain uncertain.

## Resolved Findings

| Decision | ID | Disposition | Finding |
| --- | ---: | --- | --- |
| D-18365 | 22008 | not an issue | English identifies Khamazandu and calls him the Deceitful One. The Korean meaning and `카마잔두(Khamazandu)` source-name traceability are clear; the row does not need to settle the corpus-wide preferred transliteration. |
| D-18366 | 22037 | not an issue | Completion of the Rite, return to the Circle of Engard, and reporting one's deeds are preserved. The English institution name remains explicit, while generic `의식` avoids asserting an unsupported formal rite title. |
| D-18367 | 22042 | not an issue | The introduction of the blade and Dark Huntress is retained. The Japanese source's honorific `殿` and Chinese graceful/elevated phrasing support Korean `우아하신`; title-boundary variation does not change the line's meaning. |
| D-18368 | 22050 | not an issue | English `Carry on`, Japanese `行きな`, and Chinese `继续` all support proceeding. Korean `계속 가` conveys that directive without requiring the surrounding dialogue to distinguish leaving from continuing. |

## Uncertainty Retained

- ID 22001: Korean `더 나은 존재` is more specific than English `something
  more`; broader House of Sorrows lore does not identify exactly what this
  sentence means by the transformation.
- ID 22014: the English attachment of `within its walls` remains ambiguous;
  Japanese and Chinese support different parses.
- ID 22021: the effect/stat sense of `Attenuation` and the full item's syntax
  are unknown. Although affix ID 309 has the same English text, that duplicate
  string does not prove that this `default` key occupies an affix slot.
  Preserve the prior uncertainty and do not apply the affix-only `*...*`
  convention here without that binding evidence.
- ID 22032: the isolated `JAM` wording does not establish whether it is a
  title, acronym, or wordplay; the Japanese source instead says to get to
  work.

## Integrity and Prior-Count Reconciliation

- English source, Japanese source, Japanese-derived draft, Chinese source,
  and active Korean each contain IDs 22001-22050 exactly once and in
  ascending order.
- The prior disposition recorded eight uncertainties in this range.
  D-18365-D-18368 resolves four as `not an issue`; the four listed above
  remain uncertain. No key is counted twice.
- ID 22040 retains `{3}`, `{1}`, `{2}`, and `{4}` in English order; the
  Japanese source's `{2}`/`{1}` order difference is not imported. ID 22011's
  named icon marker remains unchanged.
- No Korean CSV cell changed. Active default SHA-256 remains
  `e0e3ebe75944803a1760431988fc424659db1ac00f749c1534ca5bd275f34200`;
  no backup was needed.
- Totals through D-18368 are 2,016 accepted, 23,325 `not an issue`, and
  13,183 uncertain (38,524 counted). Next D-18369 at ID 22051.
