# Lua Corpus Translation Review

Date: 2026-11-15. Status: **COMPLETED**. Corpus accounting, bounded linguistic
review, independent proposal review, and candidate reconciliation are complete.
This is a static evidence review, not runtime or in-game validation.

## Scope And Frozen Inputs

This is a read-only static review under the approved
[design](../../../docs/superpowers/specs/2026-11-15-lua-corpus-translation-review-design.md)
and [plan](../../../docs/superpowers/plans/2026-11-15-lua-corpus-translation-review.md).
It does not authorize translation edits, execution of bytecode, rebuilding
localization binaries, or game-package operations.

The [input snapshot](lua-corpus-review-20261115/input-snapshot.json) has SHA-256
`2729ecb37d2870dfc73192a18e9c2f55981ee7687ada5ce15477cf692c023ad1`.
It freezes 13,300 file records, including the extraction manifest, extracted
payloads, twelve locale CSVs, existing translation references, and review
ledger. This baseline includes pre-existing working-tree changes; comparison
against HEAD would not be an adequate preservation check.

The extraction manifest records 12,337 scanned files and 13,268 payload
occurrences. Duplicate hashes do not collapse their source occurrences:
there are 6,361 unique payload SHA-256 values.

## Corpus Accounting

The [coverage table](lua-corpus-review-20261115/coverage.tsv) and
[summary](lua-corpus-review-20261115/coverage-summary.json) account for every
manifest occurrence.

| Occurrence Kind | Parsed | Unsupported | Malformed | Total |
| --- | ---: | ---: | ---: | ---: |
| Standalone BXML | 5,362 | 0 | 0 | 5,362 |
| Batch-nested BXML | 4,240 | 0 | 0 | 4,240 |
| Batch Lua script | 3,577 | 89 | 0 | 3,666 |
| Total | 13,179 | 89 | 0 | 13,268 |

All 89 unsupported occurrences stop at an unverified function-header form;
the parser does not resynchronize or manufacture partial function results.
The [pilot report](lua-corpus-review-20261115/parser-pilot.md) documents the
verified framing, pinned byte examples, supported instructions, opaque
regions, and conservative dataflow barriers.

Structural success is not complete semantic support. Only 1,402 occurrences
have fully supported modeled instruction semantics; 11,777 parsed
occurrences retain partial semantics. Complete modeled dataflow is recorded
for 1,998 occurrences, blocked dataflow for 11,181, and unavailable dataflow
for 89. These statuses measure the analyzer's supported model, not runtime
correctness. The decoded evidence contains 61,649 function rows.

## Candidate Evidence

The [candidate summary](lua-corpus-review-20261115/candidate-summary.json)
records 106,309 provisional exact-source-literal candidates and 106,611
same-key, variant-aware four-language comparison links.

| Resource | Parsed String Constant | Unsupported Raw ASCII Match | Total |
| --- | ---: | ---: | ---: |
| `affix` | 38 | 14 | 52 |
| `base` | 756 | 102 | 858 |
| `default` | 8,700 | 96,699 | 105,399 |
| Total | 9,494 | 96,815 | 106,309 |

Of the unsupported raw matches, 95,810 match a one-character English entry.
Maximal printable ASCII runs in an unsupported payload are not decoded Lua
strings; short binary coincidences must not be presented as translation
defects. Parsed constants likewise do not establish display behavior.

There are **zero direct localization-key mappings** and **zero supported
static localization/display call-site mappings**. All candidates keep the
`exact_source_literal_candidate` evidence level. In addition, 147,805 call
observations retain unresolved localization roles. The analyzer does not
infer an API contract from a function name, equate a number with a text ID,
or infer a speaker, dialogue sequence, or branch from co-occurrence.

The old literal index has 48 rows, all accounted for in
[legacy reconciliation](lua-corpus-review-20261115/legacy-reconciliation.tsv).
The new search includes all three resources and short literals rather than
the earlier batch/default/length-limited search. The
[credit reconciliation](lua-corpus-review-20261115/credit-reconciliation.tsv)
also accounts for all 16 previously reviewed credit labels; their current
four-language text matches that earlier checkpoint. This is provenance
accounting, not automatic approval of the earlier translation decisions.

