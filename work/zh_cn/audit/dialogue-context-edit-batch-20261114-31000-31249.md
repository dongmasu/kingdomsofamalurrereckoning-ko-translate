# Dialogue Context Translation Edit Batch: IDs `31000`-`31249`

- Date: 2026-11-14.
- Rechecked all 21 current correction candidates against English, Japanese,
  Chinese, and the active Korean text. English was primary for meaning,
  Japanese for voice and layout, and Chinese was supporting evidence.
- Applied the nine remaining in-range corrections. Eleven candidate rows
  already contained the supported correction, and `31000` already matched
  the proposed wording.
- Aligned directly related names and terminology in `default` and two
  `base` variants. Uncertain findings remain held; no speaker or playback
  order was inferred.

## In-Range Corrections

| ID | Correction |
| ---: | --- |
| `31060` | Added the `Krast Brothers` pairing and corrected the object particle to `형제를`. |
| `31067` | Paired the first occurrence of Ysa as `이사(Ysa)` in the chapter text; retained subsequent mentions and paragraph layout. |
| `31113` | Replaced all four `전승석` occurrences with the established `로어스톤`, preserving every display wrapper and control token. |
| `31179` | Paired `푸른 칼날(Verdant Blades)`, removed the unsupported `유품` implication, and retained the respectful reference to the father. |
| `31186` | Rendered the age description naturally and paired the complete name: `나이 든 닐스 맥너터(Niels MacNutter)`. |
| `31193` | Paired the complete item label as `흠 없는 미타란 지속의 손잡이(Flawless Mitharan Sustaining Grip)`. |
| `31207` | Paired `아테스(Artess)`, restored quotation framing, and ended at `일주일 뒤에...` without inventing the unfinished destination. |
| `31218` | Paired the named location as `성스러운 연못(Sacred Pools)`. |
| `31224` | Paired the tavern as `뱀의 이야기 주점(Serpent's Tale)`. |

The other reviewed candidates, `31002`, `31009`, `31011`, `31012`, `31024`,
`31048`, `31053`, `31081`, `31127`, `31144`, and `31183`, already reflected
their supported corrections and were retained. `31000` already matched its
proposed concise poetic wording. The earlier candidate at `31085` remains
cleared because its current paired names are correct. `31072` remains held:
the English, Japanese, and Chinese sources disagree on the location type.

## Related Consistency Corrections

| Group | IDs and correction |
| --- | --- |
| Krast Brothers | Added or completed the group pairing at `2671`, `16777`, `19096`, `38609`, and `46233`; aligned the exact-source objective pair `21406`/`42577` to the canonical capitalization. `15291` already matches `31009` as `메니어 이등병(Private Menyr)`. The full set of 12 default references now uses the established group name. |
| Verdant Blades | Aligned `9734`, `37757`, `43136`, and `46678` to `푸른 칼날(Verdant Blades)`, matching `31179`, `32241`, and `33619`. The two `base` variant-`11` labels, `211` and `2890`, were aligned to the same form. |
| Sacred Pools | Standardized `31218`, `33516`, `35633`, `38715`, `53537`, `57348`, and `63620` to `성스러운 연못(Sacred Pools)`, matching `29173`. The five-pool count at `35633` follows English and Chinese; the four-pool counts elsewhere remain unchanged. |
| Dice games | Added the established `하이 롤(High Roll)` pairing at `21382`, `57492`, `58302`, and `62842`. Standardized the paired `Ranged Roll` name at `57492`, `58302`, and `63074` to `범위 굴림(Ranged Roll)`; the English source at `58302` spells it `Range Roll`. At `63074`, clarified the two-dice sum rule using the aligned Japanese and established game descriptions. |
| Niels MacNutter | Paired the name at `33481`, matching `31186`; the latter retains the source's age description. |

## Verification

- Refreshed only the 42 affected default IDs' `source_fingerprint` values;
  all other ledger bytes and fields were preserved. The ledger validates all
  65,135 IDs, and the index and both catalogs reproduce.
- The `default` CSV retains its UTF-8 BOM, 65,135 ordered rows, and parsed
  structure. The `base` CSV retains its BOM, 4,844 rows, variant keys, and
  order. The byte-preserving editor was used for every translation change.
- Rechecked the complete Krast Brothers, Verdant Blades, Sacred Pools, High
  Roll/Ranged Roll, and Niels MacNutter groups. The exact-source duplicate
  texts remain aligned where their source meaning and context match.
- All 20 CSV-preservation and context-index tests pass, as does
  `git -c core.whitespace=cr-at-eol diff --check`.

The next candidate range is `31250`-`31499`; application remains ongoing.
