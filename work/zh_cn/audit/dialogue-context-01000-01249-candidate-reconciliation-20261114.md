# Candidate Reconciliation: IDs `1000`-`1249`

- Date: 2026-11-14.
- Rechecked all 20 current `overall=candidate` ledger IDs in this interval
  against English, Japanese, Chinese, and the active Korean CSV.
- Six candidates received source-supported edits; 12 were already resolved in
  the active text; two remain held for insufficient or conflicting evidence.
- No speaker or playback order was inferred from quest-asset membership.

## Applied Decisions

The family-rank document in the Ratofer quest is a charter (`勅許状` in
Japanese), not a patent or generic permit. The term was aligned to
`칙허장` at `1012`, `8049`, and `8156`, including the repeated mentions in
the latter row.

The exact English label `Argine, Queen of Staves` occurs at 26 IDs. The
accepted Korean title is `지팡이 여왕 아르진`; the current project format
keeps the complete English name and title together as
`지팡이 여왕 아르진(Argine, Queen of Staves)`. The 23 inconsistent cells
were aligned; the three already matching cells were retained.

At `1136`, the archaic vocative `이방인이여` was changed to the direct,
conversational `이방인`, in line with the English plea and Japanese plain
request. No individual speaker was assigned. At `1158`, `산악 감옥` became
the context-supported `산속 감옥`. At `1217`, the grave and theft modifiers
were reordered to make clear that the ettin stole the charm from Imelda
Holn's grave; the journal register was preserved.

## Retained And Held

Already-correct candidates were retained at `1002`, `1018`, `1041`, `1061`,
`1129`, `1133`, `1137`, `1139`, `1151`, `1214`, and `1234`. ID `1200` was
also retained: it preserves the Eventide clan and Cycle meanings, an earlier
review found no issue, and the Eventide decision does not authorize globally
replacing source-local clan/people/land wording.

ID `1046` remains held because the English, Japanese, and Chinese poem lines
differ on whether the speaker can no longer be Dara, can never meet her, or
is no longer Dara. ID `1208` remains held because choosing a natural Korean
term for “my sister” would require speaker-gender or age information not
established by the English source; Japanese alone is not enough to add that
information.

## Verification

- The 29 ID-scoped edits were applied through
  `tools/replace_text_preserve_eol.py`; only their review-ledger
  `source_fingerprint` fields were refreshed.
- All 20 candidate IDs have a recorded retained, edited, or held disposition
  in the linked manifest:
  [`decision and edit manifest`](dialogue-context-final-edits-followup-01000-01249-20261114.json).
- The four-language ledger fingerprint check passed for all 65,135 IDs.
- CSV validation confirmed 65,135 ordered rows, the UTF-8 BOM, and the
  pre-existing newline inventory: 71,838 CRLF, 244 LF-only, and no bare CR.
- All 11 CSV-preservation tests, all nine dialogue-context index tests, and
  the CRLF-aware `git diff --check` passed.
- Candidate reconciliation now covers 55 of the current 4,015 candidates
  (1.37%). This is not full candidate review completion.
- No commit was made.
