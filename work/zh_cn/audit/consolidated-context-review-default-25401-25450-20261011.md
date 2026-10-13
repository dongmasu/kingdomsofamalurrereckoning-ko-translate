# Consolidated Context Review: `default` IDs 25401-25450

- Date: 2026-10-11.
- Scope: re-review of the 37 previously uncertain unique keys in IDs
  25401-25450 against English meaning, Japanese source and draft/register,
  Chinese supporting evidence, active Korean, and prior project decisions.
- Result: 35 keys resolved (two accepted corrections and 33 `not an issue`);
  IDs 25406 and 25450 retain specific holds. Previously resolved IDs
  25405, 25410, 25418, and 25444-25446 are linked without recounting.
- English remains the semantic authority; Japanese informs voice/register;
  Chinese is supporting evidence.

## Decisions D-19162-D-19175

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19162 | 25401-25403 | not an issue | The taunt identifies the Fateless, the skill label uses the established official-manual `Sagecraft = 마법물품 제작` term (D-18209), and the book/author relation is explicit. Locale transliterations differ, but no row-local meaning error or authoritative Korean author/title form supports a change. |
| D-19163 | 25406 | uncertain | English and Chinese retain a comma fragment (`Reddle,`), while Japanese reads it directionally (`レドルへ`). Without the preceding quest sentence or in-game context, it is unclear whether Korean should preserve the name fragment or express direction. Keep unchanged. |
| D-19164 | 25407-25409 | not an issue | Ander’s Bank, the Akara-Tor collapse and safe exit, the question about what lies ahead at Gallows End, Tari, and House Ansilla remain identifiable. Phonetic variants alone do not prove a row-local defect. |
| D-19165 | 25411 | not an issue | English says Sir Airmer declares himself Windemere's new Champion in the Maid's honor; the Korean preserves that relation and both access routes (defeat him or dispel the enchantment). The Japanese title embellishment does not override English. |
| D-19166 | 25414-25417 | not an issue | `Chantries` as chapels, the loan action, Borderless Window label, and the unfinished wedding-gift line to Hrindi are represented. The sentence fragment and ellipsis are retained. |
| D-19167 | 25419 | not an issue | `Join me in Bhaile` is rendered as joining the speaker in the named place; this preserves both the request and destination. Transliteration variation does not establish a local semantic error. |
| D-19168 | 25420-25424 | not an issue | The repeated burial accusation, the pirate sighting while collecting the morning catch, the Telling's unraveling, and the request to bring Korrinna to live with the speaker and Jottun are preserved. |
| D-19169 | 25425-25428 | not an issue | The collection's commission by Ysa, Hallam's role in its creation and the Fae Cairns, closing Chaos Portals, Teinir Home, and the lock/key request remain. No unsupported distinction between the collection and cairns is introduced. |
| D-19170 | 25430-25434 | not an issue | Mithros as the Giants' home, the ring/journal/Korrinna sequence and Hystis reward, the impatient demand, return to Gorem Kane, and warning to leave are preserved. The Blackened Hall form matches active `base` usage. |
| D-19171 | 25435 | accepted | Add Korean quotation marks around `여왕` to preserve the English scare quotes, corroborated by Japanese and Chinese quotation marks; retain ownership and guarding relations. |
| D-19172 | 25437 | not an issue | Belne's weapon, its use against Witch Knight Anira in Cann-Rane, and the offer to repair weapons and armor are all retained. Locale phonetic spellings do not support a more reliable isolated replacement. |
| D-19173 | 25439-25443 | not an issue | Ambition grants the will to strive for perfection; `Trim` is plausibly a decorative-material label (`飾材` in Japanese), and the roots-before-growth condition, Thresh distraction, heartvines, leadership question, and Neassa label remain. |
| D-19174 | 25447-25448 | mixed | At 25447, the heirloom, Mithros carving resemblance, and peace/euphoria effect are preserved; name variation does not establish a local error. Accept 25448: `foundations` means structural foundations, supported by Japanese `基礎部分` and Chinese `地基`, not general infrastructure. |
| D-19175 | 25450 | uncertain | The passage clearly names the Houses of Pride and Vengeance, but the active corpus alternates translated and phonetic House names (including `긍지의 가문`, `자긍심의 가문`, and `복수의 가문`). Do not normalize this row without an approved corpus-wide House-name convention. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25435 | `... 지금은 그의 여왕이 지키고 있다.` | `... 지금은 그의 ‘여왕’이 지키고 있다.` | Preserve the source's marked/scare-quoted `“queen”`, also quoted in Japanese and Chinese. |
| 25448 | `... 하수도 저수조에 물이 고여 기반 시설에 압박을 주고 있다고 적혀 있었다.` | `... 하수도 저수조에 물이 고여 기초 부분에 부담을 주고 있다고 적혀 있었다.` | Translate `straining the foundations` as pressure on structural foundations, not strain on general infrastructure. |

## Verification

- English source, Japanese source, Japanese-derived draft, Chinese source,
  active Korean, and the byte-identical pre-edit backup each contain 65,135
  unique ascending IDs. IDs 25401-25450 occur exactly once and in identical
  order in each file.
- The default resource has no `Tipo_Variante` field. All 50 rows were joined
  by `ID_Linha`, not physical line number.
- No embedded line-break or detected runtime/markup-token differences were
  found across the five locale resources in this interval.
- The active CSV retains its UTF-8 BOM, 72,011 CRLF record endings, and 73
  existing bare-LF record endings. Only `Texto` at IDs 25435 and 25448
  differs from the backup; exact byte reconstruction from the backup with
  those two substitutions passes.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-25401-25450-D19162/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `356d3b553daac30877f5557d49e1d9b7f48cfff1cff7ed2b42348e76ac65de5a`.
- Post-edit SHA-256:
  `1f57782177c1bd030fbd9806c66ea11677b75f31d5b4f89eeb25a13e474bb44a`.
- Cumulative context-review totals: 2,164 accepted / 24,112 `not an issue`
  / 12,248 uncertain (38,524 counted keys). Resume at D-19176, ID 25451.
  Sequential context review remains for IDs 25451-65134 (39,684 IDs),
  earlier specific holds, and the D-18422-D-18452 register backfill.
