# Candidate Reconciliation: IDs `42750`-`42999`

- Date: 2026-11-15.
- Rechecked all 26 correction candidates against the active English,
  Japanese, Chinese, and Korean rows and the existing application findings.
  English anchors meaning; Japanese is the main voice and layout reference;
  Chinese is supporting evidence.
- Exact-source and proper-name cross-checks identified three linked rows,
  bringing this pass to 29 unique candidate IDs.
- The supported corrections were applied to four Korean rows:
  `27747`, `34443`, `42899`, and `54691`.

## Candidate Decisions

| IDs | Result |
| --- | --- |
| `42755`, `42779`, `42791`, `42812`, `42825`, `42834`, `42838`, `42841`, `42851`, `42853`, `42870`, `42883`, `42886`, `42902`, `42907`, `42909`, `42915`, `42941`, `42942`, `42950`, `42953`, `42961`, `42969`, `42994`, `42997` | Retained. The active Korean already has the supported name pairings, meaning, plain register, and action-label forms. `42909` uses the dominant established `틱네리(Ticneri)` spelling; the remaining inconsistent occurrence is addressed at linked ID `34443`. |
| `42899` | Changed the incomplete pairing `Maid of Windemere` to the established character title `The Maid`, retaining the Korean title and action-label ending: `윈더미어의 시녀(The Maid) 처치하기`. |

## Linked Source And Name Groups

| IDs | Result |
| --- | --- |
| `42812`, `54691` | English, Japanese, and Chinese rows are identical. Both Korean objectives now read `도시 경비대(City Watch) 방문하기`. The existing `42812` wording was retained and `54691` was aligned. |
| `27747`, `42851` | English, Japanese, and Chinese rows are identical. Both Korean journal entries now use `하급 연금술사의 기술 물약(Minor Alchemist's Art Potion)` and identical full Korean text. The existing `42851` wording was retained and `27747` was aligned. |
| `34443`, `42909` | Both refer to Ticneri. The active corpus uses `틱네리(Ticneri)` consistently apart from `34443`; that row now uses the same paired spelling. |

The linked rows `27747`, `54691`, and `34443` were newly classified as
candidates in the review ledger. The seven evidence-limited holds at
`42773`, `42808`, `42877`, `42889`, `42921`, `42925`, and `42967` remain
unresolved and unchanged.

## Verification

- Reconciled 29 unique candidates: 26 in-range candidates and three linked
  candidates. Candidate reconciliation now covers 2,853 / 4,027 IDs
  (70.85%), with 1,174 remaining.
- Four Korean rows changed. Their four-language source fingerprints were
  refreshed; three linked ledger rows were reclassified as candidates.
- All 65,135 review-ledger fingerprints and the generated index and catalogs
  validate. Both regression suites passed: 11 CSV-preservation tests and
  nine dialogue-context tests.
- The CSV retains 65,135 ordered records and its UTF-8 BOM, with 71,839 CRLF
  record endings, 242 LF-only separators, and no bare CR. Both exact-source
  pairs match across English, Japanese, Chinese, and Korean. The CRLF-aware
  diff check passed with `core.whitespace=cr-at-eol`.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.
