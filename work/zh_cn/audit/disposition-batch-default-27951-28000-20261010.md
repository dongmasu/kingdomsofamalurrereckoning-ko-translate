# Disposition and Edit Batch: `default` IDs 27951-28000

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  27951-28000, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: two accepted, three `not an issue`, and two uncertain.
- Accepted corrections at IDs 27952 and 27954 are applied.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 27952 | `초대자(the First)` | Accepted: change to `최초의 선조(the First)`. Here `the First` is Faitir's reanimated ancestor: English ID 5873 identifies “the First Scaith,” and the Chinese rows at IDs 5873, 22763, and 24455 identify the ancestor/ancestral tomb. Existing Korean ID 22763 already uses `최초의 선조`. `초대자` instead means an inviter. |
| 27954 | `페이 궁수` for `Fae bowyer` | Accepted: change to `페이의 활 제작자`. English says the bowyer made the bow; Japanese `弓師` and Chinese `制弓匠` confirm a bow maker, not an archer. |
| 27958, 27986 | Freeze-duration and Ice Barrage modifiers / temporary Stealth bonus | Not an issue: `200%`, `55%`, and the temporary `3`-point Stealth increase match the locale sources and remain unchanged. |
| 27964, 27967, 27975 | Unidentified crime witness / “dropped like a ton of bricks” / “crusty bachelor” | Not an issue: Korean preserves the unspecified perpetrator, the shared heavy-fall image, and the teasing personality description without adding unsupported detail. |
| 27951, 27953, 27955-27957, 27960, 27963, 27965-27966, 27968, 27970-27972, 27974, 27976-27983, 27987-27989, 27991-27992, 27994-27998 | Objectives, names, brief dialogue, and item/UI text | Not an issue: wording generally preserves the source meaning; no clear isolated correction is better supported. |
| 27959, 27961-27962, 27969, 27973, 27984, 27999-28000 | House of Sorrows / Motus Mining Interests / Beckoned / Basilica Gnostra / natural-order insult / Maire, Queen of Cups / Narca / Murghan | Uncertain: retain current identities and relations while deferring faction, company, institution, title, creature, and name forms to corpus-wide glossary/context review. |
| 27985, 27990 | Tester drink label / `from Stealth` fragment | Uncertain: preserve the current text and fragment; determine whether the tester label is internal and what context the clipped stealth phrase belongs to before revising. |

## Verification

- The source comparison used English, Japanese, and Chinese rows from
  `src/csv/`; the preserved Japanese-derived Korean CSV and active Korean
  CSV were also checked. Historical notes in
  `work/zh_cn/audit/from-ja_jp/open-questions.md` were reconciled.
- The preliminary key/order, embedded-line-break, and normalized
  runtime-token checks remain valid. The 200%, 55%, and `3` values are
  unchanged.
- Only Korean `Texto` values at IDs 27952 and 27954 changed. IDs, variants,
  row order, and source CSVs remain unchanged.
- Active default CSV SHA-256:
  `30ea32cc542267f7fca3beb625985df1cd34e27b9df26ae1d9f2080337ae1894`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- Register totals after this batch: 865 accepted, 2,986 `not an issue`, and
  4,954 uncertain (8,805 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 28001; 37,134 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
