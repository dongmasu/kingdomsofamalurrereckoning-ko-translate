# Missing Candidate Follow-up: IDs `46000`-`51999`

- Date: 2026-11-14.
- Reconciled the final application manifest against all ledger rows in the
  range whose historical `overall` value is `candidate`.
- The manifest omitted 42 candidate IDs. Current four-language evidence and
  the latest range reports were checked; dispositions are 21 new edits,
  17 retained, and four evidence-limited holds.
- This follow-up does not rewrite historical ledger judgments or infer
  speakers or playback order from asset association.

## Applied Corrections

| ID | Correction |
| ---: | --- |
| `46157` | Corrected the English name pairing to the exact source spelling `Avicenn Entelle`; retained the established Korean transliteration and clarified the recovery objective. |
| `46161` | Added `Malgar` and clarified that he must be removed from Tala-Rane, consistent with the linked kill objective. |
| `47026` | Recast the small-army comparison naturally and aligned the line's conversational register. |
| `47099` | Paired the full repeated source label as `Argine, Queen of Staves`. |
| `47111` | Standardized `High Priestess` to `대여사제(High Priestess)`, matching the established title at `61724`. |
| `47154` | Replaced the abrupt 하게체 ending with conversational plain speech. |
| `47200` | Standardized the establishment as `빅 헌트(The Big Hunt)` and made the invitation conversational. |
| `47202` | Rephrased the awkward passive construction as `맹렬한 기습을 당했다고`. |
| `47211` | Added the exact full pairing `Templar Julius Mavern`. |
| `47662` | Added `Wilda Brandan` to the named servant. |
| `47756` | Added the source pairing for `Lady of the Red Sands`. |
| `47815` | Corrected `band` from a group of companions to the Amrynthian crown, supported by the SQ02 context and `9604`. |
| `47863` | Replaced the literal `편도 여행` phrasing with a clear warning that the entry route cannot be reused. |
| `47905` | Smoothed the boast while retaining both the speaker's talent and training qualification. |
| `47937` | Removed the abrupt 하오체 shift and rendered the sacred aid as the power supported by Japanese. |
| `47944` | Changed the objective to the established `-하기` form. |
| `47949` | Aligned the dark joke and opening with the conversational plain register. |
| `49642` | Clarified that the objective is to follow the book's instructions. |
| `49700` | Standardized the Ratofer family document as `칙허장` and paired `Gordon`. |
| `49701` | Replaced object-like `그건` with the context-supported `그 늑대는`. |
| `51959` | Changed the faction possessive from `Travelers들의` to `Travelers의`; retained the source's count/list discrepancy without inventing a third camp. |

The machine-readable decisions, including exact old/new text, are recorded in
[`dialogue-context-final-edits-followup-46000-51999-20261114.json`](dialogue-context-final-edits-followup-46000-51999-20261114.json).
The current row at `51280` already has `로포쿠(Lupoku)`. Direct inspection of
the immutable English CSV confirms `Lupoku`; the later range report's claim
that English says `Lopoku` is incorrect.

## Retained And Held

- Retained: `46083`, `46799`, `46850`, `46998`, `47483`, `47572`, `47926`,
  `47929`, `48130`, `48440`, `50073`, `50270`, `50572`, `50951`, `51189`,
  and `51399`. The current text is already correct, a later review supersedes
  the historical candidate, or the candidate is not applicable to the
  current source.
- Held: `46403`, `47508`, `48231`, and `51806`. The referent, text type, or
  established terminology remains materially ambiguous.

## Verification

- Only the listed Korean `Texto` cells were edited with
  `tools/replace_text_preserve_eol.py`; the four held and 16 retained rows
  were not changed.
- Edited dialogue and objectives were rechecked against English for meaning,
  Japanese for voice/register, Chinese as supporting evidence, and Korean for
  naturalness, name pairing, and form.
- Ledger dispositions were preserved. Only fingerprints for edited IDs were
  refreshed.
- No source CSV, extracted asset, or game binary was modified.