## Linguistic Review

Fifty-four packets contain 2,656 distinct
`(resource, id, variant)` comparison keys: 121 `affix`, 138 `base`, and
2,397 `default`. They preserve 106,309 candidate IDs and all 106,611 links,
including variant relationships crossing packet boundaries.

English governs meaning, Japanese informs register where supported, Chinese
provides supporting context, and current Korean is the review target.
Missing locales, source conflicts, or insufficient context stay unresolved.
English `FF` is never borrowed into a different `affix` variant.

See the [review instructions](lua-corpus-review-20261115/review-instructions.md)
and [packet manifest](lua-corpus-review-20261115/review-packet-summary.json).

All 2,656 keys passed exact packet, schema, fingerprint, and evidence-reference
validation. Key-level dispositions are 2,459 retain, 193 unresolved, and 4
proposed corrections. The [independent proposal review](lua-corpus-review-20261115/proposal-independent-review.md)
checked all four proposed keys against prior scoped decisions. Proposals remain
unactioned and are not Lua-to-localization links.

The [candidate reconciliation](lua-corpus-review-20261115/reconciliation/reconciliation-summary.json)
joined every candidate ID to all mapped comparison keys and their validated
reviews. Candidate-level dispositions are 106,118 retain, 167 unresolved, and
24 proposed corrections. The 24 proposals are 21 candidates for `base:891`
and one each for `default:38785`, `default:53659`, and `default:61109`.
Aggregation is mechanical: multiple variant comparisons require unanimous
retains or identical proposals; conflicts and unresolved variants remain
unresolved. No candidate disposition promotes its evidence level.

There are zero confirmed Lua-to-localization links, so no confirmed-links
index was created and no classification mapping was promoted.

## Reproduction And Safety

Run from the repository root, with the local read-only game corpus and
extracted payloads available:

```sh
python3 -m unittest discover -s tools -p 'test_*.py' -v
python3 -m unittest discover -s work/zh_cn/audit -p 'test_probe_ffq35_lua.py' -v
python3 tools/extract_lua_scripts.py --check
python3 tools/analyze_lua_corpus.py --output-dir work/zh_cn/audit/lua-corpus-review-20261115 --check
python3 tools/analyze_lua_corpus.py --output-dir work/zh_cn/audit/lua-corpus-review-20261115 --candidates --check
python3 tools/lua_translation_candidates.py validate-key-reviews --packets work/zh_cn/audit/lua-corpus-review-20261115/review-packet-*.jsonl --reviews work/zh_cn/audit/lua-corpus-review-20261115/key-reviews-0001-0018.jsonl work/zh_cn/audit/lua-corpus-review-20261115/key-reviews-0019-0036.jsonl work/zh_cn/audit/lua-corpus-review-20261115/key-reviews-0037-0054.jsonl
python3 tools/reconcile_lua_reviews.py --candidates work/zh_cn/audit/lua-corpus-review-20261115/candidates.jsonl --mapping work/zh_cn/audit/lua-corpus-review-20261115/candidate-id-mapping.jsonl --packets work/zh_cn/audit/lua-corpus-review-20261115/review-packet-*.jsonl --reviews work/zh_cn/audit/lua-corpus-review-20261115/key-reviews-0001-0018.jsonl work/zh_cn/audit/lua-corpus-review-20261115/key-reviews-0019-0036.jsonl work/zh_cn/audit/lua-corpus-review-20261115/key-reviews-0037-0054.jsonl --output-dir work/zh_cn/audit/lua-corpus-review-20261115/reconciliation --check
```

Final validation passed: 153 tool tests, 6 FFQ35 probe tests, byte-identical
round-trip checking for 606 Lua containers, deterministic Task 4 and Task 5
checks, all 54 key-review packets, and the full candidate reconciliation
`--check`. The extraction check accounted for 13,268 occurrences with zero
unclassified signatures. The frozen input snapshot remained valid. No
translation CSV, source asset, extracted payload, or pre-existing ledger
decision was changed by this review. No VM execution, source decompilation,
runtime game test, binary build, package operation, or commit is part of this
review.
