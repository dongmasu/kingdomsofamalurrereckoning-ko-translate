# Proper-Name Resume Verification

Date: 2026-10-15

## Verified Starting State

The resumed checkpoint was D-20768; the next proper-name batch was D-20769.
All three active CSV hashes matched the current blocks in NEXT-SESSION.md,
TRANSLATION_PROGRESS.md, the audit README, and the decision register:

| Resource | Starting SHA-256 |
| --- | --- |
| affix | `23e4e9e47f730d55b2a717619c7cc6245b72f135cf14d550ccac7928b41cbe1a` |
| base | `4a3bf4b126c0af229267c0bf4d3b939de901f5ee57df183920c7033247ac0124` |
| default | `9d032b09f2b3849afea7d19303e4d38690d405ddeb708656c78c7a8522d20a3a` |

The last pre-edit default backup was verified at
`/private/tmp/ko-translate-backups/20261015/before-proper-name-D20768/locatexts_zh_cn.koalocatext_default.csv`;
its SHA-256 was
`ae4549fd2906b9dc97a254babf6584599d4e55d32d5414a5a37164551b655a38`,
matching D-20768's recorded pre-edit state.

## Historical Chain Verification

`ruby work/zh_cn/audit/verify-proper-name-full-chain.rb` completed successfully
against the captured D-20768 state. It verified 379 reviewed edit stages,
including the separate peoples/deities/House stages, by inverse
reconstruction against the exact pre-edit backups. Checks included target
old/new Texto, row keys/order/count, unchanged non-target cells and bytes,
BOM, and the complete mixed line-ending sequence.

The reconstructed pre-D-20390 hashes matched all three recorded baselines:

| Resource | Reconstructed SHA-256 |
| --- | --- |
| affix | `516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e` |
| base | `b5cd7ece89e1039a9bc7bc870bb7aa81eb61fd72f4e454dc3ec41651a5f968ac` |
| default | `f17ee0aee19bd5c1bd9a9681f235dcd8b6da3a063a40326af54ed73ed0926234` |

English/Japanese/Chinese source CSV hashes for affix/base/default also matched
the nine source hashes in `proper-name-review-D20389-20261015.md`.
No source CSV or sidecar was modified. No PAK or PAK-derived resource was
inspected or modified.
This is an edit-integrity check, not exhaustive linguistic approval or
in-game validation.

## Continuation Safeguards

- The faction helper now checks proposed English terms against other owners
  without blocking on unrelated existing homonyms such as Cryamor.
- Separate review caught and corrected Korean particle allomorphs and
  Mitharan lexical suffix placement before application.
- Separate review caught the monster helper's loss of the Korean
  `고기 5개` qualifier. Unsupported parentheticals are now held unchanged.
- The monster helper checks exact aligned source-key/content fingerprints,
  validates proposals before registration, and excludes complete
  ballad/book/team-title hits from standalone species decisions.
- The byte-preserving editor, inventory builder, occurrence indexer, and
  non-overlapping reviewed-edit rebase fixture suites passed.

Subsequent D-number reports/addenda and the current checkpoint blocks record
the actual applied continuation. This starting-state report does not
supersede those later CSV hashes or claim overall proper-name completion.
