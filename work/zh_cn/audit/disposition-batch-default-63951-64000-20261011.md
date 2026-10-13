# Disposition Batch: `default` IDs 63951-64000

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, values, and structure.
- One accepted targeted correction, 35 `not an issue` IDs, and 14 uncertain
  findings. These are working dispositions, not independent linguistic
  approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18098 | 63990 | `내가 혼돈 마법을 통달했다는 걸 보여 봐.` | `자네가 혼돈 마법을 어떻게 통달했는지 보여 봐.` | English asks the addressee to show how they mastered Chaos Magic; Japanese and Chinese agree. The previous Korean incorrectly made the speaker the one who mastered it. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18099 | 63954 | `Ragnarr's Chosen` and Ragnarr are retained, but the faction/entity relation and canonical lore terms are not explained by this objective. |
| D-18099 | 63958 | The hidden-gear objective is preserved; `Madding Wind` spellings and the warden/place relation vary by locale. |
| D-18099 | 63960 | Korean preserves the dangerous Teeth of Naros versus safe Idylla contrast; canonical place-name spellings still need glossary alignment. |
| D-18099 | 63963 | `Scavs` may be a named creature class or generic scavengers. Korean retains the source term and the task to clear the courtyard. |
| D-18099 | 63965 | `Crying Eyes` is a capitalized destination/obstacle; the route and exact sense of passing it are context-dependent. |
| D-18099 | 63966 | Irion's leadership, thievery, and devotion are retained; proper-name, Traveler, and Hierophant forms need corpus consistency review. |
| D-18099 | 63969 | English/Chinese leave “they” unresolved while Japanese identifies the Tuatha. Korean preserves the generic plural rather than supplying an antecedent. |
| D-18099 | 63972 | The death and lost opportunity are clear; Steg Darkvari/Apotyre spellings and the exact quest-state implication remain provisional. |
| D-18099 | 63974 | `Carver's Labor` could be a formal title/task or a generic phrase; Korean follows the literal English reading while Japanese personifies the creator. |
| D-18099 | 63975 | The investigation sequence is retained, but Fahrlangi and the Besin/Eamonn name forms differ across locales and need lore review. |
| D-18099 | 63982 | The required offering, blessing, and praise sequence is preserved; capitalized `The Offering` may be a formal ritual name. |
| D-18099 | 63986 | The hollow, resonant stone object is preserved; whether `pipe` is a tube/instrument or a smoking-pipe-like item depends on setting context. |
| D-18099 | 63991 | The resistance-to-control metaphor is retained; `Phasmer` spelling and whether `Traveler` is a formal faction title need alignment. |
| D-18099 | 63993 | The defeat, flight, report, and concert plan are preserved; Telogrus/Crownhold/Colet spellings remain glossary candidates. |

## Not an Issue

Decision D-18100 records these 35 IDs: 63951-63953, 63955-63957, 63959,
63961-63962, 63964, 63967-63968, 63970-63971, 63973, 63976-63981,
63983-63985, 63987-63989, 63992, and 63994-64000. They preserve available
meaning, voice, labels, values, and structure. ID 63977's explicit death
reading is supported by Japanese/Chinese; 63979 retains the intentionally
omitted body part; 63998 keeps all five localized UI markers in the
Japanese-template semantic order.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 63951-64000 once,
  in identical ascending order.
- Embedded newline counts match for every row. Runtime markers at 63998
  preserve five `{*1...}` spans and the order gem, gems, workbench, weapons,
  armor; this matches the Japanese-derived template.
- The three Jottun chieftains at 63954 and ritual/object relations are
  retained; no numeric-value differences were detected.
- Rechecked historical questions for Ragnarr's Chosen, Madding Wind, Teeth
  of Naros, scavs, Crying Eyes, the unresolved corpse pronoun, Steg
  Darkvari, Carver's Labor, Fahrlangi, the Offering, the stone pipe,
  Phasmer, Telogrus, and the gem tutorial.
- Pre-edit CSV SHA-256:
  `fe9c6eb731f331c3f1b12fb4fac7f1054a5cfc48426f327242832c183f892595`.
  Post-edit CSV SHA-256:
  `6e9a73072bf8fe9f5a85855c71450dcea4397c4ef6fe7df44a67873509c7ff4f`.
  Byte-level comparison against the batch-start backup confirmed that only
  the `Texto` field at ID 63990 changed. The UTF-8 BOM, 65,135 records, key
  order, embedded lineation, and outer CRLF record separators are preserved.
  Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-63951/locatexts_zh_cn.koalocatext_default.csv`.
- D-18098 records one accepted correction, D-18099 records 14 uncertain
  findings, and D-18100 records 35 `not an issue` IDs. Totals at D-18100:
  1,824 accepted, 16,403 `not an issue`, and 12,578 uncertain (30,805
  dispositions); next D-18101.

Resume at `default` ID 64001; 1,134 IDs remain through ID 65134. These are
working dispositions, not independent linguistic approval.
