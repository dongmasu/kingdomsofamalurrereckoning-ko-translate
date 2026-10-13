# Disposition Batch: `default` IDs 37701-37750

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: two accepted, two `not an issue`, and eight uncertain.
- CSV changes: IDs 37742 and 37748.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 37701 | Cras / `크라스` | Uncertain: English and Chinese treat this as a proper name while Japanese reads “class”; Korean follows English provisionally. |
| 37708 | Phasmer / shade / Hierophant | Uncertain: the conditional learning of respect is retained, but whether `shade` is a species, title, or address is unknown. |
| 37710 | omitted object / Korean `알` | Not an issue: Japanese and Chinese explicitly identify eggs, supporting the Korean's contextual object without changing the destroy-more/reward sequence. |
| 37716 | capitalized Fate | Uncertain: influence on allies' Fate is retained, but whether this names a metaphysical system or ordinary fate is unresolved. |
| 37728 | Hallam the White / Etair / Perpetual Mission / Sidhe | Uncertain: alchemist/priest role, institution, location, and southeast direction remain; formal titles and institution type need alignment. |
| 37730 | Ametair / “the one whom I herald” | Uncertain: finding Ametair and rejecting a simple owner/possession relation remain; English herald versus Japanese retainer and Korean service readings conflict. |
| 37731 | The Leaf | Uncertain: its comparison with Adessa's great library is retained; formal institution/place status and Korean name convention remain open. |
| 37741 | Deep Slumber | Uncertain: prediction and find-reforge-keep sequence remain; capitalized rite/prophecy status needs context. |
| 37742 | Red Legion / `적군단` | Accepted: change to `레드 리전`, reusing the established faction form in D-2554 and D-10678; the source names the faction, not a generic enemy legion. |
| 37748 | `wreak havoc` / `대혼란을 일으킬 힘` | Accepted: change to `막대한 피해를 입힐 힘`. English, Japanese, and Chinese describe destructive harm, not confusion; retain Telogrus's separate vision/unmaking abilities and the possibility-in-Chaos parallel. |
| 37750 | Fateweaver / `페이트위버` | Uncertain: the role is phonetically rendered, but its canonical Korean title remains part of broader terminology alignment. |
| Other rows in IDs 37701-37750 | Dialogue, names, values, objectives, labels, and UI | Not an issue: remaining rows preserve source meaning and structure; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- Source-keyed questions for IDs 37700-37799 were checked, including Cras,
  Hellbane, Phasmer/shade, Wyl Rendig, the map, Etair's institution, Ametair,
  Deep Slumber, and Fateweaver.
- Red Legion at 37742 reuses the already accepted Korean faction form.
- The added egg object at 37710 is supported by Japanese and Chinese; no
  other unstated object was inferred.
- These are working dispositions, not independent linguistic approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs
  37701-37750 once and in identical order.
- Only active Korean `Texto` at IDs 37742 and 37748 changed.
- No runtime marker, number, or line-break structure changed.
- The UTF-8 BOM and existing mixed line endings are preserved; exact counts
  and the resulting SHA-256 are recorded in the current checkpoint documents.

## Checkpoint

Disposition is complete through ID 37750. Resume at ID 37751; 27,384
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-37751-37800-preliminary.md`. The next unused decision ID is
D-12244.
