# Disposition Batch: `default` IDs 38701-38750

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: zero accepted, one `not an issue`, and five uncertain.
- CSV changes: none.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 38715 | Sacred Pools / Water Lock | Uncertain: all four locales say four pools in this row, while the historical audit records a separate four-versus-five source conflict. `Water Lock` is capitalized as a mechanism, but context does not establish a canonical Korean name. Preserve the current row and do not propagate the unrelated count conflict. |
| 38720 | Donovan Byrnes / `도노번 번스` | Uncertain: English, Japanese, and Chinese give the full name Donovan here. The earlier Don/Donovan conflict belongs to another source row and does not justify changing this occurrence. Canonical Korean spelling remains unsettled. |
| 38728 | Hospitalis Quarters / `병원 구역` | Uncertain: English capitalization indicates a named place, while the current Korean is generic. Prior occurrences do not establish a single canonical Korean place-name form; retain pending broader terminology review. |
| 38740 | `Gone, both the old and the new` / `옛것도 새것도 모두 사라졌어` | Uncertain: English and Japanese leave the antecedent implicit; the following sentence uses “they,” but does not identify the referent. Korean's inanimate reading may be too narrow, yet no supported replacement can be selected without context. |
| 38744 | the Crows / `까마귀들` | Uncertain: the tournament context and capitalization suggest a named team; Japanese explicitly uses a team reading. Existing decisions leave the team's canonical Korean name open, so do not impose a global rendering from this occurrence alone. |
| Other rows in IDs 38701-38750, excluding separately listed findings | Dialogue, names, values, objectives, items, and labels | Not an issue: no additional supported row-local correction was found. |

## Historical Audit Reconciliation

- Historical notes on Sacred Pools, Donovan/Don Byrnes, Hospitalis Quarters,
  and Crows were consulted. The documented source-keyed audit gap covers
  IDs 37700-40349; previous candidates are not treated as approvals.
- The four-versus-five Sacred Pools conflict is a source inconsistency,
  not a Korean translation error in ID 38715.
- These are working dispositions, not independent linguistic approval.

## Verification

- Immutable English, Japanese, Chinese, and active Korean rows were checked
  for the five findings.
- The preliminary structural comparison reports matching IDs/order,
  line-break counts, and runtime-marker identities/order.
- No CSV cells changed. The active default CSV SHA-256 remains
  `74acbdae303231d3b1c6653b70abdeeba85ea6f09b2bfc07c95daa29d6ce15dc`.
- No immutable source or prohibited directory was edited.

## Checkpoint

Disposition is complete through ID 38750. Resume at ID 38751; 26,384
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-38751-38800-preliminary.md`. The next unused decision ID is
D-12487.
