# D-20389: Proper-Name Glossary Inventory and Seed

Date: 2026-10-15

## Scope and Result

Created the first reusable proper-name glossary from decisions already
supported in D-20382 through D-20388. The seed contains 355 entity records:
340 people (the 339 personal-name groups confirmed in D-20383 plus Sagrell),
seven factions, five monsters, one skill, and two unique items. The Ursin
Kettle full-name rows are attached to the existing Ursin person rather than
counted as another entity. Prior decisions remain provenance; no historical
sequential finding or global tally was reopened or changed.

The glossary is
[`proper-name-glossary.tsv`](proper-name-glossary.tsv). The initial
source-aligned occurrence index is
[`proper-name-occurrences.tsv`](proper-name-occurrences.tsv). It contains
8,869 candidate row/entity matches for the seeded names: six `affix`, 207
`base`, and 8,656 `default` matches. These rows are marked
`needs-context`, not as translation defects or final dispositions. Common
words, homonyms, sentence context, and the requested bilingual form still
need review. This index covers only the seeded entries, not every named
entity in the game.

Implemented a read-only CSV inventory utility and synthetic tests:
[`build-proper-name-inventory.rb`](build-proper-name-inventory.rb) and
[`test-proper-name-inventory.rb`](test-proper-name-inventory.rb). The fixture
test and Ruby syntax checks passed. The occurrence indexer and its tests
(`build-proper-name-occurrences.rb`, `test-proper-name-occurrences.rb`) also
passed, including possessives, phrase boundaries, and homonyms. A full aligned inventory contains 73,430
rows: 3,451 `affix`, 4,844 `base`, and 65,135 `default`, matching the active
working CSV counts. The reproducible generated inventory is kept outside the
repository at `/private/tmp/proper-name-source-inventory.tsv`; its SHA-256 is
`ea4a77fb6d4c973696799282c79877b8141733f27cbd31df148f89af54874808`.

The reviewed examples are queued next. Existing evidence already supports
`Allestar` as `알레스타(Allestar)` (D-1230 and D-6160). Historical
`Eagonn` and `Gossamer End` entries remain explicitly unsettled; D-20390 will
compare their English, Japanese, Chinese, existing Korean variants, and
cross-row context before selecting or retaining a form.

No active CSV was edited, so no CSV backup was needed. No source CSV was
modified. No PAK or PAK-derived file was inspected. The proper-name review is
incomplete; candidate discovery and the remaining entity categories are
still pending. Next focused review: D-20390.

## Reconciliation Snapshot

| Resource | Active Korean SHA-256 | English source SHA-256 | Japanese source SHA-256 | Chinese source SHA-256 |
| --- | --- | --- | --- | --- |
| `affix` | `516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e` | `8727c06a9cd19a2c9c79090072684da97a1586858b50986a8cc4de72fc3ac302` | `984bb7ca18f074c456d46d0c043fa999b95ad12e7ffea45460330b9c3e1b0677` | `9f9d25d578b35ba607cebf9a0bd1ec45153736d618f7d6d1b14b09049a40e3e6` |
| `base` | `b5cd7ece89e1039a9bc7bc870bb7aa81eb61fd72f4e454dc3ec41651a5f968ac` | `e6af9e9008892f082f741f73275aef215c606cb73b9d6d9c7f558375b10dbfa0` | `23708c6a4479006bcfbc25fc24484bf88dc85ae503ae35094a19363592c79fcc` | `b95d447e09f68e54dc08a82294806619d9942ac080654b7a278b6fd053ba3310` |
| `default` | `f17ee0aee19bd5c1bd9a9681f235dcd8b6da3a063a40326af54ed73ed0926234` | `9984e3e0f25218dda43dbb8b054d43cfac5d0627ab9f8784d0ae0f1d70e2ba7a` | `ab652d5a3d24e3894e06e57dee024f7dd27b56dc176e587d4a50cb260d436714` | `b8381db941f87c909a1159da9976a5c2c7b2df5fbf3c789479f5c836a2fe2f3b` |

These hashes are the state used to generate this inventory. The active Korean
`base` and `default` files already contained prior D-20386 and D-20388 edits
before this pass began; those edits are preserved.
