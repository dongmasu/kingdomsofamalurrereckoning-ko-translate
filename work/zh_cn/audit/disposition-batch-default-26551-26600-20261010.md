# Disposition and Edit Batch: `default` IDs 26551-26600

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 26551-26600, checked against English,
  Japanese, Chinese, active Korean, historical questions, and recurring terms.
- Decisions: two accepted, two `not an issue`, and three uncertain.
- Accepted corrections at IDs 26565 and 26598 are applied to the active
  Korean CSV. Other lore and name questions remain open.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 26565 | Lightwatch / “drown your sorrows” | Accepted: change to `술로 시름을 달래고 싶다면 라이트워치가 다시 문을 열었어.` The English idiom in a tavern context and Chinese explicitly imply drinking. |
| 26598 | Husband's ongoing contribution | Accepted: use `늘 큰 도움이 되어 왔어` rather than simple-past `필요한 사람이었어`; English `has been essential` describes ongoing help supplying potions and anti-venom. |
| 26551-26564, 26566-26572, 26574-26576, 26578-26590, 26592-26597, 26599-26600 | Dialogue / short labels / quest wording | Not an issue: the reviewed wording generally preserves the source intent and speaker voice. |
| 26506, 26523, 26535, 26559, 26578, 26586 | `<Lie>` label / Mana / inn-cost variable / material counts / `$STR0` and `$STR1` / NUMPAD 2 | Not an issue: markup and variables are intact, English/Chinese token order is preserved, and displayed values match. |
| 26551, 26554-26555, 26558, 26561, 26564, 26567, 26571-26572, 26575, 26577, 26584, 26587-26588, 26592, 26594-26595, 26598-26599 | Aster / Scaith / Marauders / Mitharu / House of Valor / names / factions / lore terms | Uncertain: recurring names, organizations, and deity/quest terminology require corpus-wide alignment; the linked House of Valor forms remain open. |
| 26552, 26565, 26573, 26575, 26594, 26598-26599 | Suggestive dialogue / Lightwatch / Belen / Champion of Valor / Akara / ongoing aid / Tala-Rane | Uncertain: accepted idiom and tense edits do not resolve separate lore, title, or narrative-context questions. |
| 26515, 26517, 26573, 26581, 26585, 26599 | Maire/Irion departure / Conquerer typo / cultist testimony / old relics / Offering / “monument to nothing” | Uncertain: voluntariness, religious meaning, source spelling, and the final metaphor need surrounding context. |

## Verification

- English, Japanese, Chinese, and Korean each contain IDs 26551-26600 once in
  identical order.
- `<Lie>` markup, `$SQ15_FIN.m_inn_cost$`, both `$STR` tokens and their
  English/Chinese order, the five wood/two cloth counts, and `NUMPAD 2` are
  preserved.
- The only Korean CSV edits in this batch are IDs 26565 and 26598. UTF-8 BOM,
  72,046 CRLF endings, and 39 pre-existing bare-LF endings are preserved.
- Active default CSV SHA-256:
  `15ea5ada1b64a8567645f7d916c41f6f3368f359b5703709530eb7a4adc4ade4`.
- Register totals after this batch: 840 accepted, 2,914 `not an issue`, and
  4,845 uncertain (8,599 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 26601; 38,534 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
