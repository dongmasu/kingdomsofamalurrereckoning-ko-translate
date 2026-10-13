# Disposition and Edit Batch: `default` IDs 15750-15799

- Decision date: 2026-10-09.
- Scope: all preliminary findings in the range, split by source row.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, and historical audit notes.
- Twenty-five source-row decisions: one accepted, ten `not an issue`, and
  fourteen uncertain. Uncertain rows remain unchanged.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 15752 remains uncertain: `trench` is narrowed to a location below a
  ravine, but the source does not establish whether it means a ravine, channel,
  or riverbank hideout.
- ID 15757 is accepted narrowly for number (D-4877): English says Bertrand marked
  `their locations`, while the migrated Korean draft had singular `그 위치`.
  The approved form is `그 위치들을`. The proper-name rendering
  `교수대 꽃(Gallows Bloom)` remains provisional and was not part of this edit.
- ID 15761 remains uncertain: the source's `administer to the Fae` may mean
  serve or care for them; Korean preserves the contrast with the soldier.
- ID 15764 remains uncertain: the poetic fragment leaves the intruder/actor
  implicit; the Korean should not be further resolved without context.
- IDs 15765-15766 remain uncertain: `the order` is generalized to `단체`,
  and its identity and the unnatural event remain unknown.
- ID 15767 is `not an issue`: the completed hunt, return to Declan, and
  promised reward for the Mountain Trolls are retained.
- ID 15768 is `not an issue`: the ante action and exact
  `$NQD_City_Rathir.ante_mid$` runtime variable are preserved.
- IDs 15770-15771 remain uncertain: Fae `mindspace`, the bloody Widow, and
  the cave traces retain unresolved referents/identity.
- ID 15773 remains uncertain: the resource name and whether the mine's
  output claim is historical or current need context.
- ID 15774 remains uncertain: `dove` is rendered as `내 사랑`; whether
  `Traveler` is a formal title/class or generic address is unsettled.
- ID 15776 is `not an issue`: the collections purse and instruction to put it
  in the nearby box are preserved; the collection type is not specified.
- ID 15779 remains uncertain: the title form is retained, but Basawin's
  canonical Korean spelling and title status need alignment.
- ID 15781 is `not an issue`: Gaea's earth-goddess label, `{*1}` wrapper, and
  Ljosalfar availability condition are preserved.
- ID 15784 is `not an issue`: the intelligent object's directions are
  explicitly treated as instructions, like the speaker's own.
- ID 15787 is `not an issue`: the imperative and exclamation are retained;
  the isolated string does not establish whether it is a quest title or taunt.
- ID 15788 is `not an issue`: Shadow Flare, Panic, `+20%`, and per-Combo-Point
  scaling are retained; no unsupported calculation detail is added.
- IDs 15789-15790 remain uncertain: the Beckoned/Scion title, names, and
  place forms need lore-wide alignment; the quest-log meaning is preserved.
- ID 15791 is `not an issue`: the negative-effects category and curses,
  diseases, and poisons examples are all retained.
- ID 15792 is `not an issue`: despite malformed English, Korean follows the
  intended reading supported by Japanese and Chinese that translating the
  text did not take long.
- ID 15794 remains uncertain: the English is malformed; the Korean preserves
  surprise, completion before being asked, bounty, and a general blessing.
- ID 15796 is `not an issue`: both escape by opening the jail-cell door and
  serving the sentence are preserved.
- ID 15799 remains uncertain: `Orbocant` is retained bilingually, but the
  isolated label does not establish whether it is a place, institution, or
  council.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 15757 | `...그 위치를 표시해 뒀다.` | `...그 위치들을 표시해 뒀다.` | D-4877 |

The approved `Texto` was already present when this batch resumed. Its approval
is recorded here; no other translation value was changed in this batch.

## Verification

- The preliminary structural scan reports the 50 IDs in matching order across
  English, Korean, and the Japanese-derived Korean draft. ID 15768 retains
  `$NQD_City_Rathir.ante_mid$`; ID 15781 retains `{*1}` and its localized
  availability text; ID 15788 retains `+20%`. No structural exception was
  found.
- The active Korean `default` CSV retains its UTF-8 BOM, 72,046 CRLF endings,
  and 39 pre-existing bare-LF endings. Only the line ending at ID 15757 was
  restored from a stray bare LF to CRLF.
- Reversing only the accepted ID 15757 text and that line-ending repair
  reproduces the preceding checkpoint SHA-256 exactly:
  `38b0ba0e32aa3a6b42c9e1d45778128fafc3ea78e09d4154f549de4b4cb8580f`.
- The active Korean `default` CSV SHA-256 after the approved value and
  line-ending verification is
  `c7c370377c94cc7a79f6ca7b8b11fdebadd917ed1eccad8bbeb4f87a9b164576`.
- The older discrepancy beginning at IDs 15450-15499 remains unresolved and
  documented; this batch does not infer or repair its cause.
- Before this batch: 611 accepted, 1,514 `not an issue`, and 2,750 uncertain.
  After this batch: 612 accepted, 1,524 `not an issue`, and 2,764 uncertain
  (4,900 decisions total).
- Resume at ID 15800; 49,335 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
