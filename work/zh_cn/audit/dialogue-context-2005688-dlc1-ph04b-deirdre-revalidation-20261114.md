# Dialogue Context Revalidation: `2005688.quest_bxml`

- Date: 2026-11-14.
- Scope: all 108 `default` IDs linked to this asset by exact 8-byte key
  match.
- The extracted asset contains `QUEST_ID` / `DLC1_PH04b`, the NPC symbol
  `DLC1_NPC_GAL_DOK_DeirdreGwint`, and 35 conditional dialog-line handlers.
  The quest value is mixed-case, so the current uppercase-only quest-ID
  extractor does not include it in the generated catalog.
- These are asset-level clues only. No handler was mapped to an individual
  localization ID; speaker attribution remains `unassigned` and playback
  order remains `unknown`.
- The asset catalog finds 108 IDs but records exact ledger links for 106.
  Existing ledger rows `47501` and `47611` list the asset as `2005688`
  without the `.quest_bxml` suffix. Their append-only metadata was not
  rewritten; the discrepancy is documented here.

## Translation Review

The 108 linked rows were checked against English, Japanese, Chinese, and the
active Korean text. Existing sequential-review findings were reopened where
relevant; asset association was not used to assign a speaker or sequence.

- Five exact-English duplicate groups cover 16 linked rows; Korean wording
  agrees within every group.
- Logical line-break counts and runtime/layout-token signatures match across
  all four languages for these IDs.
- `28144` already uses `요새 도서관`, consistent with the Japanese and Chinese
  references and the other `Keep Library` uses. The cross-CSV search found
  14 such source rows; no change was needed.
- `28751` called both `Modern Varani` and `Old Varani` simply `(Varani)`.
  Japanese and Chinese distinguish modern and old Varani as languages. The
  English pairings now read `현대 바라니어(Modern Varani)` and
  `고대 바라니어(Old Varani)`.
- `43309` refers to a person called Peregrine and contrasts them with the
  centuries-old book. Japanese transliteration, English capitalization, and
  Chinese's person-name wording support the English pairing; the Korean still
  leaves open whether it is the same person. Added `페레그린(Peregrine)`
  without asserting an identity.
- `52582` already uses conversational Korean (`가져와`, `번역해 줄게`),
  matching Japanese; no change was needed.
- `64193` already uses the established spelling `디어드리(Deirdre)` despite
  the English objective's local typo `Dierdre`; no change was needed.

Only `28751` and `43309` were edited. Their previous ledger dispositions and
all other fields were preserved; only their `source_fingerprint` values were
refreshed. No extracted asset or immutable source CSV was modified.

## Validation

All 65,135 ledger fingerprints validate. The generated ID index, asset
catalog, and all-ID catalog reproduce; the nine index tests and 11
CSV-preservation tests pass. The Korean CSV retains 65,135 records, its UTF-8
BOM, and its existing 71,838 CRLF / 244 LF-only newline inventory.
`git -c core.whitespace=cr-at-eol diff --check` passes.
