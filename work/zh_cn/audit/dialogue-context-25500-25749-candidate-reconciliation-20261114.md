# Candidate Reconciliation: IDs `25500`-`25749`

- Date: 2026-11-14.
- Rechecked all 13 current candidate IDs in the range against active Korean
  and same-ID English, Japanese, and Chinese rows, prior findings, and the
  current edit-batch report. Also checked linked candidate `58994`.
- `25713` had already been counted in an earlier linked review. The other
  twelve in-range candidates and linked candidate `58994` are newly counted.
- The active CSV did not fully reflect the prior report at `25713` and
  `25742`; those two rows were corrected in this follow-up.
- Asset and handler associations were not treated as proof of speaker or
  dialogue order.

## Candidate Decisions

| IDs | Decision and evidence |
| --- | --- |
| `25526`, `25549`, `25553`, `25595`, `25596`, `25599`, `25627`, `25632`, `25699`, `25700`, `25727` | Confirmed the source-supported wording recorded in the edit-batch report. English anchors meaning; Japanese guides voice/register and layout; Chinese supports the comparison. |
| `25713` | Corrected the active line to `로포쿠(Lopoku)께 감사해야겠네! 신세 졌어!`. This keeps the canonical deity spelling, invokes Lupoku in the first clause, and returns to casual thanks to the rescuer in the second, matching English and Japanese. |
| `25742` | Clarified the supported number and recipient: `신병 다섯 명에게 ... 한 병씩`. The linked Bogstaunch quest text and Japanese/Chinese sources establish five individual recruits, not five squads or crews. The existing `보그스턴치(Bogstaunch)` pairing is consistent with other uses. |
| `58994` (linked) | Retained the exact Korean duplicate of `25576` and `63906`, `벨렌의 성약단(Belen's Testament)`. English, Japanese, and Chinese are identical across the three IDs; no duplicate inconsistency remains. |

The English-identical gift-check group at `25595`, `37899`, `37948`, and
`59623` was checked as a unit. `25595`, `37948`, and `59623` use the same
plain-style Korean; `37899` remains polite in line with its Japanese source.

## Evidence-Limited Holds

- `25544`: The fragment may depend syntactically on the preceding clause;
  leave it unchanged without mapped dialogue context.
- `25615`: Register remains unresolved because asset association does not
  establish speaker or scene stage.
- `25720`: The Bodan pairing is present; the separate Aster spelling question
  remains open and was not conflated with this candidate reconciliation.

## Previously Counted ID

`25713` was previously counted in the `13500`-`13749` linked review and is
not counted twice. `58994` is counted here as a linked candidate because its
current ledger disposition was still a correction candidate and it had not
appeared in an earlier candidate-reconciliation tally.

## Verification

- Reconciled 13 in-range candidates and one linked candidate; 13 IDs are
  newly counted.
- Changed only Korean `Texto` at `25713` and `25742` in this pass. Refreshed
  only those two `source_fingerprint` fields.
- The full review ledger validated against all four current language tables;
  the context index and catalogs reproduced byte-for-byte.
- The 20 CSV-preservation and context-index regression tests passed. The
  preservation editor verified record structure and unchanged bytes outside
  both target fields.
- The current CSV has 71,838 CRLF and 244 LF-only line endings, four fewer
  CRLFs than the earlier edit-batch report recorded. Both edits contain no
  line breaks, and the editor preserved every byte outside the target fields;
  this discrepancy therefore predates this follow-up. No newline
  normalization was performed.
- Cumulative candidate reconciliation is 1,447 / 4,015 (36.04%), with
  2,568 not yet reconciled.
- No source CSV or extracted game asset was changed; no commit was made.
