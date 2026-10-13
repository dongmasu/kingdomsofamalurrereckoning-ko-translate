# Disposition Batch: `default` IDs 38401-38450

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: three accepted, one `not an issue`, and five uncertain.
- CSV changes: IDs 38429, 38440, and 38447 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 38404 | capitalized Well / `샘` | Uncertain: the Well grants access to eternal life, but prior findings and locale references do not establish whether this names the Well of Souls. |
| 38406 | `what may be an impossible crime` / `불가능에 가까운 범죄` | Uncertain: English is ambiguous between an impossible crime and an implausible accusation; Japanese and Chinese also diverge. Korean preserves the uncertainty without adding a definite allegation. |
| 38417 | The Crossing / `교차로` | Uncertain: the capitalized destination appears to be named, but Japanese describes a “crossing of power” and Chinese says a pass/gateway; canonical identity and Korean name remain open. |
| 38425 | Tirin's Rest / `티린의 안식처` | Uncertain: the meeting and reward are retained, but previous audits document spelling and place-type variants for this name. |
| 38429 | `.` / empty Korean field | Accepted: restore the period. English, Japanese, and Chinese all contain `.`, while the active Korean cell is empty. |
| 38437 | `I shall tend to you in a moment` / `잠시만 기다리세요. 곧 돌봐 드리겠습니다.` | Uncertain: Chinese suggests a threat (“deal with you”), while Japanese suggests granting a reprieve; Korean's courteous service reading may change the intent. Speaker/context is unavailable. |
| 38440 | `bodies of our lost` / `실종자들의 시체` | Accepted: change to `우리가 잃은 이들의 시신`. The English explicitly refers to bodies, making a missing-person reading contradictory; this preserves the source's euphemism without assuming combat deaths. |
| 38447 | Tender / `보살핌꾼` | Accepted: change to `돌보는 이(Tender)`, reusing the role rendering accepted at ID 38153 (D-12390) while retaining the English title for traceability. The row still does not settle the group's formal title. |
| Other rows in IDs 38401-38450 | Dialogue, names, values, objectives, items, and labels | Not an issue: the preliminary comparison found no additional supported row-local correction. |

## Historical Audit Reconciliation

- The historical source-keyed open-question log has a documented coverage gap
  spanning IDs 37700-40349. No historical disposition is inferred for this
  batch.
- The capitalized Well, Crossing, and Tirin's Rest remain terminology/context
  questions. D-12390 establishes a transparent Korean rendering for the
  caretaker role, but does not settle the group's official title.
- These are working dispositions, not independent linguistic approval.

## Verification

- The preliminary structural comparison reports IDs 38401-38450 once and in
  identical order across all four locales, with matching line-break counts
  and runtime-marker identities/order.
- ID 38429's period is present in all three immutable source locales. At
  ID 38440, the English “bodies” and Chinese deceased reading support a
  deceased-person referent; Korean now keeps the euphemism without saying
  “missing persons.” The Tender form reuses D-12390.
- Recipe quantities (2, 1, 2) at ID 38435 and the 11/8/8 damage values and
  three-line layout at ID 38423 remain unchanged.
- Ruby's standard CSV parser cannot parse the active Korean file as a whole:
  with the semicolon delimiter and liberal parsing enabled, it stops at
  physical line 11029 with `CSV::MalformedCSVError` (“Unquoted fields do not
  allow new line”). No whole-file parse or round-trip is claimed. The three
  changed rows were verified directly as single physical records.
- Before this batch, the active CSV SHA-256 was
  `de125f40a1bbe1ae4e3b89a2b02edfa2ed285a846a7523da28b417809c937426`.
  After the three approved text-cell edits it is
  `dbcb71dc28d39c1872150252fd07b17c6c5b85432ef59ef406b397f7916a2ee0`.
- UTF-8 BOM, 72,046 CRLF endings, 39 bare-LF endings, and zero bare-CR
  endings are preserved. No immutable source file was edited.

## Checkpoint

Disposition is complete through ID 38450. Resume at ID 38451; 26,684
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-38451-38500-preliminary.md`. The next unused decision ID is
D-12454.
