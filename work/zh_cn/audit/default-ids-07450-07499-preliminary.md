# Preliminary Language Scan: `default` IDs 7450-7499

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 7450-7499.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions from
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 7461 | isolated `Even` → `짝수` | Keep provisional until the menu/game context confirms whether this means even-numbered, a tie/even outcome, or another state. | Japanese suggests even-numbered; Chinese says tie. The source fragment is context-free. | Medium |
| 7462 | `take this manuscript` → `이 원고를 건네` | Preserve carrying the manuscript to the named actors, without deciding that it must be handed over; e.g. `이 원고를 가지고 그들을 찾아가`. | English says “take this manuscript”; Japanese says “with this script in hand.” Korean changes that to “give them this manuscript.” | High |
| 7473 | glyph-breaking tutorial / `#NAMED_ICON_360_A#` | Keep the icon and timing instructions exact; verify the localized input glyph in the game UI. | The runtime token is unchanged and its order matches all sources; display correctness remains a separate in-game check. | Medium |
| 7487 | `deep dementia` → `깊은 치매` | Confirm whether the source means clinical dementia or severe delusion/mental deterioration; avoid an unintended diagnosis if context supports a broader term. | English uses `dementia`; Japanese describes being tormented by delusions, while Chinese also uses dementia. Korean is literal but medically specific. | Medium |
| 7495 | `Warlord Whenery` → `워로드 웨너리` | Confirm whether `Warlord` is a title to transliterate or translate and standardize Whenery with the related Lady Whenery entry. | The historical audit notes a title/name consistency question; Chinese uses a translated title, Japanese uses a general rank. | Medium |

## Historical Audit Reconciliation

- Rechecked the historical questions for IDs 7451, 7453-7454, 7456, 7461-7462,
  7464, 7467, 7471-7474, 7478, 7481, 7483-7484, 7487, 7489, 7491, 7493,
  7495, and 7497-7499.
- ID 7453 retains the intentionally ambiguous `pull it out` joke without
  supplying an object. ID 7456 preserves both the fate-thread metaphor and
  “nothing is decided.” ID 7471 keeps the gate-defense commitment and
  Bhaile's near-desertion.
- ID 7472 retains the three named stones and the return-to-Rathir objective;
  Savant and artifact-name spellings remain glossary questions. ID 7478
  distinguishes Freezing damage from the resulting slow effect.
- ID 7483 leaves `brothers` unresolved; ID 7484 preserves the Skycrown,
  Aodh, and Shardfall references. ID 7497 keeps the crystal as a conduit,
  not a magical object in itself. ID 7499 retains the simultaneous effect
  on the speaker's people without identifying the group further.
- Historical candidate wording is evidence only and does not authorize edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- Actual CSV record line-break counts match across all four locales for every
  ID in this batch.
- Localized runtime-marker identities/order, other brace tokens, and named
  icon markers match across all four locales; ID 7473's
  `#NAMED_ICON_360_A#` is unchanged.
- No active CSV structure or text was changed.

## Batch Status

IDs 7450-7499 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
