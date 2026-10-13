# Disposition Batch: `default` IDs 38751-38800

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: one accepted, one `not an issue`, and four uncertain.
- CSV changes: ID 38799 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 38752 | tower / `You could not be overlooked` | Uncertain: English shifts from a distant, visible tower to addressing “you”; Japanese/Chinese also vary in perspective. Scene context is needed to decide whether this is deliberate personification or a direct address. |
| 38760 | Brother Til's Collection / `틸 형제의 수집품` | Uncertain: capitalization and the other locales identify a named collection, but neither its function nor whether Brother Til is a title is established. The current Korean preserves the basic relation without resolving those points. |
| 38777 | `wearing a rut around Mel Aglir ... over the pikes` | Uncertain: the idiom is intentionally vivid and compressed. Japanese and Chinese clarify the pikes, but do not settle an idiomatic Korean image without changing the threat's force or speaker voice. |
| 38799 | `a testament to their strength` / `그 말은 그의 잔혹함과 힘을 증명했다` | Accepted: change to `그의 교수형은 알파르 해군의 힘을 보여 주는 증거였다.` English identifies the hanging as evidence of the Alfar Navy's strength; Chinese makes the same relation explicit. Korean instead made the pirate's own words prove his cruelty and strength. |
| 38799 | Gallows End / `내 교수대 끝` | Uncertain: the final clause appears to exploit the Gallows End/gallows wording, but historical decisions contain conflicting Korean place-name spellings and no accepted localized pun. Retain it pending integrated name and wordplay review. |
| Other rows in IDs 38751-38800, excluding separately listed findings | Dialogue, names, values, objectives, items, and labels | Not an issue: no additional supported row-local correction was found. |

## Historical Audit Reconciliation

- The source-keyed historical audit has a documented gap covering IDs
  37700-40349. Prior Gallows End, Dead Kel, and naming questions were
  consulted; none is treated as approval of the unresolved pun.
- ID 38789's English `bares` is an apparent typo for a grave bearing a name;
  Korean conveys the intended meaning and needs no correction.
- These are working dispositions, not independent linguistic approval.

## Verification

- English and Chinese confirm the referent of “their” as the Alfar Navy;
  Japanese preserves the hanging/claim without supporting Korean's
  pirate-self-strength reading.
- The preliminary structural comparison reports matching ID order,
  line-break counts, marker order, and the recorded ability values/layout.
- Only the approved Korean `Texto` at ID 38799 changed. The UTF-8 BOM and
  existing mixed line endings were preserved by a single-record patch.
- Current default CSV SHA-256:
  `4346a09f21b25583d86e837a917ffb8f10c98407fc35eb75f02025d1f3b5639b`.
- Verified formatting: UTF-8 BOM, 72,046 CRLF endings, and 39 bare-LF
  endings, matching the recorded pre-edit distribution.
- No immutable source or prohibited directory was edited.

## Checkpoint

Disposition is complete through ID 38800. Resume at ID 38801; 26,334
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-38801-38850-preliminary.md`. The next unused decision ID is
D-12493.
