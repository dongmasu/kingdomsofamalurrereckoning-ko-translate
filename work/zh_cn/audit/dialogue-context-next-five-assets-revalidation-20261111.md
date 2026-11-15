# Five More Asset Revalidations

- Date: 2026-11-11.
- Scope: all 88 unique `default` IDs linked to five previously unrecorded assets.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Seven IDs carry correction candidates; one existing meaning question remains
  on hold. No translation CSV was changed.

## Grouping Evidence and Limits

`1540101.quest_bxml` contains 13 quest-log, objective, and status entries
about Eldric Orhelm's search and death. It has no explicit quest ID, NPC
symbol, or dialogue handler.

`1743353.quest_bxml` contains 25 keys about Nyralim and its tenders. It has no
explicit quest ID or NPC symbol; 23 handlers have an `Nyralim_NQD` prefix.
This is a scene/topic clue only and does not map a key to a speaker,
callback, branch, or playback order.

`1875838.quest_bxml` contains 14 Didenhil jail conversation keys and 14
serialized dialogue handlers, but no explicit quest ID or NPC symbol. The
handlers do not establish per-key speakers or order.

`1963060.quest_bxml` contains 22 keys related to the Pteryx egg challenge.
Eight handlers have a `DLC2_FFQ02` prefix, but the asset has no explicit
quest ID or NPC symbol. The prefix is an asset-level clue only.

`1985675.quest_bxml` contains 14 `FFQ86` quest and home-upgrade entries, but
no NPC symbol or dialogue handlers. These are quest, objective, journal, and
status texts, not attributed dialogue.

All 88 rows were compared in English, Japanese, Chinese, and active Korean.
The exact-English duplicate groups within these assets were checked by ID:
`25009`/`26953`, `53318`/`55247`, `3080`/`33471`, `23348`/`36406`,
`24923`/`39676`/`59555`, and `43536`/`63431`. Their Korean translations
already match within each group. No embedded line breaks, runtime
placeholders, or markup were found in these rows.

No individual speaker or playback order was inferred from asset-level
symbols, handler counts, localization-key co-occurrence, or ID order.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `46156` | Naturalness / style | This quest-status sentence uses polite endings (`사망했습니다`, `완료할 수 없습니다`) while the English and Japanese are concise journal-style statements. Consider consistent plain narrative endings, without treating it as a character's voice. | High |
| `62192` | Speech level | One sentence shifts from plain `-군` to polite `-군요` and `-세요`; Japanese maintains polite address throughout. Recast the full line in one register. Speaker identity remains unknown. | High |
| `56395` | Meaning / naturalness | English says that with a drink the speaker would be in a tavern; Korean changes this to feeling as if already in one. Rephrase to preserve the conditional joke while keeping the source-supported polite tone. | Medium-high |
| `21914` | Meaning | `Yes?` is translated as `왜?` (“Why?”). Japanese `ん？` and Chinese `怎么了` support a brief “응?”/“무슨 일이야?” response instead. | High |
| `54431` | Meaning / terminology | After naming the Pteryx, the English `their eggs` still refers to Pteryx eggs. `짐승의 알` broadens the target; name the creature or use an unambiguous pronoun. | Medium-high |
| `43536`, `63431` | Naturalness / objective style | Both `Upgrade Gossamer End` objectives are identical in English and Korean, but use a bare `업그레이드` where parallel objectives in this set use `-하기` (for example, `Visit Gossamer End` at `3080`/`33471`). Consider `고서머 엔드(Gossamer End) 업그레이드하기`. | High |

## Evidence-Limited Hold

| ID | Question | Reason and disposition |
| ---: | --- | --- |
| `61782` | `The Great Game` | Retain the existing hold from the historical source review. English `The Great Game`, Japanese `素敵な狩り`, and Chinese `伟大的博弈` differ on whether this is a formal title or a generic phrase; the Pteryx-egg asset does not resolve the lore reference. Do not replace `대게임(The Great Game)` speculatively. |

## Retained Text and Repeated Lines

The other rows were retained after four-language comparison. Quest-complete
and quest-failed labels match across their repeated IDs, as do the repeated
Nyralim wisdom sentence and name labels. The earlier distinction between
`Bodine Borgue` and `Bodine Borgues` was preserved where each English source
uses that form. The `Eldric Orhelm` quest-log entries' references to
`Bodine` versus `Cedric` differ in English itself; no name was silently
standardized across those source variants.

## Complete ID Sets

- `1540101.quest_bxml`: `185`, `1908`, `19618`, `22478`, `26217`, `36406`,
  `41124`, `46156`, `49775`, `54378`, `59555`, `59796`, `63884`
- `1743353.quest_bxml`: `281`, `390`, `2922`, `4173`, `7085`, `9970`,
  `22299`, `24268`, `24441`, `25009`, `26953`, `30472`, `30619`, `31351`,
  `33447`, `38246`, `48479`, `50542`, `52769`, `53318`, `55247`, `56309`,
  `59713`, `62192`, `62746`
- `1875838.quest_bxml`: `11775`, `16619`, `22439`, `22826`, `24967`,
  `36397`, `42828`, `46677`, `51280`, `51838`, `56395`, `56663`, `58216`,
  `60921`
- `1963060.quest_bxml`: `110`, `8299`, `11293`, `20717`, `20922`, `21914`,
  `24923`, `24994`, `29568`, `32774`, `33256`, `34929`, `35678`, `37710`,
  `41344`, `48706`, `54431`, `56818`, `61782`, `61818`, `63114`, `63534`
- `1985675.quest_bxml`: `549`, `3080`, `10964`, `23348`, `33471`, `33525`,
  `39676`, `43536`, `53371`, `53811`, `53851`, `55494`, `59184`, `63431`

All 88 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
