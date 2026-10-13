# Disposition and Edit Batch: `default` IDs 5650-5699

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and applicable historical questions for
  `default` IDs 5650-5699.
- Compared immutable English, Japanese, and Chinese rows with active Korean.
  English governed meaning; Japanese informed voice/register; Chinese was a
  supporting cross-check.
- Seventeen findings were dispositioned: two accepted, five `not an issue`,
  and ten uncertain. Two accepted `Texto` cells were changed.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 5655 | `Activity - Carcass` | Defer whether this UI label describes an activity or a specific carcass action. | D-1477: uncertain. |
| 5657 | Goyen Reen's betrayal and attack order | Keep the Korean inference; the note supports a deduction rather than certainty. | D-1478: not an issue. |
| 5658 | Sneak past the Faer Gorta | Keep the creature name and stealth objective. | D-1479: not an issue. |
| 5661 | Wrath / Impulse ability and damage values | Defer canonical ability/category wording; retain all values and structure. | D-1480: uncertain. |
| 5662 | Carts carrying fallen soldiers' corpses west | Keep the limited `some` qualifier and lasting loss of desire to fight. | D-1481: not an issue. |
| 5665 | Gods sought to “raise us up” | Defer the exact lore sense of elevation or transformation. | D-1482: uncertain. |
| 5668 | House Oratory in Ettinmere | Defer canonical place/institution identity; do not import the Japanese-only House of Ballads detail. | D-1483: uncertain. |
| 5670 | Winning the next match will make history and upset gamblers | Replace the awkward temporal `그동안` connection with a natural additive consequence. | D-1484: accepted. |
| 5672 | `Draug's Toothpicks` | Keep the odd weapon-name joke and English traceability. | D-1485: not an issue. |
| 5678 | Walls, Arcadium, and `sites` | Defer whether Walls is a formal place and what `sites` denotes. | D-1486: uncertain. |
| 5680 | Kollossae / Ethene names | Defer canonical spellings pending terminology reconciliation. | D-1487: uncertain. |
| 5681 | `Murghan-at-Arms` | Defer whether this is a formal creature class/title or a descriptive label. | D-1488: uncertain. |
| 5683 | Ljosalfar trader and hostile family remark | Keep the established `료스알브` form and contemptuous tone. | D-1489: not an issue. |
| 5687 | Institutions residing on the Trellis | Defer whether the source means institutions, buildings, or sanctuaries and standardize House names with broader context. | D-1490: uncertain. |
| 5691 | `Silkfarmer` | Defer the setting-specific occupation/group term; recurring `base` findings remain open. | D-1491: uncertain. |
| 5692 | `I've fought bigger than you` | Render `bigger` as more formidable opponents, not physically larger opponents. | D-1492: accepted. |
| 5699 | `Be my second` in a duel | Defer the natural Korean equivalent for a second/attendant in this duel context. | D-1493: uncertain. |

All uncertain rows remain unchanged.

## Applied Corrections

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 5670 | `다음 경기에서 이기면 역사를 쓰게 될 거야, 검투사. 그동안 도박꾼들도 잔뜩 속을 끓이겠지!` | `다음 경기에서 이기면 역사를 쓰게 될 거야, 검투사. 게다가 도박꾼들도 잔뜩 속을 끓이겠지!` | D-1484: remove the misleading temporal link while preserving the gamblers' frustration. |
| 5692 | `너보다 더 큰 상대와도 싸워 봤어.` | `너보다 더 만만찮은 상대와도 싸워 봤어.` | D-1492: use the figurative “tougher/more formidable” sense supported by English and Japanese. |

## Structural Verification

- English, Japanese, Chinese, and Korean each contain 65,135 `default` rows
  with identical ordered IDs; IDs 5650-5699 are present in matching order.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF record
  endings, and zero bare LF bytes.
- The two edited cells retain their row keys, one-record layout, and runtime
  structure. Values and line breaks in the ability description at ID 5661
  remain unchanged.
- Active Korean `default` CSV SHA-256:
  `2d4317e43f7eafa31518fc939d7515a8c3d5889a64216dc2ccd8696d9536e8ba`
- Cumulative dispositions: 283 accepted, 401 `not an issue`, and 809
  uncertain. Resume at `default` ID 5700; 59,435 rows remain.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology, combined-name consistency, and integrated
voice review remain open.
