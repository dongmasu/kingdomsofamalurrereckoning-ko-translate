# Edit Addendum D-20219

Verified active SHA-256
`b7cfaccddb01732d8372fa61894ce2d49036fd3e097d5b10f1a3ff4c3efec593`
and byte-identical pre-edit backup
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20219/locatexts_zh_cn.koalocatext_default.csv`
immediately before changing two Korean `Texto` cells:

- 57206: `브레이코르는` -> `브래코르는`
  (Vraekor, official Korean manual PDF p. 2).
- 57231: `비탄의 힘는` -> `비탄의 힘은`
  (restore correct particle to D-19686's accepted Sorrows term).

`apply-named-scope-D20219.rb` verified inverse non-target bytes,
BOM, mixed line endings, all 65,135 ordered IDs, and 50 four-locale
keys, line breaks, and markers. Post-edit SHA-256:
`5bb2ffe36ec8d5ea7fc0667af204b6a7c3bae15e3803d1be13ccabbce82e5d81`.
