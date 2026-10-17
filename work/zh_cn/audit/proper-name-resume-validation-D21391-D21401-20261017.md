# D-21391-D-21401: Resumed Proper-Name Verification

Date: 2026-10-17

## Scope And Dispositions

Reviewed 184 distinct CSV resource/ID/variant row keys across 11 batches;
changed 130 distinct Texto cells: five base and 125 default. All three
resources were searched; affix has no applicable new row in these scopes.
Every batch contains at most 50 CSV row keys.

Registered 182 new entity/key occurrences. D-21399 additionally corrects
four already-indexed mixed full/short-name occurrences without adding
records. These 186 entity-review events span 184 distinct CSV rows because
Alder and Bridgette overlap at default:21503 and 39907. CSV row coverage
and edit counts deduplicate those shared rows.

Scopes:

- D-21391: 22 short Enconeg references, 20 edits, matching the established
  full-name stem as `엔코네그(Enconeg)`, with vowel-final particles.
- D-21392: 16 short Edgar references, 16 edits, `에드거(Edgar)`, excluding
  the distinct prince and retaining existing omissions.
- D-21393: the separate prince `에드거 알포라스(Edgar Aelforas)`, one edit.
- D-21394: five complete Vincent Helvern names, two edits, excluding the
  country St. Vincent and the Grenadines from person matching.
- D-21395: four Charnok Quarry/Royal Seal of Ansilla labels, three edits;
  whole-label pairs, no unsupported rarity or generic surname alias.
- D-21396-D-21398: 104 CSV rows in 50/50/4 slices, 106 entity occurrences,
  69 edits; short Alder, Bridgette, Angharad and Pepin references.
- D-21399: four existing mixed full/short-name annotation follow-ups at
  default:18039, 35537, 50452 and 58690. Exact earlier status/evidence is
  retained in the manifest. Pepin changes from not-an-issue to accepted
  solely for the newly identified short-name omission; the other three
  remain accepted. Full-name pairs remain unchanged.
- D-21400: 26 short Ost references, 13 edits; preserve `PH -` at 58283.
- D-21401: two complete Longroad Storehouse labels, two edits. This is a
  complete display-label scope, not a broader Longroad identity claim.

English anchors meaning and identity. Aligned Japanese and Chinese
corroborate the individual decisions. The official Korean manual extraction
was consulted for map/exploration, equipment, quest-type and Warsworn
background (PDF pp. 4, 6-9), not as an exhaustive character/name list.
Independent semantic passes found no translation, particle or scope blocker.
Redundant evidence prefixes/rationale text are clerical, not new decisions.

## Verification

PASS: 1,607 unique glossary entities and 40,420 unique active-aligned
occurrences. Statuses: accepted 27,004; excluded 2,422; not-an-issue 10,964;
uncertain 30. Zero needs-context entries remain.

PASS: source/index comparison has 39,746 generated matches, zero missing
keys, 674 manifest-backed contextual extras and zero undocumented extras.
There are zero terminal matches without a covering bilingual label. One
documented idiomatic non-label and four lowercase descriptive non-labels
remain intentional exceptions.

PASS: `verify-proper-name-batch-chain.rb 21391 21401` inversely reconstructs
all 130 edited cells to the exact pre-D-21391 CSV hashes. BOM, exact mixed
line-ending sequence, row count/order, keys/variants, non-target cells and
all non-target bytes are preserved. The editor also checks runtime tokens.

PASS: `verify-history-D21391-D21401.rb` removes only the 182 new records,
restores the four explicit prior dispositions/evidence and initial Korean
snapshots, and reproduces the exact pre-D-21391 40,238-row index SHA-256:
`48fc20aec65b4850bd42e4597656b10c0abc2fd199bfd7001cd6963537654ba4`.
Historical discovery appended records, whereas the resumed scoped scripts
sort the occurrence index; the verifier replays that original append order.
This index-order difference is not a CSV row-order change or a changed
historical disposition.

PASS: eight focused test files, 31 runs and 54 assertions, with zero
failures, errors or skips. Byte-preserving editor fixtures also pass.
All five active checkpoint blocks agree on D-21401, next D-21402 and
the active CSV hashes. `git diff --name-only -- src` reports no changes.

## Verified Checkpoint

Latest reviewed key: `default:50433:` / `title:longroad-storehouse`.
Next batch: D-21402, continuing source discovery/residual checks, not a
sequential default-ID restart. Sequential default review through ID 65134
remains complete. The 30 reviewed occurrence holds span 28 distinct CSV
row keys; separate unresolved entity identities also remain documented.
These holds were not reopened. There is no known exhaustive count of
undiscovered names, so no overall completion percentage is asserted.
Full proper-name discovery remains incomplete.

Active CSV SHA-256:

- affix: `9ae001a379b766612293d076eafb5b02a27ac2de70f05f2f98a706f7aef5607c`
- base: `e62d4c1eb14798e1e57393346a6b56c3a2e5cd4de18d48424085bcc4379871c3`
- default: `c19c9f1e78621d03314ff8e48d1bdc2183ee32716d1296fa7034b2d012da35e9`

Last actual pre-edit backups:

- affix: `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21387/locatexts_zh_cn.koalocatext_affix.csv`
- base: `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21401/locatexts_zh_cn.koalocatext_base.csv`
- default: `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21401/locatexts_zh_cn.koalocatext_default.csv`

Exact cells, sources, previous dispositions, pre/post hashes and byte
checks are in each batch's manifest, report and edit addendum. These are
focused run counts, not historical global translation totals. No separate
goal, build, PAK research, game test, commit or push was performed.
