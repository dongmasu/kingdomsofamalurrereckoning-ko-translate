# Disposition and Edit Batch: `default` IDs 27401-27450

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 27401-27450, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: one accepted, two `not an issue`, and five uncertain.
- Accepted correction at ID 27418 is applied.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 27418 | `my brother` -> `오빠` | Accepted: change `오빠` to `형제`. English does not specify the speaker's gender or the sibling's relative age; `오빠` adds both. This matches the prior accepted neutral rendering of unspecified `brother` at ID 5762. |
| 27404 | Fallen Hirelings / broken oath-and-death utterance | Uncertain: preserve the fragmented speech, but confirm whether `Hireling` should be a formal role term and whether the clipped lines describe one or multiple events. |
| 27411, 27416-27417, 27421, 27441-27442, 27446, 27450 | Praetorians / Interest / Maid / Risbergs / chapterhouse / Blades and Seal / Sister Zelda / Hierophant | Uncertain: institutional, title, name, and quest-item forms need corpus-wide or scene-context alignment. |
| 27425 | Official-looking, hastily scribbled document | Uncertain: the Korean preserves both appearance and haste, but the document's actual status and function are not established by this fragment. |
| 27430, 27434 | Bodies in the Midden / object placed in the furnace room | Uncertain: Korean identifies bodies/corpses where English uses indirect referents. Surrounding remains-context supports this reading, but the exact object and action should remain provisional. |
| 27448 | Contradictory investigation instruction | Uncertain: Korean preserves the source's apparent contradiction between finding out what is wrong and not wishing to investigate further. Keep it visible pending quest context rather than silently repairing it. |
| 27401-27403, 27405-27410, 27412-27415, 27419-27420, 27422-27424, 27426-27429, 27431-27433, 27435-27440, 27443-27445, 27447, 27449 | Dialogue, lore, quest, and concise UI/item wording | Not an issue: reviewed wording generally retains English meaning and Japanese-supported tone. |
| 27429 | Greatsword combat values | Not an issue: `+25` Physical Damage and `+40%` Greatsword Damage are preserved in the same order. |

## Verification

- The four-locale key/order, line-break, and runtime-token checks from the
  preliminary report remain valid. ID 27429 retains its one embedded line
  break and both displayed values.
- ID 27418 now uses a sibling term that does not infer the speaker's gender
  or the brother's relative age.
- Only the Korean `Texto` at ID 27418 changed; keys, variants, and row order
  were not changed.
- Active default CSV SHA-256:
  `a7558a92f602baffc3186e12c592060bc123478156c8494ff5854fae799b9081`.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39
  pre-existing bare-LF endings.
- Register totals after this batch: 851 accepted, 2,951 `not an issue`, and
  4,909 uncertain (8,711 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 27451; 37,684 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.

## Integrated Context Re-review (2026-10-12)

D-19362 removes the unsupported fighting detail at 27404. D-19363 resolves
eleven other uncertainty IDs as `not an issue`; only 27421 remains uncertain
for the Risbergs family/couple distinction. Totals: 2,228 accepted /
24,717 `not an issue` / 11,579 uncertain (38,524). See
[`consolidated context review`](consolidated-context-review-default-27401-27450-20261012.md).
