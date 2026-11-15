# Five More Asset Revalidations

- Date: 2026-11-11.
- Scope: all 65 unique `default` IDs linked to five previously unrecorded
  assets.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Six IDs carry correction candidates and one remains on an
  evidence-limited hold. No translation CSV was changed.

## Grouping Evidence and Limits

`2028142.quest_bxml` has 12 quest-log, objective, and status keys for the
Sewer Run. It has no explicit quest ID, NPC symbol, or dialogue handler.

`534119.quest_bxml` has 14 keys and 14 serialized dialogue handlers, but no
explicit quest ID or NPC symbol. Its Garaner, Webwood, and Canneroc references
are topic clues only; handlers do not map keys to speakers or playback order.

`662564.quest_bxml` has 13 journal and objective keys associated with four
quest IDs, `TR02`, `TR03`, `TR04`, and `TR05`. It has no NPC symbol or
dialogue handlers. This is a multi-quest asset, not evidence that the entries
are one conversation.

`725343.quest_bxml` has 13 jail/tutorial, objective, journal, and status
keys. It has no explicit quest ID, NPC symbol, or dialogue handler.

`843163.quest_bxml` has 13 keys and six dialogue handlers, but no explicit
quest ID or NPC symbol. Its Ettin, Avicenn Etelle, and Scholia Arcana
references do not establish per-key speakers or order.

All 65 rows were compared in English, Japanese, Chinese, and active Korean.
The exact-English duplicate groups were checked by ID: `Quest Failed`
(`2581`/`28259`), `Quest Complete` (`29070`/`38559`), and `Ettin`
(`4481`/`6141`). Their Korean translations already match. No embedded line
breaks, runtime placeholders, or markup were found.

No speaker or playback order was inferred from asset membership, quest IDs,
handler counts, or localization-key order.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `1683` | Terminology / objective style | `Turn in the Contract` is rendered `계약 완료 보고`, while the same English objective at IDs `334`, `2435`, `5797`, `6068`, `9423`, `11235`, `13297`, and `63763` is `계약서 제출하기`. Align this occurrence to the established form. | High |
| `37261` | Naturalness / journal style | This contract-failure entry uses polite endings (`사망했습니다`, `이행할 수 없습니다`), unlike the plain journal-style statements at `38921`, `42710`, and `45312`; Japanese also uses plain narration. Consider a consistent plain form, without assigning it to a character. | High |
| `56405` | Meaning / naturalness | In this asset, `I ran the sewer` refers to completing the masons' Sewer Run race. Korean `하수도를 질주했어` reads as running through the sewer; Japanese explicitly says the race was completed. Consider `석공들의 하수도 경주를 완주했다.` | High |
| `40418` | Format / naturalness | The English text ends with a dangling comma, and Korean copies it, leaving the journal sentence unfinished. Japanese and Chinese end the same entry as a complete sentence. Add a sentence ending after `Sun Camp` without inventing another camp or clause. | Medium-high |
| `47944` | Objective style | This `Visit the remaining camp` objective is `남은 야영지 방문`, while the parallel `Visit the remaining camps` at `56379` uses the project's `-하기` form. Consider `남은 야영지 방문하기`. | High |
| `51959` | Terminology / naturalness | `member of the Travelers` is rendered `트래블러(Travelers)들의 일원`. The established faction label is `트래블러(Travelers)`; use the faction possessive (`트래블러(Travelers)의 일원`) rather than pluralizing the faction name. | High |

## Evidence-Limited Hold

| ID | Question | Reason and disposition |
| ---: | --- | --- |
| `44978` | `Thank you for keeping them that way.` | English can refer back to the Ettin's failure to sustain civil society, while Japanese and Chinese interpret this as thanks for defeating or driving them away. Korean follows the latter interpretation. The asset does not settle the idiom, so retain provisionally rather than choosing a new reading. |

## Retained Text

The other rows were retained after source comparison. In particular,
`28079`'s “can't have ears for everyone” is adequately conveyed by the
conversational Korean; the asset does not identify its speaker. The different
camp-list entries in `662564.quest_bxml` describe different remaining-camp
states, so they were not forced into one translation. Jail tutorial wording
was treated as system text, not as a character-register sample.

## Complete ID Sets

- `2028142.quest_bxml`: `1683`, `2581`, `17652`, `21299`, `28259`, `37261`,
  `38921`, `42710`, `45312`, `47950`, `48726`, `56405`
- `534119.quest_bxml`: `63`, `11981`, `28079`, `31994`, `37101`, `38078`,
  `41605`, `45457`, `46619`, `47743`, `49727`, `54472`, `63354`, `63657`
- `662564.quest_bxml`: `1894`, `9352`, `16750`, `24926`, `28919`, `34822`,
  `38559`, `40418`, `47944`, `51959`, `54468`, `56379`, `57278`
- `725343.quest_bxml`: `1807`, `10864`, `15796`, `21413`, `25666`, `29070`,
  `43408`, `47999`, `50310`, `51947`, `54018`, `59775`, `63211`
- `843163.quest_bxml`: `1918`, `4481`, `6141`, `15096`, `26661`, `30237`,
  `42664`, `44052`, `44978`, `50282`, `57007`, `60835`, `64589`

All 65 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
