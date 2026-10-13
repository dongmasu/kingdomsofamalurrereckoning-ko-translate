# Disposition Batch: `default` IDs 2700-2749

- Decision date: 2026-10-09
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 2700-2749.
- English governs meaning; Japanese supports voice/register and alternate
  readings; Chinese is a secondary cross-check.
- This is a working editorial disposition, not final independent linguistic
  approval. Uncertain items remain unchanged.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 2700 | `Primary Weapon` UI term | Unchanged; `주 무기` matches the repeated term at IDs 4171, 59332, and 64943, and the icon marker is preserved. | D-484: not an issue |
| 2701 | `Winter Lands` / `master makers` | Unchanged; region/faction status and whether the makers are smiths or artisans remain unclear. | D-485: uncertain |
| 2707 | Ansilla / Caeled / Drewn description | Unchanged; the ring emblem and stone engraving relations are conveyed, but proper-name forms need corpus-wide reconciliation. | D-486: uncertain |
| 2709 | Worthy hero / armor legend | Unchanged; the four locales agree on the legend's sequence and Korean preserves it. | D-487: not an issue |
| 2712 | Chaos Magic in Sagecrafting | Unchanged; the official `마법물품 제작` term is used and `접목` naturally conveys applying Chaos Magic in that craft. | D-488: not an issue |
| 2716 | `Century Plants` | Unchanged; `백년초` may be confused with a specific Korean plant name, and no canonical game term is established. | D-489: uncertain |
| 2717 | `Abergast` rumor | Unchanged; the hearsay and skeptical qualification are preserved, but the Korean name spelling remains provisional. | D-490: uncertain |
| 2723 | `Mage of Cups` | Unchanged; the phrase may be a formal card/fate title rather than a generic mage description. | D-491: uncertain |
| 2726 | Twenty-line bear poem | Unchanged; the Korean preserves all 20 lines, the story, and a consistent oral-verse cadence/rhyme; no specific meaning loss is supported. | D-492: not an issue |
| 2730 | Saturnyn / House identity | Unchanged; the suspicion and betrayal question are preserved, while the House and character identity remain open. | D-493: uncertain |
| 2731 | Sanctuary collections box | Unchanged; `성소 헌금함` is supported by the English deposit context and Japanese offering-box wording. | D-494: not an issue |
| 2735 | `Cartesian Coord View` | Unchanged; the technical meaning is clear, but whether this debug-style label is player-facing remains unknown. | D-495: uncertain |
| 2738 | Pacetor / Kurn / peace | Unchanged; the memorial and revenge request are preserved; name spellings and the nuance of `peace` remain open. | D-496: uncertain |
| 2739 | Malach's vest / chestpiece allusion | Unchanged; Korean retains the chicken-and-lute joke and explicitly connects the vest to the chest armor's enchantments. | D-497: not an issue |
| 2742 | `games` touring circuit | Unchanged; the English mentions games and performing for crowds, while Japanese/Chinese emphasize performances. The event type is unresolved. | D-498: uncertain |
| 2744 | Summer Court / Gardens of Ysa / Faelands | Unchanged; the welcome and warm-heart metaphor are preserved, but faction/place Korean forms need global alignment. | D-499: uncertain |
| 2748 | Trap ability values and held attack | Unchanged; all range, trap-count, damage, and Mana values are preserved; Japanese supports holding the attack button. | D-500: not an issue |

No CSV text was changed in this batch. The historical questions in this
range were reconciled with these dispositions; same-numbered `base` item
findings were kept separate.

## Structural Verification

- All four locale `default` CSVs parse to 65,135 rows with identical complete
  ID order. All 50 IDs in this range are present.
- Embedded line-break counts match across the range. ID 2700 retains
  `#NAMED_ICON_360_X#` in source order.
- ID 2726 retains all 20 poem lines. ID 2748 retains its four line breaks,
  5-meter radius, 7 and 18 traps, 80 damage, and 80/120 Mana values.
- No translation CSV or sidecar was changed.

## Checkpoint

- Decisions recorded: D-484-D-500.
- Cumulative dispositions: 129 accepted, sixty `not an issue`, and
  311 uncertain.
- Next range: `default` IDs 2750-2799, using
  [`default-ids-02750-02799-preliminary.md`](default-ids-02750-02799-preliminary.md).
