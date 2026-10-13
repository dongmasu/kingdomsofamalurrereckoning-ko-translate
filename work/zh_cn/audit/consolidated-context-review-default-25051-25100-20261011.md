# Consolidated Context Review: `default` IDs 25051-25100

- Date: 2026-10-11.
- Re-reviewed all 18 keys previously left uncertain against English meaning,
  Japanese voice/register and draft, Chinese supporting evidence, active
  Korean, recurring corpus forms, and earlier decisions.
- Resolved all 18: one accepted correction and 17 `not an issue`.
- The prior accepted correction at ID 25065 is linked but not recounted.

## Decisions D-19065-D-19073

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19065 | 25055-25057 | not an issue | Item quality/origin and binding function remain plausible; all HP/Mana values and the two-stage charge meaning are retained. The locale differences do not establish a canonical Korean item-component term. |
| D-19066 | 25058 | not an issue | Fae control of Bristletongue, its Font-water origin, and the request to apothecary Jakasen remain. Active corpus usage supports `샘(Font)` and `자카센(Jakasen)`; locale plant spellings do not show a Korean meaning error. |
| D-19067 | 25060-25064 | mixed | IDs 25060 and 25062-25064 preserve the question, response, Doctor Skull, and respectful greeting. At ID 25061, “Solstice” is a proper place/name form in the corpus (`솔스티스` at IDs 3154, 15467, and 30187), and the Japanese transliterates it; replace the seasonal noun `하지`. |
| D-19068 | 25069-25070 | not an issue | Immediate aid and the conditional later troop movement after the gate opens are preserved; Alabastra and Brogan Adair use traceable Korean forms. |
| D-19069 | 25077 | not an issue | The choice between the companion going to Sinsear and the one going to the capitalized “House” remains. `비탄의 집` is a plausible setting-specific referent; differing locale renderings do not establish a row-local error. |
| D-19070 | 25078-25079 | not an issue | English and Japanese support Erathi Ruin, which Korean correctly renders as `에라시 유적` despite the Chinese “runes” divergence. Retrieval of Piercing Light, the Niskaru's retreat, and the follow-up inquiry remain. |
| D-19071 | 25085 | not an issue | The speaker's months of theft, claimed curse knowledge, and request for a decision remain. English/Japanese support theft in the woods; Chinese's timber reading is an unresolved locale divergence, not proof of a Korean error. |
| D-19072 | 25094-25095 | not an issue | Octienne's departure and missing evidence, the Sprite's death, apparent Well disappearance, and return/report objective remain in order. `샘` is supported by established Font usage; name variants do not establish a different referent. |
| D-19073 | 25096 | not an issue | The opening of the way to the Teeth of Naros, search for Primos, and later revelation of duty are retained with the recurring Korean forms. |

## Edits

| ID | Before | After | Rationale |
| ---: | --- | --- | --- |
| 25061 | `하지` | `솔스티스` | English capitalization, Japanese transliteration, and existing active-corpus usage identify Solstice as a proper name here; `하지` incorrectly reads as the seasonal date. |

## Verification

- English, Japanese, Chinese, Japanese-derived Korean draft, and active
  Korean each contain IDs 25051-25100 exactly once and in identical order;
  all five contain 65,135 data rows.
- ID/variant keys and embedded line-break counts match across all five files.
  Runtime-marker identity, count, and order match English and active Korean.
  The localized `{*1...}` payloads at previously accepted ID 25065 remain
  intentionally different while all wrapper positions and `{LINE_SPACE}`
  are preserved.
- A byte-level comparison against the pre-edit backup proves only the
  approved `Texto` cell at ID 25061 differs. The UTF-8 BOM, row order,
  72,011 CRLF endings, and 73 existing bare LF endings are preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-25051-25100-D19065/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `3c93f7992dec904f26fbe5e19b76ae6a1b8b1e8b850d7ada3b25f43ecde2722e`.
- Post-edit SHA-256:
  `7586a097493b833b0ecfcd5af7b80f416920b6ffa5b5a74aa0c3bfd3aed7d786`.
- Totals: 2,145 accepted / 23,940 `not an issue` / 12,439 uncertain
  (38,524 counted keys). Resume D-19074 at ID 25101. Sequential IDs
  25101-65134 remain (40,034), along with earlier specific holds and the
  D-18422-D-18452 register backfill.
