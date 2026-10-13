# Disposition and Edit Batch: `default` IDs 28651-28700

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  28651-28700, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: zero accepted, two `not an issue`, and eight uncertain.
- No CSV wording changed.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 28685 | Magic/Melee/Ranged block values | Not an issue: the three categories and values `6`, `11`, and `11` are retained on separate lines. The canonical Korean block verb remains separately uncertain. |
| IDs 28651-28700 structural and remaining ordinary text | Keys/order, breaks, markers, and unflagged dialogue/objective wording | Not an issue: all four locales contain each ID once in identical order; line breaks and normalized runtime-token structures match, with no additional isolated correction better supported. |
| 28654 | `동료 여행자여` / capitalized `Traveler` | Uncertain: this may be a formal group/title rather than a generic fellow traveler; Japanese/Chinese also localize or translate it. |
| 28670 | `청소부들` / `Scavengers` | Uncertain: English capitalizes the term and related entries use Scav/Scavs; determine whether this is a creature/faction label or generic scavengers. |
| 28679 | `부름받은 자` / `Beckoned` | Uncertain: the challenge and turn-taking are preserved, but the capitalized title needs glossary alignment. |
| 28680 | `그림자(Shade)` / Sun Camp | Uncertain: Shade may be a person, species, or title; retain the Phasmer account and escape relation pending scene context. |
| 28685 | `막습니다` / “Blocks” | Uncertain: values are correct, but English/Japanese use a specific block mechanic and the Korean combat-stat verb needs canonical UI terminology. |
| 28693 | Seeds smoldering with sun-baked-stone heat | Uncertain: Korean preserves the image but recasts whether the seeds smolder from the stone's heat or are scorched by it; locale versions also reformulate the image. |
| 28697 | Cards catching the unnamed man | Uncertain: Korean follows the literal card metaphor; Japanese reads it as fate, while English/Chinese retain cards. The historical audit flags this referent. |
| Other named terms in IDs 28651-28700 | Ayten/Freemen, Pteryx, Border Permit, Hellbane, House of Sorrows, Savant, Warsworn, Virki, Atheof, Scav, Freehold, Gallows End, Summer Court, Great Cycle, Fateweaver, and related terms | Uncertain: retain current identities pending canonical faction, title, place, creature, and lore-term alignment. |

## Verification

- The source comparison used English, Japanese, and Chinese rows from
  `src/csv/`; the active Korean rows and historical notes were also checked.
- IDs 28651-28700 occur once in each locale in identical order. Embedded
  line-break counts and normalized runtime-token identities/order match.
- No Korean `Texto` cell or source CSV changed in this batch.
- Active default CSV SHA-256 remains
  `e15a2796db09695a4845f9efa9f884ac4eb35cb815bf5289fe2774ceb25f4224`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- Register totals after this batch: 881 accepted, 3,016 `not an issue`, and
  5,050 uncertain (8,947 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 28701; 36,434 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
