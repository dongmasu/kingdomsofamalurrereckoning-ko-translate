# Edit Addendum D-20190

Before editing, confirmed active SHA-256
`58e94ff92e72f2c9be4cef64eb28a58eb8d0710f67361e04f528d1bb724540f8`
and an identical pre-edit backup at
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20190/locatexts_zh_cn.koalocatext_default.csv`.
The sole change was ID 55799 `Texto`: `에센(Ethene)` ->
`에테네(Ethene)` (official Korean manual, PDF p. 2).

`apply-named-scope-D20190.rb` passed inverse non-target byte
comparison, BOM, mixed record-ending counts, ordered IDs, all 50
four-locale two-column rows, line breaks, identical marker counts
and English/Korean marker order. At 55780 Japanese/Chinese order
`{2}` before `{1}`; English/Korean retain `{1}` then `{2}`.
Post-edit SHA-256:
`28cce105ecae818ad74be0a5c8e7bc021297e9169da1a438d4ee93abe47887e4`.
