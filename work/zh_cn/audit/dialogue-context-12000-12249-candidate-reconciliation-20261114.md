# Candidate Reconciliation: IDs `12000`-`12249`

- Date: 2026-11-14.
- Scope: all eight currently recorded candidates in this range, checked against
  English meaning, Japanese voice/register/layout, Chinese supporting evidence,
  active Korean, and related terminology groups.
- Seven prior corrections were confirmed in the current Korean; the remaining
  candidate was retained after checking the named-book context. No new CSV edit
  was needed in this pass.
- No speaker or playback order was inferred from asset membership.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `12001` | Previously applied, confirmed | The Korean uses the natural result construction `두들겨 패서 기절시켜야겠군`, matching the English and Japanese threat. |
| `12090` | Previously applied, confirmed | `조심해` follows the casual Japanese warning and avoids the marked hageche form. |
| `12130` | Previously applied, confirmed | The closing `조심해` stays in the same casual register as the preceding question. |
| `12131` | Previously applied, confirmed | The rebuke preserves the source's elevated voice without the earlier mixed register; the Korean line remains coherent. |
| `12159` | Previously applied, confirmed | The display label now separates the title and name: `컵의 왕(King of Cups) 이리온(Irion)`. |
| `12164` | Previously applied, confirmed | `은둔 대장장이(Hermit Smith)` is paired consistently with the named target while preserving the casual warning. |
| `12173` | Retained after source review | English `the Missives`, Japanese `that book`, and Chinese `book scroll` refer to the named book. The current `세이블의 서신(Missives of Sable)` names the object without the earlier plural Korean wording; the rest of the offer remains natural and informal. |
| `12225` | Previously applied, confirmed | `카드시미르(Cadsymyr)` matches the established spelling in this quest; the sentence retains the distinction between the Tuatha camp and Cadsymyr. |

## Related Consistency

- The exact-English `Irion, King of Cups` group was checked at all 20 IDs:
  `147`, `2345`, `4961`, `6644`, `9748`, `12159`, `13670`, `15598`,
  `20444`, `30849`, `33018`, `35070`, `49949`, `52369`, `54932`,
  `56837`, `57745`, `59823`, `61570`, and `63233`. All currently use
  `컵의 왕(King of Cups) 이리온(Irion)`.
- The nine explicit `Hermit Smith` entries from the prior cross-reference
  review were rechecked; their paired title and objective forms remain
  consistent.
- `12173` was checked as a named book, not treated as evidence that every
  plural English title must be translated as a plural Korean noun.

## Verification

- All eight in-range candidates are reconciled; cumulative reconciliation is
  728 / 4,015 (18.13%), with 3,287 remaining.
- The full review ledger validates all 65,135 reviewed IDs; the generated
  quest-asset index and both catalogs reproduce exactly.
- CSV-preservation tests: 11 passed; dialogue-context index tests: 9 passed.
- The active default CSV retains 65,135 ordered rows and its UTF-8 BOM.
  Newline inventory: 71,838 CRLFs, 244 LF-only separators, and no bare CRs.
- Twenty-one changed-row fingerprints were refreshed: `12173` and the 20
  `Irion, King of Cups` occurrences listed above. No other ledger fields or
  row positions were changed.
- CRLF-aware `git diff --check` passed. No source CSV or extracted asset was
  changed.
