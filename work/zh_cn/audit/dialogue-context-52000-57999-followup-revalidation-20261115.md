# Candidate Reconciliation Follow-Up: IDs `52000`-`57999`

- Date: 2026-11-15.
- Rechecked the remaining held findings in the prior
  `52000`-`57999` final-application manifest against the current Korean,
  English, Japanese, and Chinese rows and the cited context reports.
- Four previously held in-range candidates and the linked duplicate `59142`
  are now resolved. `54422` and `56405` remain held for conflicting source
  evidence.
- Five Korean rows changed: `913`, `54189`, `55264`, `57501`, and `59142`.
  The accepted objective at `57597` was already present and was retained.

## Decisions

| ID(s) | Decision | Evidence and result |
| --- | --- | --- |
| `54189` | Corrected | English says the doctor is responsible for more bodies than expected; Japanese explicitly supports deaths caused. Replaced the unnatural image of “making corpses” with `그 훌륭한 의사가 생각보다 많은 사람을 죽게 했어.` Chinese can also be read as handling bodies; that disagreement is recorded rather than hidden. |
| `54422` | Held | English `our order` could name an organization, while Japanese `本学` and Chinese `学院` identify an academic institution. The Scholia Arcana study context does not establish the canonical Korean wording for this line. |
| `55264` | Corrected for naturalness | Replaced the repeated `겪다` construction with `그가 어떤 일을 겪고 돌아왔는지 생각하면, 나라도 별로 할 말은 없었겠지.` This keeps the return-circumstances framing supported by Japanese without adding an event or speaker identity; English and Chinese emphasize his actions, so the exact referent remains broad. |
| `56405` | Held | Japanese explicitly describes completing a sewer race; English and Chinese do not establish that event. The current concise `하수도를 질주했어` remains unchanged. |
| `57501`, `59142` | Corrected and unified | These are exact-English duplicates in the same `HV03` asset. ID `913` in that asset already renders the capitalized `Pit` as `투기장`, and Japanese likewise identifies a waiting/fighting area. Both rows now use the same `투기장(The Pit)` wording without asserting a more specific room. |
| `57597` | Retained; prior hold closed | The current `마녀 기사 말윈(Witch Knight Malwyn) 처치하기` already has the complete English name/title and the objective form. It matches the separate Malwyn consistency review; the old manifest mismatch is stale. |
| `913` | Related format correction | Added `(The Pit)` to the existing `투기장` label so the parallel line in the same asset uses the complete place-name pairing. This ID was not part of the candidate tally. |

## Verification

- Five ID-targeted edits used `tools/replace_text_preserve_eol.py`; only their
  `source_fingerprint` fields were updated.
- The exact-English duplicate rows `57501` and `59142` now match.
- The review-ledger check passed for all 65,135 IDs; CSV-preservation and
  dialogue-context-index tests passed (20 total).
- The active CSV retains its UTF-8 BOM, 65,135 ordered IDs, 71,839 CRLF
  endings, 242 LF-only endings, and no bare CR. The CRLF-aware diff check
  passed.
- Candidate reconciliation is `3,297 / 4,026` (`81.89%`), with `729`
  remaining. This adds five newly resolved candidate IDs; `59142` is counted
  once as a linked ID, and `913` is excluded from the candidate pool.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.

See the machine-readable
[`decision manifest`](dialogue-context-final-edits-followup-52000-57999-20261115.json),
the prior
[`52000`-`57999` application manifest](dialogue-context-final-edits-52000-57999-20261114.json),
and the prior
[`58000`-`65134` application manifest](dialogue-context-final-edits-58000-65134-20261114.json).
