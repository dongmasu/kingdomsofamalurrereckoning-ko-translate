# Disposition Batch: `default` IDs 62601-62650

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, and structure.
- Three accepted targeted corrections/normalizations, 35 `not an issue` IDs,
  and 12 uncertain IDs. These are working dispositions, not independent final
  linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18011 | 62643 | `영리한 노움은 그 도시에서 출세할 수 있어. 하지만 현명한 노움은 그 도시에서 멀리 떨어져 나가지.` | `영리한 노움은 그 도시에서 출세할 수 있어. 하지만 현명한 노움은 그 도시를 멀리 떠나.` | English says a wise gnome goes far away from the city; Japanese agrees. Replace the awkward `떨어져 나가지`, which can be read as a negative or detachment, with an unambiguous affirmative departure. |
| D-18012 | 62637 | `나중에? 나중은 곧 사라질 거야. 네 어리석음은 끝이 없군. 네가 우리를 이런 꼴로 내버려 두고 갔는데, 내가 왜 놀라겠어?` | `나중에? 나중은 곧 사라질 거야. 네 어리석음은 끝이 없군. 네가 우리를 이런 꼴로 만들어 놓았는데, 내가 왜 놀라겠어?` | English `left us in such a state` and Japanese/Chinese describe the addressee as causing the group's condition; the prior Korean more strongly implied physically abandoning them. |
| D-18013 | 62610 | The internal separator between the damage and cost lines was CRLF. | The internal separator is LF. | English, Japanese, and Chinese use LF. Normalize only this embedded break; retain the two-line layout and all damage/cost values. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18014 | 62601 | `Dverga` is retained phonetically, but the people-name/adjective distinction from `Dvergan` and a canonical Korean form need a terminology pass. |
| D-18014 | 62604 | `Sorrows` names an item associated with the House of Sorrows, but the title/wordplay and relation to the faction remain unsettled across locales. |
| D-18014 | 62609 | The English fragment `agents in every shadow, and whisper` is ambiguous; Korean follows its image, while Chinese explicitly describes spies listening to every whisper. |
| D-18014 | 62611 | The woman and the exact Warsworn history she studied are not identified in this row; retain the source-aligned account pending dialogue context. |
| D-18014 | 62613 | `Ironfast` may identify a place, the Warsworn, or both; Korean preserves the name and the action-over-display contrast. |
| D-18014 | 62616 | `Castellans` is a formal Warsworn role and `Hall of the Firstsworn` a named location; canonical rank and hall terminology are unresolved. |
| D-18014 | 62619 | The line describes a key location holding gnomish knowledge, but does not identify the location; do not infer an institution or place name. |
| D-18014 | 62620 | `Thresh` may be a species/name; Korean retains the attacker and normally fatal encounter, while Chinese uses a localized creature label. |
| D-18014 | 62633 | `Bursar` appears to be the expedition funder, but the formal office/person rendering conflicts across locales; retain the clear current meaning. |
| D-18014 | 62645 | `Thresh - RapidFire - Ammo` may be an internal/debug label. Its audience is unknown, so do not normalize the components yet. |
| D-18014 | 62648 | Capitalized `the Marches` appears to be a region, while Korean `황무지` may be generic. The canonical place name is unresolved. |
| D-18014 | 62650 | `Adar`'s status and the exact “behind the jail” location differ across references. Korean retains the rescue actions without resolving the geography. |

## Not an Issue

Decision D-18015 records these 35 IDs: 62602-62603, 62605-62608, 62612,
62614-62615, 62617-62618, 62621-62632, 62634-62636, 62638-62642,
62644, 62646-62647, and 62649. These rows preserve the available meaning,
voice, labels, values, and structure. Runtime controls and localized-marker
identity are retained; 62610's values are separately recorded above.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 62601-62650 once,
  in identical ascending order.
- Embedded newline counts match every row after the accepted normalization.
  ID 62610 retains its two-line block. Runtime-marker identities and order
  match: `#NAMED_ICON_360_A#` at 62602 and localized `{*3Primal Magic}` at
  62612 retain their marker identities/order.
- Damage and cost values at 62610 (85, 720, 170, +10) are preserved.
- Rechecked the historical source-keyed questions for Dverga/Dvergan,
  Sorrows weapons, Chaos King agents, Warsworn history, Ironfast,
  Castellans/Firstsworn, the gnomish knowledge center, Thresh, City Watch,
  the operation/Bursar, the proverb, RapidFire, Culn/Anela, gem-setting,
  Fyragnos/Marches, and Fae Adar.
- Pre-edit CSV SHA-256:
  `816f3ca27b568db9dbd2437449bd71cacd82368fbf5eb0b8e5dff58f23e36c0c`.
  Post-edit SHA-256:
  `dae4be7f436581a82dc611bfaa100d1507f3ff898f82c98875c095ee0faaf136`.
  Only `Texto` at IDs 62610, 62637, and 62643 changed. UTF-8 BOM, 65,135
  records, key order, total newline count (72,084), and outer CSV record
  separators are preserved. Aggregate endings are 72,016 CRLF and 68 bare LF.
  Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-62601/locatexts_zh_cn.koalocatext_default.csv`.
- D-18011-D-18013 record three accepted corrections/normalizations,
  D-18014 records 12 uncertain findings, and D-18015 records 35 `not an issue`
  IDs. Direct register totals: 1,785 accepted, 15,520 `not an issue`, and
  12,133 uncertain (29,438 dispositions total); next D-18016.

Resume at `default` ID 62651; 2,484 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
