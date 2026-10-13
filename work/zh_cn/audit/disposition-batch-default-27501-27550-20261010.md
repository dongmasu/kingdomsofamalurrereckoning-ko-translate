# Disposition and Edit Batch: `default` IDs 27501-27550

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  27501-27550, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: two accepted, two `not an issue`, and six uncertain.
- Accepted corrections at IDs 27502 and 27514 are applied.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 27502 | `말하지 마` for the recognition beat in “Don't tell me. Yes, that's it.” | Accepted: change the opening to `아, 생각났다.` English and Chinese retain the short recognition prompt, and Japanese explicitly says the speaker is remembering before confirming they have met. The current Korean reads as a literal command not to speak; the correction restores the recognition context without changing the following dialogue. |
| 27514 | `처음 고용 용병이 되었을 때 ... 싸우고 싶은` | Accepted: change to `처음 용병으로 일하기 시작한 뒤로 이렇게 투지가 넘친 적은 없어.` English's “full of fight” and Japanese's “fighting spirit” describe readiness and morale, not a desire to fight. The revision also removes the awkward `고용 용병` collocation. It does not settle the corpus-wide canonical Korean term for `Hireling`. |
| 27503, 27506, 27508, 27517, 27527, 27531, 27538-27539, 27543, 27546 | Chaos Matter / Well / Preordained / Beckoned / Bloodlust / Hospitalis Quarters / Festival of Ethene / Skoria Mine / Stone of Valor / House Ansilla | Uncertain: the translations are traceable and generally supported, but metaphysical, faction, ability, event, and place terms remain open for corpus-wide terminology alignment. Preserve current wording. |
| 27520 | `Scuttle` / `스커틀` | Uncertain: English and Chinese identify fresh crustacean food, while Japanese reads it as a bucket. The historical audit favors the English-based creature reading provisionally, but the exact species and Korean name are not established. |
| 27523 | Anwon betrayal and `죽이고 또 죽일 작정` | Uncertain: the English is compressed and unusual; Japanese and Chinese describe death continuing until the speaker's turn, while Korean makes repeated killing the speaker's explicit plan. Preserve pending scene context rather than inventing the intended agency. |
| 27533 | Breaking the Deep Slumber | Uncertain: English and Chinese say Callor will punish the addressee for breaking it; Japanese instead says Callor seeks help protecting it. The Korean conditional is consistent with the English/Chinese reading but the cross-locale conflict is material. |
| 27541 | `the Sorrows` / `슬픔의 힘` | Uncertain: English names only the Sorrows, while Japanese and Chinese explicitly add a power/force. The referent and whether “power” is implicit remain unresolved in the historical terminology audit. |
| 27545 | Purchasable “powerful titles” / `강력한 작위` | Uncertain: English permits titles, ranks, or honors; Japanese and Chinese support a title-like reading, but the game's purchasable-status system and canonical Korean label are not established by this row. |
| 27548 | `distinction and virtue` / `명예와 미덕` | Not an issue: the Japanese explicitly uses honor and virtue, and the Chinese supports distinction/excellence. Korean preserves both qualities and the promise attached to holding the weapon. |
| 27501, 27504-27505, 27507, 27509-27513, 27515-27516, 27518-27519, 27521-27522, 27524-27526, 27528-27530, 27532, 27534-27537, 27540, 27542, 27544, 27547, 27549-27550 | Dialogue, lore, quest, item, and concise UI wording | Not an issue: reviewed wording generally preserves the English meaning and Japanese-supported voice. ID 27545's purchasable-title terminology is tracked separately above. |

## Verification

- The four-locale key/order, embedded line-break, and normalized runtime-token
  checks recorded in the preliminary report remain valid. ID 27534's
  `#NAMED_ICON_SKILL_ALCHEMY#` marker remains unchanged.
- Chinese ID 27543 alone contains U+FEFF; it remains untouched as a
  source-format exception.
- Only Korean `Texto` values at IDs 27502 and 27514 changed; IDs, variants,
  row order, and all source CSVs remain unchanged.
- Active default CSV SHA-256 is recorded in the synchronized progress and
  handoff checkpoints.
- Register totals after this batch: 853 accepted, 2,956 `not an issue`, and
  4,919 uncertain (8,728 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 27551; 37,584 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
