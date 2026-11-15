# Dialogue Context Translation Edit Batch: IDs `8000`-`8999`

- Date: 2026-11-13.
- Scope: recheck the correction candidates in the four sequential reports
  against current English, Japanese, Chinese, and Korean rows; apply
  source-supported corrections and directly related terminology or duplicate
  fixes.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- Speaker attribution and playback order were not inferred from asset links.

## Candidate Decisions

The reports contain 46 correction candidates. Forty-two were corrected:

`8022`, `8105`, `8135`, `8177`, `8191`, `8214`, `8235`, `8258`, `8294`,
`8301`, `8463`, `8467`, `8523`, `8536`, `8553`, `8577`, `8617`, `8625`,
`8628`, `8653`, `8662`, `8684`, `8694`, `8738`, `8742`, `8749`, `8755`,
`8788`, `8795`, `8814`, `8817`, `8831`, `8848`, `8855`, `8864`, `8877`,
`8886`, `8904`, `8928`, `8969`, `8978`, and `8997`.

Three candidates were already resolved by an earlier edit and were not
rewritten: `8190`, `8516`, and `8663`. The conflicting compliment at `8992`
remains held because the English and Japanese evaluations differ; no
speaker/context evidence settles the intended nuance.

The accepted corrections address conversational phrasing, objective and
effect wording, complete name/title pairings, established spellings, the
fate-related `Weave` term, and the naturalness and English pairing of the
seven-paragraph Skratta history. The ten-line Nix poem at `8523` retains its
existing line structure. The long book and journal entries retain their
paragraph and embedded-line-break structure.

Related repeated or terminology rows were checked in full. This includes
`Victor's Brew`, `Lord of the Chase`, `Acathan`, the deadly Headhunter
descriptions, `Marten Strand`, and `Long Winter`. Exact-English copies were
not made uniform where their full source context did not support it.

## Application and Verification

- The batch changed 59 unique Korean rows, including related rows outside
  this numeric range. Three exact-English copies already corrected in an
  earlier batch were left untouched.
- Edits were applied by exact `default` ID through
  `tools/replace_text_preserve_eol.py`; only the changed IDs' four-language
  ledger fingerprints were refreshed.
- The CSV post-edit SHA-256 is
  `b5d36d211ba22d30918aee19644cc6a328e2ae2f18d6976cc88a10f48bf5e9a9`.
  It retains the UTF-8 BOM, 65,135 rows, 71,845 CRLF record endings, and 244
  LF-only record endings.
- Ledger fingerprints, exact-English duplicate consistency, index/catalog
  reproducibility, CSV-preservation tests, context-index tests, and the
  CRLF-aware diff check were verified.
- The 46 candidates in this range have been adjudicated, bringing the
  cumulative candidate count to 292 of approximately 3,155 (9.3%). This is
  not full resolution; `8992` remains on hold and later ranges remain.
- No source CSV, extracted asset, or game binary was modified.
