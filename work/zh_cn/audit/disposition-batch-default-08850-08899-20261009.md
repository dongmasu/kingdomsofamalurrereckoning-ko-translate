# Disposition and Edit Batch: `default` IDs 8850-8899

- Decision date: 2026-10-09.
- Scope: preliminary findings and carried historical questions for `default`
  IDs 8850-8899.
- English governs meaning, Japanese informs voice/register and source
  structure, and Chinese is supporting evidence. Existing audit decisions and
  active-corpus terminology were also checked.
- Fifteen findings received dispositions: one accepted correction, three
  `not an issue`, and eleven uncertain.
- This remains an in-progress disposition pass, not independent final
  linguistic approval.

## Decisions

- ID 8850 remains uncertain: `Great Cycle` is a named cosmological concept,
  but the Korean corpus alternates among `대순환`, `위대한 순환`, and other
  forms; this isolated row does not settle global terminology.
- ID 8852 remains uncertain: Japanese supports ancestral tombstones, while
  English and Chinese allow a broader reading of the parents' stones. The
  Korean image is plausible but cannot be conclusively selected from this
  string alone.
- ID 8858 remains uncertain: the Korean preserves both sword skill and the
  sexual double entendre, but the canonical Korean name for the Court of
  Enchantments is unresolved.
- ID 8859 is accepted. Change `현명술 기술` to
  `마법물품 제작 기술`. The same Sagecraft skill and materially matching
  potion instruction use `마법물품 제작` in the active corpus, including
  ID 23080; the current row's `현명술` is an isolated inconsistent term.
  Reagent spellings and parenthetical English are left unchanged because
  their broader naming policy is not settled by this finding.
- ID 8864 is `not an issue`: the passive marker remains in the correct
  position, and the Korean preserves the freezing-duration, slowing, and Ice
  Barrage effects. No specific semantic defect is established; broader term
  standardization remains separate.
- ID 8865 remains uncertain: English's “per stack element” is malformed;
  Japanese and Chinese support the Korean per-stack interpretation, but the
  exact game mechanic cannot be verified from the string alone.
- ID 8866 remains uncertain: English and Korean indicate missives, Japanese
  says a book, and Chinese names a specific volume. The object identity is
  unresolved.
- ID 8871 is `not an issue`: Korean retains the unspecified plural
  antecedent rather than inventing what “they” refers to.
- ID 8879 remains uncertain: the capitalization suggests a named destructible
  object, but the canonical Korean name for `Fate Source` is not established.
- ID 8880 remains uncertain: the Korean preserves the Murghan and porter
  relationship, but the creature name and the exact role meant by `porter`
  are not settled across locales.
- ID 8885 remains uncertain: all locales support a lock-opening tool, but
  prior decisions use both `달인의` and `장인의` for `Master's Pick`; a
  project-wide canonical item name is not established.
- ID 8886 is `not an issue`: marker identity/order and the pull effect and
  large-enemy caveat are preserved.
- ID 8887 remains uncertain: the local meaning is retained, but
  `Hierophant` has competing Korean rank forms in the active corpus.
- ID 8891 remains uncertain: the description of Esharra as another plane is
  retained, while the proper-name spelling and established term for
  `ethereal plane` remain unresolved.
- ID 8897 remains uncertain: `이시(Eathe)` preserves the English spelling,
  but Japanese and Chinese use materially different pronunciations; the
  canonical Korean proper name is not established.

## Applied Edit

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 8859 | `현명술 기술` | `마법물품 제작 기술` | D-2478: align Sagecraft with the established active-corpus term and the matching potion instruction at ID 23080. |

## Verification

- The preliminary report covers all 50 IDs and records the four-locale key
  order, line-break, and runtime-marker checks. The row at ID 8859 was
  independently reread because the preliminary candidate wording did not
  match the active Korean CSV.
- Only the approved Korean `Texto` fragment at ID 8859 changed in this batch.
- The active Korean `default` CSV remains 65,135 data records with ordered,
  unique IDs 0-65134, two fields per record, UTF-8 BOM, semicolon delimiter,
  CRLF record endings, and no bare LF/CR.
- The active Korean `default` CSV SHA-256 after the edit is
  `215e1071f38a27a064bcc60bbb84d9b0eb6da04eea5ef0610e6bb932e8d851e7`.
- After this batch: 393 accepted, 791 `not an issue`, and 1,305 uncertain.
  Resume at ID 8900; 56,235 `default` rows remain.

Findings remain working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
