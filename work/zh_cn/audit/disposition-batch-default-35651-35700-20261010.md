# Disposition Batch: `default` IDs 35651-35700

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciled against active Korean, immutable
  English/Japanese/Chinese rows, historical questions, terminology, values,
  markers, and structure.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- Decisions: two accepted, two `not an issue`, and seven uncertain.
- CSV changes: IDs 35663 and 35688.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35651-35652 | New Culn / Odwig, Eadric, and our own `mission` | Uncertain: the shrine relationship is retained, but `mission` may mean a religious institution/station rather than a task site. Japanese monastery and Chinese mission-station readings differ; do not fix `임무지` without contextual confirmation. |
| 35653 | Trap skill values | Uncertain: seven traps, five-meter radius, 100 damage each, 80 Mana, and the held 18-trap/120-Mana state are retained with all four breaks. The ability name/terminology still needs glossary alignment; no numeric correction is authorized. |
| 35661-35662, 35667-35669 | Red Marches / raw Prismere / Sons of Laz / ancestors / component UI | Uncertain: core relations and the threatening ancestral remains are preserved; faction and region names and the two localized component labels need integrated terminology review. Marker identities/order and `{LINE_SPACE}` remain intact. |
| 35663 | `cannot hurt or frighten me` | Accepted: change `폭력으로도 겁을 줘도 날 해칠 수 없다` to `넌 나를 해치지도 겁주지도 못해`. English states two independent protections; the old Korean made frightening sound like a means of causing harm and lost the parallel. Japanese and Chinese preserve both claims. |
| 35673-35675 | Great Cycle / augmentations / Aurochs wraps | Uncertain: the Tuatha recurrence and Tirnoch gaining strength are retained; `augmentations`, Aurochs, and the creator's canonical title/name need glossary context. Korean's gender-neutral `마법사` does not itself introduce a contradiction. |
| 35679, 35685 | Arcadium investment / Well of Souls | Not an issue: poor performance and lost investment are explicit, and the quest objective correctly says to leave the Well of Souls. No row-local semantic correction is supported. |
| 35688 | `I don't dare go forward` | Accepted: change `앞으로 갈 수도 없고` to `앞으로 나아갈 엄두도 안 나`. English distinguishes fear of advancing from inability to return; Chinese supports that distinction. |
| 35689, 35692-35693 | Goliath Ring / Prismere Chantries / Kandrian curse | Uncertain: the ring-return, curse, alternate-entry objective, and prior destruction remain in order; formal item/institution terminology and names need cross-entry alignment. |
| 35696-35698 | Tragedian apprenticeship / Glass of Ambient / Missives of Sable / Hierophant | Uncertain: apprenticeship, recovery, handoff, and next objective are preserved, but `Glass of Ambient` and `Missives of Sable` are capitalized names and Korean `주변의 유리` is not established as their canonical form. |
| 35700 | The Trellis | Uncertain: entry restricted to people of high esteem/importance is retained; the capitalized venue's identity and Korean naming remain unresolved. |
| Remaining ordinary text in IDs 35651-35700 | Dialogue, labels, values, markers, and structure | Not an issue: the other 28 IDs were checked in the four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The 35600-35799 source-keyed inventory flags the mission sites, trap
  values, Testament, Sons of Laz, Great Cycle, augmentations, Arcadium,
  Well of Souls, Prismere Chantries, Glass of Ambient, and Trellis. Open
  terminology questions remain open rather than becoming edit authority.
- The two accepted corrections address English meaning directly; no
  source-locale disagreement was used to override English.

## Verification

- English, Japanese, Chinese, and active Korean rows for IDs 35651-35700
  were checked in matching key order.
- The trap counts/radius/damage/Mana values, four line breaks, component
  markers, and `#NAMED_ICON_PS3_R1#` are preserved.
- Only the approved Korean `Texto` values at IDs 35663 and 35688 changed.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- These working dispositions are not independent final linguistic approval.
- Resume disposition at ID 35701; 29,434 `default` IDs remain through 65134.
