# Edit Addendum D-20220

Verified active SHA-256
`5bb2ffe36ec8d5ea7fc0667af204b6a7c3bae15e3803d1be13ccabbce82e5d81`
and byte-identical pre-edit backup
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20220/locatexts_zh_cn.koalocatext_default.csv`
immediately before changing three Korean `Texto` cells:

- 57278: `여행자에 합류`/`여행자 야영지` ->
  `트래블러에 합류`/`트래블러 야영지`;
  `그램은` -> `그림은` (named Travelers and Grim).
- 57289: both `지팡이, 차크람, 홀` sequences use `셉터`;
  `장검` -> `롱소드`, `망치` -> `해머`, `단검` -> `대거`,
  `장궁` -> `롱보우`, `대검` -> `그레이트소드`.
  Match the official Korean manual's weapon-class list (PDF p. 7).
- 57299: `전쟁맹세단 동료` -> `워스원 동료`
  (official Korean manual, PDF p. 7).

`apply-named-scope-D20220.rb` verified inverse non-target bytes,
BOM, mixed line endings, 65,135 ordered IDs, and 50 four-locale
keys/breaks/markers. Post-edit SHA-256:
`56574f551bab15324bc5eb8340c1c39ed3ed29405641000e5d9a6dfd911d7178`.
