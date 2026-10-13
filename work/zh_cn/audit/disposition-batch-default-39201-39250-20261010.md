# Disposition Batch: `default` IDs 39201-39250

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: one accepted, one `not an issue`, and four uncertain.
- CSV changes: ID 39204.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 39204 | Negative discourse marker / `그래` | Accepted: English and Chinese use a negative response after saying Bloody Bones was not always a terror; Korean's `그래` affirmatively reverses that transition. Change to `아니`. |
| 39231 | The Tidal Pools / `조수 웅덩이` | Uncertain: the objective is clear, but English capitalization and historical notes D-? at IDs 31420 and 36559 leave named-location status and canonical Korean form open. |
| 39237 | `For three giant mushroom caps` / `커다란 버섯 갓 세 개 값` | Uncertain: Chinese reads this as a sale price, while Japanese gives a bare quantity and English is a clipped “For...” fragment. The Korean price relation is plausible but not established without context. |
| 39238 | Flawless Mitharan Bloodseeker's Shaft / `완벽한 미사루식 피추적자의 자루` | Uncertain: the component is recognizable, but Mitharan spelling, Shaft's item sense, and compound segmentation remain unresolved; see the related open finding at ID 38991. |
| 39242 | the Order / `교단` | Uncertain: English capitalization may name an organization, Chinese supports a religious group, and Japanese uses a generic association/council reading. The Korean religious characterization cannot be confirmed from this line. |
| Other rows in IDs 39201-39250, excluding separately listed findings | Dialogue, names, values, objectives, items, UI, and markers | Not an issue: the preliminary scan and source comparison found no additional supported row-local correction. |

## Historical Audit Reconciliation

- This range falls within the documented source-keyed audit gap at IDs
  37700-40349. Tidal Pools and Mitharan notes remain open rather than
  approved terminology.
- The numeric/gameplay checks and marker scan in the preliminary report
  showed no additional exception.

## Verification

- The four-locale preliminary comparison reports matching keys/order,
  embedded line breaks, and runtime markers.
- The active Korean at ID 39204 now uses a negative transition consistent
  with English and Chinese; no other row was edited.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39
  bare-LF endings. SHA-256:
  `31fdfc888a910225b041f10e9c64e6f9daa6aa00d2ed0e6ed0acb05be151595f`.
- No immutable source or prohibited directory was edited.

## Checkpoint

Disposition is complete through ID 39250. Resume at ID 39251; 25,884
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-39251-39300-preliminary.md`. Decisions D-12541 through D-12546
are recorded in the register; the next unused decision ID is D-12547.
