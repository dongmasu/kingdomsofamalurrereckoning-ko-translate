# Disposition Batch: `default` IDs 38601-38650

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: one accepted, one `not an issue`, and four uncertain.
- CSV changes: ID 38621 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 38608 | Child of Dust / `먼지의 자손` | Uncertain: previous rows vary between `먼지의 아이` and `먼지의 자손`, and prior decisions leave the phrase's title/species/group status open. Preserve the current traceable epithet pending a corpus-wide choice. |
| 38619 | Wreath / `화환`, `의례용 복식` | Uncertain: English calls it a wreath and a vestment, Japanese a ritual ring/item, and Chinese a feathered crown. The Korean retains both the wreath image and ceremonial use, but the exact object and Korean item term remain unresolved. |
| 38621 | the Sorrows / `슬픔` | Accepted: change to `비탄의 힘(Sorrows)`. This reuses the accepted traceable rendering at ID 3831 (D-833) and preserves the threatening personification without deciding whether the Sorrows are beings, a force, or both. |
| 38642 | Bursar's / `회계관에게` | Uncertain: English's possessive appears to name an institution or office, Japanese explicitly says an accounting institute, and Chinese differs; Korean's personal-recipient reading may lose the destination distinction. The exact entity is not established. |
| 38643 | Rathir GoldBlades / `라시르 골드블레이드` | Uncertain: English and Japanese indicate Gorem Kane's organized group, while the precise group type and canonical Korean name remain unsettled; Korean retains a singular-looking name. |
| Other rows in IDs 38601-38650, excluding separately listed findings | Dialogue, names, values, objectives, items, and labels | Not an issue: no additional supported row-local correction was found. |

## Historical Audit Reconciliation

- The historical source-keyed open-question log has a documented coverage gap
  spanning IDs 37700-40349. Related notes on Child of Dust, Wreath, Sorrows,
  Bursars, and GoldBlades were considered; no unresolved question is treated
  as prior approval.
- The accepted Sorrows rendering is a local reuse of D-833 and does not
  resolve the entity's identity.
- These are working dispositions, not independent linguistic approval.

## Verification

- The preliminary structural comparison reports IDs 38601-38650 once and in
  identical order across all four locales, with matching line-break counts
  and runtime-marker identities/order.
- ID 38617 retains reagent quantities 2/2/2/1 and list structure; ID 38630
  retains its four-paragraph journal layout.
- The changed record at ID 38621 was verified directly. No immutable source
  file was edited, and no whole-file CSV parse or round-trip is claimed.

## Checkpoint

Disposition is complete through ID 38650. Resume at ID 38651; 26,484
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-38651-38700-preliminary.md`. The next unused decision ID is
D-12475.
