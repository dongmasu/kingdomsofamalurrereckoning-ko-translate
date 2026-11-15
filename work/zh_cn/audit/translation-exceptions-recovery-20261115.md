# Translation Exception Recovery: Four Recovery Passes

- Date: 2026-11-15.
- Scope: the requested three-perspective pass, followed by three additional
  repetitions of that pass. Three read-only reviewers were reused across
  four rounds, with different questions in each round.
- Editable reference:
  [translation-exceptions.md](../translation-reference/exceptions/translation-exceptions.md).
- This is recovery of existing scoped decisions, not a new linguistic
  review of all translations or permission to edit the working CSVs.

## Review Perspectives

| Round | Perspective | Result |
| --- | --- | --- |
| 1 | Decision lineage and deliberate non-unification | Recovered exact-English groups whose Korean register or speech act intentionally differs. |
| 1 | Multilingual source conflicts | Indexed six retained holds without converting them into approved corrections. |
| 1 | Runtime/data structure | Recorded the Japanese-only variable-order observation at `29077` and the corrected six-line poem pair `320` / `42198`. |
| 2, first requested repetition | Bilingual annotation boundaries | Recovered full-title exclusions, separate title/name pairing, Meropis shortening, and exact-key article/spelling differences. |
| 2, first requested repetition | Gameplay/numeric semantics | Recorded damage-type distinctions, tree tiers versus ability levels, fixed probabilities, stat boundaries, and the scoped Reckoning Mode correction. |
| 2, first requested repetition | Register and genre | Recorded ceremonial/plain speech, journal narration, familiar letters, polite warnings, and royal-plural boundaries. |
| 3, second requested repetition | Collective names, short forms, and entity separation | Recorded Travelers, Sparrows, Toothpicks, and distinct Abra/Arba item boundaries. |
| 3, second requested repetition | Objectives, completed labels, and interaction UI | Recorded action/counter distinctions, Repair Equipped, Interact/Sprint, and sewer travel-label order. |
| 3, second requested repetition | Unsupported relationships and incomplete sources | Distinguished applied neutral corrections from held sibling-age, referent, and fragment interpretations. |
| 4, third requested repetition | Adversarial current-state verification | Added the November 9 source-checked counter confirmation after the historical D-6382 working disposition; no other concrete defect was reported in that bounded review. |
| 4, third requested repetition | Homonyms and lexical senses | Recorded the provisional Mine distinction, named/generic Font boundary, and confirmed Sprite creature uses. |
| 4, third requested repetition | Provenance outside chronological audit reports | Recovered the user-confirmed Band item exception, collective Ring, deity-menu name/title order, and the short-parenthetical-fragment formatting boundary. |

## Adjudication

- Compare recovered claims with their exact audit evidence and current
  ID-matched Korean text before recording a current rule.
- Keep accepted working dispositions, confirmed corrections, observations,
  partial corrections, and unresolved holds distinguishable.
- A name annotation or naturalness correction does not resolve an unrelated
  meaning, relationship, or material-identity hold in the same row.
- Do not turn routine sentence edits or generic name additions into global
  exceptions. The reference is a scoped index; full history stays in audit.
- Current-state checking corrected two stale candidate descriptions:
  `12347` follows the later consistent polite decision, not the earlier
  plain-speech revision; `34073` follows the later named-role `Traveler`
  interpretation, not the earlier ordinary-traveler exclusion.
- `62496` still says `언니` in the working CSV. Its age-order conflict is
  recorded as a hold, not described as an applied neutral correction.
- `20661`'s initial working disposition was not promoted to an independent
  approval. Its later source-checked duplicate-group confirmation with
  `22908` is recorded separately, with the source hash/ID map linked.

## Preservation Snapshot

- Repository HEAD: `d91467a8b89c50fde8281dbf95571580924f24ee`.
- Protected inventory: 105 tracked files selected by
  `git ls-files -z src 'work/zh_cn/*.csv'`.
- Inventory fingerprint: SHA-256 of the concatenated path, NUL, and file
  bytes in that inventory's order:
  `f2a32b8627d3c548ef0a1e77469bdab6adad296c1066b0d4fd2b680a84714c43`.
- Index snapshot: SHA-256 of `git ls-files --stage`:
  `086e9d83435ca8c53002f90c201ac6f558a77145255e4b13952ac40971c23bfa`.
- Existing staged and unstaged changes were preserved. No translation CSV,
  immutable source, glossary, review ledger, source fingerprint, or game
  binary was edited by this recovery task.

## Verification

- Completed all four rounds and integrated source-verified findings.
- All 177 local link/anchor occurrences passed: 176 in the reference and one
  in this recovery report. Markdown table column checks also passed.
- `git diff --check` passed for the edited reference. This new report was
  separately checked for trailing whitespace and malformed tables/links.
- Parsed all 65,135 working `default` records and verified unique ordered
  IDs `0` through `65134`. Selected current-text assertions passed for
  `12347`, `34073`, the `20661` / `22908` counter pair, `53338`, `62496`,
  and the `428`, `2124`, `45697` parenthetical examples.
- The `320` / `42198` poem pair has identical Korean text and six lines.
  The `base:4674:11` value is `밴드`. All 12 deity-menu prefixes match the
  reviewed name/title order, without restoring old eligibility-note text.
- The 105-file protected inventory and Git index fingerprints still match
  the preservation snapshot above. No staging or commit was performed.
- These are documentation/current-data checks, not newly performed
  linguistic approval. No build, repack, installation, or runtime test was
  authorized or run for this documentation-only task.

## Limits

Four completed passes describe the searches performed, not prove that
every past user request or every translation exception has been recovered.
Unresolved interpretations remain unresolved unless a later explicit
decision supplies the missing evidence.
