# Edit Addendum D-20206

Verified the pre-edit active CSV SHA-256
`26e5b747ee618259fec4e42d05521ab4566e6b30c6827dae2521652602abf7ca`
and byte-identical backup
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20206/locatexts_zh_cn.koalocatext_default.csv`
immediately before changing these Korean `Texto` cells:

- 56551: `사이온(Scion)는` -> `사이온(Scion)은` (corrects the topic particle; D-19685's accepted Scion terminology remains unchanged).
- 56554: `운명 정수(1)` -> `운명의 정수(1)` (aligns Essence of Fate with the established active-corpus term; reagent quantities and layout remain unchanged).
- 56575: `교수대 끝자락` -> `갤로우스 엔드` (uses the established named-island form for Gallows End).

`apply-named-scope-D20206.rb` verified inverse non-target bytes, UTF-8 BOM,
mixed line endings, all 65,135 ordered IDs, and all 50 four-locale keys,
line breaks, and runtime-marker signatures. The pre-existing 56581 Chinese
line-break difference (nine versus ten in English, Japanese, and Korean)
was checked and preserved. Post-edit SHA-256:
`8b02767230305512a5286f1721ba00a647d2280981279d71c3c548c9ccdafaa3`.
