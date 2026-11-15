# Dialogue Context Translation Edit Batch: IDs `11000`-`11999`

- Date: 2026-11-13.
- Scope: re-adjudicate 17 new correction candidates across four sequential
  revalidation reports against current English, Japanese, Chinese, and Korean
  rows; check directly related terminology occurrences.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- Speaker attribution and playback order were not inferred from asset links.

## Decisions

All 17 new correction candidates were rechecked and their supported
corrections applied. Evidence-limited questions remain held, including the
unresolved specialized mining terminology in the `11599` journal.

The edits clarify the source-local nickname `First`, replace the unsupported
disparaging `그 일당`, restore the contrast in `내 본래 목소리`, remove a
stacked royal honorific, make the resurrection implication explicit in the
Octienne letter, restore the future caravan route in the journal, clarify
the relic pieces in the warning, and repair the application-paper,
performance, ability-cost, and Anker subject wording.

Term checks were extended to related rows. The official Korean manual
(`references/manual/Kingdom of Amulur 공식 한글 설명.pdf`) establishes `시약`
for alchemical reagents and `에픽 보석` for Epic Gems. The latter was aligned
at `167`, `11125`, and `38457`; the unrelated `pristine quality` tier at
`11125` remains unchanged. In the `11599` mining journal, both `groover`
references now match the mining role at `19029`, and both `assayer`
references match the established occupation at `14767`. Other specialist
mining terms were not guessed or normalized.

The `Curseeker` spelling at `11907` was checked against the Japanese and
Chinese lines and the established `Cureseeker` ballad terminology throughout
`base` and `default`; it now uses `치유를 구하는 자(Cureseeker)`.

## Application and Verification

- The ID-scoped application manifest is
  [`dialogue-context-edit-batch-20261113-11000-11999.json`](dialogue-context-edit-batch-20261113-11000-11999.json).
- Applied 21 guarded text-field operations to 19 unique rows with
  `tools/replace_text_preserve_eol.py`; the four-language ledger fingerprint
  was refreshed only for those IDs.
- Reversing the manifest operations in memory restored its exact input CSV
  SHA-256. The CSV retains its UTF-8 BOM, all 65,135 rows, 71,845 CRLF
  endings, and 244 LF-only endings.
- The full 65,135-ID ledger fingerprint check, index/catalog reproducibility,
  nine context-index tests, 11 CSV-preservation tests, and CRLF-aware
  `git diff --check` passed.
- Output SHA-256: CSV
  `fcca58a1f6271b1851b351067723e1ee1d4659a5659e0e7fdba3d0064911c194`;
  review ledger
  `c83b79b26b689dd0cafa42adf4907827f37c16d7e6f8f4d049bba6450f0c9bcb`.
- No source CSV, extracted asset, or game binary was modified.

The 17 new candidates in this range are adjudicated. Cumulative candidate
adjudication now covers 422 of approximately 3,155 (about 13.4%); later
candidates remain in progress.
