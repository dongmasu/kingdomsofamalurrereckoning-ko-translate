# Consolidated Context Review: `default` IDs 25701-25750

- Date: 2026-10-11.
- Scope: re-review prior uncertainty findings from IDs 25701-25750, aligned
  by ID across English, Japanese source and Japanese-derived draft, Chinese,
  active Korean, prior decisions, and recurring terms.
- Result: resolve 28 of 30 prior uncertain keys (three accepted corrections
  and 25 `not an issue`); retain specific holds at IDs 25707 and 25727.
- English is the semantic authority; Japanese informs voice/register and
  provides supporting terminology evidence; Chinese is a secondary check.

## Decisions D-19224-D-19232

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19224 | 25703-25705 | not an issue | Secandra's expected leadership, Primos succession, Mayor Flanagan realization, kidnappers' organization, and Sverri Kura label remain. Name variants do not change the row meanings. |
| D-19225 | 25707 | uncertain | English/Japanese's `Grim's Special` does not identify whether this is a named dish or a special gift/item. Korean's `특선 요리` chooses the dish reading; retain unchanged until the game/menu context resolves it. |
| D-19226 | 25711-25715 | mixed | Correct the Beckoned player-title form at 25711 to `부름받은 자` per D-3443; English does not identify the unnamed master, and Korean preserves that. The Sigil Stone, Lupoku (official Korean manual form `로포쿠`, D-13704), Great Cycle, and Ychen remain accurate/traceable. |
| D-19227 | 25717, 25719-25720 | not an issue | The human upbringing, master training, Cape Solace reputation, health decrease, and Aster-amulet inheritance objective are preserved. The standalone status label conveys the English value; broader UI glossary consistency is separate. |
| D-19228 | 25724, 25727, 25729-25731 | mixed | Fateweavers uses the glossary form `페이트위버` (D-1495); Acatha, Derfel, Lucky Mine, the rare whiskey objective, Guard, and Jottun cohabitation remain source-traceable. Keep 25727 uncertain: capitalized `Hexes` may be a curse, card category, or game term, and locale evidence conflicts. |
| D-19229 | 25734-25739 | mixed | Correct the Beckoned and Kollossae forms at 25735 using D-692 and the later accepted Kollossae form `콜로사이` at D-18878/D-18933. The trust concern, invitation, names Arden/Janara, and Court of Summer request remain. |
| D-19230 | 25741-25742 | mixed | The +10% stealth critical-damage effect, both blank-line breaks, and unlock text are preserved. Correct 25742: English says one bottle per crew, not one per sailor; render `선원단마다 ... 한 병씩`. |
| D-19231 | 25744 | not an issue | Korean omits the subject of “She won't be happy” naturally while retaining the following male scroll-holder; it does not resolve the English pronoun mismatch by inventing a referent. |
| D-19232 | 25746-25749 | not an issue | The protected guest instruction, Templar office, thanks, negotiation proposal, paragraph divisions, and descent to the Pit remain. Korean correctly renders the misspelled English `negotioations` by its intended meaning. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25711 | `형제자매들이여, 모여라! 선택받은 자의 죽음에 우리 주인님께서 상을 내리실 것이다!` | `형제자매들이여, 모여라! 부름받은 자의 죽음에 우리 주인님께서 상을 내리실 것이다!` | Use the established player-title translation accepted at D-3443. |
| 25735 | `선택받은 자여, 콜로새의 무기가 전투에서 실패하는 일은 드뭅니다.` | `부름받은 자여, 콜로사이의 무기가 전투에서 실패하는 일은 드뭅니다.` | Reuse accepted Beckoned D-692 and the later preferred Kollossae form at D-18878/D-18933. |
| 25742 | `도망친 놈들이며 무기와 갑옷은 필요 없어. 하지만 각 선원에게 보그스토언치 한 병씩 줬지. 그걸 되찾아야 해.` | `도망친 놈들이며 무기와 갑옷은 필요 없어. 하지만 선원단마다 보그스토언치 한 병씩 줬지. 그걸 되찾아야 해.` | English `each crew a bottle` specifies one bottle for each crew; the former `각 선원에게` instead distributes one to each sailor. |

## Verification

- English source, Japanese source, Japanese-derived draft, Chinese source,
  and active Korean each contain 65,135 unique ascending IDs. IDs
  25701-25750 occur exactly once and in identical order in every file.
- Per-row embedded line-break counts and detected runtime-marker signatures
  match English. ID 25741 retains both blank-line separators and the +10%
  value.
- Only active Korean `Texto` at IDs 25711, 25735, and 25742 changed.
  Reversing those exact substitutions reproduces the pre-edit backup
  byte-for-byte. UTF-8 BOM, row order, 72,011 CRLF endings, and 73 existing
  bare-LF endings are preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-25701-25750-D19224/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `fadaa0e6b096e8e7fa8f88ce58d186143656170a3dc8e6b58eb4f81293f9ffa8`.
- Post-edit SHA-256:
  `04e76ed8a6647ed1bd1594c9f6b8dc8376c870217b395a713d706642c20dfca4`.
- Totals: 2,176 accepted / 24,260 `not an issue` / 12,088 uncertain
  (38,524 counted keys). Resume at D-19233, ID 25751; the contiguous
  interval 25751-65134 remains, as do earlier specific holds and the
  D-18422-D-18452 register reconciliation.
