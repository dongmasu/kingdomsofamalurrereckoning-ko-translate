# Disposition Batch: `default` IDs 59201-59250

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- Two accepted corrections, 40 `not an issue` IDs, and eight uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The active CSV was backed up byte-for-byte before editing.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17826 | 59239 | `팅크처, 약제, 연고와 향유가 있어.` | `팅크처, 사랑의 묘약, 연고와 향유가 있어.` | English `philter` is a love potion; Japanese `媚薬` and Chinese `春药` confirm the love-potion/aphrodisiac category omitted by generic `약제`. |
| D-17827 | 59247 | `그는 우리가 알라바스트라에 도착하기 전에 그를 붙잡으면 투아사 장군 하나를 제거할 수 있다고 생각했어.` | `그는 투아사 장군 하나가 알라바스트라에 도착하기 전에 우리가 붙잡으면 제거할 수 있다고 생각했어.` | The captured target is the Tuatha general who must not reach Alabastra; Japanese and Chinese agree with English, while Korean incorrectly made `we` the party arriving there and repeated `him`. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17828 | 59202 | The unusual “most reverent corpses” image is preserved, but English, Japanese, and Chinese differ on whether reverence describes the corpses or how the living regard them. |
| D-17828 | 59207 | The Narca's origin and Florion's plan are retained; Korean `방법을 알고 있어` may overstate English “has ideas,” while Japanese and Chinese support a more settled method. |
| D-17828 | 59209 | Tender and Delver roles remain distinct, but “we were the first of our kind” and Korean `각자의 첫 번째` leave the pair/role relation unclear. |
| D-17828 | 59217 | The need to increase the Font's flow and nourish the land are retained; the capitalized Font's canonical Korean term is unresolved. |
| D-17828 | 59224 | Olaana's gatekeeping role is preserved, but `Hall of Appointments` may be a formal place name rather than the generic `접견실`. |
| D-17828 | 59225 | `Oratory` may name a prayer place or a public-speaking venue; the locale readings conflict and the canonical Korean term is open. |
| D-17828 | 59235 | The pickpocketing, seizure note, confiscated jewelry box, and locker clue remain; `주머니를 뒤졌지만` may describe searching pockets rather than successfully pickpocketing. |
| D-17828 | 59238 | The unexpected structure, traps, lighting, comparison, and escalating mechanisms are preserved; the roles and canonical Korean forms of Deinir, Kollossae, and Rotelos remain unsettled. |

## Not an Issue

Decision D-17829 records these 40 IDs: 59201, 59203-59206, 59208,
59210-59216, 59218-59223, 59226-59234, 59236-59237, 59240-59246, and
59248-59250. The 18% Reflection value at 59233 is retained. At 59243,
Korean preserves the warning about bodies hidden below the Wharf.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain all 50 target IDs in
  ascending order. Existing full-resource checks record 65,135 matching keys
  and order.
- Rechecked the source-keyed historical prompt for 59244-59248, including
  Traveling Cleric (59245), the pronoun/arrival relation (59247), and the
  fragment “Already been” (59248). The subject correction at 59247 is
  supported by English, Japanese, and Chinese; the fragment at 59248 remains
  context-dependent and unchanged.
- The four remedy categories at 59239 are preserved, with the love-potion
  sense restored. The save-data warning, 18% value, and all row boundaries
  remain intact; no runtime-marker or line-structure correction was needed.
- Pre-edit CSV SHA-256:
  `67fde35f908683e49100528bbddd9fe25faaf88a252cb3ca5f99f7e6ec63c419`.
- Post-edit CSV SHA-256:
  `450d462e3d21db010167ee56c5966590323a21e48dd16f475656eb298f9638bf`.
  Byte comparison against the backup confirms that only the approved 59239
  and 59247 `Texto` cells changed. UTF-8 BOM, 65,135 records, key order,
  72,045 CRLF endings, and 39 pre-existing bare-LF endings are preserved.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-59201/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `67fde35f908683e49100528bbddd9fe25faaf88a252cb3ca5f99f7e6ec63c419`).

D-17826 and D-17827 record two accepted corrections, D-17828 records eight
uncertain IDs, and D-17829 records the remaining 40 `not an issue` IDs.
Direct register totals: 1,723 accepted, 13,024 `not an issue`, and 11,278
uncertain (26,025 total); next D-17830.

Resume at `default` ID 59251; 5,884 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
