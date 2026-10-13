# Disposition and Edit Batch: `default` IDs 13550-13599

- Decision date: 2026-10-09.
- Scope: all 18 candidate findings in the preliminary report.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, and archived questions.
- Eighteen findings received dispositions: one accepted, six `not an issue`,
  and eleven uncertain.
- One accepted `Texto` correction was applied at ID 13599.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 13550 remains uncertain: Korean `인수` is neutral, while Japanese
  suggests a hostile takeover; the business/political context does not settle
  the nuance.
- ID 13551 remains uncertain: the referent of Sidhe and the difference
  between `시드헤` and recurring `시드` remain unresolved.
- ID 13553 is `not an issue`: all three localized repair labels and
  `{LINE_SPACE}` retain their marker identities and order; damaged/broken
  item meanings are clear.
- ID 13554 remains uncertain: `my house` could mean a literal home, palace,
  or Fae House; the locale sources diverge.
- ID 13556 is `not an issue`: the isolated proper name `Faer` is preserved
  unchanged across locales.
- ID 13557 remains uncertain: the short title does not establish whether
  `The Offering` is a named rite or literal offering.
- ID 13559 is `not an issue`: `창궐` can describe a creature outbreak or
  infestation and does not force a disease reading.
- ID 13562 remains uncertain: proper names and the exact nature of the
  wilderness retreat need lore context; locales differ between monastery
  and hideout.
- ID 13572 is `not an issue`: all ingredients, quantities (2, 2, 1), order,
  and four embedded line breaks are retained.
- ID 13573 is `not an issue`: Korean follows English `harbor wall` and
  preserves the large lock-and-gear mechanism that must be opened to sail.
- ID 13574 remains uncertain: the Houses' survival/departure claim and the
  formal Pride/Valor names are ambiguous across locales.
- ID 13583 remains uncertain: the Cult of Belen's canonical Korean name and
  Belen spelling need terminology alignment.
- ID 13587 remains uncertain: `light` may be a lamp or person/entity; Korean
  retains the repeated distress pending context.
- ID 13592 is `not an issue`: `로포쿠(Lopoku)` matches the predominant active
  Korean deity spelling.
- ID 13595 remains uncertain: proper-name forms and whether tyrenium is a
  material or place-derived term are unresolved.
- ID 13596 remains uncertain: the formal Lords of Valor faction/team name
  and whether joining means quest completion or membership need context.
- ID 13598 remains uncertain: Abergawein's spelling and whether Residence
  means a house, estate, or district are unresolved.
- ID 13599 is accepted: replace `가문의 문장은 어떻게 얻을 수 있지?` with
  `가문의 무기는 어떻게 얻을 수 있지?`. Japanese and Chinese interpret
  `family arms` as family/heirloom weapons; the current Korean selects
  heraldic insignia.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 13599 | `가문의 문장은 어떻게 얻을 수 있지?` | `가문의 무기는 어떻게 얻을 수 있지?` | D-4037 |

## Verification

- The four locale files contain IDs 13550-13599 once each and in identical
  ascending order. The preliminary structural audit found matching record
  line-break counts and runtime-token signatures; localized inline labels
  at ID 13553, `{LINE_SPACE}`, and the four line breaks at ID 13572 remain
  unchanged.
- Only the accepted Korean `Texto` wording at ID 13599 changed. Its row key
  and surrounding record remain unchanged.
- Before this batch: 547 accepted, 1,299 `not an issue`, and 2,173 uncertain.
  After this batch: 548 accepted, 1,305 `not an issue`, and 2,184 uncertain
  (4,037 dispositions total).
- The active Korean `default` CSV retains its UTF-8 BOM and CRLF record
  endings. Its SHA-256 after the edit is
  `420157d47104968c318ffec088ef2599752e5b4fa71b96a5318778d296852cd6`.
- Reversing only the approved text substitution must restore the preceding
  batch's CSV SHA-256 before this edit:
  `7e914c8d2536736b5406261a0ff6412302f3abbc687f9224bd80350c95e1b71b`.
- A generic standard-library CSV parse is not used because the existing
  corpus contains multiline/quoting forms it rejects; key order in this
  range was checked line-by-line across all four locale files.
- Resume at ID 13600; 51,535 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
