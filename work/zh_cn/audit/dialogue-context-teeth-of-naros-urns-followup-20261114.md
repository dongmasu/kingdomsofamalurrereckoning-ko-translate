# Dialogue Context Follow-up: Teeth of Naros Urns

- Date: 2026-11-14.
- Rechecked the 18 quest-specific urn references identified in
  `dialogue-context-five-pending-assets-followup-revalidation-20261111.md`.
  English, Japanese, and Chinese support `유골함` for these ash-filled quest
  objects; this does not standardize unrelated pottery or urn references.
- The cross-check found that the approved correction at `54630` was still
  missing from the active CSV. It now uses `유골함` and describes the magic
  corrupting the beasts without the awkward "controlling them for evil."
- The same 18-row pass found particle errors at `6103` (`유골함를`) and
  `8606` (`유골함는`). Both particles and their references to the urns and
  Trolls were corrected; the conversational register was preserved.
- ID `35675` was also checked against its final follow-up manifest and
  already contains the approved Aurochs pairing and `영적인 일` wording; it
  was not changed in this pass.
- Only the Korean `Texto` fields for `6103`, `8606`, and `54630` changed.
  Only their four-language `source_fingerprint` values were refreshed.
- The active CSV retains its UTF-8 BOM, 65,135 ordered rows, 71,838 CRLF,
  244 LF-only newlines, and no bare CR. All 65,135 ledger fingerprints
  validate; 11 CSV-preservation tests, nine dialogue-context-index tests,
  and the CRLF-aware diff check pass.
- No commit was made.
