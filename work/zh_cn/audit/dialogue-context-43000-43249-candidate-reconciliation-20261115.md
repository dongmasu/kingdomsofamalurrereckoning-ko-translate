# Candidate Reconciliation: IDs `43000`-`43249`

- Date: 2026-11-15.
- Rechecked all 28 correction candidates against the active English,
  Japanese, Chinese, and Korean rows and existing findings. English anchors
  meaning; Japanese is the primary voice and layout reference; Chinese is
  supporting evidence.
- The supported corrections in all 28 range candidates were already present.
  A full-corpus exact-English comparison found one linked Korean mismatch,
  ID `47222`, bringing this pass to 29 unique candidate IDs.

## Candidate Decisions

| IDs | Result |
| --- | --- |
| `43021`, `43028`, `43038`, `43042`, `43124`, `43136`, `43140`, `43145`, `43146`, `43157`, `43163`, `43168`, `43169`, `43170`, `43171`, `43194`, `43197`, `43198`, `43207`, `43210`, `43214`, `43216`, `43219`, `43227`, `43228`, `43236`, `43238`, `43239` | Retained. The active Korean already has the supported complete name/item/title pairings, terminology, natural sentence revisions, and reagent spacing. Source-supported poem layout and runtime structure remain intact. |
| `47222` | Changed the standalone `Syl` from `실` to `실(Syl)` to match exact-English duplicate `43207`. No person/place identity is inferred; the name annotation is source-local. Its previous format hold is resolved. |

## Exact-Source Checks

| IDs | Result |
| --- | --- |
| `43042`, `50448` | All four language rows are identical, including the five-line Korean poem. |
| `43207`, `47222` | English is identical; Japanese and Chinese render the standalone term differently. Korean now consistently reads `실(Syl)` in both rows, preserving the source string without inferring identity. |

The ten evidence-limited holds from the sequential range review remain
unchanged: `43004`, `43010`, `43012`, `43106`, `43162`, `43183`, `43201`,
`43215`, `43233`, and the meaning dimension at `43236`.

## Verification

- Reconciled 29 unique candidates: 28 in-range candidates and linked
  candidate `47222`. Candidate reconciliation now covers 2,882 / 4,028 IDs
  (71.55%), with 1,146 remaining.
- One Korean row changed; its four-language source fingerprint was refreshed
  and the existing ledger row was reclassified from uncertain to candidate.
- All 65,135 review-ledger fingerprints and the generated index and catalogs
  validate. Both regression suites passed: 11 CSV-preservation tests and
  nine dialogue-context tests.
- The CSV retains 65,135 ordered records and its UTF-8 BOM, with 71,839 CRLF
  record endings, 242 LF-only separators, and no bare CR. Exact-source
  checks passed for both groups. The CRLF-aware diff check passed with
  `core.whitespace=cr-at-eol`.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.
