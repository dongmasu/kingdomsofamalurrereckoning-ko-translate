# Disposition and Edit Batch: `default` IDs 28601-28650

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  28601-28650, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: one accepted, two `not an issue`, and nine uncertain.
- The register correction at ID 28650 is applied.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 28650 | `잡것들이라고?` for casual “Critters?” | Accepted: change to `동물들이라고?`. English is colloquial, Japanese explicitly says animals, and Chinese says little creatures/devils; Korean `잡것들` adds a contemptuous insult not clearly present in the speaker's reaction. |
| 28612 | Thumos-paint quest mechanics | Not an issue: both vials, their distinct Murghan/Scav kill conditions, and the paint's restorative/mystical function are retained. The canonical Korean rendering of `thumos` remains separately uncertain. |
| 28645 | `우리 곁에 있어 줘` for “Stay with us.” | Not an issue: Korean and Chinese preserve the request to stay with the group; the Japanese “see you soon” divergence does not justify changing the English-aligned Korean. |
| IDs 28601-28650 structural and remaining ordinary text | Keys/order, line breaks, runtime markers, and unflagged dialogue/objective wording | Not an issue: all four locales contain the 50 IDs once in identical order; line breaks and normalized markers match, and no additional isolated correction is better supported. |
| 28612 | `투모스(thumos)` | Uncertain: English treats the substance as a named term; Japanese and Chinese transliterate it differently. Preserve the source-linked Korean form pending glossary/context review. |
| 28617 | `거울칼(Mirrorblades)` | Uncertain: English capitalizes a weapon name; Japanese/Chinese render it as mirror blades. Confirm whether it is a proper weapon name before standardizing. |
| 28622 | `도슨트(Docent)` rank | Uncertain: English/Chinese describe an academic rank and its earned honors; Japanese generalizes the qualification. Canonical institutional rank is unresolved. |
| 28624 | Paling Wand / Lyria / Nareens / Galafor | Uncertain: Korean follows English's causal relation, while Japanese/Chinese recast Lyria's motive and the wand's farm function. Preserve pending lore context. |
| 28632 | `사략선 선원` / privateer | Uncertain: the vest's connection to a privateer crew is retained, but the canonical role/uniform term needs setting-glossary alignment. |
| 28634 | `전투` / capitalized `Warfare` | Uncertain: this may be a formal skill-tree category; Japanese says tactics and Chinese war. Confirm the UI category before changing it. |
| 28638 | Convicted / distracted clause | Uncertain: English is deliberately compressed and the referents are unclear; Korean preserves the convictions and flirtatious distraction but needs surrounding dialogue for final interpretation. |
| 28648 | `화이트플레이크(Whiteflake)` | Uncertain: English/Japanese preserve the name, while Chinese translates it literally. Determine whether it is a place, material, or creature term. |
| Other named terms in IDs 28601-28650 | Eamonn's Isle, Gravehal Keep, Fallon, Champ, Summer Fae, Gallows Tree, Jottun, Mirrorblades, Freehold, High King, Docent, Whiteflake | Uncertain: retain current identities pending canonical spelling, faction, rank, weapon, and place terminology review. |

## Verification

- The source comparison used English, Japanese, and Chinese rows from
  `src/csv/`; the active Korean rows and historical notes were also checked.
- IDs 28601-28650 occur once in each locale in identical order. Embedded
  line-break counts and normalized runtime-token identities/order match.
- Only Korean `Texto` at ID 28650 changed. No source CSV, key, row order, or
  variant structure changed.
- Active default CSV SHA-256:
  `e15a2796db09695a4845f9efa9f884ac4eb35cb815bf5289fe2774ceb25f4224`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- Register totals after this batch: 881 accepted, 3,014 `not an issue`, and
  5,042 uncertain (8,937 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 28651; 36,484 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
