# Disposition Batch: `default` IDs 35751-35800

- Decision date: 2026-10-10.
- Scope: all 50 IDs; checked active Korean against immutable English,
  Japanese, and Chinese rows, the preliminary scan, and the source-keyed
  historical audit.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- Decisions: one accepted, one `not an issue`, and seven uncertain.
- CSV change: the accepted correction at ID 35753 was already present in
  the active CSV when this disposition pass began; it was verified, not
  rewritten.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35752 | `Eventide` / `해질녘` | Uncertain: English's capitalization and the Japanese phonetic rendering suggest a proper name, while Chinese supports a time-of-day reading. The isolated label does not establish the entity or canonical Korean form. |
| 35753 | Blade used to kill the Alfar / House of Sorrows | Accepted: the Korean phrase `나보다 더 적합한 이` makes the speaker themself the comparison candidate, unlike English `the blade that I use` and the instrumental readings in Japanese and Chinese. The current Korean correctly makes the blade the thing the speaker uses; this exact correction was already present in the CSV and was left untouched. |
| 35760-35761 | Gallows End / Orison / `Service` | Uncertain: the voyage destination and task to stop Nuer are retained, but the proper-name form and whether `Service` is a named rite or generic service cannot be decided from these rows. |
| 35764 | `ageless one` / `불멸자` | Uncertain: English and Japanese support being without age, while Chinese says without years. Korean's `불멸자` may assert immortality, a stronger claim; no safe replacement is established by the row alone. |
| 35768-35771 | Corruption, Fatesworn, Mystic Grip | Uncertain: the arrival, changed condition of the site, and speaker's shock are retained. Formal faction and item terminology remains a corpus/glossary question. |
| 35774, 35777 | Njordir's Font / Hyperian Temple | Uncertain: the named sites and their roles are preserved, but `Font` as a proper water source versus a generic spring and canonical site-name forms need broader context. |
| 35784, 35789 | Hierophant / Font flow / Lyceum Grove | Uncertain: the threat, livelihood relation, controlled water flow, and root-system mechanism are present. `Hierophant`, `Font`, and place-name forms remain terminology questions. |
| 35796-35799 | Second Burning / Of Two Seasons / Honor Brands | Uncertain: the historical event, southern quays, eyewitness position, title, and counterfeit Faeblades transaction are retained; formal names and item terminology remain open. |
| Remaining ordinary text in IDs 35751-35800 | Dialogue, names, objectives, labels, and values | Not an issue: the other 33 IDs were checked in all four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 35600-35799 flags Eventide,
  House of Sorrows, Orison/Service, ageless Arvia, Fatesworn, Mitharan Grip,
  Njordir's Font, Hyperian Temple, Hierophant livelihood, Lyceum Grove, and
  Second Burning/Of Two Seasons/Honor Brands. These questions were compared
  with all four locale rows; none alone authorizes a global terminology edit.
- The agent change at ID 35753 is supported directly by the English source
  and the Japanese/Chinese row meanings, independently of the previous
  preliminary note.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs 35751-35800
  once in identical order.
- The rows have no embedded line breaks or runtime markers; no numeric values
  are present in the range.
- The active CSV has a UTF-8 BOM, 72,046 CRLF endings, and 39 bare-LF endings.
- The active CSV SHA-256 at disposition is
  `dca76b6a73b6343d17d9e3d5d59e88b25c024cce250056628b0b74bf32100c9f`.
  This differs from the prior recorded checkpoint hash
  `5a6cdcc96556fe2cef548427eb5c31bea0ee62aefd278691a4d5327c9ad3158c`.
  Reversing only the already-present ID 35753 correction in memory does not
  reproduce that prior hash (`69e8abfe22032def80b0559b47ff95919392f2b2f314018fddde0db81cfe9561`);
  the broader discrepancy remains unresolved. No unrelated CSV content was
  altered to force a hash match.
- These are working dispositions, not independent final linguistic
  approval.

## Checkpoint

Disposition is complete through ID 35800. Resume at ID 35801; 29,334
`default` IDs remain through ID 65134. The next unused decision ID is
D-11575. Preliminary scan:
`default-ids-35801-35850-preliminary.md`.
