# D-21857-D-21862: Continued Proper-Name Verification

Date: 2026-10-20

Six bounded batches changed 28 distinct Texto cells: 26 default and two base.
Removed duplicate Elswin/Drefan annotations, corrected source-local
military/watch titles, registered only the exact Captain Kerrod name, and
corrected Harit Wyle's erroneous 과일 surname rendering. Each scope received
a read-only independent semantic review. Two Talibor particles were corrected
before applying D-21859. No global Captain or surname substitution was used.

## Verification

- `verify-proper-name-batch-chain.rb 21852 21862`: PASS. All 44 edits across
  these eleven batches reverse to byte-identical backups: 40 default and
  four base. Non-target bytes, BOM, line endings, row order and variants
  are preserved. D-21852-D-21856 were retained earlier-session changes.
- Captain/title regression: 6 tests, 94 assertions, PASS.
- Kerrod/Harit regression: 4 tests, 20 assertions, PASS.
- Active data validation: PASS, 2,349 entities and 48,479 unique occurrences.
  Statuses: accepted 32,652; not-an-issue 12,499; excluded 3,217; uncertain 111.
- Final residual audit: PASS. Missing source/index keys 0; undocumented extras
  0; terminal matches missing a bilingual label 0. Compared 47,401 source
  matches with 48,479 occurrences across 73,430 CSV rows.
- D-21861 registration-only reconstruction reproduced the exact pre-discovery
  glossary and 48,476-row index after removing its one entity/three keys and
  restoring the three old Korean snapshots. All older owners, statuses,
  evidence, canonicals and aliases were preserved.
- `git -c core.whitespace=cr-at-eol diff --check`: PASS at D-21862. Ordinary
  `git diff --check` flags the required CRLF endings; these were not normalized.

The 111 existing indexed holds remain in 106 row keys. Captain Mys was not
resolved by a Japanese rank label alone. Captain Kerrod has no bare Kerrod
alias and is not linked to Kerrod Graine or possessive armor labels.
Valid contextual 대장/대위 forms outside the reviewed error rows remain.

## Snapshot

- affix: `9dbee978d73148eeb547c2a01a58e3d8168a519824382d339179c55770492b33`
- base: `fcf6fdad49d2c053314ecb2bdb2692f2acdec6949fe8e747767b9a26c5f3412b`
- default: `8e7486e5e162798b19274748fcb741d9e8ed7515eff0e250d762eb77122e1508`
- glossary: `841f2e6cb05b7c3f1f35ee33bf24b4119da4f3eb43e88ca43790a6faec46a34c`
- occurrence index: `e94e09aed2fcdec2c15f5c64c6fdcffb13b6ce689a1c774e93c1492e18de3924`

Translation remains considered complete. Proper-name discovery is not
exhaustive and continues in small batches until the user asks to stop.
No binary build, PAK inspection, game test, tag, release, commit or push
was performed. The published release ZIP is unchanged.

## D-21863 Addendum

An independently reviewed follow-up removed duplicate component annotations
from three complete object/rank labels. D-21857-D-21863 now covers 31
distinct edited cells: four base and 27 default. Its seven-batch reverse
chain passed and reconstructs the exact pre-D-21857 CSV hashes.

Current focused regressions: captain/title 6 tests/94 assertions; extended
Kerrod/Harit/atomic-label 5 tests/23 assertions. All pass. Active data and
final residual audits pass with the same entity/status totals shown above.
All 111 prior uncertain records, including Korean snapshots and evidence,
also exactly match the pre-D-21861 index backup. The five generated current
checkpoint blocks agree on D-21863 and all active CSV hashes.

Current base SHA-256:
`244dec237c439aae31f75ae76eb3486c2944e49d2fae80c1b5928fd189a2fc94`.
Current default SHA-256:
`62ea4f62df4a934ef0c8f0f56908b692fe4f8e8571ae8651a837d8f22db40959`.
Affix and glossary are unchanged from the D-21862 snapshot. Continue with
bounded fresh candidates; full discovery and game validation remain incomplete.

## D-21864-D-21865 Addendum

D-21864 registered only the explicit complete group label `Wyle Family`
at default:53243 and corrected 바일 to 와일. It adds one exact
family:wyle key, no bare Wyle alias, and no membership relationship to
individual Wyle names, Wyle Home, or the separate bare-Wyle hold.
After removing that new glossary/index key and restoring the one old Korean
cell, serialization exactly reproduced the pre-D-21864 glossary and
48,479-row occurrence-index backup bytes. All 111 existing uncertain
records remained byte-identical.

D-21865 corrected the first qualifier in `Summer and Winter Fae` at
default:9538 to the established `Summer Fae` form. Existing people:fae and
people:winter-fae owners remain; no summer-fae occurrence was registered.
Independent review approved both scopes.

The D-21857-D-21865 inverse chain passed for 33 distinct edited cells
(29 default, four base) and reconstructs the exact pre-D-21857 CSV hashes.
Current extended proper-name regression: 7 tests, 44 assertions, PASS.
Active data validation: 2,350 entities and 48,480 occurrences; accepted
32,653, not-an-issue 12,499, excluded 3,217, uncertain 111. Final residual
audit passed with 47,402 source matches, 48,480 indexed matches, zero
missing source/index keys, zero undocumented extras and zero terminal
matches missing bilingual labels.

Current hashes: affix `9dbee978d73148eeb547c2a01a58e3d8168a519824382d339179c55770492b33`;
base `244dec237c439aae31f75ae76eb3486c2944e49d2fae80c1b5928fd189a2fc94`;
default `ad4f3949a9a1b07e7c5643d7e7581285ad50f43a21738c149a909c6dc889b4ab`;
glossary `a998dbf65f28565c94f69aa9f0e28b787bf1c324c6b3887dbc8f66044f5def95`;
occurrence index `7b9e54a04c83f26c4302b489166a0799d5335e9a5262fe91cf1d04133e672b80`.
All five generated checkpoint blocks agree on D-21865 and these active CSV
hashes. The released ZIP remains unchanged; exhaustive discovery and game
validation remain incomplete.
