# Dialogue Context Translation Edit Batch: IDs `9000`-`9999`

- Date: 2026-11-13.
- Scope: re-adjudicate the 62 candidates in the four sequential
  revalidation reports against current English, Japanese, Chinese, and Korean
  rows; make source-supported changes and directly related duplicate fixes.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- Speaker attribution and playback order were not inferred from asset links.

## Candidate Decisions

The 62 reported candidates were checked individually. The following 58 were
accepted for correction:

`9035`, `9056`, `9072`, `9091`, `9124`, `9132`, `9175`, `9193`, `9211`,
`9227`, `9249`, `9264`, `9279`, `9299`, `9302`, `9322`, `9323`, `9342`,
`9360`, `9364`, `9375`, `9382`, `9384`, `9393`, `9402`, `9405`, `9407`,
`9413`, `9429`, `9447`, `9473`, `9483`, `9485`, `9487`, `9488`, `9568`,
`9577`, `9597`, `9646`, `9647`, `9673`, `9684`, `9744`, `9746`, `9748`,
`9763`, `9774`, `9828`, `9839`, `9844`, `9867`, `9880`, `9886`, `9905`,
`9936`, `9982`, `9988`, and `9989`.

Four candidates were retained without a new edit:

- `9304`: the current `교만의 시종(Knave of Pride)` already has a complete
  English pairing and follows an earlier accepted, source-contextual
  rendering. The distinct title/role uncertainty remains documented.
- `9627`, `9691`, and `9721`: the current rows already contain the complete
  English pairings proposed by the reports.

The text-level corrections cover the full identified quest journal, book,
letter, UI label, effect description, and dialogue sentence rather than
isolated vocabulary. In particular, the `9405` book keeps its existing
paragraph layout while clarifying named references and awkward wording;
`9342` retains its four-part quoted instructions; and `9763` retains its
five-line poem layout.

Before application, a manifest audit found that several edits for the `9405`
book had been assigned to the unrelated `9342` hammer instructions, and vice
versa. Those ID assignments were corrected against the full English and
Japanese rows; an unrelated council edit was removed. A final read-through
also added the missing first-mention pairing for Ysa in the `9405` verse.
The corrected manifest contains 73 edit rules and 96 ID-scoped applications
across 80 unique rows.

Repeated English was checked across all matching IDs. The final name/title
form for `Irion, King of Cups` is aligned across its 20 exact-English rows.
The `Nuer's Blasphemy` objective is aligned at `9746` and `9886`; the
`9763` poem correction is also applied to its exact-English copy at `59459`.
Other exact-English copies corrected together are `9364`/`11418` and
`9413`/`62768`.

## Application and Verification

- The ID-scoped application manifest is
  [`dialogue-context-edit-batch-20261113-9000-9999.json`](dialogue-context-edit-batch-20261113-9000-9999.json).
- Changes were applied sequentially through
  `tools/replace_text_preserve_eol.py`; four-language ledger fingerprints
  were refreshed only for the 80 edited IDs.
- Verification passed for the 65,135-ID ledger, index and catalog
  reproducibility, 20 CSV-preservation/context-index tests, exact-English
  duplicate groups, and the CRLF-aware diff check. The CSV retains its UTF-8
  BOM, 65,135 rows, 71,845 CRLF, and 244 LF-only endings.
- Final SHA-256 values are
  `950101024fa845f34fb677bcb0245bbc7e9d2c48b4cbf428b24d5cca130bab82` for
  the CSV and
  `fe28e890a1b4a41b3c30d31adde626d097323f34c9ba0e91d6a3442b4b1ae474` for
  the review ledger.
- No source CSV, extracted asset, or game binary was modified.
- Evidence-limited findings in the range reports remain unresolved; a
  correction-candidate count is not a claim that every ambiguity is settled.
