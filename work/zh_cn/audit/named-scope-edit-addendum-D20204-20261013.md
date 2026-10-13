# Edit Addendum D-20204

Verified the pre-edit active CSV SHA-256
`e2ae9b4cb677d9d6f0dded18607dfa10828feca5b6d1a73ef4ad681a7a24bc81`
and byte-identical backup
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20204/locatexts_zh_cn.koalocatext_default.csv`
immediately before changing these Korean `Texto` cells:

- 56480: `침묵의 성가대` -> `침묵의 합창단(Silent Choir)`, following the accepted same-group form at ID 51244.
- 56491: `그이는 뭐든 세게 치는 걸 좋아해.` -> `뭐든 세게 치는 걸 좋아하거든.`, removing an unsupported intimate pronoun while retaining the warning.

`apply-named-scope-D20204.rb` verified inverse non-target bytes,
BOM, mixed line endings, all 65,135 ordered IDs, and all 50 four-locale
keys, line breaks, and runtime markers. Post-edit SHA-256:
`95c585a08306cecba9f6c3415355e680ee32673b6766d4a232832f6a64401a24`.
