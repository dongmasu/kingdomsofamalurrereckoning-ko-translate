# Disposition Batch: `default` IDs 59251-59300

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- Two accepted corrections, 39 `not an issue` IDs, and 10 uncertain findings;
  the uncertainty at 59282 concerns a separate phrase at an accepted ID.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The active CSV was backed up byte-for-byte before editing.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17830 | 59282 | `고마워, 그대여. 이걸 열어 주지 않으면 여기서 나가려고 살을 몇십 킬로는 빼야 할 판이야.` | `고마워, 그대여. 이걸 열어 주지 않으면 여기서 나가려면 몇십 파운드는 빼야 할 판이야.` | English says “a few dozen pounds,” and Chinese explicitly says `几十磅`; `몇십 킬로` inflated the weight. The `dove` address is tracked separately as uncertain. |
| D-17831 | 59287 | `슬픔의 가문 정문이 안쪽에서 잠겨 있고 주변에 싸운 흔적이 있는 것을 발견했다. 무슨 일이 있었는지 조사해야 한다. 하지만 가문 안으로 들어가려면 시련의 전당을 통과해야 한다.` | `비탄의 집 정문이 안쪽에서 잠겨 있고 주변에 싸운 흔적이 있는 것을 발견했다. 무슨 일이 있었는지 조사해야 한다. 하지만 집 안으로 들어가려면 시련의 전당을 통과해야 한다.` | Reuse the approved `House of Sorrows` form `비탄의 집` from D-9869, D-9965, and D-10186; preserve the locked entrance, struggle signs, and Proving Halls route. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17832 | 59251 | The failed journey and prayer beads are retained; the formal institution meant by `Mission` remains unsettled across locale readings. |
| D-17832 | 59260 | The instruction to display trophies so Lekka appears is retained; English, Japanese, and Chinese differ on whether these are trophies or heads. |
| D-17832 | 59269 | The approach/light/closer sequence is retained; canonical Korean wording for the capitalized Font is unresolved. |
| D-17832 | 59271 | The item title `Chalice of Forced Vintage` is retained; the exact wine-making or magical effect is not established by the row. |
| D-17832 | 59282 | Separate from the accepted unit correction, `dove` is an affectionate address; Korean `그대여` may not preserve the intended intimacy/register. |
| D-17832 | 59285 | The lasting effect on the Travelers is retained; `the Chariot` may be a formal Fate-card/title rather than a generic vehicle. |
| D-17832 | 59289 | Gallows End is retained as a translated place name; the corpus has conflicting phonetic and semantic forms, so do not normalize locally. |
| D-17832 | 59294 | The Blacksmithing/Repair Kit effect is preserved; established game UI terms for the skill and kit remain to be checked. |
| D-17832 | 59295 | `Quarterlings` is transliterated, but the capitalized term's identity as a people, rank, or other setting category is unknown. |
| D-17832 | 59299 | English capitalizes `Oratory`, while locale readings conflict between a prayer place and public-speaking venue; retain the question and defer the canonical term. |

## Not an Issue

Decision D-17833 records these 39 IDs: 59252-59259, 59261-59268, 59270,
59272-59281, 59283-59284, 59286, 59288, 59290-59293, 59296-59298, and
59300. The repeated House of Sorrows name at 59287 is corrected locally
using the accepted form rather than bulk-normalizing other occurrences.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain all 50 target IDs in
  ascending order. Existing full-resource checks record 65,135 matching keys
  and order.
- Rechecked the source-keyed historical prompts for IDs 59250-59349,
  including the Mission, trophies/Lekka, Font, forced-vintage chalice,
  affectionate `dove`/weight-loss joke, Chariot, House of Sorrows, Gallows
  End, Blacksmithing, Quarterlings, and Oratory.
- English and Chinese both specify pounds at 59282; the metric rendering was
  corrected without resolving the separate vocative. The House of Sorrows
  form at 59287 follows prior accepted decisions; no global replacement was
  performed.
- Pre-edit CSV SHA-256:
  `450d462e3d21db010167ee56c5966590323a21e48dd16f475656eb298f9638bf`.
- Post-edit CSV SHA-256:
  `28388ecc40ead328283e0d75b8224f5da6f8c3656131713ef4e4be64a94b6b5d`.
  Byte comparison against the backup confirms that only the approved 59282
  and 59287 `Texto` cells changed. UTF-8 BOM, 65,135 records, key order,
  72,045 CRLF endings, and 39 pre-existing bare-LF endings are preserved.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-59251/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `450d462e3d21db010167ee56c5966590323a21e48dd16f475656eb298f9638bf`).

D-17830 and D-17831 record two accepted corrections, D-17832 records 10
uncertain findings (one overlaps an accepted ID), and D-17833 records the
remaining 39 `not an issue` IDs. Direct register totals: 1,725 accepted,
13,063 `not an issue`, and 11,288 uncertain (26,076 total); next D-17834.

Resume at `default` ID 59301; 5,834 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
