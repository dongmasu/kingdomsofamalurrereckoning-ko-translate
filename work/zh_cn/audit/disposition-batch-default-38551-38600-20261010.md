# Disposition Batch: `default` IDs 38551-38600

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: two accepted, two `not an issue`, and one uncertain.
- CSV changes: IDs 38551 and 38597 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 38551 | Beckoned / `초대받은 자여` | Accepted: change to `부름받은 자여`, reusing the established player-title form authorized at D-692 and reaffirmed at IDs 38170 (D-12391) and 38343 (D-12420). |
| 38560 | Deep Slumber / `깊은 잠` | Uncertain: English capitalization suggests a named entity or rite, Japanese explicitly calls it a ritual, and Chinese/Korean use ordinary sleep wording. Prior decisions leave this status unresolved; retain the concise current text. |
| 38585, 38591 | Collections / `소장품`; Destiny UI terms and `{*1}`, `{*2}` labels | Not an issue: Korean uses a broad, plausible rendering for the curated collections and preserves the tutorial's Destiny terms, class choices, marker identities, and order. No specific glossary correction is established by these rows. |
| 38597 | Testament / `유언장` | Accepted: change to `테스타먼트(The Testament)` and render `preyed on the innocent` as `무고한 사람들을 먹잇감으로 삼아 왔어`. English names the Testament and describes predation; reuse the accepted proper-name treatment at IDs 38081 (D-12375) and 38372 (D-12432), and retain the Testament/Belen identity conflict as unresolved. |
| Other rows in IDs 38551-38600, excluding the rows above | Dialogue, names, values, objectives, items, and labels | Not an issue: no additional supported row-local correction was found. |

## Historical Audit Reconciliation

- The historical source-keyed open-question log has a documented coverage gap
  spanning IDs 37700-40349. No historical disposition is inferred for this
  batch.
- Deep Slumber's status as a named rite/entity versus ordinary sleep remains
  unresolved, consistent with prior decisions including D-057, D-1234, and
  D-12239.
- Testament/Belen naming remains a cross-locale lore conflict. Reusing the
  English proper-name form does not identify it with or distinguish it from
  the Belen Covenant.
- These are working dispositions, not independent linguistic approval.

## Verification

- The preliminary structural comparison reports IDs 38551-38600 once and in
  identical order across all four locales, with matching line-break counts
  and runtime-marker identities/order.
- ID 38591 retains `{LINE_LEFT}`, `{LINE_SPACE}`, and both styled-label
  markers in source order. The Destiny tutorial text and the `{1}` control
  marker at ID 38586 remain intact.
- No immutable source file was edited. The two changed records were verified
  directly; no whole-file CSV parse or round-trip is claimed.

## Checkpoint

Disposition is complete through ID 38600. Resume at ID 38601; 26,534
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-38601-38650-preliminary.md`. The next unused decision ID is
D-12469.
