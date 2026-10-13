# Disposition and Edit Batch: `default` IDs 5600-5649

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and applicable historical questions for
  `default` IDs 5600-5649.
- Compared immutable English, Japanese, and Chinese rows with active Korean.
  English governed meaning; Japanese informed voice/register; Chinese was a
  supporting cross-check.
- Twenty-eight findings were dispositioned: one accepted, sixteen
  `not an issue`, and eleven uncertain. One accepted `Texto` cell was changed.
- The combined terminology finding covers `default` IDs 5619, 5625, and 5638.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 5600 | `The Ariad` | Keep `아리아드대` as a unit/group. | D-1449: not an issue. |
| 5601 | Gallows End distance and isolation | Defer canonical place-name spelling. | D-1450: uncertain. |
| 5602 | Capitalized `The Tree` and Winter Fae decay imagery | Defer named-entity versus generic-tree status. | D-1451: uncertain. |
| 5603 | Bodies at an unnamed person's feet / Giran | Keep the implicit antecedent and shocked question. | D-1452: not an issue. |
| 5605 | Six-line Engard lore passage | Keep the animal comparisons, agency, and six-line structure. | D-1453: not an issue. |
| 5606 | Mysterious shorthand scroll | Keep the distinction between unknown symbols and unreadability to those who do not know them. | D-1454: not an issue. |
| 5608 | Fall of Castle Yolvan / title-subtitle relation | Keep the history/ruin relation; defer canonical spelling. | D-1455: uncertain. |
| 5609 | Maid's challenge / Wencen's fate | Keep English's compressed conditional without importing Japanese's explicit rescue purpose. | D-1456: not an issue. |
| 5612 | `vermin` in villages, castles, and ruins | Defer whether the in-world target is pests or monsters. | D-1457: uncertain. |
| 5613 | Two rivals and promised army | Keep the simultaneous-rival constraint and army condition without implying alliance. | D-1458: not an issue. |
| 5614 | `Flawless Mitharan Slaughtering Rivets` | Defer the modifier's function and item terminology. | D-1459: uncertain. |
| 5615 | Encountering an individual Fae | Keep the singular encounter and informal warning. | D-1460: not an issue. |
| 5617 | Colm Alba, Hreid, Eathe, and Fyragnos sequence | Keep who stays to hold the door and who proceeds. | D-1461: not an issue. |
| 5618 | `+40% Damage Resistance While Dodging` | Keep the dodge condition and exact value. | D-1462: not an issue. |
| 5619, 5625, 5638 | Valor / Champion / Lords / House of Valor terms | Keep `용맹` consistently and align `House of Valor` with D-148. | D-1463: not an issue. |
| 5621 | `wearing a rut around Mel Aglir` | Defer the idiom, pike imagery, and target of the chase. | D-1464: uncertain. |
| 5623 | Player moved aside so the speaker could kill the remaining group | Keep the English/Chinese causal reading; do not import Japanese-only additions. | D-1465: not an issue. |
| 5626 | `American Samoa` | Keep the shared standalone name without inferring a test-string error. | D-1466: not an issue. |
| 5631 | House / Delver / Tender roles | Defer faction and formal-role status. | D-1467: uncertain. |
| 5633 | Sarcastic sewer “accomplishments” and `divinity` | Keep the sarcasm and broad `신성` wording. | D-1468: not an issue. |
| 5635 | Tirin's Rest / past locked away and forgotten | Keep the speaker's abrupt retreat and the past-as-buried image. | D-1469: not an issue. |
| 5639 | `clap on chains of faith` | `“무릎 꿇어라, 경건한 자들아! 너희 신들은 너희를 나약하게 버려두었다! ‒ 온순한 자에게나 어울리는 믿음의 사슬을 몸에 둘러라!”` | D-1470: accepted. |
| 5640 | Twelve-line High Fulgen poem | Defer imagery and poetic-register choices; retain all lines. | D-1471: uncertain. |
| 5641 | Unnamed comrade / Summer and Winter Fae | Keep the unnamed comrade; do not import the Japanese-only name Maxen. | D-1472: not an issue. |
| 5643 | House of Sorrows / Faelands | Keep the source meaning and established `패란즈`; defer canonical House name. | D-1473: uncertain. |
| 5646 | Great Cycle / autumn / rebirth | Defer the canonical lore term and unusual source grammar. | D-1474: uncertain. |
| 5647 | Vagrants at Beggar's Bluff vs. refugees in Galafor | Keep the English/Japanese-supported distinction; do not import Chinese's “merchants.” | D-1475: not an issue. |
| 5649 | Rithen / Phasmer Humm | Defer canonical name spellings. | D-1476: uncertain. |

All uncertain rows remain unchanged.

## Applied Correction

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 5639 | `...온순한 자에게 어울리는 믿음의 사슬을 두르고 기뻐하라!` | `...온순한 자에게나 어울리는 믿음의 사슬을 몸에 둘러라!` | D-1470: render `clap on` as putting on chains, not rejoicing; restore the meek comparison. |

## Structural Verification

- English, Japanese, Chinese, and Korean each contain 65,135 `default` rows
  with identical ordered IDs; IDs 5600-5649 are present in matching order.
- The Korean CSV parses successfully and retains its UTF-8 BOM, semicolon
  delimiter, CRLF record endings, and zero bare LF bytes.
- The edited ID 5639 retains the source line's single record and has no
  embedded line break or runtime token. The six-line passage at ID 5605 and
  twelve-line poem at ID 5640 remain structurally unchanged.
- Active Korean `default` CSV SHA-256:
  `01a95c3845c58e6b4deaf6b9b9bc0a3dbdfdaf530e4b82fbe0340a500c17b5b9`
- Cumulative dispositions: 281 accepted, 396 `not an issue`, and 799
  uncertain. Resume at `default` ID 5650; 59,485 rows remain.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology, combined-name consistency, and integrated
voice review remain open.
