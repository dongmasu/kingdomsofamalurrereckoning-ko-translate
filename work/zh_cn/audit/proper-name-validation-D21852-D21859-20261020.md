# D-21852-D-21859: Bounded Proper-Name Validation

Date: 2026-10-20

## Scope

Eight batches reviewed and edited 37 distinct CSV cells: 35 default and
two base. This includes the earlier D-21852-D-21856 edits retained from
the preceding session, not just the 21 cells changed in D-21857-D-21859.
The translation-complete status is unchanged. Discovery is not exhaustive;
the release ZIP, binaries, PAKs, tags, and GitHub release were not changed.

The added work removed duplicate title/name annotations and corrected
source-local military/watch-command titles using English identity/context,
aligned Japanese/Chinese, and existing per-person Korean forms. No glossary
identity, canonical form, alias, or component owner was changed.
Read-only independent review caught two required Talibor particle changes;
both were applied before D-21859. D-21857's report separately clarifies the
shared Elswin rationale in two Drefan evidence records without rewriting
the applied historical manifest.

## Verification

- `verify-proper-name-batch-chain.rb 21852 21859`: PASS for all eight batches.
  All 37 Texto edits reverse to byte-identical pre-edit backups; ordered
  keys/variants, BOM, exact line endings, and non-target bytes are preserved.
- `validate-proper-name-data.rb`: PASS, 2,348 unique entities and 48,476
  unique active-aligned occurrences: accepted 32,646; not-an-issue 12,502;
  excluded 3,217; uncertain 111.
- `audit-proper-name-residual-final.rb`: PASS. Missing source/index keys 0;
  undocumented extras 0; terminal matches lacking a bilingual label 0.
  Compared 47,398 source matches and 48,476 indexed occurrences across
  73,430 CSV rows. The 1,078 contextual extras are documented exceptions.
- `test-captain-title-contexts-D21859.rb`: 5 tests, 86 assertions, PASS
  before the subsequent D-21860 regression test was added.
- Residual-audit regression: 1 test, 17 assertions, PASS at D-21857.
- Cell editor, source inventory, occurrence matcher, and index reconciliation
  fixture suites: PASS at D-21857.

The 111 previously reviewed indexed holds remain in 106 distinct row keys.
Zero missing labels for existing indexed matches does not mean zero
undiscovered names or complete linguistic/in-game validation.

## CSV Snapshot

- affix: `9dbee978d73148eeb547c2a01a58e3d8168a519824382d339179c55770492b33`
- base: `010da0cd8d9888e050b63ae73f5beb5a5a963e294dd575df7d33075822fdbc21`
- default: `dd0b44eb441b104212f017b331504859aea9cdf32fb99b1b83bb93a76323c442`

Pre-D-21852 reverse reconstruction:

- affix: `9dbee978d73148eeb547c2a01a58e3d8168a519824382d339179c55770492b33`
- base: `afb24dd6ca7a252173af67e593761ab622e6d615a129d97318854721b300db0c`
- default: `5e63f4db3b3d79b013778336bb07ade68734354c909af2cc7885221c3d625a9f`

## Follow-Up

Continue small, evidence-backed batches until the user asks to stop.
D-21860 is prepared separately for three clear Janya/Enright maritime-title
errors; it is not included in this verified snapshot. Captain Mys lacks
sufficient role/identity context for an edit. Captain Kerrod's three
explicit military-name rows need a separate registration/review scope;
do not identify him with Kerrod Graine or assume armor ownership.
