# Disposition Batch: `default` IDs 38051-38100

- Decision date: 2026-10-10.
- Scope: all IDs 38051-38100; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions. The preliminary scan also listed eight
  candidate groups beyond its stated endpoint; those were dispositioned here
  as carry-forward items and remain assigned to their actual ID range.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions, including the carry-forward items: three accepted, seven
  `not an issue`, and seven uncertain.
- CSV changes: ID 38081 in scope; IDs 38121 and 38133 were out-of-range
  carry-forward corrections.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 38052 | Aewin Rathgar / `에윈 래스가(Aewin Rathgar)` | Uncertain: identity and source spelling are present, but locale phonetics differ and no authoritative Korean form is established. |
| 38066 | farmers entering spider webs | Not an issue: Korean follows English and Chinese's farmer/web image; Japanese instead describes gathering spider silk, a source/context divergence not resolved by changing the English-led Korean. |
| 38073 | Domus Politica / `정치회관(Domus Politica)` | Uncertain: the document's recipient and Adessa institution are retained, but the institution's canonical Korean name remains unresolved. |
| 38077, 38087 | Theater of Fate / `운명의 극장` | Not an issue: English, Chinese, and Korean agree on a theater; the altar reading is Japanese-only and does not override the English source. The two Korean rows remain consistent. |
| 38081 | Testament's influence / `유언장(The Testament)` | Accepted: change to `테스타먼트(The Testament)`, using the established proper-name form at IDs 12102 and 29405 (D-9241) without resolving the separate Testament/Belen identity conflict. |
| 38082 | Fae Cairn / Lorestone / `페이의 무덤돌` | Uncertain: the Lorestone/Echo Stone relation is retained, but existing audits leave the Cairn's function and canonical Korean term unresolved. |
| 38093 | `SpellAmmoInstant` | Uncertain: the implementation-style label is translated, but the row does not establish whether it is player-facing or internal/debug text. |
| 38098 | Warden / `감시관` | Not an issue: Korean identifies the Warden and preserves the instruction to report trouble to Herc Adwold; `감시관` matches the accepted office term in prior decisions. |
| 38107 | “We did nothing to deserve this fate” | Not an issue: Korean follows English and Japanese. Chinese reverses the meaning, but that source-locale divergence is not grounds to change Korean. |
| 38108 | `{3}`, `{1}`, `{2}` | Not an issue: all markers and English order are preserved; Japanese reorders `{1}` and `{2}` for syntax. |
| 38121 | House of Ballads / `발라드 가문` | Accepted: change to `발라드의 집`, reusing the accepted named-faction rendering at IDs 31544, 32245, 32252, 32418, 32436, 32578, and 32856. |
| 38128 | Gallows End / `갤로우스 엔드` | Uncertain: survival meaning is retained, but accepted corpus spellings conflict (`갤로우스 엔드`/`갤로스 엔드`); do not normalize one occurrence without reconciling the term. |
| 38132 | Silken Seat / `실크 좌석` | Uncertain: English capitalizes a likely place name and Japanese suggests an inn, but Chinese and prior audits do not settle the referent or canonical Korean form. |
| 38133 | `TestTest` / `테스트` | Accepted: change to `테스트테스트`; English, Japanese, and Chinese all preserve the repeated test label, while Korean had dropped one occurrence. |
| 38139 | Pyrderi / Pryderi | Uncertain: the English spelling differs from the recurring Pryderi spelling, and locale renderings conflict; retain the row's source rather than silently normalizing it. |
| 38150 | Aron Excavations / Motus competition | Not an issue: the other mining operation, Motus's only competitor, and the dismissive assessment of its strength remain. |
| Other rows in IDs 38051-38100 | Dialogue, names, values, objectives, items, and labels | Not an issue: remaining rows preserve English meaning and structure; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The historical source-keyed open-question log has a documented coverage gap
  spanning IDs 37700-40349, so no missing historical disposition was inferred.
- The preliminary report's declared range ended at 38100 but listed candidates
  for IDs 38107, 38108, 38121, 38128, 38132, 38133, 38139, and 38150. These
  were explicitly adjudicated here to avoid losing them; do not count or
  disposition them again in the corresponding later-range batch.
- Prior decisions were applied for Warden (`감시관`), House of Ballads
  (`발라드의 집`), Testament (`테스타먼트`), and the unresolved Cairn,
  Gallows End, Silken Seat, and Pryderi questions.
- At ID 38108, the Japanese-only placeholder-order variation does not justify
  reordering Korean markers.
- These are working dispositions, not independent linguistic approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs
  38051-38100 once and in identical order, as recorded in the preliminary
  structural comparison.
- Only active Korean `Texto` cells at ID 38081 in this range and the
  carry-forward IDs 38121 and 38133 changed.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39 bare-LF
  endings. Active default CSV SHA-256:
  `2786ab27ab43789f04188423e5bdaff8a9dd65e26f1c64573e719967136f436d`.

## Checkpoint

Disposition is complete through ID 38100, with the listed later-ID findings
already decided. Resume at ID 38101; 27,034 `default` IDs remain through ID
65134. The next preliminary scan is
`default-ids-38101-38150-preliminary.md`; skip the already-registered IDs
listed above. The next unused decision ID is D-12388.
