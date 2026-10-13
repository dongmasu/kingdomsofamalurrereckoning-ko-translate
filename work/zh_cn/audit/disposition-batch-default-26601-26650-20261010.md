# Disposition and Edit Batch: `default` IDs 26601-26650

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 26601-26650, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: one accepted, two `not an issue`, and two uncertain.
- Accepted correction at ID 26635 is applied to the active Korean CSV.
  Named-object and lore questions remain open.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 26635 | “upon this rock” | Accepted: change `바위섬` to the nonspecific `이곳`; no locale reference establishes that the place is an island. |
| 26603-26613, 26617-26619, 26621-26630, 26632-26634, 26636-26638, 26640-26642, 26644-26646, 26648-26650 | Dialogue / short UI / quest wording | Not an issue: reviewed dialogue, labels, and punctuation preserve source intent and concise UI meaning. |
| 26620, 26633, 26645, 26649 | Connection error / Resist Arrest / country / punctuation | Not an issue: technical wording, objective label, country name, and standalone period are preserved. |
| 26601-26602, 26606-26609, 26612, 26615-26616, 26622, 26625, 26632, 26642-26647, 26650 | Hyperian / shrines / names / Requiem / Kandrian / Watcher / Captain Canwen | Uncertain: canonical spellings, realm/item classifications, and role terms need cross-corpus alignment. |
| 26614, 26616, 26635-26639, 26643, 26647 | Tender's will / Requiem / rock / witch's curse / Guelmuin / worship circle / Family arms / Watcher Corpse | Uncertain: several terms admit materially different readings; preserve the draft pending surrounding game context. |

## Verification

- English, Japanese, Chinese, and Korean each contain IDs 26601-26650 once in
  identical order.
- The error message, `Resist Arrest` objective, country name, and standalone
  period are retained as in the source structure.
- The only Korean CSV edit in this batch is ID 26635. UTF-8 BOM, 72,046 CRLF
  endings, and 39 pre-existing bare-LF endings are preserved.
- Active default CSV SHA-256:
  `f9a6d4dfceea48c8c5757c26221b91783c0993e25095be1bc8724709ebbc4b1d`.
- Register totals after this batch: 841 accepted, 2,916 `not an issue`, and
  4,847 uncertain (8,604 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 26651; 38,484 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.

## Contextual Re-review (2026-10-11)

D-19315-D-19317 supersede the open uncertainty assignments above for the
contextually reviewed keys. Of 24 unique prior uncertainties, two were
accepted (26616 and 26637), twenty-one were cleared as `not an issue`, and
the `will` reading at 26614 remains uncertain. ID 26635 was already accepted
at D-8605 and was linked without recounting. The two accepted `Texto` edits
and byte-level verification are recorded in
[`consolidated-context-review-default-26601-26650-20261011.md`](consolidated-context-review-default-26601-26650-20261011.md).
