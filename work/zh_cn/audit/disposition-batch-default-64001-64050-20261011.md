# Disposition Batch: `default` IDs 64001-64050

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, values, and structure.
- No accepted corrections, 36 `not an issue` IDs, and 14 uncertain findings.
  No CSV text was changed. These are working dispositions, not independent
  linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18101 | 64001 | English's “Face my supposition!” is unusual; Korean naturally reads it as “hear my reasoning,” while Japanese/Chinese differ in wording. Retain pending speaker/context review. |
| D-18101 | 64003 | The one-person camp and conditional dismissal are preserved; it is unclear whether “room enough for one” means one occupant total or one remaining place. |
| D-18101 | 64004 | The armor attribution and commander succession are retained; canonical spellings for Shepard and Ballegar vary across locales. |
| D-18101 | 64009 | The warning and withdrawal advice are preserved; `Red Legion` has divergent localized faction names and needs glossary alignment. |
| D-18101 | 64013 | The camp-work/distraction sequence is preserved; verify Argine's canonical name spelling against other occurrences. |
| D-18101 | 64015 | The Korean preserves the English source's unfinished trailing dash and the two-year contradiction; Japanese completes the thought, so retain the fragment pending source/UI context. |
| D-18101 | 64017 | `Online Services Testers` may be an internal test label or a user-facing role; Korean retains the English text as Japanese does. |
| D-18101 | 64018 | English `sailor's yarn` can mean a colorful tale without requiring falsehood; Korean's `허풍 섞인` adds a tall-tale nuance not explicit in Japanese/Chinese. |
| D-18101 | 64021 | English/Chinese say the daughter is lost, Japanese suggests she is gone, and Korean says she disappeared; the underlying outcome remains unclear. |
| D-18101 | 64023 | The source key `FourthRoomEntrance` looks like an internal identifier, while all target locales render a user-facing entrance label. Verify runtime intent. |
| D-18101 | 64029 | English `right with you` may mean Jokull supported the addressee or judged them correctly; Korean follows Japanese's supportive reading. |
| D-18101 | 64033 | `Hunting Herald` may be a formal title or descriptive epithet, and locales vary in its order relative to Aergase's name. |
| D-18101 | 64046 | `Forge Ysa Honor Brands` could name an item, crafting station, or action; Korean provisionally reads it as crafting Ysa's honor mark. |
| D-18101 | 64047 | The five-line poem preserves the wish/condition, raising the Hyperian, and Ethene's demand, but the “befouled” and final-agency imagery remain obscure. |

## Not an Issue

Decision D-18102 records these 36 IDs: 64002, 64005-64008, 64010-64012,
64014, 64016, 64019-64020, 64022, 64024-64028, 64030-64032, 64034-64045,
and 64048-64050. They preserve available meaning, voice, labels, values,
and structure. ID 64012 correctly reads `small game` as a diminutive address;
64032 follows the apparent intended “supposed to be in a cell” question
despite the English typo; and 64038 retains `{1}` and `{*1sprint}` in order.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 64001-64050 once,
  in identical ascending order.
- Embedded newline counts match for every row. The unfinished fragment at
  64015 and the five-line poem at 64047 retain their layouts.
- Runtime markers at 64020 and 64038 retain their identities and order;
  the `{1}` die-roll variable, Chaos-effect values, and named references
  are preserved. The Korean sprint marker remains after `{1}`.
- Rechecked historical questions for the Beckoned, Shepard/Ballegar,
  Red Legion, Argine, Online Services Testers, sailor's yarn, missing
  daughter, FourthRoomEntrance, Jokull, Aergase, Ysa Honor Brands, and the
  Hyperian/Ethene poem.
- No translation CSV cells were changed. Active CSV SHA-256 remains
  `6e9a73072bf8fe9f5a85855c71450dcea4397c4ef6fe7df44a67873509c7ff4f`,
  byte-identical to the batch-start backup:
  `/private/tmp/ko-translate-backups/20261011/before-64001/locatexts_zh_cn.koalocatext_default.csv`.
  UTF-8 BOM, 65,135 records, key order, embedded lineation, markers, and
  outer CRLF record separators remain unchanged.
- D-18101 records 14 uncertain findings and D-18102 records 36
  `not an issue` IDs. Totals at D-18102: 1,824 accepted, 16,439
  `not an issue`, and 12,592 uncertain (30,855 dispositions); next D-18103.

Resume at `default` ID 64051; 1,084 IDs remain through ID 65134. These are
working dispositions, not independent linguistic approval.
