# Disposition and Edit Batch: `default` IDs 3950-3999

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and source-keyed historical questions
  for `default` IDs 3950-3999.
- Compared immutable English, Japanese, and Chinese source CSV rows with the
  active Korean CSV. English governs meaning; Japanese informs
  voice/register; Chinese is a supporting cross-check.
- This is a working disposition, not independent final linguistic approval.
- Twenty-one findings were dispositioned: four accepted, six `not an issue`,
  and eleven uncertain. Four accepted corrections were applied to four
  `Texto` cells.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 3950 | `Amphora` vessel name | Keep the traceable Korean transliteration. | D-887: not an issue. |
| 3951 | `old Scion`, explicitly outgoing spiritual leader | Replace age-based `노년의` with the supported impending-retirement meaning. | D-888: accepted. |
| 3954 | Capitalized `Flowering` event | Keep `개화 의식`; Japanese explicitly supports a rite. | D-889: not an issue. |
| 3958 | Warsworn/Klurikon terminology | Preserve the scouting analogy, but defer inconsistent faction/place-name normalization. | D-890: uncertain. |
| 3962 | Cydan's history/actions with the House | Defer the source-relation ambiguity and canonical House terminology. | D-891: uncertain. |
| 3963 | Weapon salvage and required Core | Keep the plausible game-mechanic wording and source-name traceability. | D-892: not an issue. |
| 3967 | Figurative warning about faith speaking for a person | Replace the stiff calque with a natural equivalent. | D-893: accepted. |
| 3970 | `above my station` | State the role-based limitation without self-deprecating `제 주제에`. | D-894: accepted. |
| 3974 | Object assembled/restored from Raven Guard dead | Defer the fragment's unidentified object and exact relation. | D-895: uncertain. |
| 3976 | `Our august company` and young Eagonn | Keep the accurate distinguished-group and bearing comparison. | D-896: not an issue. |
| 3977 | `Hexes` game value | Defer the game's rule and Korean label. | D-897: uncertain. |
| 3979 | Kandrian Stockade location type | Defer whether this is a prison, stockade, or penal enclosure. | D-898: uncertain. |
| 3983 | Saltwell Lab Notes title | Defer whether Saltwell is a proper name or descriptive term. | D-899: uncertain. |
| 3985 | Pledgeshield rank/title | Defer the canonical Korean rank form. | D-900: uncertain. |
| 3988 | Mallion's Sisters | Defer whether this denotes relatives, a faction, or a group. | D-901: uncertain. |
| 3990 | Failed request to help Nel take revenge for Bareth | Retain the supported failed-action state and revenge target. | D-902: not an issue. |
| 3995 | `Paling Wand` | Preserve pending conflicting item-name readings. | D-903: uncertain. |
| 3996 | Alchemy ingredient names | Keep the list unchanged pending authoritative terminology; preserve order, values, and lineation. | D-904: uncertain. |
| 3997 | `Ranged Roll` | Defer whether this is a named game or a dice action. | D-905: uncertain. |
| 3998 | Maura, Ordo, and Weconai | Keep the English/Japanese-supported actor and object relations. | D-906: not an issue. |
| 3999 | `Scarcity is king` supply maxim | Restore scarcity as the reason to stock up. | D-907: accepted. |

Historical questions for same-numbered `base` items remain separate and were
not merged into these `default` dispositions.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 3951 | `...떠나는 노년의 정신적 지도자, 사이온(Scion)...` | `...퇴임을 앞둔 정신적 지도자 사이온(Scion)...` | D-888 |
| 3967 | `신앙이 그를 대변하게 두는 사람은 절대 믿지 마.` | `자기 신앙을 앞세우는 사람은 절대 믿지 마.` | D-893 |
| 3970 | `제 주제에 그녀에게 의문을 제기할 순 없습니다.` | `제 위치상 그녀에게 의문을 제기할 순 없습니다.` | D-894 |
| 3999 | `...여기서 물자를 비축해 둬. 귀한 물건이 최고야.` | `...여기선 물자를 미리 쟁여 둬. 물자가 부족하거든.` | D-907 |

## Structural Verification

- English, Japanese, Chinese, and Korean source CSVs each contain IDs
  3950-3999 once and in identical order.
- The multiline ingredient record at ID 3996 retains its line breaks,
  ingredient order, and quantities.
- The four accepted edits do not alter keys, row order, line breaks, or
  runtime markers.
- The active Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF
  record endings, and no bare LF bytes.
- Active Korean `default` CSV SHA-256:
  `cc1dfd1bd1a28860d38f448d9369e62197ba50a86221101d61f34bf22afbe249`
- Cumulative dispositions: 208 accepted, 165 `not an issue`, and 534
  uncertain. Resume at `default` ID 4000.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology and integrated voice consistency remain
open.
