# Dialogue Context Translation Edit Batch: IDs `24500`-`24749`

- Date: 2026-11-14.
- Rechecked all ten new correction candidates and eight retained candidates
  against current English, Japanese, Chinese, and Korean rows. English
  established meaning, Japanese guided voice/register, and Chinese supported
  the comparison.
- Applied 13 supported corrections within the range and two linked-ID
  corrections (`27929`, `35478`), for 15 changed IDs total.
- Three retained findings were already resolved in the active Korean text.
  `24716` remains held because the sources differ on whether the Hierophant's
  task was assigned or its reward received.
- No speaker identity or dialogue order was inferred from asset associations.

## Applied Corrections

| ID(s) | Correction |
| --- | --- |
| `24506` | Recast the sentence in consistent plain conversational speech, matching the Japanese register while retaining the missionary/pilgrim distinction. |
| `24546` | Paired the complete creature/rank name as `니스카루 군주(Niskaru Lord)`. |
| `24578` | Added the exact source-local organization form `스콜리아 아르카나(Scolia Arcana)` without silently changing `Scolia` to the separately attested `Scholia`. |
| `24589` | Removed redundant suffering language and clarified that the speaker hopes to help the victims while still having time to reach the Counsel. |
| `24600` | Paired the complete item label `Flawless Mitharan Infected Rivets`. |
| `24639` | Treated `Child of Dust` as a direct form of address and paired the complete title. |
| `24648` | Replaced `예언자` with the established role term `선견자` in the item-name fragment. |
| `24660`, `35478` | Kept the already-correct `퍼스트 소드 처치` at `24660` and aligned its exact-English duplicate `35478` to the same Korean text. |
| `24661` | Corrected `pedestal` from `제단` to `받침대`, matching the related quest objective and Japanese/Chinese. |
| `24666` | Restored the omitted initial article in the complete title pairing: `나무와 가지(The Tree and the Branches)`. |
| `24718` | Clarified the contrast between raising some people up and casting others down. |
| `24722` | Recast the awkward literal image as things that cannot be erased from sight even with drink. |
| `24729`, `27929` | Paired the Sun Stone and Storm Stone with their complete English names in the coordinated artifact references; retained the established source-local `Frost Stones` form. |
| `24730` | Paired the complete item label `Master Mitharan Immunity Lining`. |

## Already Resolved Or Held

- `24590` already uses the accepted short form `성약단(The Testament)` and
  preserves the revenge and poisoned-water meaning; no edit was needed.
- `24624` already contains the complete reviewed names and terms for the
  Headsman, Midden, Tinehil, Alfar, and Betheli Jons; no edit was needed.
- `24693` already uses the established Gertern Asker, Bristletongue Seeds,
  and Asker's Alley forms; no edit was needed.
- `24716` remains unchanged: English `has been awarded` can mean assignment,
  while Japanese and Chinese support a reward reading.

## Verification

- Refreshed only the 15 changed IDs' `source_fingerprint` values. The ledger
  validates all 65,135 IDs against the four current language tables.
- The quest index and both context catalogs reproduce byte-for-byte.
- The default CSV retains its UTF-8 BOM, 65,135 ordered rows, and existing
  71,845 CRLF / 244 LF-only newline inventory.
- All 20 CSV-preservation and context-index regression tests passed.
- `git -c core.whitespace=cr-at-eol diff --check` passed.

The next sequential candidate range is `24750`-`24999`.
