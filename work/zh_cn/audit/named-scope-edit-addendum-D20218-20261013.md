# Edit Addendum D-20218

Verified active SHA-256
`f48f341862ac2c72b9738c76357819b9c40576bceede203673a49a3d9097a674`
and byte-identical pre-edit backup
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20218/locatexts_zh_cn.koalocatext_default.csv`
immediately before changing four Korean `Texto` cells:

- 57157: `조툰은` -> `요툰은` (established Jottun form).
- 57159: `비탄의 힘(Sorrows)는` -> `비탄의 힘(Sorrows)은`;
  `그들을 위험에 노출하지 않았어` ->
  `그 힘을 위험에 노출하지 않았어` (D-19686's accepted force sense).
- 57165: `아들이 독을 먹었대!` -> `아들이 독에 당했대!`
  (passive `was poisoned`, without presuming death or voluntary ingestion).
- 57178: `조툰을 감시` -> `요툰을 감시`.

`apply-named-scope-D20218.rb` verified inverse non-target bytes,
BOM, mixed line endings, 65,135 ordered IDs, and 50 four-locale
keys/breaks/markers. Post-edit SHA-256:
`b7cfaccddb01732d8372fa61894ce2d49036fd3e097d5b10f1a3ff4c3efec593`.
