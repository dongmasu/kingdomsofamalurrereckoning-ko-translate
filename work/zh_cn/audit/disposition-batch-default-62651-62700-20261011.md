# Disposition Batch: `default` IDs 62651-62700

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, and structure.
- Four accepted targeted corrections/normalizations, 33 `not an issue` IDs,
  and 13 uncertain IDs. These are working dispositions, not independent final
  linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18016 | 62652 | Two internal separators in the three-line block were CRLF. | The two internal separators are LF. | Match English, Japanese, and Chinese; retain the three damage-blocking lines and values 5/10/10. |
| D-18017 | 62667 | `미사루 기사단 소속 성인 오드위그(Odwig)` | `미사루 교단 소속 성인 오드위그(Odwig)` | English only says Order of Mitharu; Japanese and Chinese specify a religious order/sect, not knights. Remove the unsupported knightly rank implication. |
| D-18018 | 62676 | `... 그가 도와 달라고 한 실험을 맡아야겠다.` | `... 그가 도와 달라고 한 실험을 도와야겠다.` | English says the gnomish scholar asked for the speaker's assistance, and Japanese explicitly says to accept helping. `맡다` overstates taking charge of the experiment. |
| D-18019 | 62683 | `... 비극에만 매달리는 법은 이제 잊었어. 앞으로 나아가야 해.` | `... 비극에만 매달리지 않는 법을 배웠어. 이제 앞으로 나아가야 해.` | Restore English/Japanese/Chinese that the group learned not to dwell on tragedy; the previous Korean says it forgot how to dwell on tragedy. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18020 | 62651 | The sword/core crafting choices are retained, but the established player-facing Korean term for `core` needs cross-item consistency review. |
| D-18020 | 62658 | The patrol and Niskaru objective are preserved; English `Hirelings` and Japanese's specific third-class mercenaries differ in group/rank implication. |
| D-18020 | 62659 | The odd/even challenge and drawn three are retained; exact card-game rules are unavailable. |
| D-18020 | 62661 | `Agreement` may mean a formal agreement, bargain, or alliance with the Champion; context is absent. |
| D-18020 | 62662 | `Master Healing Potion`'s canonical Korean tier conflicts with the Japanese large-potion reading; retain the current item name. |
| D-18020 | 62665 | `Bogeymen` may be a folk-horror term or a general scare-story expression; Korean preserves the deterrent-story function. |
| D-18020 | 62666 | `Firstsworn` is a historical group/title and its relationship to the present Warsworn remains a lore/terminology question. |
| D-18020 | 62670 | `Children of Ohn` is retained as a group/title, but the meaning of “children” and canonical name form require lore context. |
| D-18020 | 62677 | `Chief Financial Officer` may be intentionally player-facing or test/developer text; retain it pending display context. |
| D-18020 | 62679 | `Akara the Exile` may be an epithet/title, while Chinese can parse it as Akara plus an exile; retain the English-led appositive provisionally. |
| D-18020 | 62680 | `Reverie` may be a location/status/UI label or a generic state; the isolated row does not settle it. |
| D-18020 | 62686 | English `on the lines` may refer to the front lines; Japanese instead reads as watching the addressee's fighting. Retain the plausible current rendering. |
| D-18020 | 62692 | `Moon Camp` appears to be a place name, but the canonical treatment of `Moon` is unresolved. |

## Not an Issue

Decision D-18021 records these 33 IDs: 62653-62657, 62660, 62663-62664,
62668-62669, 62671-62675, 62678, 62681-62682, 62684-62685, 62687-62691,
and 62693-62700. These rows preserve the available meaning, voice, labels,
values, and runtime markers.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 62651-62700 once,
  in identical ascending order.
- Embedded newline counts match every row after the accepted normalization.
  ID 62652 retains its three-line block; the two internal separators now
  match the reference locales.
- Runtime-marker identities and counts are preserved. ID 62654 retains all
  three `{*1}` markers in English-source order; ID 62699 retains all three
  localized `{*1...}` markers.
- Values at 62652 (5/10/10 damage) and label `9` at 62660 are preserved.
- Rechecked the historical source-keyed questions for weapon core/block
  values, Inventory-longbow markup, Brigand Hall patrol, parity challenge,
  Champion agreement, Master Healing Potion, resurrection, spirits/bogeymen,
  Firstsworn, Order of Mitharu, Children of Ohn, CFO, Akara the Exile,
  Reverie, front lines, Moon Camp, Eagonn/Eamonn, and Sceptre markers.
- Pre-edit CSV SHA-256:
  `dae4be7f436581a82dc611bfaa100d1507f3ff898f82c98875c095ee0faaf136`.
  Post-edit SHA-256:
  `1c4be3fd1d8e74998f83ff3fbb57b8ea8254936b88045ce73c424c8ec18dd6ac`.
  Only `Texto` at IDs 62652, 62667, 62676, and 62683 changed. UTF-8 BOM,
  65,135 records, key order, total newline count (72,084), and outer CSV
  record separators are preserved. Aggregate endings are 72,014 CRLF and
  70 bare LF. Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-62651/locatexts_zh_cn.koalocatext_default.csv`.
- D-18016-D-18019 record four accepted corrections/normalizations,
  D-18020 records 13 uncertain findings, and D-18021 records 33 `not an issue`
  IDs. Direct register totals: 1,789 accepted, 15,553 `not an issue`, and
  12,146 uncertain (29,488 dispositions total); next D-18022.

Resume at `default` ID 62701; 2,434 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
