# Consolidated Context Review: `default` IDs 26601-26650

- Review date: 2026-10-11.
- Scope: the 24 unique prior uncertainties in D-8608-D-8609 within IDs
  26601-26650. ID 26635 was already accepted at D-8605 and is linked,
  not recounted.
- Result: two accepted corrections, twenty-one `not an issue`, and one
  specific unresolved reading at ID 26614.
- English controls meaning; Japanese source and its Korean draft inform
  voice/register; Chinese is supporting evidence.

## Decisions D-19315-D-19317

| Decision | Key | Outcome | Evidence |
| --- | --- | --- | --- |
| D-19315 | `default` 26616, 26637 | accepted | At 26616, English/Japanese/Chinese source context identifies The Requiem as a ship: the Japanese row uses the vessel suffix `号`, and other English rows call it Dead Kel's ship. Existing Korean rows consistently use `레퀴엠호`. At 26637, English `Death at Guelmuin!`, the parallel Japanese/Chinese wording, and the separate Guelmuin lodge reference identify a death at the place, not Guelmuin's own death. |
| D-19316 | `default` 26601-26602, 26606-26609, 26612, 26615, 26622, 26625, 26632, 26636, 26638-26639, 26642-26647, 26650 | not an issue | The Korean meanings remain traceable to English; Japanese/Chinese support the narrative, role, item, or location readings where relevant. Transliteration and capitalization questions alone do not demonstrate a row-level defect or authorize a broader glossary change. ID 26643's “family arms” is compatible with the Japanese heirloom-weapon reading; 26639's `기도 장소` does not over-specify the place. |
| D-19317 | `default` 26614 | uncertain | English `will`, Japanese `遺志` (the deceased person's wishes), and Chinese `愿望` (wish) do not establish whether the tender's will is a testament or a broader intention. Keep the current Korean `유언` pending surrounding quest context. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26616 | `너는 《레퀴엠》을 손에 넣지 못할 거야.` | `너는 레퀴엠호를 손에 넣지 못할 거야.` | The named target is Dead Kel's ship The Requiem, not a book or literary title. Reuse the established `레퀴엠호` form in the active corpus, including IDs 10232, 12280, 14883, and 57453. |
| 26637 | `구엘무인의 죽음!` | `구엘무인에서의 죽음!` | English `at Guelmuin` and the Japanese/Chinese versions indicate the place where the death occurs; the previous Korean possessive could imply Guelmuin itself died. |

## Verification

- English, Japanese source, Chinese, Japanese-derived Korean draft, and
  active Korean each contain IDs 26601-26650 exactly once in ascending order.
- The active Korean `Texto` cells at 26616 and 26637 are the only content
  changes. Reversing the exact substitutions reproduces the pre-edit backup
  byte-for-byte.
- UTF-8 BOM is retained. The file retains 72,011 CRLF and 73 pre-existing
  bare-LF endings.
- The preliminary scan checked embedded line breaks and runtime-token
  signatures. This review independently confirmed 50 ordered IDs in each of
  the five files.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-26601-26650-D19315/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `c7e3b09af219210751aee2adfa012866e64258e5d9958bcee6d7ba22810adb14`.
- Post-edit SHA-256:
  `59c1c500a9baf9d335764f44db900b9bc7e50fbb94d927a6bb6c70bfd36098a6`.
- Twenty-three of the 24 prior uncertainties were reclassified: two accepted
  and twenty-one `not an issue`; only the `will` reading at 26614 remains
  uncertain. D-8605 at 26635 is linked without recounting.
- Totals: 2,208 accepted / 24,504 `not an issue` / 11,812 uncertain
  (38,524). Resume at D-19318, ID 26651.
