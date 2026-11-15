# Dialogue Context Translation Edit Batch: IDs `12000`-`12999`

- Date: 2026-11-13.
- Scope: adjudicate all 35 candidate IDs in this range, including earlier
  quest-asset findings, against current English, Japanese, Chinese, and Korean
  rows; inspect directly related exact-title and terminology occurrences.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- No speaker attribution or playback order was inferred from asset links.

## Decisions

Thirty-four candidates received source-supported corrections. ID `12766` was
already resolved in the active CSV: its first mention of Grim Onwig already
has the English pairing, so it was retained without another edit. Findings
marked evidence-limited in the source reports remain unresolved and were not
changed.

The 35 adjudicated candidate IDs are `12001`, `12090`, `12130`, `12131`,
`12159`, `12164`, `12173`, `12225`, `12344`, `12347`, `12353`, `12357`,
`12365`, `12382`, `12395`, `12416`, `12427`, `12434`, `12506`, `12545`,
`12550`, `12571`, `12585`, `12610`, `12673`, `12735`, `12766`, `12836`,
`12887`, `12890`, `12893`, `12917`, `12934`, `12956`, and `12964`.

The row-level corrections clarify the physical action at `12001`; remove
marked hageche at `12090`, `12130`, and `12887`; keep the HM01 rebuke at
`12131` coherent; correct the singular book reference at `12173`; standardize
`Cadsymyr` at `12225`; and use action-form objectives at `12344` and `12382`.
The introduction at `12347` is consistently deferential, while `12353` now
uses one conversational register. At `12357`, `제3장` is kept together and
the blank separation before the excerpt is preserved. The edits also align
`Authority` to `권능`, clarify the stolen amulet at `12416`, make the gratitude
sentence at `12434` natural, retain the strict `over 10,000` threshold at
`12673`, and correct the idiom and natural phrasing at `12934`, `12956`, and
`12964`.

Related rows were checked and updated as follows:

- `Irion, King of Cups`: all 20 exact-English rows now use
  `컵의 왕(King of Cups) 이리온(Irion)`:
  `147`, `2345`, `4961`, `6644`, `9748`, `12159`, `13670`, `15598`,
  `20444`, `30849`, `33018`, `35070`, `49949`, `52369`, `54932`,
  `56837`, `57745`, `59823`, `61570`, and `63233`.
- `Hermit Smith`: all nine explicit title/objective references now use the
  paired `은둔 대장장이(Hermit Smith)` form at `8360`, `10939`, `11581`,
  `12164`, `14861`, `19097`, `28676`, `28839`, and `59710`. The objective
  at `10939` and dialogue objective at `59710` use the established action
  form. Full personal-name entries were not given a redundant nested title.
- `Belen's Testament` / `the Testament`: the established forms
  `벨렌의 성약단(Belen's Testament)` and `성약단(The Testament)` were
  applied by the exact English wording at `3782`, `12365`, `12917`, `17685`,
  `21745`, `23116`, `23469`, `24590`, `30409`, `38372`, `38597`, `40782`,
  `44627`, and `60393`. Existing correct full-name forms at `8897`, `31387`,
  `35865`, `55119`, and `55470` were retained. `46998` uses only the
  contextual pronoun “their”; no faction name was inserted there.
- `Ordination Tome`: the same named artifact is now `서품서(Ordination Tome)`
  at `6593`, `8217`, `12427`, `22834`, and `23790`.
- `Ambassador Kulder`: the name/title order is standardized to
  `쿨더 대사(Ambassador Kulder)` at `17`, `12545`, and `33632`.
- Other linked corrections add the ballad-title pairings at `12610`, the
  Lorestone pairing at `12735`, and the proper-name pairing was verified as
  already present at `12766`.

The remaining row-specific decisions were: `12347` uses consistent
deferential speech; `12353` follows the Japanese conversational register;
`12506` uses `부역자` for the occupation-era collaborator; `12550` avoids
adding sibling age; `12571` avoids assuming the speaker's gender or the
brother's age; `12585` expresses acceptance rather than eagerness; `12836`
uses natural wording for an unusual proposal; `12890` restores “somewhat”;
and `12893` renders Great House as `대가문`, not a mansion.

## Application and Verification

- The ID-scoped application manifest is
  [`dialogue-context-edit-batch-20261113-12000-12999.json`](dialogue-context-edit-batch-20261113-12000-12999.json).
- Applied 80 guarded text-field operations to 79 unique rows using
  `tools/replace_text_preserve_eol.py`. The four-language ledger fingerprint
  was refreshed only for those 79 edited IDs; all other ledger fields,
  positions, and order were preserved.
- The active CSV retains its UTF-8 BOM, all 65,135 rows, 71,845 CRLF record
  endings, and 244 LF-only record endings. The `12357` heading reflow retains
  its existing line-break count.
- The 65,135-ID ledger fingerprint check, index/catalog reproducibility,
  11 CSV-preservation tests, and CRLF-aware `git diff --check` passed.
- Output SHA-256: CSV
  `69197ed5037e754ba01bf465a0365676b5b14d4ad0d9c949c63cbefe0e6ce0b0`;
  review ledger
  `f2e5b8967b3f0f1c2d28eb8a3cd0fef467f9865cde0ca6542ca2335a3e7e9810`.
- No source CSV, extracted asset, or game binary was modified.

All 35 candidate IDs in `12000`-`12999` are adjudicated, including the
already-resolved `12766`. Cumulative candidate adjudication now covers 457
of approximately 3,155 (about 14.5%); later candidates remain in progress.
The next range is `13000`-`13999`.
