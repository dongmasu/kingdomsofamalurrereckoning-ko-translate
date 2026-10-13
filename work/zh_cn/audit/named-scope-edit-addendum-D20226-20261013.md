# Edit Addendum D-20226

Verified active SHA-256
`001d60ae9693289d9ccac16e95197fe25acf225694e1c3ec86e25bdd0d703c41`
and byte-identical pre-edit backup
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20226/locatexts_zh_cn.koalocatext_default.csv`
immediately before changing two Korean `Texto` cells:

- 57573: `중가르라는 성을` -> `준가르라는 성을`
  (Zungar, active IDs 57026/57200).
- 57576: `에마이르 지하에는` -> `에메어 지하에는`
  (Emaire, active IDs 56815/56979/57319).

`apply-named-scope-D20226.rb` verified inverse non-target bytes,
BOM, mixed line endings, all 65,135 ordered IDs, and 50 four-locale
keys/breaks/markers. Post-edit SHA-256:
`a1990db91f34900ca39326219ecc74f1ccc0a41aef1add8174bd3f7ca8997ed8`.
