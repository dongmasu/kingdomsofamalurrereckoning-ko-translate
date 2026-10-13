# Disposition Batch: `default` IDs 36301-36350

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: two accepted, five `not an issue`, and five uncertain.
- CSV changes: IDs 36309 and 36310 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 36307 | Unnamed Alfar city / `forces of right` | Not an issue: Korean retains an unnamed eastern Alfar city and renders the forces gathering against the Tuatha without identifying the city as Ysa. The broad “forces of right” sense is present. |
| 36309 | Whether he had a scroll | Accepted: English asks whether he had a scroll, perhaps in his pack; Chinese supports possession and Japanese asks whether it was in the luggage. Change `그의 두루마리를 찾았어? 혹시 짐 속에 있었나?` to `그에게 두루마리가 있었어? 어쩌면 짐 속에 있었을지도 몰라.` to restore the question's subject and possession meaning. |
| 36310 | `Beckoned` / `선택받은 자` | Accepted: D-692 established `부름받은 자` as the approved player-title rendering and repeated decisions apply it. Change only the title; keep `히페리온` because this batch does not establish a better Korean form for `Hyperian`. |
| 36317 | `Blood Rite` / `혈맹 의식` | Uncertain: English names the Blood Rite, and Japanese/Chinese support a blood ritual. However, prior D-2249 and D-10474 explicitly leave formal ritual terminology unresolved and note active Korean variants. Do not make a local terminology substitution before glossary alignment. |
| 36322 | United Merchants Delegation | Not an issue: despite malformed English grammar, Korean preserves the apparent coalition of traders, authorization to sell wares in Ysa, and the delegation reference; Japanese and Chinese support the repaired reading. |
| 36325 | Ethene's name and removal of mourning robes | Not an issue: `이름을 기리다` is a plausible Korean rendering of celebrating Ethene's name in this ceremonial context; no specific festival or proclamation is asserted. |
| 36333 | `Court of Summer` / `여름 궁정` | Not an issue: this follows the English named-court sense and matches prior D-10858. Broader canonical institution terminology remains a corpus-level question, not a demonstrated row-local defect. |
| 36340 | `Hall of Appointments` | Uncertain: the label alone does not distinguish an appointment/meeting hall from an official chamber, and the Japanese and Chinese readings diverge. |
| 36343 | `herad` / `Bracer falls silent` | Uncertain: the source typo is evidently intended as “heard,” matching the other locales and Korean. The identity of the capitalized `Bracer` remains unclear, so do not reinterpret its silence. |
| 36347 | Secandra / Kollossae guard | Uncertain: the follower and guard roles and qualified boast are retained, but proper-name transliterations vary across the project and no global normalization is approved. |
| 36350 | Elayen Dark / historical `patrons` note | Uncertain: the active row concerns answers, rumors, whispers, and secrets; it contains no `patrons` term, so the archived note is a key/source-snapshot mismatch. Keep the current row text; the proper-name form remains a corpus consistency question. |
| Remaining ordinary text in IDs 36301-36350 | Dialogue, names, values, objectives, and labels | Not an issue: the remaining rows were compared across the four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The source-keyed historical notes for IDs 36200-36399 were checked against
  the active row at each cited ID. Questions at 36307, 36317, 36322, 36340,
  and 36343 were reconciled; the `patrons` note at 36350 does not match the
  active source text.
- Prior decisions D-692, D-2249, D-10858, and D-10474 were checked. D-692
  supports the title correction at 36310; the Blood Rite terminology
  decisions support deferral rather than a local rewrite.
- Unresolved spelling, institutional, and lore questions remain
  provisional; this working disposition is not independent final linguistic
  approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs 36301-36350
  once in matching order.
- Embedded line breaks, runtime markers, and the quantity at ID 36341 remain
  unchanged.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39
  pre-existing bare-LF endings.
- Active default CSV SHA-256:
  `f70f3b90f9725418ee703027724a45dd79c6e89b1359325e9d42e3b18f155c15`.
- The two accepted cell edits are recorded in
  `edit-batch-20261010-addendum.md`.

## Checkpoint

Disposition is complete through ID 36350. Resume at ID 36351; 28,784
`default` IDs remain through ID 65134. The next unused decision ID is
D-11701. The next preliminary scan is
`default-ids-36351-36400-preliminary.md`.
