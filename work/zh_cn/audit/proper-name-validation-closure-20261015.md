# Historical Proper-Name Review Pass Validation (D-20613 Snapshot)

Date: 2026-10-15

This is a historical validation snapshot from before the continued review
through D-20828. Its counts and residual findings below are not current.
Use `proper-name-continuation-validation-20261015.md` for the current
checkpoint and verification results.

## Reverse Edit-Chain Verification

`verify-proper-name-full-chain.rb` reconstructed all 224 edited stages from
D-20613 back through D-20390, including the separate peoples/deities stages
in D-20392 and House stage in D-20393. For every edited resource it checked
the exact manifest old/new `Texto`, headers, keys, row order, unchanged
non-target cells and bytes, BOM, complete line-ending sequence, and inverse
reconstruction against the recorded byte-identical backup.

The reconstructed pre-D-20390 hashes match the recorded starting state:

| Resource | Reconstructed SHA-256 |
| --- | --- |
| `affix` | `516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e` |
| `base` | `b5cd7ece89e1039a9bc7bc870bb7aa81eb61fd72f4e454dc3ec41651a5f968ac` |
| `default` | `f17ee0aee19bd5c1bd9a9681f235dcd8b6da3a063a40326af54ed73ed0926234` |

## Indexed Scope and Residual Check

The current occurrence index contains 12,820 entity/row matches: 7,550
`accepted`, 4,262 `not-an-issue`, 1,003 `excluded`, and five `uncertain`.
There are zero `needs-context` matches; the five existing holds cover four
CSV row keys and were not reopened.

The final source/index comparison found 12,815 source matches, no missing
index keys, and five documented contextual Anwon-family additions. The
terminal-match bilingual-label scan found zero omissions. The glossary has
469 entries (468 confirmed and one excluded). These results reconcile the
registered glossary scope; they do not prove exhaustive discovery of every
proper name.

`proper-name-candidates.tsv` contains 29,569 heuristic candidates, all still
marked `needs-context`. It is a broad, non-exhaustive discovery aid, not a
queue of verified proper names. Therefore overall proper-name discovery and
consistency are not declared complete. Do not reopen the five existing holds
without new evidence.

## Verification

- `ruby work/zh_cn/audit/verify-proper-name-full-chain.rb`: PASS, 224 stages.
- `ruby work/zh_cn/audit/test-proper-name-cell-editor.rb`: PASS.
- `ruby work/zh_cn/audit/test-proper-name-candidates.rb`: 13 runs, 68 assertions, zero failures.
- Residual source/index comparison: zero missing source keys and zero terminal bilingual omissions.
- No CSV was edited during this validation pass.
