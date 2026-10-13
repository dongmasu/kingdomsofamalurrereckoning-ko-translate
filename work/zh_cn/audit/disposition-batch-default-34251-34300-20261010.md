# Disposition Batch: `default` IDs 34251-34300

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling preliminary candidates and carried
  historical questions against active Korean, available source rows, prior
  decisions, terminology, values, markers, and structure.
- Evidence caution: `src/csv/zh_cn/` provides the Chinese source in this
  workspace; `work/ja_jp/` matches the active Korean in this range and is not
  independent Japanese corroboration. The English wording for ID 34275 could
  not be retrieved locally, so the conflicting Chinese reading is recorded
  without using it alone to authorize a correction.
- Decisions: one accepted, six `not an issue`, and thirteen uncertain
  findings, plus one `not an issue` disposition for remaining ordinary text.
- CSV change: ID 34259 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 34251 | Grave Thresh's weakened nest / Gorguath | Not an issue: Korean follows English's weakening sense rather than the stronger destruction wording noted in Chinese; the remaining creature/place spellings need glossary alignment, not a row-local semantic edit. |
| 34252 | `sign of fateful` / scar on each convert | Uncertain: Korean preserves a fate-related mark and the convert's scar, but the unusual English phrase and conversion context remain unresolved. |
| 34255 | Energy reaching back to Alabastra | Uncertain: the connection is retained; `reaches back` could indicate origin or extent, and Alabastra's canonical form needs alignment. |
| 34257 | `$TRSQ01.bribe_value$` / gold label | Not an issue: the variable is retained exactly once with the currency label; runtime expansion cannot be inferred from this CSV row. |
| 34259 | Red Legion / `레드 군단` | Accepted: change to `레드 리전의 악당들이야`, reusing the accepted faction form at IDs 9157 (D-2554), 32870 (D-10678), and 34250 (D-11065). |
| 34262 | `Hierophant Shrine` / `대사제의 성소` | Uncertain: prayer and blessed wisdom are retained, but the named title and shrine form are not standardized. |
| 34265 | `{1} / {2} XP` | Not an issue: both placeholders, order, separator, and `XP` payload are retained; no numeric or marker change is supported. |
| 34268 | Mortal-temper comparison | Not an issue: the speaker's warning and self-deprecating comparison are retained. |
| 34271 | Rescued man's strength as aid rather than hindrance | Not an issue: appearance, strength, and the speaker's hope for its usefulness are preserved. |
| 34272 | Unidentified thing driving miners near madness | Not an issue: Korean keeps the cause unspecified and retains the speaker's stated motive and desire to reclaim their life. |
| 34275 | “You as well” / actor-role exchange | Uncertain: the preliminary comparison lists an English meaning, but the local English source is unavailable; Chinese says `你也一样` while the Korean/JA-derived copy says `그렇게 될 거야`. Do not edit without confirming the English payload. |
| 34276 | `ran ‒ Down` fragment / wordplay | Uncertain: Korean preserves a jump/fall reading, but the source fragment could be a pun, direction, name, or split phrase. |
| 34279 | Ivan / Unbound / repeated plea | Uncertain: the three-part appeal is retained, but the faction term and the address `Fateless One` need terminology alignment. |
| 34281 | Shared fire, words, thoughts, and leadership | Uncertain: the transformation and rhetorical question remain, but the antecedent of `it` and relation between the speakers are contextual. |
| 34284 | `Tirin's flock` / refugees and Almain country folk | Uncertain: the contrast and group metaphor are retained; religious, communal, and political readings remain possible. |
| 34291 | Sorrows / Hollow of the Weeping King / Sinsear | Uncertain: key location and objective are present, but the row does not establish that `Sorrows` is the House of Sorrows; prior House-specific corrections do not authorize extending that form here. |
| 34295 | Gallows End / Alder's daughter | Uncertain: the contrast is preserved, but the recurring place-name rendering varies across the corpus. |
| 34296 | The Crossing | Uncertain: the threshold/place function is plausible, but the canonical lore term and whether it is a realm or passage are unresolved. |
| 34297 | Quicklings / Alyn Shir | Uncertain: dedication and contrast are retained; prior decisions leave Quickling as a people/species versus descriptive term unsettled. |
| 34299 | Scholia Arcana Initiate | Uncertain: institution spelling is consistent, but the formal rank's canonical Korean title is not established. |
| Remaining ordinary text in IDs 34251-34300 | Dialogue, labels, and values | Not an issue: no further supported row-local wording or structural defect was identified among the other IDs; values, placeholders, ordering, and paragraph structure align with the preliminary checks. |

## Historical Audit Reconciliation

- Accepted D-2554 and D-10678 establish `레드 리전` for Red Legion. That
  evidence supports the targeted correction at ID 34259; no other text in
  the row was changed.
- Prior House of Sorrows corrections apply only where English explicitly
  identifies the House. ID 34291 says `Sorrows`, so its `비탄의 가문`
  rendering remains uncertain rather than being changed to `비탄의 집`.
- Earlier records leave Quickling, Crossing, Hierophant, and the `ran ‒ Down`
  fragment unresolved. This batch preserves those questions.
- No historical question by itself was treated as authorization to edit.

## Verification

- All 50 ordered IDs were checked against the preliminary report and the
  available Korean/Chinese rows; the Korean/JA-derived identity was not
  counted as independent locale evidence.
- `$TRSQ01.bribe_value$` remains intact at ID 34257; `{1}` and `{2}` remain
  ordered at ID 34265.
- No embedded line breaks occur in this range, and numeric values remain
  unchanged.
- These are working dispositions, not independent final linguistic approval.
- Resume at ID 34301; 30,834 default IDs remain through ID 65134.
