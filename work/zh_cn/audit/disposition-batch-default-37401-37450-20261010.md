# Disposition Batch: `default` IDs 37401-37450

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: zero accepted, one `not an issue`, and nine uncertain.
- CSV changes: none.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 37401 | Maisie's Luck / named ring | Uncertain: the fortune-versus-despair effect is retained, but the canonical Korean item-name form remains unsettled in prior findings. |
| 37404 | The Widow Walks | Uncertain: the literal title-like phrase is retained, but the English/Japanese title readings and unresolved title/quest status do not support a definitive Korean retitling. |
| 37415 | Dead Kel / Akara the Exile / Gallows End | Uncertain: the mission, pirate, community, and deified-tree relationship are retained; canonical spellings and the exact epithet remain open. |
| 37417 | Storyteller / Summer Court anthology | Uncertain: the speaker's custodial role and Fae storytelling tradition are present, but the formal Storyteller/Telling terminology is unresolved. |
| 37425 | Strict Accounts | Uncertain: `엄격한 회계` follows the locale readings, but the capitalized English label's in-game function is unknown. |
| 37432 | Callis Dren / Defender of Pride | Uncertain: the defender relationship is preserved; whether Pride names the House or the abstract virtue remains unresolved in prior decisions, so no one-row normalization is justified. |
| 37437 | Weave / reading a place or fate | Uncertain: the loss of divination after returning from Alabastra is retained, but the Weave metaphor and its established Korean form remain inconsistent across prior decisions. |
| 37441 | maiden's light / Hollow | Uncertain: the recovery-and-return objective is clear, but the object and whether Hollow is a named place are unresolved. |
| 37447 | Keurig Shaster / mercenary threat | Uncertain: the tracking, waiting outside, and threat to spill the speaker's blood remain; the proper-name spelling is not established across locales. |
| Other rows in IDs 37401-37450 | Dialogue, names, values, objectives, UI, and labels | Not an issue: remaining rows were compared across the four locales; no additional supported row-local correction was identified. The ante variable and `{1}` UI token are retained. |

## Historical Audit Reconciliation

- The source-keyed questions for IDs 37400-37599 were checked against these
  rows, including The Widow Walks, Strict Accounts, Pride, the Weave, and
  maiden's light. Prior unresolved terminology remains unresolved.
- `$NQD_City_Rathir.ante_high$` at 37429 and `{1}` at 37443 were checked
  directly and remain unchanged.
- These are working dispositions, not independent linguistic approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs
  37401-37450 once and in identical order.
- The targeted rows contain no changed runtime markers or numeric values;
  line-break structure is unchanged.
- No active Korean text was changed in this batch.

## Checkpoint

Disposition is complete through ID 37450. Resume at ID 37451; 27,684
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-37451-37500-preliminary.md`. The next unused decision ID is
D-12153.
