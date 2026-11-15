# Dialogue Context Translation Edit Batch: IDs `16000`-`16999`

- Date: 2026-11-14.
- Scope: re-adjudicate all 36 current correction candidates in this range
  against current English, Japanese, Chinese, and Korean rows, then apply
  source-supported corrections and align directly related groups.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- No speaker or playback order was inferred from asset associations.

## Decisions

Thirty candidates received source-supported corrections. Three were already
resolved in the active Korean, and three were retained. No current candidate
remains on hold.

The edits correct meaning, naturalness, register, name pairing, and
terminology, including silver as a material, Scholia Arcana initiates,
City Watch navigation, the Maid's projection, the Fastings, the Sagecraft
altar, and the Carver title. The edits retain the source verse breaks and
preserve the distinct quest-log, dialogue, and instructional registers.

The SQ122 notice-delivery findings were rechecked together across the full
quest group. The named military item is consistently `복무 소집 통지서
(Notices of Duty)`; generic references use `통지서`. The Officer's Hall and
City Watch labels use their established paired forms. The formal hero-directed
line remains polite, while the quest-failure journal line uses plain style.

The SQ108 group was checked for the standalone capitalized `Chosen` title.
IDs `16171`, `16988`, and `63399` now use the paired plural form;
`Ragnarr's Chosen` entries remain unchanged. The exact-English Carver poem at
`7257` and `16758` is paired identically. All six `Cliffbreak Fasting`
references were aligned.

Three earlier proposals were not reopened because the current ledger already
dispositions them as `not-issue`: IDs `16276` and `16414` are not part of the
current candidate set; ID `16681` was already reflected in the active Korean.
ID `16687` already uses the established `연도문` term. IDs `16767`, `16921`,
and `16943` were retained after source comparison.

The ID-scoped operations and source-based rationales are recorded in the
[application manifest](dialogue-context-edit-batch-20261113-16000-16999.json).

## Application and Verification

- Applied 50 guarded text operations to 49 unique `default` IDs through
  `tools/replace_text_preserve_eol.py`.
- Refreshed only the four-language fingerprints for those 49 edited IDs.
- Reversing the text operations and restoring ID `16927`'s original
  unquoted-field representation reproduces the exact input CSV SHA-256:
  `be652801f9430795e11b93dcf567fff9230da6ff246e8fef8736da98341e4f28`.
  The new English name contains ASCII quotation marks, so the CSV helper
  correctly quotes and escapes that target field.
- Output CSV SHA-256:
  `b26b705ddf6466f1698f31c359a4090b303abfdb822e4e41023ab8dc3c146f9b`.
- Output review-ledger SHA-256:
  `a92948802621611b7783717bb5e0f9de283e30bb738f01bb9d60e2d545b4f3f0`.
- The CSV retains its UTF-8 BOM, 65,135 ordered records, 71,845 CRLF record
  endings, and 244 LF-only record endings. Edited fields retain their
  existing line-break and runtime-token signatures.
- The review ledger validates for all 65,135 IDs. Index and both catalog
  reproducibility checks passed. The CSV-preservation suite passed 11 tests,
  the context-index suite passed 9 tests, and CRLF-aware `git diff --check`
  passed.
- No source CSV, extracted game asset, localization binary, or PAK was
  modified. No commit was made.

Candidate adjudication now covers 636 of approximately 3,155 candidates
(about 20.2%). Later candidates remain in progress.
