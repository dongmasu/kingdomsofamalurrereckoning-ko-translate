# Consolidated Context Review: `default` IDs 25651-25700

- Date: 2026-10-11.
- Scope: re-review prior uncertainty findings from IDs 25651-25700, aligned
  by ID across English, Japanese source and Japanese-derived draft, Chinese,
  active Korean, prior decisions, and recurring terms.
- Result: resolve 27 of 31 prior uncertain keys (one accepted correction
  and 26 `not an issue`); retain specific holds at IDs 25663, 25694, 25698,
  and 25699.
- English is the semantic authority; Japanese informs voice/register and
  provides supporting terminology evidence; Chinese is a secondary check.

## Decisions D-19217-D-19223

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19217 | 25651-25656 | not an issue | The Bloomers objective, Marus Torix statue description, explicit buying/selling distinction, request to stay, Haxhi Troll contract repost, and Fontmaster Nomeron's concern/weakening-magic report remain. Japanese and Chinese support the spring/font flow context; transliteration differences alone do not establish row-local errors. |
| D-19218 | 25663 | uncertain | `LoreWeapon` is a standalone internal-looking label. English/Japanese/Chinese do not establish whether it is player-facing or a technical category; retain Korean unchanged. |
| D-19219 | 25670, 25672-25673 | not an issue | `Dispel Ward`, `Mystic Hammer`, and the direct address to Bisarane are rendered transparently; no source establishes a conflicting spell/item sense or Korean name error. |
| D-19220 | 25676-25685 | not an issue | The Baronett's invitation, ale/fight preparation, strange entity, Father Etair's experiments, Summer Fae, repeated affirmative, Klurikon cleanup, Maire's title, and Livrarium are preserved. Cross-locale name variants do not prove local semantic errors. |
| D-19221 | 25687-25690 | not an issue | The offshore tower, contested hall, rebel soldiers, City Watch label, small-person remark, and Mercantile skill remain. Japanese's rapid-control-change paraphrase does not contradict the English-led Korean account. |
| D-19222 | 25693-25694 | mixed | Accept ID 25693 as `관통의 빛(Piercing Light)`, reusing D-18453 and the preceding context decision D-19210; the Niskaru duke's tusk and resting spear remain. Retain ID 25694 because the standalone `Brownie's Bite` item/title sense is not settled by the differing “bite/teeth” locale forms. |
| D-19223 | 25695-25699 | mixed | IDs 25695-25697 preserve the question about Irion, quest status, jewel/light, projected vision, mine workers, and Enser's outpost objective. Retain ID 25698 because the standalone `Shadowcaster` may be a game category/title, and ID 25699 because English/Chinese's `Undersea Fasting` conflicts with Japanese's undersea-passage reading. |

## Accepted Text Edit

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25693 | `이 유적은 니스카루 공작 가자오르의 엄니로 만든 창, 꿰뚫는 빛이 잠든 곳이라고 전해진다.` | `이 유적은 니스카루 공작 가자오르의 엄니로 만든 창, 관통의 빛(Piercing Light)이 잠든 곳이라고 전해진다.` | Reuse the established named-weapon form `관통의 빛(Piercing Light)` accepted at D-18453 and confirmed for the same weapon in D-19210. |

## Verification

- English source, Japanese source, Japanese-derived draft, Chinese source,
  and active Korean each contain 65,135 unique ascending IDs. IDs
  25651-25700 occur exactly once and in identical order in every file.
- Per-row embedded line-break counts and detected runtime-marker signatures
  match English across the interval; no token exception was found.
- Only active Korean `Texto` at ID 25693 changed. Reversing that exact
  substitution reproduces the pre-edit backup byte-for-byte. UTF-8 BOM, row
  order, 72,011 CRLF endings, and 73 existing bare-LF endings are preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-25651-25700-D19217/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `d715d9f5d1bd027530e4a66f41fad290e357d36f9b507ef730ae736165eb5b73`.
- Post-edit SHA-256:
  `fadaa0e6b096e8e7fa8f88ce58d186143656170a3dc8e6b58eb4f81293f9ffa8`.
- Totals: 2,173 accepted / 24,235 `not an issue` / 12,116 uncertain
  (38,524 counted keys). Resume at D-19224, ID 25701; the contiguous
  interval 25701-65134 remains, as do earlier specific holds and the
  D-18422-D-18452 register reconciliation.
