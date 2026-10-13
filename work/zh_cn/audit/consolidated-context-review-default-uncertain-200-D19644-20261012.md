# Consolidated Context Review: Uncertain Batch D-19644

- Closed the 200 keys in `uncertain-200-D1884-D2317-20261012.jsonl`.
  All four-locale snapshot cells were matched directly to the English,
  Japanese, Chinese, and active Korean CSVs; there were no mismatches.
- Eleven keys had already been closed by earlier decisions and are linked
  below without recounting. The remaining 189 open keys were resolved in
  this grouped pass: 14 accepted corrections and 175 `not an issue`.
- English controls meaning, Japanese informs voice/register, and Chinese is
  supporting evidence. Relevant Korean manual context was checked in its
  searchable PDF extraction and source: the Travelers faction is named
  `트래블러(Travelers)` (PDF p. 7), and Persuasion lowers the cost of bribing
  guards after crimes (PDF p. 4). No PAK-derived material was consulted.

## Accepted Corrections

| ID | Evidence and correction |
| ---: | --- |
| 7080 | Lowercase `dove` is familiar address, not a name. Reuse the accepted `친구` rendering (D-19432, D-19621); change `도브(Dove)` to `친구`. |
| 7312 | English lore and Japanese `嘆きの力` identify the magical force, not the House. Change `비탄의 집(Sorrows)` to `비탄의 힘(Sorrows)`, as established at IDs 4472, 4537, and 5491. |
| 7357 | English names the Hierophant's shrine; Chinese says high-priest shrine. Reuse the accepted office `대사제` (D-19577, D-19639): `계시자의 성소` -> `대사제의 성소`. |
| 7371, 7875 | `Oathblade` is a formal Warsworn rank. Reuse D-18254's accepted `맹세의 칼날` in both rows, replacing `서약검`. |
| 7373 | Japanese and Chinese identify chapels/shrines, not a named `Chantries` faction. Reuse the accepted generic `성소들` reading (D-1095): `찬트리(Chantries)` -> `성소들(Chantries)`. |
| 7840 | `Amongst Travelers` describes belonging among the named Travelers, not a separate place. Use the official-manual faction name and render the familiar `dove` as `친구`: `이 대사제가 우리를 잘못된 길로 이끌기 전까지는 트래블러들과 함께하는 게 가장 좋았어. 네가 훔칠 그 책으로 그 자유를 되찾을 거야, 친구.` |
| 7965 | `House of Sorrows` is the established faction `비탄의 집` (D-19602 and later decisions), not `슬픔의 집`. Only the faction name changes; the Delver role and essence-harvesting claim remain. |
| 7967 | Japanese explicitly identifies the Sorrows as a power, distinct from the House. Change `슬픔의 집(Sorrows)` to `비탄의 힘(Sorrows)`, following D-19641 and the established force usage. |
| 8064, 8294 | Normalize `Kollossae` from `콜로새` to the later accepted corpus form `콜로사이` (D-18878, D-18933, D-19573); the manual does not name this people. |
| 8143 | `Lady of Receivership` is an administrative/property office. Reuse D-19643's accepted `재산관리관` at ID 6737 instead of `수탁 관리인`; retain the separate Sagecrafting term. |
| 8182 | The English `crime bribes` refers to bribes paid after criminal acts. The official Korean manual's Persuasion section explicitly identifies bribing guards after crimes. Replace `범죄자에게 뇌물을 주느라` with `범죄를 저지른 뒤 경비병을 매수하는 데`. |
| 8269 | Capitalized `Travelers` names the faction. The official Korean manual (PDF p. 7) and D-19639 establish `트래블러(Travelers)`; replace `여행자(Travelers)`. |

## Not an Issue and Linked Decisions

The other 175 newly reviewed keys are `not an issue`; their exact IDs are
the 200-row snapshot minus the eleven previously closed keys and the 14
accepted IDs above. Source-faithful wording was retained rather than
normalizing every locale difference.

IDs 7085, 7253, 7461, 7553, 7632, 7713, 7878, 7950, 8020, 8162, and
8302 are linked without recounting. Their completed decisions are in the
Tenders labels, Preordained core, Even card, Plagueshield, Valor short,
Kollossae standardization, Counsel (D-19443), Telling/Sagrell, and Ivan
Hugues reports.

Two focused contrasts were closed without edits: at ID 7510, English
`prepare you for Belen` and Japanese's offering-to-Belen reading support
the existing Korean, while Chinese is more specific about killing; at
ID 7802, English `Ascension` and Japanese `即位` support Korean `즉위`,
despite Chinese `升天`. Neither contrast proves a Korean meaning error.

## Integrity and Resume

- Accepted `Texto` edits: IDs 7080, 7312, 7357, 7371, 7373, 7840, 7875,
  7965, 7967, 8064, 8143, 8182, 8269, and 8294.
- Pre-edit SHA-256:
  `661748971420138f4dc0685d8d5f789733c384a692c32f18b88a927e313470e2`.
- Byte-identical backup:
  `/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19644/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit SHA-256:
  `9d866affc9eb41e46e520b5ce4ca0298ed1257e07e189b4603badf7aaf09fb05`.
- Exact inverse reconstruction passed. Only the 14 approved physical rows
  changed; the UTF-8 BOM, 72,011 CRLF endings, 73 bare-LF endings, row order,
  and all other bytes are preserved.
- Totals: **2,639 accepted / 26,400 not an issue / 9,485 uncertain**
  (38,524). The separate 55 Chinese-only provisional `affix` uncertainties
  are outside these default totals and remain open.
- Resume **D-2320 / default ID 8330**. The exact next batch must be selected
  from still-open findings, excluding keys already closed by snapshots or
  individual/group reports. Default review is incomplete.
