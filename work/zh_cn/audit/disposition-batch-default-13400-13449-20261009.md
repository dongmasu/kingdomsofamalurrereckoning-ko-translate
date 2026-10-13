# Disposition and Edit Batch: `default` IDs 13400-13449

- Decision date: 2026-10-09.
- Scope: all 26 candidate findings in the preliminary report.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, and archived questions.
- Twenty-six findings received dispositions: one accepted, eleven `not an
  issue`, and fourteen uncertain.
- One accepted `Texto` correction was applied at ID 13403.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 13400 is `not an issue`: `여기선 누구도 봐주지 않아` correctly renders
  `you'll find no quarter here` as a threat of no mercy. The separate `now
  this` referent remains implicit in the English source.
- ID 13403 is accepted: replace `그 심장을 짓밟으려` with
  `그 심장을 쥐어짜려`. English `wring its heart`, Japanese `心を締め上げ`,
  and Chinese `绞杀它的心脏` share a squeezing/strangling image; Korean
  currently changes it to trampling.
- ID 13404 remains uncertain: the text preserves the fate/faith paradox, but
  what labor is being fulfilled and why fate must be unbound require lore
  context.
- ID 13405 remains uncertain: `dove` may be affectionate address or a
  setting-specific title. Korean `아가씨` adds an unsupported age/gender
  implication; the references do not establish a safe replacement.
- ID 13406 remains uncertain: `신참` conveys a newcomer, but the canonical
  rank/address for `Neophyte` is not established.
- ID 13407 is `not an issue`: Korean preserves the tunnel running from the
  keep across the island and the speaker's uncertainty about its value.
- ID 13408 remains uncertain: English and Chinese identify the Pit, while
  Japanese says a waiting area. Whether `Pit` is a named arena and the
  canonical Korean tournament term need context.
- ID 13411 is `not an issue`: the Korean letter preserves the source's
  betrothal rather than changing Ratofer into an existing husband, and keeps
  all four paragraph breaks.
- ID 13415 is `not an issue`: `화려한 삽화` plausibly renders lavish
  illuminations in a book; Japanese's broader decoration wording does not
  establish a Korean meaning error.
- ID 13420 is `not an issue`: the additional room, storage, furnishings, and
  emperor-drooling hyperbole are retained in the housing-upgrade offer.
- ID 13421 is `not an issue`: Korean preserves the betrayal disclosure,
  return to Canneroc, and assistance after Barten resumes village leadership.
- ID 13422 is `not an issue`: Korean retains that the speaker's sisters died
  in the war and the mother could not speak for days, without adding the
  speaker's gender.
- ID 13424 remains uncertain: `수선용 끈` is plausible, but the item's
  crafting/repair role and the canonical Mitharan form are not established.
- ID 13429 remains uncertain: capitalization may mark `The Offering` as a
  named rite; the isolated source does not settle whether this is a title or
  a literal offering.
- ID 13430 is `not an issue`: Korean follows English and Chinese's meadows;
  Japanese alone says marsh. The documented locale conflict remains open.
- ID 13431 remains uncertain: character spelling, the rank `Archsage`, and
  the organization's identity/name require terminology context.
- ID 13434 remains uncertain: Korean retains both Pura's vigil at the Circle
  and guidance for new Keepers, but the place/order status and role relation
  are not sufficiently clear for a correction.
- ID 13436 remains uncertain: `무기 교관` is plausible for `master-at-arms`,
  but the military office and both Keep names need canonical terminology.
- ID 13438 remains uncertain: `많은 이` narrows `many` to people, while the
  source leaves whether the slain were people or creatures unstated.
- ID 13442 remains uncertain: `세속적인` can mean worldly rather than
  ordinary/mortal; the exact contemptuous force of `mundane` in this Fae
  address needs context.
- ID 13444 remains uncertain: the sarcastic complaint is preserved, but the
  antecedent of `she` and the gift's context are unknown.
- ID 13445 is `not an issue`: Korean preserves the Great Cycle condition and
  the shared world's continuing refinement toward perfection.
- ID 13446 is `not an issue`: `무기로 막아내기 100회` expresses performing
  100 parries and preserves the required count.
- ID 13447 remains uncertain: `House` could denote a family, building, or
  named faction; the isolated label and locale renderings do not resolve it.
- ID 13448 remains uncertain: the Beckoned title and the referent of `those
  monsters` need glossary/lore context.
- ID 13449 is `not an issue`: Korean preserves the instruction to sheath the
  weapon and identifies the Peace Edict as its reason.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 13403 | `그 심장을 짓밟으려 한 건 큰 실수였어.` | `그 심장을 쥐어짜려 한 건 큰 실수였어.` | D-3957 |

## Verification

- The four locale CSVs contain the reviewed IDs in identical key order; the
  preliminary structural audit found matching record line-break counts and
  runtime-token signatures throughout this range.
- Only the accepted Korean `Texto` wording at ID 13403 changed. Its row key,
  surrounding dialogue, paragraph structure, and runtime content are
  otherwise unchanged.
- Before this batch: 541 accepted, 1,269 `not an issue`, and 2,145 uncertain.
  After this batch: 542 accepted, 1,280 `not an issue`, and 2,159 uncertain
  (3,981 dispositions total).
- The active Korean `default` CSV retains its UTF-8 BOM and CRLF record
  endings. Its SHA-256 after the edit is
  `5d6d76fc19c475faa8658276e2296eba56b771902c50ae45389b634bc4487612`.
- A byte-level inverse substitution restores the exact pre-edit SHA-256,
  confirming no bytes outside the approved wording changed. A generic
  standard-library CSV parse was not usable because the existing corpus
  contains multiline/quoting forms it rejects; the reviewed key range was
  independently checked line-by-line across all four locale files.
- Resume at ID 13450; 51,685 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
