# Disposition and Edit Batch: `default` IDs 5050-5099

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 5050-5099.
- Compared immutable English, Japanese, and Chinese source rows with active
  Korean. English governs meaning; Japanese informs voice/register; Chinese
  is a supporting cross-check.
- Fifteen findings were dispositioned: four accepted, three `not an issue`,
  and eight uncertain. Four accepted corrections were applied to their
  approved Korean `Texto` cells.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 5054 | `Of Order` emphasis / narration register | Keep the rhetorical emphasis and polite Korean register. | D-1221: not an issue. |
| 5056 | `Agreed, but you go first` threat | Defer the literal-versus-threat reading. | D-1222: uncertain. |
| 5064 | Four-paragraph explorer's account | Keep the source-matched roles, events, and layout. | D-1223: not an issue. |
| 5068 | Investigating shipwreck salvage | Say the scout will search for recoverable goods. | D-1224: accepted. |
| 5073 | `Your Grace` form of address | Defer the addressee's rank and Korean honorific. | D-1225: uncertain. |
| 5074 | Capitalized `Travelers` faction | Defer the canonical faction term. | D-1226: uncertain. |
| 5075 | `Pledgeshield` / Shieldsisters / Shieldbrothers | Defer the related formal titles together. | D-1227: uncertain. |
| 5077 | Grand Bursar's location/office | Defer the exact institution/place referent. | D-1228: uncertain. |
| 5081 | `The Champions` title/group | Defer the named-group interpretation. | D-1229: uncertain. |
| 5085 | `fled Allestar` | Restore the explicit escape. | D-1230: accepted. |
| 5089 | Unlocalized tutorial labels and duplicated level-up lead-in | Localize visible labels and remove the duplicate wording. | D-1231: accepted. |
| 5094 | Grinning Vane Spirrick name/epithet boundary | Separate the epithet from Vane Spirrick. | D-1232: accepted. |
| 5095 | Lucinde letter's intimate clothing/bath euphemism | Keep the suggestive but non-explicit voice and sequence. | D-1233: not an issue. |
| 5097 | `Deep Slumber` lore term | Defer ritual-versus-generic-sleep status. | D-1234: uncertain. |
| 5098 | Cipher / Beckoned / Primos account | Defer the recurring lore-term forms. | D-1235: uncertain. |

Historical questions for other source keys remain separate. All uncertain
rows remain unchanged.

## Applied Text

| ID | Previous Korean / issue | Applied Korean / correction | Decision |
| ---: | --- | --- | --- |
| 5068 | `...그 잔해를 조사하러 보낼 수 있겠지.` | `...난파선에서 건질 물건을 찾으러 보낼 수 있겠지.` | D-1224 |
| 5085 | `알레스타(Allestar)를 떠난 뒤` | `알레스타(Allestar)에서 도망친 뒤` | D-1230 |
| 5089 | English marker payloads and duplicated lead-in | `레벨이 {*1올랐습니다}! 이제 {*1능력}과 {*1기술}을 강화할 수 있습니다.{LINE_SPACE}{*1능력}은 전투에서 엄청난 힘을 발휘하게 해 줍니다.` | D-1231 |
| 5094 | `도적왕 그리닝 베인 스피릭(Grinning Vane Spirrick)` | `도적왕 웃는 베인 스피릭(Grinning Vane Spirrick)` | D-1232 |

At 5089, all `*1` wrapper identities and order remain unchanged, the four
visible labels are localized, and the duplicate level-up lead-in is removed.

## Structural Verification

- English, Japanese, Chinese, and Korean each contain IDs 5050-5099 once in
  identical order; each full CSV parses as 65,135 rows.
- Runtime marker identities/order and explicit line-break counts match for
  all rows in this range.
- The active Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF
  physical record endings, and zero bare LF bytes.
- Only the four accepted Korean `Texto` cells changed; keys, order, other
  fields, and uncertain Korean rows remain unchanged.
- Active Korean `default` CSV SHA-256:
  `518369579f14c2bbfd527f2a86634a6ed058e6a6619dc3e15a41d4b0df81ae8d`
- Cumulative dispositions: 258 accepted, 290 `not an issue`, and 687
  uncertain. Resume at `default` ID 5100.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology, combined-name consistency, and integrated
voice review remain open.
