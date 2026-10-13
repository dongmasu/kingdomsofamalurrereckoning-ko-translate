# Consolidated Context Review: Early Term Cluster (D-19591)

- Date: 2026-10-12.
- Scope: unresolved default term/context keys from D-154 through D-187,
  plus linked `The Font` keys 12405 and 14580.
- English controls meaning; Japanese and Chinese were compared by exact ID.
  The official Korean manual was consulted for setting/faction context and
  its printed pages 13-14 confirm `Warsworn = 워스원`. No PAK or PAK-derived
  material was used.

## Dispositions

| ID | Disposition | Evidence and rationale |
| ---: | --- | --- |
| 1071 | not an issue | English names the Warsworn; Korean `워스원(Warsworn)` matches the official Korean manual and preserves banishment, branding, and blame. |
| 1073 | not an issue | `Tirin's Rest` is retained as a source-paired place-name. Japanese describes a waystation, Chinese a resting-place, and English does not specify the settlement's function; Korean `안식처` preserves the name without choosing a facility type. D-5385 is unrelated (ID 17102); D-18655 / ID 23535 is a source-paired usage, not canonical-name approval. No edit. |
| 1091 | not an issue | The English, Japanese, and Chinese identify Amethyn as the named realm between worlds; the Korean name and sealing/madness sequence remain traceable. |
| 1111 | not an issue | The English objective says to gather pteryx vanes to assemble the Wreath; Japanese's ring and Chinese's feather-crown wording support the Korean `면죄의 화관` without adding flower imagery. |
| 1163 | not an issue | English gives a temporary +3 to Persuasion; Korean preserves the value and duration without imposing the unit disagreement between Japanese “levels” and Chinese “points.” |
| 1170 | not an issue | The sources preserve Jory's broken sword and possible restoration by a skilled smith. Korean's gender-neutral phrasing retains that claim without assigning sword gender. |
| 1185 | not an issue | The Great Cycle's effect, the speaker's opposition to the Maid, and her hero/heartless-tyrant roles are preserved. |
| 1192, 1331, 12405, 14580 | not an issue | English and the parallel Japanese/Chinese rows identify `The Font` as a spring/source, including the origin and heart of Summer Court magic at 1192. `샘(Font)` preserves that meaning and the exact English label; an unresolved global display preference does not make these rows inaccurate. This closes only these four keys. |
| 1200 | not an issue | English's Eventide clan and being sent to the Cycle remain intact; Korean preserves both names and the claim that no one survived. |
| 1201 | not an issue | The Soulbind curse, harmful vial, and requirement to drink it are retained across the English-led comparison. |
| 1204 | not an issue | English says the card is a five and “not even”; Japanese confirms the odd-number reading. Korean preserves that reading; Chinese's “not a tie” does not outweigh the direct English/Japanese wording. |
| 1220 | not an issue | `What is the Jottun Problem?` remains a direct question about the named Jottun topic; Korean does not invent a quest or mechanic. |
| 1247 | not an issue | Korean `시단(Cydan)` retains the exact source spelling. Locale phonetics and other Korean spellings vary, but this standalone row leaves no identity ambiguity; no corpus-wide transliteration is authorized here. |
| 1254 | not an issue | `케언(Cairn)` remains source-traceable. The English library context and Japanese cairn monuments / Chinese spirit-orbs support a named object; the row does not require a narrower object classification. |
| 1258 | not an issue | English explicitly presents “Prospecting” as wordplay on recognizing promise; Chinese supports prospecting and Japanese supports potential. Korean `'잠재력 발굴'` preserves both sides naturally. |
| 1273 | not an issue | The active cell says `조언자`, matching English `The Counsel` as a person/adviser and the singular Japanese/Chinese readings. The obsolete `고문단` description in the older candidate entry does not match the active CSV. |
| 1293 | not an issue | English and Japanese both give `Christmas Island`; Korean is source-traceable. Chinese's alternative localized name does not establish a Korean error. |
| 1300 | not an issue | The sentence itself explains Delvers' spiritual work: looking into Winter Fae essence, finding sorrows, and bearing that burden. `탐굴자들` preserves the delve concept and the explanatory role; no canonical title is required to convey this row. |
| 1315 | not an issue | English `crafts and such`, Japanese craftsmanship, and Chinese crafts support the broad Korean `기술` wording in the miller's contrast. No material mismatch justifies a stylistic rewrite. |
| 1326 | not an issue | `Lady of Receivership` is an administrative office, while Japanese favors property administration and Chinese reception. `영수 담당 부인` remains a plausible broad office rendering; the row does not establish a narrower hierarchy or require a global term choice. |
| 1334 | not an issue | English says only capitalized `the House`; Japanese identifies House of Ballads, while Chinese says family. Korean `하우스` preserves the source's scope without guessing which House. |
| 1239 | accepted | English explicitly says House of Ballads; Japanese and Chinese corroborate the named House. Replace only the House-name phrase with the approved `발라드의 집(House of Ballads)` form. Preserve the existing seat-taking meaning and all other content. |

### Previously Resolved, Not Recounted

- IDs 1081 and 1106 were resolved in D-19573.
- ID 1227 was corrected and accepted in D-19458.
- IDs 1250, 1271, 1280, 1130, 1302, 1333, 1339, and 1381 were already
  disposed in earlier decisions.

## Edit and Verification

Only default ID 1239 changed:

| ID | Previous Korean | Approved Korean |
| ---: | --- | --- |
| 1239 | `...사그렐(Sagrell)의 반지를 되찾아 발라드 가문의 자리를 차지할 수 있어.` | `...사그렐(Sagrell)의 반지를 되찾아 발라드의 집(House of Ballads)에서 자리를 차지할 수 있어.` |

- Pre-edit SHA-256: `49dd64aee6ef5c374e330d87e6bf9bc69f11f0b04a1bc173bb232116b42763b0`.
- Byte-identical backup: `/private/tmp/ko-translate-backups/20261012/before-context-terms-D19591/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit SHA-256: `eb03fa86f5d193a5659f9e3ff35c2d1f12d05d201cfa40fa93f8a33bfc0bce3a`.
- Exact reverse substitution reproduces the backup byte-for-byte. BOM, row order/count, and all bytes outside the approved `Texto` cell are preserved; line endings remain 72,011 CRLF and 73 bare LF.
- D-19591 closes 24 previously uncertain keys as `not an issue` and accepts one correction. Totals: **2,512 accepted / 25,436 not an issue / 10,576 uncertain** (38,524).
- Next: **D-188 / default ID 1354**. The 35 uncertain Chinese-only affix fallback keys remain for direct active-row review.
