# Consolidated Context Review: `default` IDs 25301-25350

- Date: 2026-10-11.
- Scope: re-review all 33 unique uncertain ID keys carried from the prior
  disposition against English meaning, Japanese original, Japanese-derived
  Korean draft/register, Chinese supporting evidence, active Korean, and
  prior terminology decisions.
- Resolved 30 keys: two accepted corrections and 28 `not an issue`.
  IDs 25310, 25344, and 25350 remain on specific idiom, proper-name, and
  antecedent holds.
- Four keys already dispositioned `not an issue` (25301, 25303, 25304,
  25317) are linked and not counted again.

## Decisions D-19134-D-19148

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19134 | 25302 | not an issue | `Talk to Audra` is rendered `오드라와 대화`; the full name `오드라 피란(Audra Firan)` recurs in the active corpus. Locale phonetic differences do not establish a local error. |
| D-19135 | 25307, 25309 | not an issue | Tyr and High King Titarion remain identifiable as `티르` and `최고왕 티타리온`; the Korean follows the Japanese-derived draft and preserves the title. No row-local meaning defect is established. |
| D-19136 | 25310 | uncertain | English “control the show,” Japanese's appearance/presentation reading, and Chinese's performance reading leave the intended idiom unresolved. Keep the current stage-control metaphor pending scene context. |
| D-19137 | 25311-25312 | not an issue | The marriage counterfactual and Wyvyrn-Gifres family comparison remain; `발라드의 집` is the established House of Ballads form. |
| D-19138 | 25314-25316 | not an issue | Besin/Fahrlangi pursuit, Eamonn Isle, purpose, Finale label, amphora, and all three sacred-spring locations are retained. Locale spelling differences do not establish a row-local error. |
| D-19139 | 25319 | not an issue | The English explicitly calls the Sidhe a dangerous place; Korean retains that place reading and pairs `시드` with the exact source spelling. |
| D-19140 | 25321-25324 | not an issue | Tender's Path, the hammer remains, Dead Kel threat, and Elza's letter/discovery/meeting request remain. Names and Menetyre are traceable; the English opening-quote glyph irregularity does not change meaning. |
| D-19141 | 25325 | accepted | Replace the phonetic `포세이큰 평원` with established `버림받은 평원`, used for Forsaken Plain in the active corpus and supported by the exact region term at `base` IDs 1901/2361 and D-18220. |
| D-19142 | 25326-25329 | not an issue | Tournament champion, request to lower one's voice, `+15% Fate`, and the Rikka Egest/mission-monk gossip are retained. No evidence supports changing the religious institution reading. |
| D-19143 | 25332-25335 | not an issue | Patron responsibility/debt, the Stowaway troll's history and bounty, Pathieu Jarian, and the two-class hybrid Destiny remain. `은등 트롤` preserves the English silver-back descriptor; no canonical alternative is established. |
| D-19144 | 25336 | not an issue | The Lorestones' spread and manipulability, plus the Fae request for a new medium and method of telling, are preserved without deciding that “telling” is a formal named rite. |
| D-19145 | 25340-25343 | mixed | Keep Valor Arena Guard, Map Slot, and the Summer Court's two possible ways of ending neutrality. At 25342, normalize Maura Chalin from `마우라 찰린` to the prevailing exact-name form `마우라 차린` used elsewhere in the active corpus. |
| D-19146 | 25344 | uncertain | The rebirth-star blessing is preserved, but `브레이코르` is one of several active Vraekor spellings. Earlier D-075/D-17097 leave the canonical deity form unresolved; do not normalize this row alone. |
| D-19147 | 25346-25348 | not an issue | Loss of healing, first error, others learning she can err, Glasspillar Caves, and the ceremonial amulet for all Scions remain. Current `사이온` is a traceable form; broader title policy does not establish a local defect here. |
| D-19148 | 25350 | uncertain | English/Chinese retain “Is he, then?” while Japanese omits the referent. Without the antecedent, the Korean `그런가?` cannot be confirmed as preserving the identity question; keep unchanged pending dialogue context. |

## Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25325 | `포세이큰 평원` | `버림받은 평원` | Reuse the established Korean region name for Forsaken Plain. |
| 25342 | `마우라 찰린의 감옥은 유적 대회랑 지하 깊숙한 곳에 있다. 무장해라.` | `마우라 차린의 감옥은 유적 대회랑 지하 깊숙한 곳에 있다. 무장해라.` | Match the prevailing paired Korean spelling for Maura Chalin elsewhere in the active corpus. |

## Verification

- English original, Japanese original, Japanese-derived Korean draft,
  Chinese original, and active Korean each expose IDs 25301-25350 exactly
  once and in ascending order (50 IDs each).
- ID 25317 has two embedded line feeds in all five files; the blank-line
  separation and `+50%` value remain. ID 25328's `+15% Fate` is unchanged.
  No runtime token occurs in this interval.
- The active Korean file has the pre-existing CSV parser error at physical
  line 11029, outside this interval. The batch was checked using
  ID-anchored record starts; byte comparison against the backup confirms no
  unrelated bytes changed.
- UTF-8 BOM, 72,011 CRLF endings, and 73 existing bare LF endings are
  unchanged. Only the two approved `Texto` cells differ.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-25301-25350-D19134/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `a29dd883e5bbe87a227d997eb14e034b8721cedb34d76538c368ada98ce2ee77`.
- Post-edit SHA-256:
  `8d2e6059835827766674e67527c5f6a6441cd84d0c6e8d7244e517891b76fca8`.
- Totals: 2,158 accepted / 24,051 `not an issue` / 12,315 uncertain
  (38,524 counted keys). Resume D-19149 at ID 25351. Sequential IDs
  25351-65134 remain (39,784), along with earlier specific holds and the
  D-18422-D-18452 register backfill.
