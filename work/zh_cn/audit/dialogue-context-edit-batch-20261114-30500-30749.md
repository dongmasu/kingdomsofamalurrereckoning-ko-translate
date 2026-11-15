# Dialogue Context Translation Edit Batch: IDs `30500`-`30749`

- Date: 2026-11-14.
- Rechecked the 18 supported candidate findings and two prior evidence-limited
  questions against English, Japanese, Chinese, active Korean, and linked
  context reports.
- All supported findings within the range already matched their sources; no
  Korean text in `30500`-`30749` needed editing.
- Applied three related, source-supported corrections outside the range at
  `25913`, `47929`, and `59613`.

## Related Corrections

| ID | Correction |
| ---: | --- |
| `25913` | Changed `프라이데리(The Pryderi)의 잡화점 주인` to `프라이데리(Pryderi)에 있는 잡화점 주인`. English and Chinese describe a shop located in Pryderi; the wording avoids treating Pryderi as a possessive organization. The related references at `19076` and `30599` use the same place spelling. |
| `47929` | Replaced the inconsistent, unpaired `개스티어` with `가스티르(Gastyr)`, matching the source and the scoped Gastyr references at `30731`, `39388`, `48961`, `50028`, and `59242`. No entity type was inferred. |
| `59613` | Corrected `콜러 경(Lord Callor)` to `칼로르 경(Lord Callor)`, matching the other source-aligned Lord Callor rows, including `30061`, `30563`, `39341`, `39451`, `43632`, and `56981`. |

## Retained Findings And Clarifications

- `30537`, `30550`, `30563`, `30588`, `30599`, `30604`, `30613`,
  `30614`, `30631`, `30637`, `30659`, `30681`, `30682`, `30695`,
  `30713`, `30731`, `30741`, and `30744` already reflect the supported
  meaning, tone, terminology, or format.
- `30663` retains `각반` for `Chausses`. The identical Faehunter armor item
  is `Chausses of the Faehunter` at `base:4202`, also rendered with `각반`;
  the English and French sources preserve `Chausses`. The user's separate
  `Leggings` → `레깅스` decision therefore does not apply to this item.
- The meaning question at `30718` is clarified by the later
  `1966401.quest_bxml` (`DLC2_SQ09`) review: Hystis is an NPC in that quest,
  and `default:28911` identifies him as a Kollossae hermit. The existing
  `만나러 가야 해` is supported by Japanese and quest context; it was kept.
  This does not assign a speaker or playback order to `30718`.
- The source-matched `Echo Stone` at `30695` is spelled differently from
  `Echostone` at other IDs; each English source spelling remains paired
  exactly rather than being globally normalized.
- At `30744`, the existing English/Korean eight-break layout was preserved.

## Verification

- Only the Korean `Texto` fields at `25913`, `47929`, and `59613` changed.
  Only those three ledger `source_fingerprint` values were refreshed; all
  other ledger fields and rows were preserved.
- No in-range Korean text or existing line break was changed. No speaker or
  playback order was inferred from asset association.
- No commit was made.
