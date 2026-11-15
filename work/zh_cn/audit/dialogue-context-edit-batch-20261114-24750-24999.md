# Dialogue Context Translation Edit Batch: IDs `24750`-`24999`

- Date: 2026-11-14.
- Rechecked all ten new correction candidates and four retained candidates
  against current English, Japanese, Chinese, and Korean rows. English
  established meaning, Japanese guided voice/register, and Chinese supported
  the comparison.
- Applied 13 supported corrections in the range and 14 linked-ID updates,
  for 27 changed IDs total.
- Three unresolved findings remain held: `24772` (Aster's Korean spelling),
  `24786` (addressee/register), and `24958` (Orison's referent).
- No speaker identity or dialogue order was inferred from asset associations.

## Applied Corrections

| ID(s) | Correction |
| --- | --- |
| `24753` | Replaced the mistranslated status `고용 대기` with the role `수행원(Retainer)`. |
| `24754` | Paired the complete `Flawless Mitharan Executioner's Handle` item label. |
| `24765` | Added the missing Fara and Raf spellings and clarified the sequence of missing people and discovered bodies. |
| `24780` | Corrected `as a token` from a returned favor to `동맹의 증표로`. |
| `24788`, `44294`, `45386`, `57901` | Treated Adarus as the place `아다루스 동굴(Adarus Hollow)`, not a person or generic hollow, retaining the fragment at `24788`. Existing rows `31085` and `57408` already used the established full form. |
| `24798` | Added the established `샘(The Font)` pairing. |
| `24824` | Made the empty bottle's value explicit as about 20 gold pieces, not a count of 20 bottles. |
| `24846` | Clarified that the confiscated supplies are to be destroyed. |
| `24874` | Restored the named creature `베어사크(Baresark)` and the established `-하기` objective form. |
| `24907` | Paired the complete group/title `Prime Justicars`. |
| `24937`, `2915`, `3253`, `5172`, `11805`, `28107`, `29990`, `33659`, `45875`, `51043`, `59200` | Standardized references to Nanne's alchemical formula as `조제법`; five other reviewed references already used this form. |
| `30806` | Corrected the linked SQ12 title from cooking `조리법` to the alchemical `조제법`, preserving the title's wordplay. |
| `24939` | Restored `The` in the complete title pairing `세이블의 서신(The Missives of Sable)`. |
| `24966` | Paired the complete creature/rank name as `니스카루 군주(Niskaru Lord)` before Balor's name. |

## Already Resolved Or Held

- `24993` already uses the established `무기 교관` term; no edit was needed.
- Earlier findings `24771` and `24959` were already resolved in the active
  Korean text; no edit was needed.
- Existing candidates `24788`, `24798`, and `24937` were corrected above.
- Existing holds `24772` and `24786`, and the new hold `24958`, remain
  unchanged because the compared sources do not settle their meanings.
- The separate SQ12 mention at `4244` remains outside the formula
  harmonization: Japanese may refer to the concoction rather than its method.

## Verification

- Refreshed only the 27 changed IDs' `source_fingerprint` values. The ledger
  validates all 65,135 IDs against the four current language tables.
- The quest index and both context catalogs reproduce byte-for-byte.
- The default CSV retains its UTF-8 BOM, 65,135 ordered rows, and existing
  71,845 CRLF / 244 LF-only newline inventory.
- All 20 CSV-preservation and context-index regression tests passed.
- `git -c core.whitespace=cr-at-eol diff --check` passed.

The next sequential candidate range is `25000`-`25249`.
