# Disposition Batch: `default` IDs 39001-39050

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: zero accepted, two `not an issue`, and three uncertain.
- CSV changes: none.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 39004 | The Baronett / `바러넷` | Uncertain: English identifies the named pirate and Japanese/Chinese transliterate the name, but active Korean varies among `바로넷`, `바러넷`, `바로네트`, and `남작네트`. Earlier decision D-12428 and historical notes at IDs 60622 and 64592 leave the name/title and canonical spelling unresolved. |
| 39020 | Solemn Bell / `장엄한 종 찾기` | Not an issue: Korean preserves the named bell and objective to find it. Capitalization and Japanese quotation marks alone do not establish a specific correction or Korean naming convention. |
| 39022 | Traveler / `여행자` | Uncertain: the English capitalized singular may identify a member of the Travelers, and Japanese uses a phonetic rendering. Prior decisions, including D-12498 and D-11929, leave the faction's canonical Korean form and singular display unsettled. |
| 39043 | `dove` / `내 사랑` | Uncertain: the affectionate vocative is represented, but `내 사랑` may be more explicitly romantic than the English familiar address. Japanese omits it, Chinese diverges, and earlier findings such as D-12336 defer the speaker-specific form. |
| Other rows in IDs 39001-39050, excluding separately listed findings | Dialogue, names, values, objectives, items, UI, and markers | Not an issue: the preliminary scan and row-by-row source comparison found no additional supported row-local correction. |

## Historical Audit Reconciliation

- The source-keyed historical log has a documented gap for IDs 37700-40349.
  Existing Baronett, Travelers, and `dove` questions were carried forward,
  not treated as approval.
- The Solemn Bell objective remains understandable in Korean. This row does
  not resolve the formal name or terminology questions recorded elsewhere.

## Verification

- English, Japanese, Chinese, and Korean rows for IDs 39001-39050 were
  compared in order. The preliminary scan reports matching keys, line breaks,
  runtime-marker identities/order, and values.
- The active Korean rows retain the reported objective, values, and markers.
- No translation CSV or immutable source file was edited.

## Checkpoint

Disposition is complete through ID 39050. Resume at ID 39051; 26,084
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-39051-39100-preliminary.md`. Decisions D-12519 through D-12523
are recorded in the register; the next unused decision ID is D-12524.
