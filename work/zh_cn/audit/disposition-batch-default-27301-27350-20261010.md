# Disposition and Edit Batch: `default` IDs 27301-27350

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 27301-27350, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: one accepted, two `not an issue`, and five uncertain.
- Accepted correction at ID 27332 is applied.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 27332 | “Wouldn't I love to move our camp ... but that's not possible” | Accepted: change `옮기고 싶지 않겠어? 하지만 불가능해.` to `옮길 수 있으면 좋을 텐데. 하지만 불가능해.` English and Japanese express the speaker's wish and inability; the old Korean instead asked whether the listener wanted to move the camp. |
| 27302-27303, 27308, 27311, 27313-27317, 27324-27328, 27333-27337, 27341-27344 | Summer/Winter Fae, Gadflow, Atteia, Tenhwa, Helius, Erathell, Lorca, Carasta Arawyn, Ashmoor, House of Pride, Seawine, House Anwon, Mace Darkken, Twayn | Uncertain: proper names, factions, places, and roles need corpus-wide form alignment. Preserve current forms; this finding does not approve a canonical glossary. |
| 27306 | `Display the Trophies` -> `전리품 전시하기` | Uncertain: Japanese indicates displaying heads, Chinese says trophies, and English may refer to a game-specific collection. The object/category is not settled by this label alone. |
| 27327 | Glyphs around dead/prone bodies | Uncertain: preserve the awkward source distinction among the body on the floor, the dead man, and the prone man until scene context clarifies the spatial description. |
| 27339 | `dustlings` -> `먼지 인간들` | Uncertain: the contemptuous address is retained, but related Korean forms vary across the corpus. Defer normalization to the species/address terminology pass. |
| 27350 | `User 2` -> `사용자 2` | Uncertain: the direct UI rendering is plausible, but historical review flags this as potentially a QA/test label rather than player-facing text. |
| 27301, 27304-27305, 27307, 27309-27310, 27312, 27318-27323, 27329-27331, 27338, 27340, 27345-27349 | Dialogue, lore, quest, and concise UI/item wording | Not an issue: reviewed wording generally preserves English meaning and Japanese-supported voice. The mother's proverb retains its comic warning. |
| 27315, 27331 | Material counts, bow modifier, damage and Mana values | Not an issue: the displayed material count, `+2` bow Piercing Damage, `100` Physical Damage, and Mana values match the locale references. |

## Verification

- The four-locale key/order, line-break, and runtime-token checks remain valid.
  ID 27301 retains two embedded line breaks; IDs 27315 and 27331 retain one
  each.
- ID 27332 now preserves the speaker's wish and the impossibility of moving
  camp behind the walls.
- Only the Korean `Texto` at ID 27332 changed; keys, variants, and row order
  were not changed.
- Active default CSV SHA-256:
  `b03f32d66ef751dc8be4153e8222b62607aca80569b9d11a81030b5d3fbafe9f`.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39
  pre-existing bare-LF endings.
- Register totals after this batch: 849 accepted, 2,947 `not an issue`, and
  4,897 uncertain (8,693 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 27351; 37,784 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.

## Integrated Context Re-review (2026-10-12)

D-19358 corrects ID 27306 from `전리품` to `트로피`; D-19359 resolves the
remaining 25 unique uncertainties as `not an issue`. The name variants,
source ambiguity at 27327, `dustlings` rendering, and `User 2` label are
traceable and do not establish row-level translation errors. Totals:
2,227 accepted / 24,694 `not an issue` / 11,603 uncertain (38,524). See
[`consolidated context review`](consolidated-context-review-default-27301-27350-20261012.md).
