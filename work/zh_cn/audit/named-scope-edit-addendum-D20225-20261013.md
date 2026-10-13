# Edit Addendum D-20225

Verified active SHA-256
`d586498317482086138840215c7e1af58ea55e64d47bef53f3d1bb3d012c0f66`
and byte-identical pre-edit backup
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20225/locatexts_zh_cn.koalocatext_default.csv`
immediately before changing two Korean `Texto` cells:

- 57505: `도칼파르 도시` -> `도크알브 도시`
  (Dokkalfar, official Korean manual PDF p. 1).
- 57507: `다시는 햇빛을 볼 희망도 없이 죽어 간다.` ->
  `다시는 햇빛을 볼 희망도 없다.`
  The English journal says the speaker rests without hope of
  daylight, not that death is already occurring. Preserve every
  journal break and the final plea to deliver the book.

`apply-named-scope-D20225.rb` verified inverse non-target bytes,
BOM, mixed line endings, 65,135 ordered IDs, and 50 four-locale
keys/breaks/markers (57507's 14 internal breaks unchanged).
Post-edit SHA-256:
`001d60ae9693289d9ccac16e95197fe25acf225694e1c3ec86e25bdd0d703c41`.
