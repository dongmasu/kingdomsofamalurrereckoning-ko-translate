# Jakasen Name-Pairing Review - November 10, 2026

- Compared the active Korean `base`, `default`, and `affix` resources against the matching English source IDs. `Jakasen` appears 15 times, all in `default`; no occurrences were found in `base` or `affix`.
- Added the missing English name pairing at `default:25058`, `25639`, `47256`, `57872`, and `59318`.
- At `default:38029`, changed `자카센에게 말하기` to `자카센(Jakasen)과 대화하기`, both pairing the name and using a natural quest-objective form. The English `Talk to Jakasen` and Japanese `ジャカセンと話す` support this wording.
- Rechecked all 15 active occurrences. Each now contains `자카센(Jakasen)`; no unpaired `자카센` or bare `Jakasen` remains. The other existing name pairings were retained.
- Compared the changed rows with the same-ID English and Japanese sources; the name references and quest wording are supported. No IDs, variants, or row order changed.
- The CSV replacement-helper regression suite passed all 11 tests. The CRLF-aware diff check passed.
