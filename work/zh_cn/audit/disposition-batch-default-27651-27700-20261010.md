# Disposition and Edit Batch: `default` IDs 27651-27700

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  27651-27700, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: one accepted, five `not an issue`, and seven uncertain.
- Accepted correction at ID 27651 is applied.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 27651 | `Leave me.` / `가.` | Accepted: change to `날 내버려 둬.` Japanese says “leave me alone” and Chinese says “don't bother me”; the current Korean only tells the listener to go away and omits the request to leave the speaker alone. |
| 27652, 27654, 27657, 27659-27660, 27674, 27676-27680, 27682-27683, 27688, 27693, 27698 | Widow / Canneroc / Valor Arena / Sprite Champion / Ysa title / Onwer Brond / Hyperian Tragedy / theater roles / Flowering / names and factions / Witch Knight / Forsaken Plain | Uncertain: Korean preserves the identities and plot relationships, but proper names, roles, faction terms, and the possible English typo `Onwer` require corpus-wide context. Do not silently correct the source name. |
| 27670 | `the hex` / `헥스` | Uncertain: English and Japanese name a “hex,” while Chinese interprets it as six points. The card/game result and canonical Korean term are not established by this row. |
| 27671, 27690 | `dove` / `도브(Dove)` | Uncertain: English uses a lowercase familiar address, Japanese omits it, and Chinese renders it as “peace messenger.” Historical evidence suggests an endearment but does not establish a universal Korean equivalent. |
| 27672, 27697 | Stations of the Day / date display | Uncertain: the UI labels may be a post, station, or schedule category. Korean preserves `{1}` and `{2}` in order at 27697, but the display convention is not established. |
| 27689 | Clyeth Arne / “the rest of Dolve Arne” | Uncertain: the Korean preserves the account of the talisman, staff, and abandonment, but English/Japanese/Chinese do not settle whether Dolve Arne is a place, family, or people. |
| 27692 | `Yurny` / `유르니` | Uncertain: the Korean form is plausible, but Japanese and Chinese phonetic forms differ and no canonical Korean spelling is established. |
| 27700 | Belmaid / Maid of Windemere poem | Uncertain: the Korean preserves the curse, rescue, grief, and Wencen's illness, but poetic meter and the exact relationship among the named figures need integrated context. |
| 27663 | `50%` | Not an issue: the numeric value is identical across all four locales. |
| 27687 | Ring's natural fire affinity | Not an issue: English, Japanese, Chinese, and Korean all describe an increase to the wearer's affinity for fire. |
| 27692 | Chinese-only U+FEFF | Not an issue: the format character occurs only in the Chinese source after the name. It was retained there and was not copied into Korean. |
| 27697 | `{1}` and `{2}` placeholders | Not an issue: both placeholder identities and their order are preserved; the UI-display terminology question remains separate above. |
| 27653, 27655-27656, 27658, 27661-27662, 27664-27669, 27673, 27675, 27681, 27684-27686, 27691, 27694-27696, 27699 | Dialogue, lore, item, and concise UI wording | Not an issue: reviewed wording generally preserves English meaning and Japanese-supported voice. ID 27696 keeps the source's unnamed object implicit. |

## Verification

- The four-locale key/order, line-break, and normalized runtime-token checks
  recorded in the preliminary report remain valid. ID 27697 retains `{1}`
  and `{2}` in source order; the `50%` value at 27663 is unchanged.
- ID 27700 retains the matching two-stanza lineation. Chinese ID 27692's
  U+FEFF remains a source-only format exception.
- Only the Korean `Texto` value at ID 27651 changed; IDs, variants, row order,
  and all source CSVs remain unchanged.
- Active default CSV SHA-256 is recorded in the synchronized progress and
  handoff checkpoints.
- Register totals after this batch: 857 accepted, 2,968 `not an issue`, and
  4,941 uncertain (8,766 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 27701; 37,434 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
