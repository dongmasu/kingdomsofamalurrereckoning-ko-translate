# Candidate Reconciliation: IDs `26750`-`26999`

- Date: 2026-11-14.
- Rechecked all 13 correction candidates against the same-ID English,
  Japanese, Chinese, and active Korean rows, plus the prior edit and
  context-revalidation reports.
- Ten previously applied corrections remain supported. `26916` already
  matches the accepted wording for the same English sentence at `23919`.
- Further refined two existing corrections: the quoted-stone passage at
  `26783` now reads more clearly, and `26939` explicitly says Enconeg
  rewarded the narrator for helping. These changes preserve the source
  meaning and are reflected in the active CSV.
- The evidence-limited hold at `26912` remains unresolved and is not part of
  the candidate tally.

## Candidate Decisions

| IDs | Decision and evidence |
| --- | --- |
| `26762`, `26781`, `26866`, `26880`, `26884`, `26897`, `26921`, `26929`, `26933`, `26940` | Confirmed the active, source-supported corrections: the Ainmhi name pairing, the non-agentive account of people who learned too much, conversational imperative, Syllareta and Dartan spellings, the named force `비탄의 힘(Sorrows)`, Belen's Testament faction, Witch Knight spacing, The Burn location, and action-objective form. |
| `26783` | Further refined the quoted reflective-stone description and surrounding historical phrasing. The Tyrenium, Scholar Joson, Basilica Gnostrum, and trec references remain paired with English names; all nine logical line breaks and paragraph layout are preserved. |
| `26916` | Retained. Its Korean already matches the same-English sentence at `23919`; the Japanese and Chinese counterparts also match. |
| `26939` | Clarified the journal sentence so the reward recipient is explicit: `엔코네그(Enconeg)는 고마움의 표시로 내게 보상을 줬다.` This preserves the first-person meaning of the English and Japanese sources. |

The linked objective at `16778` is identical to `26940` in English,
Japanese, Chinese, and Korean. It was checked as a consistency reference but
was not counted as another candidate in this range. The existing hold at
`26912` remains unresolved because English and Chinese say “Very noble”
while Japanese says “thank you.”

## Verification

- All 13 candidate IDs were reconciled; none was previously counted in a
  machine-readable candidate-reconciliation batch.
- Only `26783` and `26939` were further edited in this follow-up. Only their
  `source_fingerprint` fields were refreshed; the full 65,135-ID
  four-language ledger check passed.
- Embedded line-break counts match across all four languages for all 13
  candidates. `26783` has nine logical breaks in each language.
- `16778` and `26940` are identical across all four languages.
- CSV-preservation tests: 11 passed; context-index tests: 9 passed.
- The active CSV retains its UTF-8 BOM and existing newline inventory:
  71,838 CRLF, 244 LF-only, and no bare CR.
- Cumulative candidate reconciliation is 1,549 / 4,015 (38.58%), with
  2,466 not yet reconciled.
- No source CSV or extracted game asset was changed; no commit was made.

The next sequential candidate range is `27000`-`27249`.
