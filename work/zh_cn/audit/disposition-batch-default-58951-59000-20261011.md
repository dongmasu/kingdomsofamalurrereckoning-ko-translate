# Disposition Batch: `default` IDs 58951-59000

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- No accepted corrections, 36 `not an issue` IDs, and 14 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- No CSV cell changed in this batch. The active file and byte-identical
  pre-batch backup both match the prior checkpoint.

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17813 | 58955 | The empty-handed dignity comparison and offer of the trinkets are retained; the English is nonstandard/idiomatic and differs in singular/plural framing across clauses and references. |
| D-17813 | 58956 | `reverie` plausibly means a daydream, as Korean and Chinese read it, but Japanese is malformed/unclear; preserve the broken reverie and dry final emphasis pending context. |
| D-17813 | 58957 | English frames trading in Mel Aglir as a necessity; Japanese calls it a reason for living, Chinese says indispensable, and Korean narrows this to livelihood. The precise attitude remains uncertain. |
| D-17813 | 58959 | The scholar's formal distance and limited interaction are retained; the intended in-world group and register of `those of your race` need context. |
| D-17813 | 58968 | `Hallidite` is traceable as `할리다이트(Hallidite)`, but canonical spelling and inconsistent bilingual proper-name annotation remain open. |
| D-17813 | 58971 | The inn, Bera's ownership/innkeeping, and namesake wordplay are preserved; the Korean display name and exact namesake phrasing need a project-wide naming convention. |
| D-17813 | 58975 | English describes dangerous, demented trees with razor-sharp branches; Korean calls them dangerous magical creatures, while Chinese supplies a species label. Exact referent and whether `magical` is warranted remain unresolved. |
| D-17813 | 58980 | Two Fae, the Eldest, their departure from the House, and move to Damalroc are retained; whether `the Eldest` is a formal title and which House is meant need context. |
| D-17813 | 58982 | General Tilera's Korean-plus-English parenthetical form is traceable, but bilingual name annotation is inconsistent across the corpus. No normalization is authorized. |
| D-17813 | 58986 | Ollie Madsen's bilingual parenthetical form is traceable, but bilingual name annotation is inconsistent across the corpus. No normalization is authorized. |
| D-17813 | 58989 | The three paths and shared ending are preserved; canonical Korean terms for Fatelessness and the Weave, and the metaphysical force of rewriting it, remain open. |
| D-17813 | 58992 | The literal shield-brother/sister wording is preserved in Korean and Chinese, while Japanese uses a generic comrades term; confirm whether these are formal kinship/faction titles. |
| D-17813 | 58994 | The theft, desire to recover the object intact, and need for help are preserved; identify the Testament/Belen faction and canonical Korean name. |
| D-17813 | 59000 | The erratic behavior and apparent desire for another story outcome are retained; `dustling` and `Bloody Bones` spellings and the metafictional force remain terminology/context questions. |

## Not an Issue

Decision D-17814 records these 36 IDs: 58951-58954, 58958, 58960-58967,
58969-58970, 58972-58974, 58976-58979, 58981, 58983-58985, 58987-58988,
58990-58991, 58993, and 58995-58999. These rows preserve evident meaning,
voice/register, and applicable structure.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each have 50 ID-start rows for
  58951-59000 in ascending order. English, Japanese, and Chinese CSV parsing
  and Korean ID-start scans confirm the batch coverage.
- Reconciled the source-keyed historical prompts for IDs 58950-59049,
  including empty-handed dignity, reverie, Mel Aglir, Sandstone Villa,
  Hallidite, Thirsty Wench, enchanted beasts, the Eldest, the Weave,
  Shieldbrother/Sister, the Testament, and Bloody Bones. Open questions
  remain explicitly uncertain; no name or terminology sweep was made.
- The existing preliminary comparison found matching embedded newlines,
  no runtime-marker discrepancies, and no numeric-value changes in this
  range. No structure, marker, or value change was needed.
- The system Ruby CSV parser stops at an existing unquoted multiline cell
  near physical line 11029. No parser workaround or newline normalization
  was applied; the batch was checked by ID-start rows and the translation
  map.
- Pre-edit and post-edit active CSV SHA-256:
  `f55e5d6ffbff7616d5879fc6b79513006e57b3a097201f46f691c757e4ee7b18`.
  No translation cell changed. The UTF-8 BOM, key/order baseline, record
  count, and established line-ending distribution remain unchanged.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-58951/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `f55e5d6ffbff7616d5879fc6b79513006e57b3a097201f46f691c757e4ee7b18`).

D-17813 records 14 uncertain IDs; D-17814 records the remaining 36
`not an issue` IDs. Direct register totals: 1,719 accepted, 12,827
`not an issue`, and 11,230 uncertain (25,776 total); next D-17815.

Resume at `default` ID 59001; 6,134 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
