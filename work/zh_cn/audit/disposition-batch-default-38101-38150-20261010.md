# Disposition Batch: `default` IDs 38101-38150

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- Findings at IDs 38107, 38108, 38121, 38128, 38132, 38133, 38139, and
  38150 were already dispositioned as carry-forward candidates in
  `disposition-batch-default-38051-38100-20261010.md`; they are not counted
  again here.
- New dispositions: zero accepted, one `not an issue`, and one uncertain.
- CSV changes: none.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 38105 | Midden / `미든`; `call for decay` / `부패의 소명` | Uncertain: Korean preserves honoring the Midden, tending its depths, and honoring nature's decay, but `Midden`'s referent and the decay-practice wording remain unresolved in prior audit decisions. The Chinese corpse-tending reading is not sufficient to settle the English/Japanese divergence. |
| 38107 | “We did nothing to deserve this fate” | Previously dispositioned as D-12379 (`not an issue`); Korean follows English and Japanese, not the reversed Chinese meaning. |
| 38108 | `{3}`, `{1}`, `{2}` | Previously dispositioned as D-12380 (`not an issue`); Korean preserves all markers in English order. |
| 38121 | House of Ballads / `발라드 가문` | Previously dispositioned and corrected as D-12381 (`accepted`) to `발라드의 집`. |
| 38128 | Gallows End / `갤로우스 엔드` | Previously dispositioned as D-12382 (`uncertain`); competing accepted corpus spellings remain unresolved. |
| 38132 | Silken Seat / `실크 좌석` | Previously dispositioned as D-12383 (`uncertain`); place/inn referent and canonical Korean remain unresolved. |
| 38133 | `TestTest` / `테스트` | Previously dispositioned and corrected as D-12384 (`accepted`) to `테스트테스트`, restoring source repetition. |
| 38139 | Pyrderi / Pryderi | Previously dispositioned as D-12385 (`uncertain`); retain the source spelling pending context. |
| 38150 | Aron Excavations / Motus competition | Previously dispositioned as D-12386 (`not an issue`); the other mining operation, sole competitor, and dismissive assessment remain. |
| Other rows in IDs 38101-38150, excluding the rows above and ID 38105 | Dialogue, names, values, objectives, items, and labels | Not an issue: the remaining rows preserve English meaning and structure; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The historical source-keyed open-question log has a documented coverage gap
  spanning IDs 37700-40349.
- D-12379 through D-12386 cover all other candidates carried forward from the
  preceding preliminary report; no decision is duplicated or recounted here.
- ID 38105 remains open consistently with prior Midden/corpse-tending
  decisions, including D-3288 and D-9232.
- These are working dispositions, not independent linguistic approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs
  38101-38150 once and in identical order, as recorded in the preliminary
  structural comparison.
- No active CSV cell changed in this batch.
- The active default CSV SHA-256 remains
  `2786ab27ab43789f04188423e5bdaff8a9dd65e26f1c64573e719967136f436d`;
  the UTF-8 BOM, 72,046 CRLF endings, and 39 bare-LF endings remain intact.

## Checkpoint

Disposition is complete through ID 38150. Resume at ID 38151; 26,984
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-38151-38200-preliminary.md`. The next unused decision ID is
D-12390.
