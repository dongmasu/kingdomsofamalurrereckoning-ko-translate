# Translation Edit: `default:4182`

- Date: 2026-11-27.
- Scope: add the English source form to the second mention of Edwin.

## Decision

English names Edwin twice in this line. The first Korean mention already
included `(Edwin)`; the second did not. Japanese and Chinese also repeat the
name. The revised sentence now uses `에드윈(Edwin)을 찌르고`, without adding
an unsupported surname or changing the surrounding dialogue.

## Verification

- Changed only the `Texto` field for `default:4182` with
  `tools/replace_text_preserve_eol.py`.
- Updated only `default:4182`'s four-language `source_fingerprint`.
- No default occurrence-index or exact-English duplicate entry exists for this
  key; no source CSV, extracted asset, or game binary changed. No commit was
  made.
