# Consolidated Context Review: `default` IDs 26101-26150

- Review date: 2026-10-11.
- Scope: re-review the eight prior uncertain findings in the existing
  disposition for IDs 26101-26150; this is not a repeat first-pass scan.
- Result: four findings accepted, three `not an issue`, and one remains
  uncertain because the canonical Korean `Beckoned` form is unresolved.
- English controls meaning; Japanese and its Korean draft inform
  voice/register; Chinese is supporting evidence.

## Decisions D-19274-D-19281

| Decision | Key | Outcome | Evidence |
| --- | --- | --- | --- |
| D-19274 | `default` 26101, 26134 | uncertain | The access denial and preparation instruction are intact, but the dedicated Beckoned review explicitly retains these IDs because accepted Korean precedents conflict between `부름받은 자` and `불려온 자`. Keep both cells unchanged; do not resolve the global title choice locally. |
| D-19275 | `default` 26103-26105, 26107-26108 | not an issue | The mining operation, Edgar Aron, Varen Seawine, indifference attempt, question, and Narca remain source-traceable. Japanese and Chinese phonetic differences do not establish a Korean meaning error. ID 26106's overlapping Ynadon/marker question is assessed once under D-19276. |
| D-19276 | `default` 26106, 26110, 26123 | not an issue | `Ynadon, God of Justice`, `Muse of Fate`, and `Fateless One` are represented without changing their roles or the power to upend reality. The localized `{*1...}` availability wrapper retains marker identity/order and the same Korean payload as the Japanese-derived draft. ID 26106 is not counted again under D-19275. |
| D-19277 | `default` 26113, 26121 | accepted | At 26113, replace the literal `먼지 아이` with the established dismissive `먼지나부랭이` for `dustling` (D-335/D-18327), and express the source's interest clause naturally. ID 26121 retains the dust image and greeting idiom without inventing a new creature name. |
| D-19278 | `default` 26126-26129 | accepted | At 26126, reuse `발라드의 집` for House of Ballads (D-711); at 26127, reuse `워스원(Warsworn)` (D-2857). The Death Notice and the flow/waters balancing summer and winter remain intact; Japanese supports the flow imagery at 26129. |
| D-19279 | `default` 26135-26137, 26139-26140 | not an issue | The veteran's service, wounds, honor, book coverage, invaders, Dverga enslavement, revenge, and welcome at Tirin's Rest are preserved. English spellings remain traceable; locale transliteration differences alone do not prove a Korean defect. |
| D-19280 | `default` 26142, 26145-26149 | accepted | At 26142, normalize `Kollossae` to the later accepted `콜로사이` form (D-18878/D-18933). Ethene opening the way, uncertainty about the halls, Fomorians, the Belen warning, Jottun threat, Akara/Scion report, and the ancient-place statement remain. |
| D-19281 | `default` 26150 | accepted | Correct `갈라져 나왔다` to `후손이다`: English says the Ljosalfar and Dokkalfar descend from the same original Alfar people, and Japanese explicitly says `子孫`. The Icenwreth origin, three-section lore structure, terminology, and paragraph breaks are retained. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26113 | `그럼 먼지 아이는 흥미를 끄는 걸 찾았나?` | `그럼 먼지나부랭이가 흥미를 느낄 만한 걸 찾았나?` | Reuse the established dismissive `dustling` term and restore natural Korean for `piques its interest`. |
| 26126 | `발라드의 가문` | `발라드의 집` | Reuse the accepted House of Ballads form D-711. |
| 26127 | `...워스워른에 자네 같은 강자가 더 필요하네.` | `...워스원(Warsworn)에 자네 같은 강자가 더 필요하네.` | Reuse accepted Warsworn form D-2857 and preserve the exact English faction name. |
| 26142 | `...콜로새 중에 저 회랑에 발을 들인 이가 있는지도 모르겠어.` | `...콜로사이 중에 저 회랑에 발을 들인 이가 있는지도 모르겠어.` | Apply the later accepted Kollossae form D-18878/D-18933. |
| 26150 | `...최초의 알파르족에게서 갈라져 나왔다.` | `...최초의 알파르족의 후손이다.` | Correct the source's descent relationship without changing the stated homeland. |

## Verification

- English, Japanese source, Japanese-derived draft, Chinese, and active
  Korean each contain 65,135 unique ascending IDs in identical order.
- IDs reviewed in the eight prior findings occur once in each file. The
  runtime marker at 26106 is retained; ID 26150 keeps its nine embedded
  line-breaks and all section/paragraph boundaries.
- Only active Korean `Texto` values at IDs 26113, 26126, 26127, 26142, and
  26150 changed. Reversing the five exact substitutions reproduces the
  pre-edit backup byte-for-byte.
- UTF-8 BOM, row order, 72,011 CRLF endings, and 73 pre-existing bare-LF
  endings are preserved. Standalone period ID 26153 was already ASCII `.`;
  its earlier accepted correction is not recounted.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-26101-26150-D19274/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `a3eb5aa5d3277db9f9e8389e87f2eecc1db4f6369f14ec9d7305d7fe683a9375`.
- Post-edit SHA-256:
  `2e88c2e07b9e80038ded0dbec4d8fe3b55d90a8880cc00c9add34fe1d6df2783`.
- Totals: 2,193 accepted / 24,325 `not an issue` / 12,006 uncertain
  (38,524). Resume at D-19282, ID 26151.
- The D-19162-D-19238 and D-18422-D-18452 register-detail gaps remain
  explicit and unreconciled.
