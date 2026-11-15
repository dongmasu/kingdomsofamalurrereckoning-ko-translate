# Dialogue Context Translation Edits: `36000`-`39999`

- Date: 2026-11-14.
- Rechecked 292 candidate IDs across the current English, Japanese, Chinese,
  and Korean rows. Applied 73 source-supported corrections, retained 187,
  and held 41 for insufficient or conflicting evidence. Candidate categories
  overlap where a row had more than one finding.
- English anchored meaning; Japanese guided register, honorifics, and form;
  Chinese was supporting evidence. Asset links were not treated as proof of
  an individual speaker or playback order.
- Corrections include distinguishing a named Gastyr court from House Gastyr
  (`36669`), clarifying that excess magic refers to quantity (`36738`),
  restoring the dismissive force of “deign” (`36863`), and correcting
  misleading wording about the Fae's position (`36618`). Proper names,
  objectives, conversational lines, and journal entries were checked in
  their text types.
- All 73 edits matched their expected old text before application. Runtime
  tokens and embedded line-break counts matched before and after each edit.
  The CSV retains 65,135 ordered rows, its UTF-8 BOM, 71,838 CRLF sequences,
  244 LF-only sequences, and no bare CR.
- Only the 73 corresponding ledger `source_fingerprint` fields were updated;
  the prior review dispositions and all other ledger bytes were preserved.
- The byte-preserving CSV regression tests, dialogue-context index tests,
  review-ledger fingerprint check, and CRLF-aware diff check passed. No
  source CSV, extracted game asset, or game binary was modified.
