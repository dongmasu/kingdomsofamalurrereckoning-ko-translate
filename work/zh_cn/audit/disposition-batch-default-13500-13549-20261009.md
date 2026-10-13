# Disposition and Edit Batch: `default` IDs 13500-13549

- Decision date: 2026-10-09.
- Scope: all 17 candidate findings in the preliminary report.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, and archived questions.
- Seventeen findings received dispositions: three accepted, six `not an
  issue`, and eight uncertain.
- Three accepted `Texto` corrections were applied at IDs 13507, 13525, and
  13539.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 13500 remains uncertain: the fragmentary title does not establish
  whether `White` names a person/group or describes a visual image.
- ID 13502 remains uncertain: Cape Solace has conflicting Korean spellings
  and the exact military office denoted by `master-at-arms` remains
  unresolved. Do not normalize this occurrence in isolation.
- ID 13503 is `not an issue`: the exact
  `#NAMED_ICON_MOUSE_BUTTON_1#` token and the mouse-over condition/ward
  explosion consequence are preserved.
- ID 13507 is accepted: replace `칼을 팔아 생계를 꾸려` with
  `칼을 휘두르며 생계를 꾸려`. English's idiom, Japanese, and Chinese
  describe earning a living by fighting/using swords, not selling them.
- ID 13510 is `not an issue`: `텔로그루스(Telogrus)` matches the
  predominant active-corpus form and retains the source name.
- ID 13511 remains uncertain: capitalization suggests a named place, but the
  canonical `Fellfire Pit` Korean construction needs context.
- ID 13512 remains uncertain: English and Chinese support reverie, while
  Japanese interprets it as meditation; the formal Fae practice/state is
  unresolved.
- ID 13514 is `not an issue`: Korean uses the established Sagecraft term and
  preserves its relation to Chaos Magic.
- ID 13520 is `not an issue`: both longsword bonuses, their values, weapon
  scope, and the source line break are retained.
- ID 13524 remains uncertain: `points` may mean arguments, score, or point
  of view; the source locales diverge.
- ID 13525 is accepted: replace `패즈머의 저주` with
  `파스머(Phasmer)의 저주`, matching the predominant active-corpus proper
  name and adding traceability.
- ID 13526 is `not an issue`: `발라드의 집` matches the active Korean term
  for House of Ballads.
- ID 13529 is `not an issue`: Korean `정력` retains the source's virility
  sense and the dry-air joke.
- ID 13534 remains uncertain: the insult is preserved, but the Preordained
  group's canonical name and formal status are not settled.
- ID 13536 remains uncertain: the target count is preserved, but the Scavs'
  canonical Korean creature name is unsettled across locales.
- ID 13539 is accepted: replace `불려온 자` with `부름받은 자` to align this
  formal player-title occurrence with previously accepted corpus decisions,
  including D-3115 and later title alignments.
- ID 13549 remains uncertain: the isolated label does not establish whether
  Crows is an arena team or ordinary birds; the English parenthetical remains
  useful.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 13507 | `칼을 팔아 생계를 꾸려` | `칼을 휘두르며 생계를 꾸려` | D-4006 |
| 13525 | `패즈머의 저주` | `파스머(Phasmer)의 저주` | D-4013 |
| 13539 | `불려온 자가 왔군.` | `부름받은 자가 왔군.` | D-4018 |

## Verification

- The four locale files contain IDs 13500-13549 once each and in identical
  ascending order. The preliminary structural audit found matching record
  line-break counts and runtime-token signatures; the icon token at ID 13503
  and the stats/line break at ID 13520 remain unchanged.
- Only the three accepted Korean `Texto` cells changed. Their row keys and
  surrounding records remain unchanged.
- Before this batch: 544 accepted, 1,293 `not an issue`, and 2,165 uncertain.
  After this batch: 547 accepted, 1,299 `not an issue`, and 2,173 uncertain
  (4,019 dispositions total).
- The active Korean `default` CSV retains its UTF-8 BOM and CRLF record
  endings. Its SHA-256 after the edits is
  `7e914c8d2536736b5406261a0ff6412302f3abbc687f9224bd80350c95e1b71b`.
- Reversing only the three approved text substitutions must restore the
  preceding batch's CSV SHA-256 before these edits:
  `84c195605337551c88ff15aef06531ab888f43487098ddef57b30e6f1b6e9fee`.
- A generic standard-library CSV parse is not used because the existing
  corpus contains multiline/quoting forms it rejects; key order in this
  range was checked line-by-line across all four locale files.
- Resume at ID 13550; 51,585 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
