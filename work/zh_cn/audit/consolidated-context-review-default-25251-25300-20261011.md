# Consolidated Context Review: `default` IDs 25251-25300

- Date: 2026-10-11.
- Scope: re-review the 26 unique uncertain ID keys in the prior
  disposition, using English as the meaning authority, Japanese original
  and Japanese-derived Korean draft for voice/register, Chinese as a
  supporting check, active Korean, and prior terminology decisions.
- Resolved 24 keys: four accepted corrections and 20 `not an issue`.
  IDs 25280 and 25290 remain uncertain for the previously identified
  corpus-wide Unseelie and Preordained terminology conflicts.
- The three keys already classified `not an issue` in the prior pass
  (25265, 25275, 25283) are linked, not counted again.

## Decisions D-19119-D-19133

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19119 | 25251, 25253 | not an issue | The return objective identifies Eli Tems, matching the full Korean name at ID 60526. ID 25253 preserves the English chronology and prey relation: the crudok was present first and only recently began preying on gnomes. Korean creature forms are traceable; no row-local meaning error is established. |
| D-19120 | 25254-25255 | not an issue | The comparison to the Travelers' camp is retained. Understyle is a proper district name under accepted D-244/D-314; `언더스타일` is established elsewhere in the active corpus. |
| D-19121 | 25260-25261 | not an issue | Oreyn's transformation into an antelope and the request for help are explicit. `오레인` and `아테오프` match recurring active-corpus forms. |
| D-19122 | 25267 | not an issue | Private sea access, a protected/safe lookout, acceptance of the offer, and its prerequisite are all preserved. Without scene evidence, the Korean `안전한 전망대` is a defensible rendering of “protected perch.” |
| D-19123 | 25268 | not an issue | The speaker's manageable-infestation contrast and Pagus's treatment of the vermin as Niskaru spawn remain. No evidence supports a narrower pest identity. |
| D-19124 | 25269, 25271 | mixed | At 25269, the Requiem ship, sunrise direction, black gulls, and corpses on the rigging are preserved. At 25271, correct `미스란` to `미타란`: accepted D-2927 renders the same Mitharan-music concept as `미타란 음악`; `미스로스` remains the established regional form. |
| D-19125 | 25272, 25277-25278 | not an issue | The birth candle search, Chrysalae planting task, and thanks for help completing the ritual are retained. Japanese original clarifies Chrysalae seeds; the Korean transliteration and planting objective remain compatible with the English. |
| D-19126 | 25274, 25276 | mixed | Accept the deity correction at 25274 from `미타루` to the manual-backed `미사루` (D-152). At 25276, Teers drugging the speaker, the crew leaving, the race to the treasure, and request for support are preserved; `티어스` matches the established form. |
| D-19127 | 25280 | uncertain | The ring description is retained, but the Korean `운실리` conflicts with the more frequent `언실리`. Existing D-17046 and related decisions leave the faction's Korean form unresolved; do not normalize this isolated row. |
| D-19128 | 25281 | not an issue | The Destiny Stone shattering on contact and hope that Agarth understands are retained. `운명의 돌` expresses the source object despite Japanese's adjacent Fate wording; `아가스` matches active usage. |
| D-19129 | 25288 | not an issue | English, Japanese, and Chinese all describe Cutter winning and the speaker claiming their share. Korean preserves the teasing tone and winnings request; the references support `커터` as the name-form in this line. |
| D-19130 | 25290 | uncertain | The sentence says the named group killed Calan Mcleod, and Korean preserves that event and the traceable name. The faction's canonical Korean rendering remains unresolved across the corpus; retain the current phrase rather than choosing among competing forms. |
| D-19131 | 25293 | accepted | English names a Grotto and Chinese independently says cave, while Japanese says Gorhart Prison. Following English as the semantic authority and the supporting Chinese reading, replace generic `은신처` with `동굴`; record the Japanese source conflict without importing its conflicting location. |
| D-19132 | 25295-25299 | not an issue | The motivation for joining the Travelers, Almain Firemage class label, dedication to Mel Senshir's savior, Maisie's Luck name, and lack of knowledge about the referenced group are retained. `메이지(Maisie)의 행운` is corroborated by the exact `base` entry at ID 2702; the omitted Korean pronoun in 25299 is natural and does not change the referent. |
| D-19133 | 25300 | accepted | English and Chinese say the speaker prays to Goddess Lyria; the draft/Japanese uses worship wording. Korean `섬겨` changes the action from prayer to worship. Replace it with `기도해`, preserving the casual voice and the priestess's guidance/protection. |

## Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25271 | `미스란 민속 음악으로, 미스로스 지역의 전통 선율을 담았어.` | `미타란 민속 음악으로, 미스로스 지역의 전통 선율을 담았어.` | Correct the Mitharan name form using accepted D-2927 and preserve Mithros as the region. |
| 25274 | `미타루께서 너그러운 마음으로 너를 우리에게 돌려보내셨구나. 그럴 줄 알았어.` | `미사루께서 너그러운 마음으로 너를 우리에게 돌려보내셨구나. 그럴 줄 알았어.` | Apply manual-backed Mitharu form from D-152. |
| 25293 | `법을 어긴 자의 은신처` | `법을 어긴 자의 동굴` | Preserve the English Grotto/cave location type, supported by Chinese. |
| 25300 | `우린 여신 리리아를 섬겨. 에라셀에서 전쟁이 한창일 때, 여사제의 말씀이 우리를 이끌고 지켜 주셨어.` | `우린 여신 리리아께 기도해. 에라셀에서 전쟁이 한창일 때, 여사제의 말씀이 우리를 이끌고 지켜 주셨어.` | Restore English/Chinese's prayer action while retaining conversational register. |

## Verification

- English original, Japanese original, Japanese-derived Korean draft,
  Chinese original, and active Korean each expose IDs 25251-25300 exactly
  once and in ascending order (50 IDs each).
- ID 25265 preserves `$SQ53.bribe_value$` exactly and in place across all
  five files. No other runtime marker occurs in the interval. The selected
  rows contain no embedded line breaks.
- The active Korean file has a pre-existing CSV parser error at physical
  line 11029 (`Unquoted fields do not allow new line`). It is outside this
  interval and was not modified. Range ID/order validation therefore used
  ID-anchored physical record starts; exact-byte comparison against the
  backup confirms no unrelated bytes changed.
- UTF-8 BOM, 72,011 CRLF endings, and 73 existing bare LF endings are
  unchanged. Only the four approved `Texto` cells differ.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-25251-25300-D19119/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `d211ed35eafdfe5bd5ce5cad084f6974e037238e552c2ed21be1b28e48eb049c`.
- Post-edit SHA-256:
  `a29dd883e5bbe87a227d997eb14e034b8721cedb34d76538c368ada98ce2ee77`.
- Totals: 2,156 accepted / 24,023 `not an issue` / 12,345 uncertain
  (38,524 counted keys). Resume D-19134 at ID 25301. Sequential IDs
  25301-65134 remain (39,834), along with earlier specific holds and the
  D-18422-D-18452 register backfill.
