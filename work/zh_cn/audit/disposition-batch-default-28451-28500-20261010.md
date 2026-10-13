# Disposition and Edit Batch: `default` IDs 28451-28500

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  28451-28500, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: one accepted, three `not an issue`, and nine uncertain.
- The accepted insult correction at ID 28495 is applied.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 28495 | `애송이` for “dreg” | Accepted: change to `쓰레기`. English uses `dreg` as a contemptuous address and Chinese explicitly uses “scum”; Korean `애송이` instead means an inexperienced novice. |
| 28455 | “make peace with your god” | Not an issue: Korean asks whether the condemned speaker should seek forgiveness; Japanese specifies a final confession and Chinese a final prayer. The religious admonition is retained. |
| 28460 | Active ability text and line layout | Not an issue: marker identity/order, all four weapon types, and the critical-hit damage effect are retained. English/Chinese/Korean have two line breaks; the Japanese one-break layout is a documented locale difference. |
| IDs 28451-28500 structural checks | Keys/order, line breaks, and runtime-token identities/order | Not an issue: all four locales contain each ID once in identical order; normalized runtime markers match, including the active ability marker. |
| 28459 | `은밀한` for “subtle magical assaults” | Uncertain: English may mean subtle or hard-to-detect attacks, while Korean implies covert/secret attacks; Japanese/Chinese remain broader. |
| 28462 | `진정한 프리모스(Primos)` | Uncertain: English/Japanese treat Primos as a named people or title, while Chinese says “true leader.” Keep the source-based proper name pending glossary confirmation. |
| 28464 | `그건` for “that one” | Uncertain: English does not identify whether the referent is a person or object; Chinese chooses a person, but the isolated source remains open. |
| 28469 | Bone Wall / Hera Orhelm | Uncertain: the role and place/object referent differ across locales; Japanese describes a request-board manager, while English/Chinese retain a wall reading. |
| 28479 | `여행자들` for capitalized `Travelers` | Uncertain: English may name a formal group; related historical references use multiple forms. Keep pending corpus-wide faction-term alignment. |
| 28480 | `영웅 등급 소켓` for `Epic socket` | Uncertain: the armor/socket relation and rare-quality condition are preserved, but the Korean quality-tier term needs glossary alignment. |
| 28485 | `stay our diggers, our masons` | Uncertain: the archaic English may mean retaining the workers, keeping them in their roles, or halting their work. Korean's “stop the work” reading is not settled by the conflicting locale renderings. |
| 28487 | `티끌 같은 자` for `dustling` | Uncertain: this may be a lore-specific people/creature term or a generic insult; Japanese/Chinese and English-based Korean differ. |
| Other named terms in IDs 28451-28500 | Whitestone, Star Camp, Chamber of Trade, Ljosalfar, Alfar, Bone Wall, Apotyre, Travelers, Burn, Teeth of Naros, Faer Gorta, and Primos | Uncertain: preserve current identities pending canonical spelling, faction, creature, place, and item terminology review. |

## Verification

- The source comparison used English, Japanese, and Chinese rows from
  `src/csv/`; the active Korean rows and historical notes were also checked.
- Only Korean `Texto` at ID 28495 changed. No source CSV, key, row order, or
  variant structure changed.
- Active default CSV SHA-256:
  `0859bb3c801ecab1922860471d810f3a52097e029b484a46c39026e2f49bc8b4`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- Register totals after this batch: 879 accepted, 3,008 `not an issue`, and
  5,019 uncertain (8,906 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 28501; 36,634 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
