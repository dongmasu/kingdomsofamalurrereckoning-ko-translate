# Disposition Batch: `default` IDs 38251-38300

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared the active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: one accepted, one `not an issue`, and eleven uncertain.
- CSV change: ID 38292 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 38252 | Default Sign Popup / `기본 표지 팝업` | Uncertain: the source locales do not agree on whether `Sign` means a sign, signature, or UI action, and the display context is unavailable. |
| 38258 | Domus Politica / Heralds / `정치회관` / `전령` | Uncertain: the endorsement and title-announcement relation is retained, but the institution and formal herald/title terms remain unsettled. |
| 38261 | great House / sanctuary / `가문` / `성소` | Uncertain: the fall of the named Fae House and the sanctuary's decline are retained; capitalization and the faction's formal name need broader context. |
| 38266 | Unique Finesse Armor Surprise / `고유 재주 갑옷 깜짝 상자` | Uncertain: Korean adds a “box” category not explicit in English, but the short label and other locales do not establish the item/UI type. |
| 38270 | Knave of Coins / `동전의 잭` | Uncertain: the capitalized title may use a Fateweaver court-card rank; prior findings leave the card-title sense and canonical Korean form unresolved. |
| 38272 | Cthongeny: Selinia / `크통게니: 셀리니아` | Uncertain: Japanese transliterates Cthongeny while Chinese interprets it as “Greater Titan”; the category and canonical name form are not established. |
| 38275 | Lyria passage / `골짜기의 샘물` | Uncertain: Korean preserves the poem's sequence and spring simile, but malformed English phrases are source issues and the full literary reading remains open. |
| 38286 | Lyria's grace / Fate-weaving poem | Uncertain: paragraph order and core theological/Fate imagery are retained; awkward English source phrasing and the poem's register require broader review. |
| 38292 | `boggarts` / `브라우니들을` | Accepted: change to `보가트들을`. English explicitly names boggarts; Japanese `ボガート` and Chinese `博格特` support the Boggart identity. Korean `브라우니` changes it to a different creature. Reuse the established in-corpus `보가트` form; no other wording in the row changes. |
| 38293 | Toast Tester Barclay / `바클레이 건배 시험` | Uncertain: the capitalized fragment may be a toast addressed to Barclay or an internal/test label; player-facing context is unavailable. |
| 38298 | Guard Down / `방어 태세 무너짐` | Uncertain: the short capitalized label may be a named status/ability or a generic combat phrase; UI context is absent. |
| 38300 | Lykeios / Beckoned / `리케이오스` / `초대받은 자` | Uncertain: the Beckoned title is covered by the established `부름받은 자` decision, but the same cell also contains a disputed Lykeios spelling. Do not change only part of the compound text until its complete display form is resolved. |
| Other rows in IDs 38251-38300 | Dialogue, names, values, objectives, items, and labels | Not an issue: the preliminary comparison found no additional supported row-local correction. |

## Historical Audit Reconciliation

- The historical source-keyed open-question log has a documented coverage gap
  spanning IDs 37700-40349. No historical disposition is inferred for this
  batch.
- Prior notes leave Domus Politica, Knave of Coins, and Lykeios terminology
  unresolved. The established Beckoned form is `부름받은 자`; it does not
  settle the separate Lykeios spelling in ID 38300.
- The preceding batch report understated its uncertain count by one.
  Register entries D-12398-D-12406 contain six uncertain, not five, findings.
  This batch's cumulative recount corrects that discrepancy.
- These are working dispositions, not independent linguistic approval.

## Verification

- The preliminary structural comparison reports IDs 38251-38300 once and in
  identical order across all four locales, with matching line-break and
  runtime-marker structures.
- Raw-row comparison at ID 38292 confirms English `boggarts`, Japanese
  `ボガート`, Chinese `博格特`, and the Korean correction to `보가트들`.
- Ruby's standard CSV parser cannot parse the active Korean file as a whole:
  with the semicolon delimiter and liberal parsing enabled, it stops at
  physical line 11029 with `CSV::MalformedCSVError` (“Unquoted fields do not
  allow new line”). No whole-file parse or round-trip is claimed. The target
  row was verified directly as a single physical record.
- Before this batch, the active CSV SHA-256 was
  `b2c7f7dbb0ffd9640d8f8ff9d5be13d8a696f4a6ee9434d807e25e4ed535e603`.
  After the one approved text-cell edit it is
  `b39e1a7954c991a661161aad5e304460bb01a250049e71a652b97dcbf6ccbdc1`.
- UTF-8 BOM, 72,046 CRLF endings, 39 bare-LF endings, and zero bare-CR
  endings are preserved. No immutable source file was edited.

## Checkpoint

Disposition is complete through ID 38300. Resume at ID 38301; 26,834
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-38301-38350-preliminary.md`. The next unused decision ID is
D-12420.
