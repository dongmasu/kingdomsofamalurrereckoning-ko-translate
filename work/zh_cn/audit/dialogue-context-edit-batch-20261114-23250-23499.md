# Dialogue Context Translation Edit Batch: IDs `23250`-`23499`

- Date: 2026-11-14.
- Rechecked all 19 candidate findings in the range against current English,
  Japanese, Chinese, and Korean. English established meaning, Japanese guided
  voice/register, and Chinese supported the comparison.
- Applied 17 supported corrections; two findings (`23346`, `23469`) were
  already reflected in the current Korean. No speaker, gender, branch, or
  playback order was inferred from asset association.
- Applied five linked corrections outside the range, for 22 edited IDs total.

## Applied Corrections

| ID(s) | Correction |
| --- | --- |
| `23251`, `15965` | Changed the repeated `the Headsman is gone` clause to `처형인이 죽었다`, supported by Japanese and Chinese and by the preceding quest outcome. The paired title and Betheli spelling were already correct. |
| `21512` | Corrected the Betheli spelling and paired `처형인(Headsman)`; retained both the strange magic and the revenge motive. |
| `23252` | Used the established short faction form `성약단(The Testament)` and clarified that the victims' anger and vengeance are embodied in the speaker. |
| `23301` | Rephrased the reed image so it is rigidly unbending and soon breaks, without losing the source's threat. |
| `23320` | Recast the awkward “saved my people from their flaws” phrase naturally and described the Hyperian as being raised/launched, supported by the Japanese and Chinese. |
| `23326` | Corrected “the man he longed to be” without assuming Nix's gender; retained the gentlemanly duel and fair-combat outcome. |
| `23342`, `18242` | Aligned their identical English opening sentence as `지금 행동해야 이 일을 막을 수 있어`; retained their different reward clauses. |
| `23381` | Corrected `시리 페이` to the established `시일리` for `Seelie`. |
| `23402` | Replaced modern bar slang `원샷해` with `끝까지 들이켜`, preserving the rough encouragement. |
| `23405` | Changed the imperative quest objective to the established `-하기` form. |
| `23413` | Replaced the isolated `-오` register with conversational plain speech, matching the Japanese style; preserved the mask's sacrifice, Prismere, the speaker's god, and the trailing ellipsis. |
| `23430` | Paired the complete creature title as `투아사 약탈자(Tuatha Raider)`. |
| `23431` | Restored `사반트(Savant)` as a formal rank and clarified the exceptional skills that qualify its members. |
| `23446` | Replaced the stiff isolated `-군` with conversational `-구나`, retaining the remaining reward dialogue. |
| `23452` | Changed the quest-failure status to concise plain journal text, matching the same-source status at `46156`. |
| `11896`, `23465`, `34765` | Aligned the identical bounty-completion sentence to one natural journal-style construction while preserving each distinct family name. |
| `23468` | Added the missing English pairing to `해변석(Beachstone)` without changing the material list. |
| `23499` | Recast the father-to-son inheritance sentence naturally and retained the map's hidden family treasure locations. |

`23346` already paired the complete `Ballads Library` label. `23469` already
used `성약단(The Testament)` and accurately retained the poisoning and
cistern actions, so neither was changed. The meaning and register findings at
`23266`, `23298`, `23349`, `23393`, and `23486` remain held as documented.
Other previously recorded Headsman references were checked; no unrelated
`Executioner` title was conflated with `Headsman`.

## Verification

- Only the 22 edited IDs' `source_fingerprint` values were refreshed; all
  other ledger bytes and fields were preserved.
- The ledger validates all 65,135 IDs against the four current language
  tables. The quest index and both context catalogs reproduce byte-for-byte.
- The default CSV retains its UTF-8 BOM, 65,135 ordered data rows, 71,845
  CRLFs, and 244 LF-only record endings.
- The 20 CSV-preservation and context-index regression tests passed.
- `git -c core.whitespace=cr-at-eol diff --check` passed.

The next sequential candidate range is `23500`-`23749`.
