# Disposition Batch: `default` IDs 37751-37800

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: zero accepted, six `not an issue`, and fifteen uncertain.
- CSV changes: none.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 37751 | moderate health increase | Not an issue: temporary duration, total-health scope, and moderate increase are retained. |
| 37753 | alcoholic / fiend / fighter | Uncertain: alcohol problem and combat ability remain, but `fiend` intensity and character voice need broader context. |
| 37756 | Archsage / pawn of Fate | Uncertain: surrender and pawn metaphor remain; canonical title and formal Fate status are open. |
| 37757 | Verdant Blades / Seal of Ansilla | Uncertain: objective and destination are retained, but the named artifact and Korean form are already unresolved in D-10105 and D-10455. |
| 37761 | fiends / daughter taken | Uncertain: kidnapping, willingness to pay, and request are preserved; the setting-specific scope of `fiends` versus `악마` remains unsettled. |
| 37762 | Bisarane's Voice | Uncertain: the standalone label is translated, but Bisarane's canonical spelling and whether Voice is a formal title remain open. |
| 37765 | the Well / `영혼의 샘` | Uncertain: singularity and destruction by the Tuatha are retained; English's capitalized Well does not establish whether the full Well of Souls title is intended. |
| 37766 | Crudok / Rundamir brownies | Uncertain: corpse-collection and ambush causality are retained; creature and group spellings remain provisional. |
| 37767 | Foes' Hearth | Uncertain: literal meaning is preserved, but named-place versus descriptive-phrase status remains open, as in D-6990 and D-7415. |
| 37769 | affectionate `dove` | Uncertain: Korean preserves a close direct address with `그대`, but whether a distinct endearment is required remains open in the historical audit. |
| 37772 | Gask / Ashmoor / Eventide | Uncertain: occupation, severed connection, and communication loss remain; canonical faction/place spellings are unresolved. |
| 37774 | Tirnoch | Uncertain: shared source, intelligence, and malice are preserved; canonical proper-name spelling remains open. |
| 37776 | Rhose / favored one | Not an issue: favored status and taking what is owed are retained; Japanese and Chinese also support the luck/winner interpretation. |
| 37778 | malformed English “my the staff” | Not an issue: entry surprise and the staff/talisman question are preserved without reproducing the source typo, consistent with Japanese and Chinese. |
| 37779 | Eathe / Black Eathe | Uncertain: identity, epithet, skill condition, and offer are retained; canonical name and epithet forms remain open. |
| 37781 | Galette / non-believer | Not an issue: speaker's distress, deity's acceptance of Galette's souls, and the parallel acceptance of the addressee are retained. |
| 37786 | Ambyth / fellow Fateweaver | Uncertain: citizenship, affiliation, and debt are retained; locale spellings conflict and the canonical Korean form is unknown. |
| 37791 | boulder-like fists / sobering up | Not an issue: hard-punch image and immediate sobering effect are preserved; Korean need not encode English `girl` explicitly. |
| 37797 | Revival / Preordained / journal structure | Uncertain: bleak forecast, contrast with the name Revival, activity increase, and all ten English line breaks are preserved; faction/place conventions remain open. Japanese alone has two extra breaks. |
| 37799 | root golem / Scuttle Beach | Uncertain: reported sighting and passage location are retained; creature and place-name forms remain provisional. |
| Other rows in IDs 37751-37800 | Dialogue, names, values, objectives, items, and labels | Not an issue: remaining rows preserve English meaning and structure; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 37700-37799 was checked against
  these candidates, including Verdant Blades/Seal, Bisarane, the Well, Foes'
  Hearth, `dove`, Tirnoch, Rhose, Eathe, Ambyth, Revival, and Scuttle Beach.
- Existing unresolved decisions about Verdant Blades and Foes' Hearth remain
  open; this batch does not approve global terminology changes.
- The malformed English at 37778 is not reproduced in Korean; Japanese and
  Chinese also render its intended meaning.
- ID 37797 retains the English/Korean/Chinese layout with ten embedded
  breaks; Japanese has twelve. No structural change is warranted.
- These are working dispositions, not independent linguistic approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs
  37751-37800 once and in identical order, as checked in the preliminary
  structural comparison.
- No CSV text changed. Runtime markers, numeric values, and line breaks
  remain untouched.
- The active default CSV remains UTF-8 with BOM, 72,046 CRLF endings, and 39
  pre-existing bare-LF endings. SHA-256:
  `383a220362885395984c1aa84b76b4965774637c5690fefba71082cd651be062`.

## Checkpoint

Disposition is complete through ID 37800. Resume at ID 37801; 27,334
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-37801-37850-preliminary.md`. The next unused decision ID is
D-12264.
