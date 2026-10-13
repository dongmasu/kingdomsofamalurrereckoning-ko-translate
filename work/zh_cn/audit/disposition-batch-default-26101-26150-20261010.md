# Disposition and Edit Batch: `default` IDs 26101-26150

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 26101-26150, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: one accepted, four `not an issue`, and eight uncertain.
- Accepted punctuation correction at ID 26153 is applied to the active CSV and
  translation map. Proper-name and lore questions remain unchanged.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 26101, 26134 | `Beckoned` address/title | Uncertain: the current `부름받은 자` differs from other Korean forms such as `선택받은 자`; standardize during the global terminology pass. |
| 26102, 26111 | DLC-removal label / guards | Not an issue: both concise system/dialogue labels convey the source. |
| 26103-26108 | Hollowlands / Edgar Aron / Varen Seawine / Ynadon / Narca | Uncertain: meaning is retained, but names and the Hollowlands rendering need global alignment. |
| 26106, 26110, 26123 | Ynadon / Muse of Fate / Fateless One | Uncertain: deity, title, and lore terms need glossary alignment; the localized `{*1...}` wrapper itself is preserved. |
| 26109 | Tuatha prisoners / ultimatum | Not an issue: the captured company and execution threat unless the rest surrender are preserved. |
| 26112 | Pull-damage effect | Not an issue: range (14 meters), Physical Damage (15), Piercing Damage (8), and Mana cost (20) match the source. |
| 26113, 26121 | `dustling` / dust wordplay | Uncertain: `먼지 아이` and the idiomatic response preserve the image, but the established Korean creature/address term is not settled. |
| 26126-26129 | House of Ballads / Warsworn / Weave | Uncertain: military service and Fae-cycle lore remain, while faction and metaphysical terms need consistency review. |
| 26135-26137, 26139-26140 | Galafor / War of Parries / Orieator's Lance / Dverga / Tirin's Rest | Uncertain: service meaning is retained, but names and the historical-event titles need lore verification. |
| 26138 | Health and resistance bonus | Not an issue: both percentage effects and their order are retained. |
| 26142, 26145-26149 | Ethene / Kollossae / Fomorians / Belen / Akara / Scion | Uncertain: the verse-like Belen line and proper names remain context-dependent; the cryptic line's layout is preserved. |
| 26150 | Ljosalfar lore chapter | Uncertain: section/paragraph structure is intact, but “split from” versus “descended from” and multiple proper-name forms need integrated review. |
| 26153 | Standalone period | Accepted: replace the full-width Japanese period `。` with ASCII `.` to match English, Japanese, and Chinese. |

## Verification

- English, Japanese, Chinese, and Korean contain IDs 26101-26150 once in the
  same order, as checked in the preliminary report.
- The localized wrapper at ID 26106 retains its marker identity/order. The
  14-meter effect values and long lore section's paragraph breaks are retained.
- Active default CSV SHA-256:
  `9a45af2a78c1efc2778e79033467bc78c88fa7333a7857f30e02117e00a01dbd`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 bare-LF endings are preserved.
- Register totals after this batch: 830 accepted, 2,888 `not an issue`, and
  4,813 uncertain (8,531 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 26151; 38,984 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
