# Edit Addendum D-20189

Verified the active SHA-256
`289a526b23484d2be8763b368c1133dd3edda06501677bae0e47b96c31072cdf`
and made an identical pre-edit backup at
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20189/locatexts_zh_cn.koalocatext_default.csv`.
Changed only Korean `Texto` cells 55715 (`사이온(Scion)를` ->
`사이온(Scion)을`) and 55746 (`워스워른(Warsworn)` ->
`워스원(Warsworn)`).

`apply-named-scope-D20189.rb` verified inverse byte equality,
BOM, mixed endings, ordered IDs and 50 four-locale keys/breaks/markers.
Post-edit SHA-256:
`58e94ff92e72f2c9be4cef64eb28a58eb8d0710f67361e04f528d1bb724540f8`.
