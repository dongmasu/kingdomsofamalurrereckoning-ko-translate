# Disposition Batch: `default` IDs 38151-38200

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: three accepted, one `not an issue`, and four uncertain.
- CSV changes: IDs 38153, 38170, and 38193.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 38153 | Tenders / `보호 대상` | Accepted: change to `돌보는 이들(Tenders)`. English role noun, Japanese protector/caretaker, Chinese caretaker, and prior service context identify people who tend/care for something; Korean `보호 대상` instead names the recipient/object of protection. Retain the English term to avoid overcommitting to an unverified formal title. |
| 38170 | Beckoned / `초대받은 자여` | Accepted: change to `부름받은 자여`, reusing the established player-title form authorized at ID 3368 (D-692) and later accepted decisions. |
| 38171 | `thrown in the` / Korean supplies `감옥에` | Uncertain: the English fragment breaks off mid-phrase and Korean supplies a prison object; Japanese and Chinese also leave the object incomplete. The likely referent is insufficient to settle whether the completion is justified. |
| 38174 | Little Fate-Weaver / `꼬마 운명 직조사` | Uncertain: the diminutive and demand for release are retained, but the canonical Korean Fate-Weaver title remains unsettled. |
| 38176 | ward / `보호막` | Uncertain: the puzzle action and all-wards-in-one-revolution condition are retained; English, Japanese, and Chinese differ on ward/seal/protective-magic terminology. |
| 38193 | `Without the Tuatha at your back` / `투아사가 뒤를 봐주지 않는다면` | Accepted: change to `투아사가 뒤쫓지 않는다면`, restoring the likely “without Tuatha pursuers” sense explicitly supported by Japanese and consistent with entry being easier without the hostile group following. |
| 38198 | Caeled Coast / `케일드 해안` | Uncertain: the place identity is retained, but locale phonetics and accepted Korean spellings differ; no canonical form is established here. |
| Other rows in IDs 38151-38200 | Dialogue, names, values, objectives, items, and labels | Not an issue: remaining rows preserve English meaning and structure; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The historical source-keyed open-question log has a documented coverage gap
  spanning IDs 37700-40349.
- Existing decisions were applied to the established Beckoned form and the
  unresolved Fate-Weaver, ward, and Caeled Coast terms.
- The 14-meter/weapon-stat values, line break, `{1}` marker, and other
  structural checks recorded in the preliminary report remain unchanged.
- These are working dispositions, not independent linguistic approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs
  38151-38200 once and in identical order, as recorded in the preliminary
  structural comparison.
- Only active Korean `Texto` cells at IDs 38153, 38170, and 38193 changed.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39 bare-LF
  endings. Active default CSV SHA-256:
  `9ea064c839c1097a6906b4dddaecf46348ef7a69bdb3b3567e25ce1f73910dc7`.

## Checkpoint

Disposition is complete through ID 38200. Resume at ID 38201; 26,934
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-38201-38250-preliminary.md`. The next unused decision ID is
D-12398.
