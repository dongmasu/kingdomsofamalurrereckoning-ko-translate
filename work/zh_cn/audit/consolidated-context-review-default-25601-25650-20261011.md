# Consolidated Context Review: `default` IDs 25601-25650

- Date: 2026-10-11.
- Scope: re-review prior uncertainty findings from IDs 25601-25650, aligned
  by ID across English, Japanese source and Japanese-derived draft, Chinese,
  active Korean, prior decisions, and recurring terms.
- Result: resolve 34 of 39 still-uncertain keys (two accepted corrections
  and 32 `not an issue`); retain specific holds at IDs 25601, 25611, 25637,
  25639, and 25643. ID 25617 links to D-18225 without recounting.
- English is the semantic authority; Japanese informs voice/register and
  provides supporting terminology evidence; Chinese is a secondary check.

## Decisions D-19210-D-19216

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19210 | 25601-25603 | mixed | ID 25602 preserves the secret council's government and immunity from corruption/idolatry. Accept ID 25603 as `관통의 빛(Piercing Light)`, reusing the established named-weapon form at D-18453. Keep ID 25601 uncertain: all locales retain an unknown day value, and the isolated counter does not reveal whether `?` is a runtime value or intentionally incomplete label. |
| D-19211 | 25604-25612 | mixed | Accept ID 25608 as `워스원(Warsworn) 궁수`, reusing accepted D-2857. The QA label, Maid objective, ranged-damage value, request, title-match hiring, Cadogan Twayn, and Travelers' origin remain semantically intact. Keep ID 25611 uncertain because Kollossae spellings conflict across accepted decisions (`콜로세` and `콜로사이`); do not choose a corpus-wide form from this row. |
| D-19212 | 25613-25616, 25618 | not an issue | The letter salutation, report directive, Camden's possible return, and standalone names remain traceable to English. ID 25617 was separately resolved by D-18225 and is linked without recounting. Locale transliteration differences alone do not demonstrate a row-local error. |
| D-19213 | 25621-25624, 25626-25628 | not an issue | The save-space choice, Shieldring Keep destination, all-Lorestone discovery, suspicion, childhood memory, Ordo introduction, and gem-removal result are preserved. `{1}` remains unchanged and in order. |
| D-19214 | 25633-25637 | mixed | Acae, Walen, Fae Blades, and the Grian purchase contrast remain traceable and semantically intact. Keep ID 25637 uncertain: capitalized `Walls` may be a named district or a literal place description; Japanese transliterates it while Chinese translates it descriptively, and the isolated line cannot settle the geography. |
| D-19215 | 25639-25643 | mixed | Mercantile `+1`, the Pteryx warning, and Agarth's lead about an old friend are preserved. Keep ID 25639 uncertain because capitalized `Font` may be a named structure/place despite Japanese/Chinese supporting a spring/font reading. Keep ID 25643 uncertain: `Hireling` may be a formal game category/rank, and this standalone label cannot settle the corpus-wide term. |
| D-19216 | 25645-25649 | not an issue | `Guardian`, the Akara vessel ceremony, the reaction, quest-failed label, and experience-bar tutorial retain their English meanings; the auxiliary-language differences do not establish a Korean error. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25603 | `틸레라 장군과 함께 꿰뚫는 빛을 되찾았고, 멜 센시르에서 투아사와 싸울 준비를 마쳤다.` | `틸레라 장군과 함께 관통의 빛(Piercing Light)을 되찾았고, 멜 센시르에서 투아사와 싸울 준비를 마쳤다.` | Reuse the established named-weapon rendering accepted at D-18453; retain the source item name for traceability. |
| 25608 | `워스워른 궁수` | `워스원(Warsworn) 궁수` | Reuse the established Warsworn rendering accepted at D-2857. |

## Verification

- English source, Japanese source, Japanese-derived draft, Chinese source,
  and active Korean each contain 65,135 unique ascending IDs. IDs
  25601-25650 occur exactly once and in identical order in every file.
- Per-row embedded line-break counts and detected runtime-marker signatures
  match English across the interval. The `{1}/{2}` and `{1}` placeholders
  remain unchanged and in their original order.
- Only active Korean `Texto` values at IDs 25603 and 25608 changed.
  Reversing those two substitutions reproduces the pre-edit backup
  byte-for-byte. UTF-8 BOM, row order, 72,011 CRLF endings, and 73 existing
  bare-LF endings are preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-25601-25650-D19210/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `aeb60301ba8cd905e26601c1c8a823c82fd271e6d2db40f5816bb5d8e0d7f984`.
- Post-edit SHA-256:
  `d715d9f5d1bd027530e4a66f41fad290e357d36f9b507ef730ae736165eb5b73`.
- Totals: 2,172 accepted / 24,209 `not an issue` / 12,143 uncertain
  (38,524 counted keys). Resume at D-19217, ID 25651; the contiguous
  interval 25651-65134 remains, as do earlier specific holds and the
  D-18422-D-18452 register reconciliation.
