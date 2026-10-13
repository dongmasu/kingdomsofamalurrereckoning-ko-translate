# Disposition Batch: `default` IDs 32351-32400

- Decision date: 2026-10-10.
- Scope: all 50 rows and preliminary findings for IDs 32351-32400, compared
  across English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, recurring terminology,
  line breaks, numeric values, and runtime tokens.
- Decisions: two accepted, four `not an issue`, and ten uncertain.
- CSV changes: IDs 32354 and 32396.

## Findings

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 32351 | Fate tapestry / Fateweaver terminology | Uncertain: Korean preserves all three thread actions and uses the established `운명의 태피스트리`; the Korean title for `Fateweaver` remains subject to corpus-wide alignment. |
| 32354 | `Asker's Draught` / `아스커의 영약` for the family's famous ale | Accepted: change to `아스커의 약주(Asker's Draught)` and clarify that the person could help the brothers brew it. English explicitly identifies an ale; `영약` incorrectly suggests a magical potion. |
| 32362 | Cipher / Beckoned / Primos in the recap | Uncertain: the event and instruction sequence are retained, but the entity, artifact, and office forms need integrated terminology review. |
| 32365 | `Castellan` / `성주`; Amaldor Sverri Kura | Uncertain: territorial oversight and war role are retained, but the formal office and personal-name rendering conflict across locales. |
| 32367 | Speaker's sister's House and own House | Uncertain: Korean preserves the collapse and protection contrast, but `House` may mean a named Fae faction rather than a family house. |
| 32371 | Five-Bolgan rusty-knife boast | Not an issue: both quoted facts and the speaker's dismissive punch line are retained; exact joke implications need no row-local correction. |
| 32373 | `Master's Pick` / `장인의 자물쇠따개` | Uncertain: the item is named consistently with ID 32211, but its exact identity/type is not established by the locales. |
| 32374 | Seven projectiles and 24/5/40 damage/cost values | Not an issue: projectile count, per-projectile damage values, and the separate 40-Mana cost line are preserved. |
| 32376 | `The hex. You lose.` / `헥스야. 네가 졌어.` | Uncertain: English/Japanese may name Hex, while Chinese reads a six-point result; game context is required. |
| 32381 | Prisoner exchange and `Every high moon` schedule | Uncertain: the labor-market description and schedule are retained, but the euphemism and calendar meaning of `high moon` remain unresolved. |
| 32385 | Bag of Winds / Watcher | Uncertain: puzzle sequence and result are preserved, but the item's and entity's canonical Korean names need alignment. |
| 32390 | `order of Mitharu` / `미타루 교단` | Uncertain: the holy symbol and religious-text meaning are retained, but the formal order's institutional name needs terminology review. |
| 32396 | `wrongs you have righted` / `우리가 바로잡지 못한 잘못`; `owe their futures` / `미래는 네게 달렸어` | Accepted: change to `네가 바로잡아 준 잘못들에 대해선 아무리 보답해도 부족해. 초대받은 자여, 우리 백성의 미래는 네 덕분이야.` Remove the unsupported “we could not right” detail and restore gratitude for the future the addressee secured. |
| 32399 | Mitharu's creed / Brother Fallon / Glendara shrines | Uncertain: custom, prayer-bead handoff, shrine visits, and amulet transformation are retained; order/creed and name spellings need integrated alignment. |
| 32351-32400 | Four-locale row order, line breaks, and numeric/runtime structure | Not an issue: each locale contains the same 50 IDs in order; the ID 32374 damage/cost break and 32381 invitation/schedule break, all values, and inspected markers are preserved. |
| Remaining ordinary text in IDs 32351-32400 | Dialogue / objectives / labels / ordinary prose | Not an issue: no additional supported semantic or Korean-usage defect was identified beyond the dispositions above. |

## Verification

- English, Japanese, Chinese, and Korean each contain all 50 IDs exactly once
  and in identical order.
- Embedded line-break counts match throughout, including the stat entry at
  ID 32374 and invitation/schedule entry at ID 32381.
- Numeric values at ID 32374 remain seven projectiles, 24 Ice Damage,
  5 Freezing Damage per projectile, and 40 Mana.
- Active default CSV SHA-256 is
  `bb48b884f8bdf87ac4a72135343e68b7948ca635b782c1ba73350103fe86e509`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- Register totals after this batch: 980 accepted, 3,616 `not an issue`, and
  5,909 uncertain (10,505 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 32401; 31,734 `default` IDs remain.

These working dispositions are not independent linguistic approval.
