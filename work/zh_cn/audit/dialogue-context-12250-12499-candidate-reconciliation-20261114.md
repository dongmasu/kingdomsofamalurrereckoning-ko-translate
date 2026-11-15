# Candidate Reconciliation: IDs `12250`-`12499`

- Date: 2026-11-14.
- Scope: all ten current candidates in this range, compared across English,
  Japanese, Chinese, and the active Korean, including the previously applied
  batch corrections and related terminology.
- Nine previous corrections were confirmed. ID `12434` received a further
  source-checked naturalness correction.
- No speaker or playback order was inferred from asset membership.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `12344` | Previously applied, confirmed | `산길 개방하기` expresses opening the mountain road as a concise quest objective. |
| `12347` | Previously applied, confirmed | The English deferential address and Japanese admiration reference were checked; the current Korean consistently uses polite self-reference and the established `백색의 할람(Hallam the White)` form. |
| `12353` | Previously applied, confirmed | The line now stays conversational throughout, matching Japanese casual speech and direct instructions. |
| `12357` | Previously applied, confirmed | The heading keeps `제3장` together and retains separation before the excerpt; the poem's other intentional line breaks remain. |
| `12365` | Previously applied, confirmed | `성약단(The Testament)` correctly identifies the faction's soldiers; no extra speaker or gender assumption was introduced. |
| `12382` | Previously applied, confirmed | `고서 읽기` conveys the source objective `Read the Tome` in the established action form. |
| `12395` | Previously applied, confirmed | `권능(Authority)` matches the established divine title and preserves the prayer's meaning. |
| `12416` | Previously applied, confirmed | `내게서 훔쳐 간 부적` correctly identifies the speaker as the person from whom the amulet was stolen; the curse and handover remain clear. |
| `12427` | Previously applied, confirmed | Quest context identifies the promised book as the `서품서(Ordination Tome)`; the Korean keeps the source's forceful prediction. |
| `12434` | Corrected | Recast the opening and closing as natural informal Korean while preserving gratitude for Akara's help, the planted tree seed, and the speaker's modesty. |

## Related Consistency

- The `The Testament` references were checked against the established
  `성약단(The Testament)` form; `12365` matches the related faction entries.
- `12427` matches the established `서품서(Ordination Tome)` label used for
  the named artifact.
- The earlier `12347` request for polite address was preserved rather than
  normalized to the Japanese casual register alone; the source English and
  Chinese also support the deferential address.

## Verification

- All ten in-range candidates are reconciled; cumulative reconciliation is
  738 / 4,015 (18.38%), with 3,277 remaining.
- Only `default:12434` was edited in this pass, using the ID-guarded
  EOL-preserving CSV tool. Its four-language fingerprint was refreshed.
- The full review ledger validates all 65,135 reviewed IDs; the generated
  quest-asset index and both catalogs reproduce exactly.
- CSV-preservation tests: 11 passed; dialogue-context index tests: 9 passed.
- The active default CSV retains 65,135 ordered rows and its UTF-8 BOM.
  Newline inventory: 71,838 CRLFs, 244 LF-only separators, and no bare CRs.
- CRLF-aware `git diff --check` passed. No source CSV or extracted asset was
  changed.
