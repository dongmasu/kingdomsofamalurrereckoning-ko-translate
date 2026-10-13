# Disposition Batch: `default` IDs 36401-36450

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  prior decisions, and established terminology.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: two accepted, six `not an issue`, and seven uncertain.
- CSV changes: IDs 36435 and 36442 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 36405 | Fahrlangi / Mad Harst / Heart of Sibun / Lord Besin | Not an issue: the theft, Harst's employment under Besin, Gwyn's separate task in Rathir, and the plan to compare findings are retained. Faction identity and spelling remain corpus-level questions. |
| 36407 | Faer Gorta / `put them out of their misery` | Not an issue: the transformed companions and request to free them from suffering are retained as a euphemism; Korean does not invent an explicit killing action. Creature naming remains a separate glossary question. |
| 36414 | St. Odwig's Bunks / `성 오드윅의 숙소` | Uncertain: English specifies bunks, Chinese suggests barracks/simple quarters, and Japanese says lodging. The exact function of this location label is not recoverable from the row alone. |
| 36415 | `send them on down` / `아래로 보내라` | Uncertain: the order preserves the source's veiled threat, but the destination and whether it means killing or dispatching are unclear. |
| 36417 | `discipline` / `규율` | Not an issue: Korean follows English and Chinese's discipline choice; Japanese's self-reflection reading is a source-locale divergence. |
| 36419 | Crudok Bloodbane / Dunehead Mine | Uncertain: the creature's appetite for Gnomish miners and the resulting obstruction are retained; whether Bloodbane is a name or epithet and the canonical name forms remain open. |
| 36423 | Rathir / stone-tree branches and ships | Uncertain: Korean plausibly repairs English `bows` to tree branches, as Japanese does, but the compressed source and Chinese's ship-prow reading differ; Rathir's Korean spelling also varies. |
| 36432 | `GOR` / destroyed-object art production note | Uncertain: Korean translates the production instruction and retains `GOR`, but it is unknown whether this internal-looking note is intended for players. |
| 36435 | `mastersmith` / `다른 대장장이` | Accepted: English, Japanese, and Chinese specify a master smith. Replace `운명 없는 자여, 다른 대장장이는 없어. 나뿐이야.` with `운명 없는 자여, 나 말고는 명장 대장장이가 없어.` to retain the speaker's claimed expertise. |
| 36436 | `Pleasant findings` / `좋은 물건이군` | Uncertain: Japanese reads a good selection and Chinese a pleasant discovery/find; the English fragment and missing context do not settle whether this is merchandise or a discovery. |
| 36438 | Tutorial/options wrappers | Not an issue: both localized `{*1...}` labels, wrapper identities, and order are preserved. |
| 36442 | Dispelling / `해제술` | Accepted: D-341 established `마법 해제` for the named skill, with later accepted usage at D-1526. Replace `해제술` with `마법 해제`; retain the polite dialogue. |
| 36447 | Scout / ship spotter | Not an issue: Korean preserves both the scout role and the ability to spot ships; the paraphrase is accurate without requiring a literal job title. |
| 36448 | Missives of Sable / Livrarium / Hierophant | Uncertain: the theft and revenge relation are retained, but the book title, institution, and rank have unresolved canonical forms across project terminology. |
| Remaining ordinary text in IDs 36401-36450 | Dialogue, names, values, objectives, and labels | Not an issue: all other rows were compared across the four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- Source-keyed historical notes for IDs 36400-36599 were checked, including
  the chain of responsibility at 36405, the euphemism at 36407, the
  branches/ships image at 36423, the production note at 36432, and names at
  36447-36448.
- Prior decision D-341 and follow-up D-1526 establish `마법 해제` for
  Dispelling and support the accepted correction at ID 36442.
- These are working dispositions, not independent final linguistic
  approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs 36401-36450
  once in matching order.
- Embedded line breaks match across locales. Both `{*1...}` wrappers at ID
  36438 retain their identities and order.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39
  pre-existing bare-LF endings.
- Active default CSV SHA-256:
  `78e34bd4c65c7f82436518e3739b9f562f2841f4de9a3ebcc44be9fd33672674`.
- Accepted changes are recorded in `edit-batch-20261010-addendum.md`.

## Checkpoint

Disposition is complete through ID 36450. Resume at ID 36451; 28,684
`default` IDs remain through ID 65134. The next unused decision ID is
D-11737. The next preliminary scan is
`default-ids-36451-36500-preliminary.md`.
