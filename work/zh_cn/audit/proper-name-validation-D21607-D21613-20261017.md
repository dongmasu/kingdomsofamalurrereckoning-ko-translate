# D-21607-D-21613 Validation

Date: 2026-10-17. **Full proper-name discovery remains incomplete.**
Next: **D-21614 / default:32149**, then 5288/43618, using
`proper-name-residual-queue-D21614-20261017.md`.

## Review Scope

English led each judgment; exact aligned Japanese and Chinese cells are
retained in the range manifests. Each complete source-name scope was
searched across affix/base/default, including source spelling and plural
aliases. The official Korean manual extraction/reference contains no
direct entries for the newly registered names.

| Batch | Distinct Reviewed Keys | Edited Texto Events | Scope |
| --- | ---: | ---: | --- |
| D-21607 | 35 | 27 | Pacetor, Kurn, Echoes of Fate, Hall of Echoes, Twilight Garden, Martial Masters |
| D-21608 | 1 | 1 | Galatea alias of existing Galataea owner |
| D-21609 | 21 | 12 | Weconai and Amaura |
| D-21610 | 5 | 5 | Arrow Storm |
| D-21611 | 39 | 39 | Zungar family/Zungars, Zungar Shaft, Windstone Vale |
| D-21612 | 37 | 32 | Windstone/Windstones and separate Windstone Circle |
| D-21613 | 22 | 11 | Urul-Tusk / Urul Tusk |
| Total Events | 160 | 127 | Seven batches, each at most 50 keys |

The union contains **153 distinct source rows: ten base and 143 default**.
The edits affect **123 distinct Texto cells: seven base and 116 default**.
The extra edit events are the second name correction in default:34960
and later place-name corrections at 35462/38510/42382 after Windstone edits.
No affix bytes changed. Direct comparison against the D-21607 immediately
pre-edit backups confirms the same seven/116 net changed cells.

Fifteen new glossary entries and one alias of an existing owner add
164 entity/row matches: accepted 129, not-an-issue 33, excluded two.
These are focused index events, not global translation totals.
The 160 row dispositions differ from the 164 entity/row dispositions:
multi-entity rows are counted once as CSV keys.

Existing Galataea judgments on 17 keys remain unchanged; only previously
unindexed Galatea/default:34960 is added under the same owner. Existing
Zungar personal-name dispositions and exclusions are preserved while new
family/place scopes are registered. No colliding global Zungar alias was
introduced. Field names, source data and shuffled row order were unchanged.

Arrow Storm annotations are outside the complete existing localized
`{*1화살 폭풍}` token. All token bytes and combat values remain intact.
Windstone Vale is excluded from the generic object scope; Windstone Circle
has a separate place disposition on the same row as its object exclusion.
Source-local English case and Urul Tusk's missing hyphen are preserved in
their pairs. No race, biography or ambiguous label identity was invented.

## Verification

- `test-proper-name-residuals-D21607-D21610.rb`: five tests, 492 assertions;
  zero failures/errors/skips.
- `test-proper-name-family-windstone-D21611-D21613.rb`: four tests,
  965 assertions; zero failures/errors/skips.
- `test-proper-name-candidates.rb`: 13 tests, 68 assertions;
  zero failures/errors/skips.
- `test-audit-proper-name-residual-final.rb`: one test, 11 assertions;
  zero failures/errors/skips. Terminal rows without a covering bilingual
  English label: zero. This checks registered scopes, not exhaustive discovery.
- Byte-preserving cell-editor and inventory fixtures passed.
- `validate-proper-name-data.rb`: 2,109 unique glossary entries and
  44,919 unique active-aligned occurrence keys; no duplicates/orphans/stale
  Korean snapshots.
- `verify-proper-name-batch-chain.rb 21605 21613`: all nine batches passed.
  This includes inherited D-21605/D-21606 edits, not only the seven new
  batches. Reconstructed pre-D-21605 default:
  `197b76ed7f8cae0aafeaa77958c3800551e7457b98ceb4ae2bfd4d5d7014504c`.
  Verified exact masked non-target bytes, inverse equality to each
  immediately pre-edit backup, BOM, mixed line-ending sequence, header,
  ordered keys/variants, 4,844 base rows and 65,135 default rows.
- Each new batch also ran its own separate edit verifier immediately
  after applying its manifest. Backups remain under
  `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21607/`
  through `before-proper-name-D21613/`.
- All five active checkpoint blocks are byte-identical and include the
  actual active CSV hashes. Each also has the concrete D-21614/32149 queue.
- Git whitespace checking passed with command-local `cr-at-eol`, which
  recognizes the intentionally preserved CRLF data records. The default
  whitespace check flags those carriage returns; no line endings were
  normalized to suppress those warnings.

The new regression-test draft initially mishandled a historical blank
per-entity JSON cell and split a multiword fixture name with `%w`.
Inspecting the historical manifest and the actual Ruby word array proved
both were test implementation defects. The tests now compare that old
single-entity row's authoritative `status` and preserve multiword fixture
names as complete strings. No translation data or prior status was
changed to make a test pass.

## Checkpoint

Latest verified batch D-21613; last reviewed key default:64849.
Next D-21614 starts with default:32149's four-family evidence.
The source scopes of other families have not yet been fully extracted;
there is no justified exact overall remaining row count or percentage.

Index states: accepted 30,025; not-an-issue 11,897; excluded 2,901;
uncertain 96. There are no unreviewed indexed matches. The 96 reviewed
uncertain matches occupy 93 distinct rows and are not the entire
discovery backlog. The queue records 14 additional unclassified label
families in 24 source rows and preserves the earlier two Eyrie/Eryie
labels outside the indexed holds. Do not resolve them by phonetic shape.

Active CSV SHA-256:

- affix: `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`.
- base: `c63f4377a5e5eef01b6ac46e1ef60cb8d5f539b90396655c2e182cf295470bf1`.
- default: `559cec971a78d2356bd2ffd6060554269c983e0b65f90c1b441e1864d45c8808`.

Last actual base/default pre-edit backups:
`/private/tmp/ko-translate-backups/20261017/before-proper-name-D21613/locatexts_zh_cn.koalocatext_base.csv`
and
`/private/tmp/ko-translate-backups/20261017/before-proper-name-D21613/locatexts_zh_cn.koalocatext_default.csv`.
The unchanged affix retains its D-21521 backup, as recorded in all five
active checkpoint blocks. Source CSVs, tools and root user-facing README
were not changed. No PAK inspection, release build, commit/push, Windows
execution test or game rendering test was performed in this continuation.
