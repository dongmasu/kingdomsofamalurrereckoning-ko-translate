# Disposition and Edit Batch: `default` IDs 2800-2849

- Decision date: 2026-10-09
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 2800-2849.
- English governs meaning; Japanese supports voice/register and alternate
  readings; Chinese is a secondary cross-check.
- This is a working editorial disposition, not final independent linguistic
  approval. Uncertain items remain unchanged.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 2800 | `Meraun` | Unchanged; Korean spelling is plausible, but canonical pronunciation differs across locales. | D-518: uncertain |
| 2804, 5990 | `Wil Donall` parenthetical spelling | `Will Donall` -> `Wil Donall` in both repeated Korean parentheticals; English source spells the name with one `l` in `Wil`. | D-519: accepted |
| 2805 | Sustained-cost percentage | Unchanged; the 30% Mana value and line layout match; do not add Japanese-only “maximum” without the game's UI convention. | D-520: not an issue |
| 2807 | Damage reduction / Mana cost | Unchanged; 25%, 8 seconds, and 20 Mana match the English source. | D-521: not an issue |
| 2808 | `put my mates out of their misery` | Unchanged; the mercy-killing implication is possible but not settled by this isolated quest line or the other locales. | D-522: uncertain |
| 2810 | `A Page-Turner` | Unchanged; Korean naturally renders the compelling-book idiom. | D-523: not an issue |
| 2814 | `Lower` UI label | Unchanged; action, state, and category interpretations remain possible without UI context. | D-524: uncertain |
| 2815 | `Gallows End` | Unchanged; the entry identifies a place, but active Korean spellings vary and need corpus-wide normalization. | D-525: uncertain |
| 2820 | Bursar's collectors | Unchanged; whether Bursar is an office/title and the best Korean compound remain open. | D-526: uncertain |
| 2823 | `Chaos field` | Unchanged; generic versus named magical-area status is unresolved. | D-527: uncertain |
| 2824 | Oda Celfred | Unchanged; the basic meaning is preserved, but the Korean name spelling remains provisional. | D-528: uncertain |
| 2828 | Corgan Hold | Unchanged; proper-place status and canonical Korean rendering are unresolved. | D-529: uncertain |
| 2830 | Petals of Susanrus | Unchanged; the name's spelling and whether this is an item, quest, or title need context. | D-530: uncertain |
| 2831 | `How can I reach Ventrinio?` | Unchanged; Korean can mean finding or reaching him, and quest context is needed to select a more precise verb. | D-531: uncertain |
| 2834 | Faer Gorta health/total-damage effect | Unchanged; +10% and 60 Mana are preserved, while canonical creature/stat terminology remains open. | D-532: uncertain |
| 2835 | Gwalchmai | Unchanged; the bargain and stubborn tone are preserved, but canonical name spelling is unresolved. | D-533: uncertain |
| 2840 | Priestess Tirin / three springs chronology | Unchanged; the journey and blessing relationship are compressed and differ across references. | D-534: uncertain |
| 2842 | `the Villa` in the Sandstone Villa journal | `저택` -> `샌드스톤 저택(Sandstone Villa)`; ID 2822 identifies the owned property with this exact name, and Japanese repeats it here. | D-535: accepted |
| 2845 | `ADD` key/action label | Unchanged; Japanese and Chinese display `+`, supporting the Korean plus glyph. | D-536: not an issue |
| 2846 | `tempered indifference` | Unchanged; `무심함` is supported by Japanese and Chinese and fits the no-hesitation effect; no clear meaning error is established. | D-537: not an issue |

The two accepted corrections are authorized by D-519 and D-535. The
repeated `Wil Donall` spelling at ID 5990 was corrected in the same
cross-reference check.

## Structural Verification

- All four locale `default` CSVs parse to 65,135 rows with identical complete
  ID order. All 50 IDs in this range are present.
- Line-break counts match in the checked stat descriptions at IDs 2805,
  2807, and 2834. Their percentages, duration, and Mana values are retained.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, and CRLF record
  endings. No row, key, variant, or sidecar was changed.

## Checkpoint

- Decisions recorded: D-518-D-537.
- Cumulative dispositions: 133 accepted, sixty-eight `not an issue`, and
  336 uncertain.
- Next range: `default` IDs 2850-2899, using
  [`default-ids-02850-02899-preliminary.md`](default-ids-02850-02899-preliminary.md).
