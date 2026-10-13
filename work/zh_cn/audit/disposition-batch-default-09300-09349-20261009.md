# Disposition and Edit Batch: `default` IDs 9300-9349

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 9300-9349.
- English governs meaning, Japanese informs voice/register and source
  structure, and Chinese is supporting evidence. Historical audit notes and
  active-corpus usage were also checked.
- Eighteen findings received dispositions: one accepted, five `not an issue`,
  and twelve uncertain.
- This remains an in-progress disposition pass, not independent final
  linguistic approval.

## Decisions

- ID 9301 is `not an issue`: `잔소리 심한 마누라` localizes the insulting
  “harpy of a wife” as an idiomatic complaint, consistent with Japanese's
  nagging-wife reading and the speaker's comic exasperation.
- ID 9304 remains uncertain: `Knave of Pride` may be a card rank/title or a
  servant associated with a Pride faction. Japanese supports the servant
  reading, but Chinese transliterates the term and the isolated row does not
  settle its category.
- ID 9305 is `not an issue`: English and Japanese both say to merge the two
  amulets at the father's grave and preserve the resulting key-to-inheritance
  sequence. The Chinese reference differs on where the amulets are placed.
- ID 9307 remains uncertain: `brood` and “what was written” may refer to a
  lineage, creature group, prophecy, or story; the Korean preserves the
  change-of-fate claim without enough context to resolve those categories.
- ID 9309 remains uncertain: `Sworn to War` is a standalone fragment that
  may be a Warsworn motto or an incomplete oath/sign-off; its canonical
  Korean wording is not established.
- ID 9311 remains uncertain: the ally/distrust contrast is preserved, but
  Alyn Shir, Dellach, and Agarth have provisional Korean spellings that need
  corpus-wide alignment.
- ID 9314 is `not an issue`: the ambassador's representation of Adessa's
  gnomes and the fact that she expected the player are preserved in a
  plausible polite register.
- ID 9319 remains uncertain: `Gallows End` is a named location with several
  Korean forms in the corpus; the literal form cannot be normalized in
  isolation.
- ID 9320 remains uncertain: the meaning of devotion to the Hierophant is
  clear, but the title has competing Korean renderings (`대주교`,
  `대사제`, and transliteration).
- ID 9323 remains uncertain: English says only `7 Damage`; Japanese and
  Chinese specify physical damage. Since the English semantic source does
  not identify a damage type, do not add `물리` without stronger evidence.
  The preliminary report's statement that English explicitly says
  “Physical” is inaccurate and is not relied on here.
- ID 9325 remains uncertain: `mission` may mean a task, religious mission,
  or institution; Japanese and Chinese contextualize it differently, so
  the Korean generic `임무` is not safely replaceable from this line alone.
- ID 9328 is accepted: replace `크루독이 이끌던 무리가 사라졌으니` with
  `크루독이 사라졌으니`. English, Japanese, and Chinese say the brownies
  are without their Crudok leader; the current Korean instead asserts that
  the group he led disappeared.
- ID 9330 remains uncertain: `power` is a game resource paired with health,
  but the established Korean UI term is unresolved; `힘` may be read as
  physical strength.
- ID 9336 remains uncertain: the unusual claim that the deathblow is
  Bisarane's is preserved, while `Sorrows` appears to be a named entity or
  power whose canonical Korean form is unsettled.
- ID 9338 is `not an issue`: Korean follows English in defining a quest
  target as the next objective's map location. `{*2...}`, both `{*4...}`
  markers, and `{LINE_LEFT}` remain in order; Japanese's differing
  quest-giver interpretation does not outweigh English.
- ID 9341 remains uncertain: `Tuatha` has competing Korean spellings
  (`투아타` and `투아사`) across the corpus; defer normalization to the
  terminology pass.
- ID 9342 remains uncertain: the four-step forging account and its
  paragraph structure are retained, but several names and material terms
  differ among references and need lore/terminology review.
- ID 9349 is `not an issue`: despite the English subject-verb agreement
  error, Korean correctly preserves that one required party has died and
  the contract can no longer be completed.

## Applied Edits

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 9328 | `크루독이 이끌던 무리가 사라졌으니, 룬다미르의 브라우니들은...` | `크루독이 사라졌으니, 룬다미르의 브라우니들은...` | D-2601: remove the unsupported claim that the whole led group disappeared. |

## Verification

- The preliminary report covers all 50 IDs. Candidate lines were compared
  against the actual English, Japanese, Chinese, and active Korean CSVs;
  historical questions were reconciled against the active rows.
- ID 9323's physical-damage type is not added because English leaves it
  unspecified, despite Japanese and Chinese specifying it.
- ID 9338 retains `{*2Quest Targets}`, `{*4!}`, `{*4o}`, and `{LINE_LEFT}` in
  source order. The Mystic Hammer account at ID 9342 retains its paragraph
  sequence and embedded line breaks.
- The active CSV parses as 65,135 records with IDs 0-65134 in order,
  matching the immutable English and Chinese keys. Its non-text fields,
  UTF-8 BOM, and CRLF record endings are preserved.
- Active Korean `default` CSV SHA-256:
  `8a347cb5ef61b79fb70b178ef85d16fa72d5c1f3104223e17a14e0323624f2c7`.
- Before this batch: 408 accepted, 826 `not an issue`, and 1,355 uncertain.
  After this batch: 409 accepted, 831 `not an issue`, and 1,367 uncertain.
- Resume at ID 9350; 55,785 `default` rows remain.

Findings remain working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
