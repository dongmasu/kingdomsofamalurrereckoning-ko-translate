# Disposition Batch: `default` IDs 38201-38250

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: two accepted, one `not an issue`, and six uncertain.
- CSV changes: IDs 38201 and 38208.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 38201 | Hall of Appointments / `임명실`; House of Ballads / `발라드 가문` | Uncertain for Hall of Appointments: the messenger relation is retained, but the institution's exact function and canonical name remain open. Accepted for House of Ballads: change `발라드 가문` to `발라드의 집`, reusing D-10221, D-10457, D-10462, D-10516, D-10524, D-10577, and D-10674. |
| 38208 | `required parties` / `필수 의뢰인` | Accepted: change to `퀘스트에 필요한 관계자 중 한 명`, supported by Japanese and Chinese; English `party` means a participant here, not a client/commissioner. |
| 38217 | Sagecraft altar / `마법물품 제작 제단` | Uncertain: the shard/gem procedure is retained, but Sagecraft is a named discipline and its Korean term is not established well enough to replace the generic phrase safely. |
| 38220 | capitalized Well / `샘` | Uncertain: the command to destroy the Well is preserved, but this line and the locale references do not establish whether it names the Well of Souls. |
| 38235 | House of Vengeance / `복수의 가문` | Uncertain: the question about whether the group can mend its deeds over time is retained; its formal entity/name treatment remains unresolved. |
| 38240 | `FAIL LINE` / `실패 줄` | Uncertain: this may be an internal/test label; the row does not establish whether it is player-facing. |
| 38241 | House of Vengeance / Court / Witchknights account | Uncertain: six-line sequence and main relations are retained, but faction, title, and personal-name forms need broader terminology review. |
| Other rows in IDs 38201-38250 | Dialogue, names, values, objectives, items, and labels | Not an issue: remaining rows preserve English meaning and structure; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The historical source-keyed open-question log has a documented coverage gap
  spanning IDs 37700-40349.
- Accepted House of Ballads decisions were reused without globally changing
  other House terms. Sagecraft, Well, and House of Vengeance questions remain
  open as in prior audit notes.
- The multiline structure at ID 38217, six-line layout at ID 38241, runtime
  variables, and numeric values recorded in the preliminary report remain
  intact.
- These are working dispositions, not independent linguistic approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs
  38201-38250 once and in identical order, as recorded in the preliminary
  structural comparison.
- Only active Korean `Texto` cells at IDs 38201 and 38208 changed.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39 bare-LF
  endings. Active default CSV SHA-256:
  `b2c7f7dbb0ffd9640d8f8ff9d5be13d8a696f4a6ee9434d807e25e4ed535e603`.
- Register reconciliation: D-12398-D-12406 contain six uncertain
  dispositions; the earlier batch summary's count of five was an arithmetic
  error.

## Checkpoint

Disposition is complete through ID 38250. Resume at ID 38251; 26,884
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-38251-38300-preliminary.md`. The next unused decision ID is
D-12407.
