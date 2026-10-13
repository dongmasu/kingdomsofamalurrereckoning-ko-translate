# Disposition Batch: `default` IDs 36101-36150

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: one accepted, one `not an issue`, and four uncertain.
- CSV change: ID 36139 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 36110, 36127 | `"Sorrows"` / key to the Sorrows | Uncertain: the English capitalization and quotes mark a named referent, but ID 36110's “these Sorrows” does not establish people; Japanese reads as a power, Chinese as a named group, and Korean identifies House of Sorrows people. ID 36127's key supports a destination/artifact reading but does not resolve the identity. Keep both current texts unchanged pending lore context. |
| 36121 | Praetors / Missives of Sable / Centurion Gastet | Uncertain: the recovered document, sought-by group, gnomish leader, and possible exchange for Grim's freedom are retained. `군단병들` is plausible but does not establish the formal Praetor group, while the proper title `세이블의 서신` cannot resolve whether Sable is a person, place, or descriptor. Do not normalize the military term or manuscript title here. |
| 36128 | Castle Yolvan entrance and alternate route | Not an issue: Korean distinguishes the inaccessible entrance from evidence that it was destroyed, then preserves the alternate-entry and Canneroc-help objectives. The malformed English punctuation does not justify a different quest sequence. |
| 36139 | Omitted first-listener relation | Accepted: English, Japanese, and Chinese explicitly say the addressee is the first person to hear his voice in some time. The Korean only says he has spoken after a long silence. Replace with `네가 오랜만에 그의 목소리를 들은 첫 사람이야. 침묵을 맹세한 시종들과 함께할 줄 알았지.`; the existing informal voice and second clause are retained. |
| 36143 | Dverga / Gallows End terminology | Uncertain: the treasure-map meaning is preserved. Gallows End uses the accepted `갤로우스 엔드` form; `드베르가족` is understandable, but prior decisions leave the ethnonym and its Korean morphology unsettled. No local rewrite is supported. |
| 36144 | Fomorous Hugues | Not an issue: `포모러스 휴그` matches the dominant active-corpus spelling supported by D-839. The isolated `휴그스` variation does not establish a reason to alter this row. |
| 36150 | `History of the Crystal War, Vol III` | Uncertain: English and Chinese say Volume III while Japanese says Volume II. Korean follows the primary English meaning; the conflict cannot be resolved from these rows, so retain `제3권` pending book/lore verification. |
| Remaining ordinary text in IDs 36101-36150 | Dialogue, objectives, names, labels, values, and structures | Not an issue: all other IDs were compared in the four locales. No additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The source-keyed 36000-36199 entry flags IDs 36110, 36121, and 36150.
  Those questions remain unresolved and were not treated as prior approval.
- Prior Praetorian/Praetor and Dverga decisions continue to leave formal
  terminology open. D-839 supports the dominant Korean spelling `휴그`;
  the accepted Gallows End spelling at D-10903 and D-11264 is already used.
- The preliminary report's concerns at IDs 36128 and 36139 were checked
  against all four immutable/current rows. Only the omitted first-listener
  relation at 36139 warranted an edit.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs 36101-36150
  exactly once in identical order.
- The two embedded line breaks at ID 36136 and nine at ID 36137 match across
  locales. Runtime markers `{1}`, `{2}`, and `{*3...}` remain in their
  original positions and identities.
- Active default CSV SHA-256:
  `eec4f850b1a15eb0576c602275aa2f664594f03abf2778fa1e0779f23f927adb`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- These are working dispositions, not independent final linguistic approval.

## Checkpoint

Disposition is complete through ID 36150. Resume at ID 36151; 28,984
`default` IDs remain through ID 65134. The next unused decision ID is
D-11647. Preliminary scan:
`default-ids-36151-36200-preliminary.md`.
