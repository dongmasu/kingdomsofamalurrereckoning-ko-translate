# Consolidated Context Review: 100 Default Keys (D-19729)

Scope: all 100 exact keys in `uncertain-100-D19729-20261012.jsonl`
(IDs 60471-61028). English controls meaning, Japanese voice and address,
Chinese corroborates; the official Korean manual and accepted Korean rank,
item and faction decisions control terminology. Source rows were checked
against `src/csv`; no PAK evidence was consulted.

## Accepted

| ID | Correction | Evidence |
| ---: | --- | --- |
| 60485 | `성채 관리관` -> `성주` | Castellan: Japanese/Chinese `城主`, accepted D-18374/D-18913. |
| 60520 | `저만의 마법` -> `이곳만의 마법` | Red says *this place* has magic of its own, not the narrator. Chinese confirms possession. |
| 60527 | `완벽한 미사루 피추적자 확대 지렛목` -> `흠 없는 미타란 피추적자의 지렛목` | English Flawless Mitharan Bloodseeker's Fulcrum: accepted D-19551 Flawless/Mitharan/Fulcrum item components. Do not invent `확대` (Magnifying). |
| 60568 | `추락한 자` -> `타락한 자` | Fell is moral corruption, corroborated by Japanese `堕落者` and Chinese `堕落之人`. |
| 60622 | `남작` -> `바로넷` | Baronett is the named pirate, not a generic baron; D-18830. |
| 60640 | `계승자` -> `사이온` | Formal Scion office, D-19496. |
| 60735 | `미사란` -> `미타란족` | English Mitharans (people), not god Mitharu; D-18158 and official manual deity distinction (p. 2). |
| 60739 | `학자 엔가르` -> `사반트 엔가르` | Scholia's Savant rank, D-18268/D-19506. |
| 60747 | `숄리아 아르카나` -> `스콜리아 아르카나` | Official manual's named institution (p. 7); reuse D-19720. |
| 60850 | `벡컨드` -> `부름받은 자` | Established Beckoned address, D-19627. |
| 60851 | `트래블러스` -> `트래블러` | Named faction in official manual (p. 7). |
| 60924 | `맹세의 칼` -> `맹세의 칼날` | Oathblade formal Warsworn rank, D-18254; Japanese rank paraphrase does not override English. |
| 60956 | `위나돈` -> `이나돈` | Official manual's deity Inadon/Ynadon (p. 2); English `Ynadon` retained in parenthesis. |
| 60965 | `비탄의 집(House of Sorrows)` -> `비탄의 힘(Sorrows)` | English says the Sorrows, a named magical force, not House; D-18322/D-19627. |
| 60992 | `은신 감지` -> `숨겨진 물건 찾기` | Official manual's Detect Hidden skill name (p. 4). |
| 60993 | `데타이어` -> `데티르` | Same Detyre as 60485 and the accepted local form; preserve remaining item lore. |
| 61003 | `미사란` -> `미타란` | Mitharan adjective, distinguished from Mitharu in the official manual and D-18158. |

The other 83 IDs in the snapshot are `not an issue`:
60471, 60473, 60474, 60477, 60487, 60489, 60497, 60503, 60504,
60506, 60509, 60513, 60522, 60525, 60528, 60532, 60534, 60540,
60542, 60547, 60549, 60555, 60556, 60562, 60573, 60578, 60589,
60597, 60600, 60603, 60614, 60617, 60625, 60638, 60646, 60657,
60662, 60691, 60694, 60696, 60700, 60702, 60717, 60720, 60729,
60742, 60759, 60781, 60787, 60797, 60800, 60818, 60829, 60832,
60835, 60838, 60842, 60844, 60848, 60855, 60857, 60861, 60866,
60876, 60886, 60890, 60905, 60914, 60925, 60927, 60931, 60941,
60946, 60953, 60962, 60977, 60982, 60985, 60989, 61013, 61019,
61026, 61028.

The fragmentary journal 60503 retains its source truncation and line breaks.
The raw diagnostic `Failed To Link Loc` at 60532 must not be translated
without runtime evidence. `House of Pride` 60946 already uses the accepted
`긍지의 집` from D-19491; conflicting legacy renderings elsewhere do not
invalidate this cell. The colloquial `lofty` at 60614 is compatible with
`잘난`, even though Japanese interprets it as physical height. `cast-offs`
60759 follows the Japanese `分身` reading and is not changed on the ambiguous
English fragment alone. No key in this batch remains open.

Pre-edit SHA-256: `da210b42855812a8fc380300d02fe269a6aed3152dc3330ca92a09e1140ad5b9`.
Post-edit SHA-256: `9d28160961e3a29f104c1152f9a8817733bfca818dd395ab1ec1fce95cd0c3fc`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261012/before-uncertain-100-D19729/locatexts_zh_cn.koalocatext_default.csv`.
`apply-uncertain-100-D19729.rb` verified the 100 snapshot cells, BOM, mixed
line endings, row order, non-target record bytes, non-Texto cells and exact
inverse reconstruction. Corrected candidate-open reconstruction leaves
805 IDs; the historical 3,419 / 34,118 / 987 operational tally has
unreconciled membership and cannot be updated by subtraction.
