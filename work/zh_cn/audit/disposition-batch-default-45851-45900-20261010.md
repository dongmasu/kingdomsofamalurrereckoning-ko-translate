# Disposition Batch: `default` IDs 45851-45900

- Date: 2026-10-10. Compared active Korean with English, Japanese, Chinese,
  source-keyed historical questions, and prior terminology decisions. This
  is a working disposition pass, not independent final linguistic approval.
- Decisions: three accepted, three `not an issue`, and nine uncertain.
- CSV edits: IDs 45875, 45891, and 45900.

| ID | Decision | Rationale |
| ---: | --- | --- |
| 45855 | Not an issue | Korean retains the three damage types, their 18/35/35 values, and all three lines. |
| 45857 | Uncertain | The Eye of Amman, Edwin Hoswig, Emaire, purification, and return objective are present; canonical proper-name forms need alignment. |
| 45858 | Uncertain | Korean reads “turn away” as pretending not to know, while Japanese says to flee; English does not settle the exact action. |
| 45864 | Uncertain | The locked treasure door, Hreid's belief, search of cave bodies, and combination clue are retained; names and the cave/door relation need context. |
| 45868-45869 | Uncertain | Guard and rebel roles are represented; the formal Unseelie and House of Sorrows faction forms need alignment. |
| 45870 | Not an issue | The established `마법물품 제작` term is used and the offer of instruction is preserved; broader Sagecrafting terminology remains separate. |
| 45873 | Uncertain | The location is translated as a camp name; canonical Camp Moondown form is unsettled across locales. |
| 45875 | Accepted | Change `공식 제조법 운송품 파괴` to `제조법이 실린 수송품 파괴`. `공식` introduces the unsupported “official” sense; English, Japanese, and Chinese support transported formulas/recipes. |
| 45876 | Uncertain | The Maid's challenge, rescue of the Court of Enchantments, and consultation with Hallam are retained; title and Court naming remain open. |
| 45878 | Uncertain | The spider attack, Canneroc, Garaner, Barten, Webwood, and follow-up objective remain; personal and place-name spellings need alignment. |
| 45882 | Uncertain | The corruption, ancient leanashe Meathgra, corpse-feeding, and conditional threat to the Midden are retained; canonical creature/name forms remain open. |
| 45891 | Accepted | Change `지도교수` to `멘토` for English `mentor`, matching the parallel Korean sentence at ID 50054; keep the Savant rank itself open. |
| 45891 | Uncertain | `Savant` is retained as a transliterated rank, but its formal Korean equivalent remains unsettled across the corpus. |
| 45896 | Not an issue | English `forbearer` supports `선조`; the striving-to-meet-Andronikos's example is preserved. The Japanese mentor reading does not override the English. |
| 45898 | Not an issue | The Special Deliveries Chest is clearly rendered as a special-delivery box; no supported row-local correction is needed. |
| 45900 | Accepted | Add `일시 정지 메뉴의` before the Inventory section to restore the explicit pause-menu location, using the established UI phrase at ID 20407; preserve the existing prompt and controls. |
| Remaining IDs 45851-45900, excluding listed findings | Not an issue | No further supported row-local correction was identified. Meaning, quantities, and structure remain intact. |

Decision IDs D-14035 through D-14049. Direct register totals after this
batch: 1,414 accepted, 4,574 `not an issue`, and 8,055 uncertain (14,043
categorized dispositions). The next decision ID is D-14050.

CSV SHA-256 before editing:
`512e91881e407286b80bb884024880b73590d25522ff81fc95f17ee8dcaf6207`.
The UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings
must remain preserved. English, Japanese, Chinese, and Korean each contain
the 50 IDs once in matching order. ID 45855 retains its three lines and
18/35/35 values. ID 45900 retains the localized Inventory marker,
`{LINE_SPACE}`, and `{1}` in that order.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 45875 | `공식 제조법 운송품 파괴` | `제조법이 실린 수송품 파괴` | Remove the unsupported “official” sense of `공식` and express a shipment carrying formulas/recipes. |
| 45891 | `사반트 에이선 엥가르가 이미 자네의 지도교수로 정해졌네... 다만 지금은 이사 시에서 대사로 일하고 있어 자리를 비웠지.` | `사반트 에이선 엥가르가 이미 자네의 멘토로 정해졌네... 다만 지금은 이사 시에서 대사로 일하고 있어 자리를 비웠지.` | Translate the explicit `mentor` role consistently with the parallel Korean line at ID 50054; do not make it specifically an academic supervisor. |
| 45900 | `{*1인벤토리} 항목에 새 물건이 있습니다. 지금 확인해 보세요.{LINE_SPACE}{1}을 누르면 메뉴 항목을 이용할 수 있습니다.` | `일시 정지 메뉴의 {*1인벤토리} 항목에 새 물건이 있습니다. 지금 확인해 보세요.{LINE_SPACE}{1}을 누르면 메뉴 항목을 이용할 수 있습니다.` | Restore the English pause-menu location, using the established Korean UI phrase at ID 20407 while preserving all controls. |
