# Disposition Batch: `default` IDs 62701-62750

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, and structure.
- Two accepted targeted corrections/normalizations, 37 `not an issue` IDs,
  and 11 uncertain IDs. These are working dispositions, not independent final
  linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18022 | 62707 | The internal separator between the damage and cost lines was CRLF. | The internal separator is LF. | Match English, Japanese, and Chinese; retain the two-line damage/cost layout and 700 Fire, 95 Burning, 290 Mana values. |
| D-18023 | 62722 | `우리가 아는 가장 가까운 상인은 선술집 주인 한 테트란(Han Tetran)이야.` | `우리에게 상인이라고 할 만한 사람은 선술집 주인 한 테트란(Han Tetran)이야.` | English `the closest thing we have to a merchant` describes the closest local equivalent, not a geographically nearby merchant. Japanese and Chinese support the equivalent/approximation sense. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18024 | 62702 | `Tree and the Branches` is a named modern druid order; Korean preserves the name and purpose, but its canonical Korean form is unresolved. |
| D-18024 | 62706 | The warming-amulet requirement is retained, but the Paragon Barghest tier and heart-to-amulet game mechanic vary across references. |
| D-18024 | 62715 | The surprise at the Hierophant being chained and Grim leading the camp is retained; the title and precise camp role need lore context. |
| D-18024 | 62720 | Birth, death, rebirth, repeated roles, and countless ages are retained; the group's cosmology remains lore-dependent. |
| D-18024 | 62727 | `DIVIDE` may be an internal/control label rather than player-facing text; defer translating or normalizing it without interface context. |
| D-18024 | 62732 | The ornate ceremonial weapons and possible usefulness of gem-socketing are preserved; the crafting objective's exact practical relation needs context. |
| D-18024 | 62744 | The interruption-resistance/armor tradeoff and increased incoming damage are retained; exact combat/UI terminology remains provisional. |
| D-18024 | 62746 | `Children of Dust` is retained as a group/title, but the canonical name and honorific force need lore context. |
| D-18024 | 62747 | `Fahrlangi` may be a creature or group name. Korean preserves the uncertain inference that they have seen the party. |
| D-18024 | 62748 | The Headhunter/“head” wordplay is retained, but the object/reference depends on quest context. |
| D-18024 | 62749 | Korean's `지상인` conveys surface-dwellers; the exact social category and canonical term remain open. |

## Not an Issue

Decision D-18025 records these 37 IDs: 62701, 62703-62705, 62708-62714,
62716-62719, 62721, 62723-62726, 62728-62731, 62733-62743, 62745, and
62750. These rows preserve the available meaning, voice, labels, values, and
structure. Ariope is read as a performance role based on Japanese/Chinese
support for the English ambiguity; the battle values and quest objectives
remain intact.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 62701-62750 once,
  in identical ascending order.
- Embedded newline counts match every row after the accepted normalization.
  ID 62707 retains its two-line damage/cost layout.
- Runtime-marker identities/order and numeric values match. ID 62707 retains
  700 Fire, 95 Burning, and 290 Mana.
- Rechecked the historical source-keyed questions for Tree and the Branches,
  Barghest/Paragon, Fire/Burning values, the spouses' shop roles,
  Hierophant/Grim, “cheated the gallows,” the life cycle, Han Tetran, Ariope,
  `DIVIDE`, the slave-rescue objective, gem-socketing, Blink, Akara's rant,
  the tower promise, interruption resistance, Children of Dust, Fahrlangi,
  the Headhunter wordplay, and topsiders.
- Pre-edit CSV SHA-256:
  `1c4be3fd1d8e74998f83ff3fbb57b8ea8254936b88045ce73c424c8ec18dd6ac`.
  Post-edit SHA-256:
  `b534f41825624ba7b4caccb5655f7c294207a761b34a48d458562cf20fafb494`.
  Only `Texto` at IDs 62707 and 62722 changed. UTF-8 BOM, 65,135 records,
  key order, total newline count (72,084), and outer CSV record separators
  are preserved. Aggregate endings are 72,012 CRLF and 72 bare LF.
  Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-62701/locatexts_zh_cn.koalocatext_default.csv`.
- D-18022-D-18023 record two accepted corrections/normalizations,
  D-18024 records 11 uncertain findings, and D-18025 records 37 `not an issue`
  IDs. Direct register totals: 1,791 accepted, 15,590 `not an issue`, and
  12,157 uncertain (29,538 dispositions total); next D-18026.

Resume at `default` ID 62751; 2,384 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
