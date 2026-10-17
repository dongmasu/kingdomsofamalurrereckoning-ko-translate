# D-20390 Edit Addendum

Date: 2026-10-15

Applied 95 reviewed `Texto` edits (11 `base`, 84 `default`) using
`review-example-names-D20390.rb` and the tested byte-preserving
`proper-name-cell-editor.rb`. Manifest:
[proper-name-edits-D20390.tsv](proper-name-edits-D20390.tsv).

| Resource | Pre-edit SHA-256 | Post-edit SHA-256 |
| --- | --- | --- |
| base | `b5cd7ece89e1039a9bc7bc870bb7aa81eb61fd72f4e454dc3ec41651a5f968ac` | `cebf707b2d8d18a59a113059980798010612d18e13d229a0b08b21dc651e8cfa` |
| default | `f17ee0aee19bd5c1bd9a9681f235dcd8b6da3a063a40326af54ed73ed0926234` | `bb38115eaef16232eb7e3875f038d587496f3c0769740a3e7f9f46410966af37` |

Byte-identical backups created immediately before writes:

- `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20390/locatexts_zh_cn.koalocatext_base.csv`
- `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20390/locatexts_zh_cn.koalocatext_default.csv`

Verification passed: BOM, semicolon delimiter/header, exact complete
line-ending sequence (including embedded line breaks), row count/order
(4,844 base / 65,135 default), ID/variant fields, game tokens, target
values, and all non-target bytes. Reversing exact encoded field patches
reproduced the backup byte-for-byte before each write. Saved bytes match
the validated output. Editor fixtures include mixed embedded newlines,
quotes/semicolons, no terminal newline, variants, stale manifests,
duplicate targets, and token-change rejection.

Affix is unchanged at
`516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e`.
This focused pass does not change global tally or prior key dispositions.
No build/publication occurred.
