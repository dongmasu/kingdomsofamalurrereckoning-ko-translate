# Preliminary Language Scan: `default` IDs 1000-1049

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 1000-1049.
- Compared matching English, Japanese, and Chinese rows with active Korean.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 1002 | 비탄의 집 사람들을 풀어 주지 못하게 | Keep the historical question open: does `the Sorrows` mean House of Sorrows members or another entity? | This was already recorded in the historical audit. English says `the Sorrows`; Japanese says `the power of sorrow`, and Chinese says spirits of sorrow. The active Korean chooses members of the House of Sorrows. Nearby lore context is needed before accepting that interpretation. | Low |
| 1010 | 운명술사 | Use the official-manual `Fateweaver = 페이트위버` term unless context establishes an exception. | The English source says `Fateweaver`; current Korean uses the semantic rendering `운명술사`, conflicting with the project glossary and established usage elsewhere. | High |
| 1015 | 대상에게 3초 동안 기절을 일으킬 확률이 20% 증가합니다. | Preserve the absolute `20% chance` instead of saying an existing chance increases by 20%. | English says the trap has a 20% chance to stun for 3 seconds; Japanese and Chinese state a 20% probability. Korean `확률이 20% 증가` changes this to a relative increase. | High |

## Historical Audit Reconciliation

The earlier Japanese-derived audit's open questions for IDs 1001, 1002, 1004,
1018, 1023, 1026, 1029, 1043, and 1046 were checked against the active
`zh_cn` rows. The name/title and referent questions for 1001, 1002, 1018,
1023, 1026, 1029, and 1043 remain unresolved; ID 1004's fragmentary card
line and the interpretation of the Dara poem at 1046 also remain
provisional. These are carried forward as historical context, not accepted
review decisions.

## Other Checks

- IDs 1006 and 1015 preserve `{*1location}`, `{*1fast travel}`,
  `{*1world map}`, `{LINE_SPACE}`, `{1}`, and the stated duration/damage
  values; ID 1015's probability wording is the exception recorded above.
- ID 1026's `Ravenous` equipment-name construction remains a historical
  context question; the current Korean follows the apparent “ravenous”
  sense, but the item family should settle whether this is a set/material
  name.
- IDs 1000, 1005, 1008, 1016, 1019, 1027, 1037, and 1049 broadly preserve
  the English dialogue meaning and Japanese-informed conversational tone.
- The poem at ID 1046 retains its paragraph/line structure. Proper-name
  display and character-specific register are not normalized in this pass.

## Batch Status

IDs 1000-1049 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
