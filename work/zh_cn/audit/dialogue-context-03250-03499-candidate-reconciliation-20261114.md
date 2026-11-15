# Candidate Reconciliation: IDs `3250`-`3499`

- Date: 2026-11-14.
- Rechecked all 12 current `overall=candidate` IDs in the interval against
  English, Japanese, Chinese, active Korean, and their linked review reports.
- Four in-range corrections were applied; eight candidates were retained
  because the supported wording was already present.
- A whole-file `Banshaen` pairing search found one related lowercase form at
  `52239`; its English pairing was capitalized to match established usage.
  The separate lore-relationship question at that ID remains unresolved.
- No speaker or playback order was inferred from asset association.

## Applied Corrections

At `3301`, the quest objective `Search Turin for the Scroll` was phrased as
though the scroll were merely located in Turin. It now reads
`투린(Turin)을 수색해 두루마리 찾기`, making Turin the object of the search.

At `3303`, `위압감 있으면서도 아름다운` implied a contrast absent from the
English and Japanese. The recollection now coordinates the traits naturally:
`둘 다 키가 크고 위엄도 있었고, 아름다웠던 걸로 기억해.`

At `3373`, the same creature name was paired as lowercase `banshaen`, unlike
the established `Banshaen` form at `54432` and `61419`. The English pairing
now matches that capitalization.

At `3489`, polite endings and `저처럼` conflicted with `내 거처`. It now uses
`제 거처`, consistently maintaining the speaker's polite first-person voice.

## Related Correction

At `52239`, the same creature name also appeared as `밴션(banshaen)`. It now
uses `밴션(Banshaen)`. The existing uncertainty about the lore-specific
relationship among the Banshaen, Murghan clans, and Tuatha Deohn is unchanged.

## Retained

- `3253` already uses the source-supported alchemical term `조제법` after the
  separate SQ12 terminology pass.
- `3269` already localizes both `destiny` display labels as `운명` and
  preserves `{*1...}` and `{LINE_SPACE}`.
- `3307` already pairs the complete title `Argine, Queen of Staves`; all 26
  exact-English occurrences have the same complete Korean label. The
  separate lore question about the title's in-world meaning is not reopened.
- `3312` already identifies the waiting area as `검투사 대기장`, consistent
  with the Japanese source.
- `3330` already preserves the four embedded line breaks present in all four
  language tables.
- `3351` keeps the quoted term `Fatesworn` itself as the subject of the
  question rather than translating the term before asking what it means.
- `3414` already uses the natural category label `이로운 효과 범주`.
- `3447` already reads naturally in plain conversational Korean and preserves
  the poisoned Fae and the advice about dealing with him.

## Verification

- All 12 in-range candidates have a decision in the accompanying manifest.
- Only Korean `Texto` fields for `3301`, `3303`, `3373`, `3489`, and `52239`
  changed; only those five `source_fingerprint` values were refreshed.
- Line-break counts match across English, Japanese, Chinese, and Korean for
  all 12 candidates. The 26-row `Argine, Queen of Staves` group has one
  identical source string per language and one identical, fully paired
  Korean string.
- The 65,135-row ledger and generated index/catalog checks passed. Both
  regression suites passed (11 CSV-preservation tests and nine context-index
  tests). The CSV retained its UTF-8 BOM and existing line endings
  (71,838 CRLF, 244 LF-only, zero bare CR); the CRLF-aware diff check passed.
- Sequential candidate reconciliation now covers 210 of 4,015 current
  candidates (5.23%); 3,805 remain unreconciled.
- No commit was made.
