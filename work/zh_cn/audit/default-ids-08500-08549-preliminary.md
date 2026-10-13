# Preliminary Language Scan: `default` IDs 8500-8549

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 8500-8549.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and applicable historical questions in
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 8500 | `Mitharan Prismere Plumb` → `미타란 프리즈미어 배관` | Identify the item's category and intended meaning of `Plumb`; avoid committing to “plumbing” until the object is known. | English capitalization is ambiguous; Chinese reads it as a Prismere hammer, while Korean says plumbing. Japanese transliteration does not resolve the item type. | Low |
| 8501 | Kollossae / “ones so... elevated” | Preserve the dry irony about the Kollossae's elevated status rather than turning the line into straightforward praise. | Korean keeps the ellipsis and the contrast between overlooking details and being “고귀한”; the pun/irony depends on scene delivery. | Medium |
| 8503 | “We adore him” / source typo `Their is no fire` | Preserve the speaker's reverent affection and resolve the obvious `Their`/`There` source typo only as a reading, not as a source edit. | Korean follows the contextual “There is no fire in him” reading. The exact referent and tone are not established by this isolated line. | Medium |
| 8505 | `great aunt` → `큰이모할머니` | Avoid fixing the great-aunt relationship to the maternal side unless context supports it. | English is gender-lineage neutral; Japanese uses a general great-aunt term, while Korean specifies an aunt on the mother's side. | Medium |
| 8517 | `Mr. Hugues! The Tuatha have` | Preserve the truncated source fragment unless neighboring dialogue establishes its continuation; verify Hugues spelling elsewhere. | All four strings end mid-sentence. Korean's ellipsis makes the truncation visible without inventing a completion. | High |
| 8523 | ten-line Nix / Maid Windemere poem | Preserve the plot and stanza structure; review the line “In nature it was displeased with its part” for meaning and defer meter/rhyme to a literary pass. | Korean has ten lines and the same main events, but the second line may recast the troll's dissatisfaction with its lot as its nature failing to do its part. `Maid` is rendered `시녀`, as at IDs 8428 and 8540. | Medium |
| 8525 | `Travelers` → `트래블러스` | Standardize the faction/name form against `여행자(Travelers)` at ID 8404 and the Korean usage at ID 8466. | English capitalizes the faction name. The active Korean alternates between transliteration and translated name-plus-English form. | Medium |
| 8526 | `TMP - Tree Cave` | Determine whether `TMP` is a development placeholder to preserve or omit from player-facing text; do not silently erase it. | English and Chinese retain `TMP`; Japanese explicitly labels it provisional. Korean preserves the marker and translates the descriptor. | Medium |
| 8529 | Mana Regeneration potion / reagent list | Preserve the two-line description, blank paragraph, item names, and reagent quantities. | Korean retains the blank line and both quantities `(2)` and `(1)`; item-name transliterations remain candidates. | High |
| 8534 | Gravehal → `그레이홀` | Align the place name with `그레이브홀` at ID 8409 and `그레이브홀 성` at ID 8409's related Keep reference. | The same English place name is rendered with different Korean consonants in the active draft. Confirm a canonical form in the integrated name pass. | Medium |
| 8537 | Hallam the White / “his pet” / House of Ballads | Preserve the contemptuous “pet” insult and keep the faction name consistent. | Korean retains the insult and threat but uses `하우스 오브 발라드`, unlike the translated/name-paired form at ID 8428. | Medium |
| 8540 | Maid of Windemere / House of Ballads | Reconcile `시녀` with the title's possible maiden/heroine sense and keep it consistent with IDs 8428 and 8523. | English title `Maid` is ambiguous; Japanese uses a heroine-like epithet and Chinese says maiden. Korean consistently uses `시녀` in these entries, but the title sense remains open. | Medium |
| 8549 | Vipers / Crows | Standardize the team names, especially `Crows` against ID 8393. | Korean uses `크로우스` here but `크로우즈(Crows)` at ID 8393. The line otherwise preserves the team comparison and army hyperbole. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 8500-8501, 8517, 8523, and 8526
  against all four language rows.
- Added questions for ID 8505's maternal-line specificity and the recurring
  `Travelers`, `Maid of Windemere`, `Gravehal`, and `Crows` name forms after
  comparing nearby active Korean rows.
- These are preliminary candidates only. No historical or cross-row note
  authorizes a translation change.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts match across all four locales,
  including the ten-line poem at ID 8523 and the blank paragraph/reagent list
  at ID 8529.
- Extracted brace/control tokens, angle-bracket markers, and named icon
  markers match in identity and order across all four locales.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.

## Batch Status

IDs 8500-8549 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
