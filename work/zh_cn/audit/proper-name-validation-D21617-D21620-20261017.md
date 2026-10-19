# D-21617-D-21620 Validation

Date: 2026-10-17. **Full proper-name discovery remains incomplete.**
Next: **D-21621 / base:3224:11, then default:31616/56850 (Arcaneid)**.
Concrete queue: `proper-name-residual-queue-D21621-20261017.md`.

## Scope

| Batch | Reviewed Row Events | Texto Edit Events | Scope |
| --- | ---: | ---: | --- |
| D-21617 | 32 | 32 | Row-scoped Darkvari/Cynric/Skoria/Zungar family contexts |
| D-21618 | 14 | 14 | Eight complete item/site entries, including contracts, keys, map, colliery and deed |
| D-21619 | 14 | 10 | Existing-owner Quarry/map aliases, narrow Skoria mine references, surname labels |
| D-21620 | 2 | 2 | Article-bearing deed phrase alias under the same item |
| Events | 62 | 58 | Every batch contains at most 50 distinct keys |

The union is **61 distinct source rows: eight base and 53 default**.
Changes affect **57 distinct Texto cells: eight base and 49 default**.
default:50221 is reviewed twice for independent Quarry and deed spans;
it is counted once in distinct-row/cell totals. No affix bytes changed.
Eight glossary entries and three existing-owner phrase aliases add
**63 new entity/row keys**, not 63 new people or historical translation
decisions. No earlier terminal key was reopened or recounted.

English anchors every judgment; exact aligned Japanese and Chinese cells
are retained in each batch manifest. The official Korean manual extraction
and reference have no direct entries for these selected names.

Family scopes keep the existing personal-name exclusions/dispositions.
Skoria membership is not a race; 58119 retains the speaker's guess.
No global bare-surname alias was added. Shortened surnames in name/성
contexts retain those words rather than being converted into people.
Darkvari Colliery has its own source-label entry, without claiming it is
physically distinct from Darkvari Mine. Cynric Quarry is attached to
existing Cynric Mine using the shared family/quarry/Adath-hiding and
south-of-Whitestone evidence; no duplicate Quarry entity was registered.
Source-local Quarry/채석장 and Mine/광산 nouns remain distinguishable.

The deed has one item owner with its two source phrase forms, separate
from the mine-place entry. Full document labels replace partial or nested
place-only parentheses. The Darkvari map short form stays under the
existing treasure-map item without adding words absent from English.
All unrelated actions, other names, tokens and line endings are preserved.

## Verification

- `test-proper-name-mining-contexts-D21617.rb`: three tests, 281 assertions.
- `test-proper-name-mining-items-sites-D21618-D21620.rb`: four tests,
  267 assertions. It also verifies the article alias, preserved Quarry
  annotation, nine deed occurrences and unchanged old person exclusions.
- `test-proper-name-mining-families-D21614-D21616.rb`: four tests,
  378 assertions.
- `test-proper-name-family-windstone-D21611-D21613.rb`: four tests,
  965 assertions.
- `test-proper-name-candidates.rb`: 13 tests, 68 assertions.
- `test-audit-proper-name-residual-final.rb`: one test, 11 assertions.
  Registered terminal matches without a covering bilingual label: zero.
  This is not an exhaustive new-name discovery test.
- All listed tests finished with zero failures, errors or skips.
  Cell-editor and aligned-inventory fixtures also passed.
- `validate-proper-name-data.rb`: 2,121 unique glossary entries and
  45,065 unique active-aligned occurrence keys; no duplicates, orphans,
  invalid states or stale Korean snapshots.
- `verify-proper-name-batch-chain.rb 21614 21620`: all seven batches
  passed reverse reconstruction, including the three inherited batches.
  Verified 115 default and nine base edit events across that longer chain.
  Reconstructed pre-D-21614 default hash:
  `559cec971a78d2356bd2ffd6060554269c983e0b65f90c1b441e1864d45c8808`.
- Each edited batch separately verified its immediate byte-identical
  backup, exact target Texto fields, all non-target bytes, inverse
  equality, BOM, mixed line-ending sequence, ordered keys/variants and
  unchanged counts: 3,451 affix, 4,844 base, 65,135 default.
- All five current checkpoint blocks are identical and contain the actual
  active hashes. All five documents point to the same D-21621 resume queue;
  the old D-21614 static resume instruction was explicitly superseded.
- Git whitespace checking passed with command-local `cr-at-eol`.
- Independent read-only linguistic review found no concrete semantic,
  identity or old-disposition preservation defect in D-21617-D-21619.
  D-21620 was checked against the exact article-bearing source rows,
  the independent byte verifier and its regression assertions.

The new test initially called `last` on `CSV::Table`, which this Ruby CSV
implementation does not support. A minimal reproduction confirmed that
negative indexing returns the intended row. The test was corrected and
rerun successfully; no translation, source or disposition was changed to
make it pass. The new test file supersedes its temporary D21618-D21619
filename; use the D21618-D21620 filename above.

The Zungar family surname was added to the residual auditor's narrowly
scoped family-label token map, matching the three other family tokens.
It requires the family owner, an actual English-source token and a
covering parenthetical; it does not register a global Zungar alias or
silence unmatched generic names.

## Checkpoint

Latest D-21620; last reviewed key default:50221 / item:deed-to-skoria-mine.
Next D-21621 starts with source-local Arcaneid label consistency, not a
restart of the completed sequential default pass.
Index: accepted 30,161; excluded 2,901; not-an-issue 11,907; uncertain 96.
The 96 indexed holds occupy 93 rows; no indexed key is unreviewed.

A separate read-only review covers the 14 previously unclassified label
groups/24 exact source rows. Those identity-classification holds and the
Cynric/Pit/ambiguous Skoria contexts are documented in
`proper-name-unclassified-label-review-20261017.md`, outside the indexed
96 holds. Potential label-only spelling/pair improvements remain proposals;
no unsupported people, deities, item identities or category assignments
were registered. The earlier Eyrie/Eryie and ability-looking label holds
are retained without reopening them on the same evidence.
No justified overall remaining-row total or completion percentage follows
from these focused counts.

Active CSV SHA-256:

- affix: `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`.
- base: `26eb700daa82733b82532d4379a7ffab5c726a77878b382e5d6ec38777239061`.
- default: `fcdc3706f17047f6ef8af656ee1d90886de1fd169723a86867dfcfa7f12d9ffa`.

Last actual pre-edit backups:

- affix: `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21521/locatexts_zh_cn.koalocatext_affix.csv`.
- base: `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21618/locatexts_zh_cn.koalocatext_base.csv`.
- default: `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21620/locatexts_zh_cn.koalocatext_default.csv`.

Source CSVs, PAKs, build tools and root user-facing README were not edited.
No PAK investigation, build, commit/push, release update, Windows execution
test or in-game rendering test was performed. The published D-21569 ZIP
remains unchanged.
