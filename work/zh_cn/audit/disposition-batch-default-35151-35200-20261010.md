# Disposition Batch: `default` IDs 35151-35200

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling the preliminary scan with active Korean,
  immutable English/Japanese/Chinese rows, historical decisions, terminology,
  line breaks, markers, values, and structure.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  the Korean migration archive in `work/ja_jp/` is not independent evidence.
- Decisions: one accepted, four `not an issue`, and nine uncertain.
- CSV changes: one targeted correction at ID 35162.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35155, 35175 | Hospitals Quarter / Hospitalis Quarters | Uncertain: both are rendered as `병원 구역`, and locale references support a medical district, but the English forms and historical decisions leave the canonical named-place form unresolved. |
| 35159 | Eight-line Faehunter helm poem / “elegant terminus” | Uncertain: the eight-line poem and its images are retained, but the referent and Korean poetic rendering of the unusual “terminus” image need integrated literary/context review. |
| 35162 | Added sea deity in the Seasteel account | Accepted: remove `신이 내린` from `바다의 신이 내린 선물`, yielding `바다의 선물`. English says the Dverga saw Seasteel as one of the sea's gifts; Japanese and Chinese agree and none identifies a deity. |
| 35162 | Seasteel, Dverga, Obsidian Isle, Emberdeep, and Foundry Guild terms | Uncertain: material properties, three paragraphs, arrival after storms, diminishing buoyancy after refining, and hoarding are preserved, but the established Korean forms and institutional names are not uniformly resolved. D-324 supports `바다강철` for one item label but explicitly does not settle corpus-wide material naming. |
| 35163 | Wolds / Freemen | Uncertain: the rough sense is retained, but both capitalized names may refer to places or groups and their canonical Korean forms remain open. |
| 35165 | Fragment `of Shelter` | Not an issue: `보호의` preserves the source's suffix-like unfinished fragment rather than converting it into a complete sentence. |
| 35168 | Zotikus / Ariope / Rhode casting | Not an issue: Korean correctly reads “cast ... as” theatrically as assigning roles, not spellcasting, and preserves the speaker's qualification that they did not presume to order the player. |
| 35174 | `House of Pride` | Uncertain: the proper-name treatment is clear, but prior decisions document competing forms (`긍지`, `자만`, `오만`) and do not authorize a one-row normalization. |
| 35179 | `Crow` arena status | Uncertain: the condition (all teammates lost, survivor escapes) and its disgraceful status are retained, but whether Crow is an arena rank/team name or a literal label remains unresolved. Chinese's “intending to flee” is not imported. |
| 35183 | `Ragnarr's Chosen` | Uncertain: the quest objective is retained, but Japanese and Chinese differ on whether the group is officers or a named Chosen collective; canonical faction/title form remains open. |
| 35187 | `The Red Marches` | Uncertain: the place-name is retained, but English/Chinese indicate plural borderlands while Japanese transliterates the name; canonical Korean form is unresolved. |
| 35197 | `Ballads Squire` | Uncertain: Japanese expands House of Ballads and Chinese reads a generic squire; English's compressed label does not settle formal rank versus descriptive role. |
| 35199 | Templars / gnomish people / “all peoples” | Not an issue: Korean retains the leadership, large and sometimes divided group, and inclusive concern for its own people and all peoples; no row-local referent loss is established. |
| Remaining ordinary text in IDs 35151-35200 | Dialogue, labels, values, markers, and structure | Not an issue: no additional supported row-local defect was identified in the other 37 IDs. |

## Historical Audit Reconciliation

- D-324 accepts `바다강철` for the Seasteel bundle at ID 2111, based on
  existing draft occurrences, but explicitly avoids settling material naming
  corpus-wide. The 35162 name cluster therefore remains uncertain; only the
  unsupported sea-god addition is corrected.
- Prior decisions D-6344 and D-10103 leave House of Pride's canonical Korean
  form unresolved. This batch does not choose among existing alternatives.
- Hospitalis Quarters, Crow status, Ragnarr's Chosen, Red Marches, Ballads
  Squire, and the poem's figurative image remain open for context/glossary
  review.

## Verification

- All 50 IDs were checked in English, Japanese, Chinese, and active Korean;
  keys and order match.
- The Faehunter poem at ID 35159 retains all seven embedded line breaks. The
  Seasteel account at 35162 retains all three paragraphs/four line breaks,
  technical properties, and the storm/annual arrival sequence.
- The `$TRSQ02.cowl_price$` variable at ID 35164 and its order are unchanged.
- Only the `Texto` value at ID 35162 changed. The UTF-8 BOM, 72,046 CRLF
  endings, and 39 original bare-LF endings remain intact.
- These working dispositions are not independent final linguistic approval.
- Resume disposition at ID 35201; 29,934 IDs remain through ID 65134.
