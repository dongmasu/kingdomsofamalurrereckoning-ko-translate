# Edit Addendum D-20224

Verified active SHA-256
`f24f6ff2d220b7bef7f09d13c52d46ffc7afca1c52fce6ddb621710261dcebd7`
and byte-identical pre-edit backup
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20224/locatexts_zh_cn.koalocatext_default.csv`
immediately before changing two Korean `Texto` cells:

- 57472: `서부 페이랜드에` -> `서부 패란즈에`
  (Faelands, official Korean manual PDF p. 1; preserve original
  English's unusual `Faelandsh` in the read-only source).
- 57500: `도칼파르 사반트` -> `도크알브 사반트`
  (Dokkalfar, official Korean manual PDF p. 1).

`apply-named-scope-D20224.rb` verified inverse non-target bytes,
BOM, mixed line endings, all 65,135 ordered IDs, and 50 four-locale
keys/breaks/markers. Post-edit SHA-256:
`d586498317482086138840215c7e1af58ea55e64d47bef53f3d1bb3d012c0f66`.
