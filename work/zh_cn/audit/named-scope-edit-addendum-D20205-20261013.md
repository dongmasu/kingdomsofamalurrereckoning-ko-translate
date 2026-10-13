# Edit Addendum D-20205

Verified the pre-edit active CSV SHA-256
`95c585a08306cecba9f6c3415355e680ee32673b6766d4a232832f6a64401a24`
and byte-identical backup
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20205/locatexts_zh_cn.koalocatext_default.csv`
immediately before changing this Korean `Texto` cell:

- 56537: `내가 사이온(Scion)다.` -> `내가 사이온(Scion)이야.` (corrects the incomplete copula; D-19685's accepted Scion terminology remains unchanged).

`apply-named-scope-D20205.rb` verified inverse non-target bytes,
BOM, mixed line endings, all 65,135 ordered IDs, and all 50 four-locale
keys, line breaks, and runtime markers. Post-edit SHA-256:
`26e5b747ee618259fec4e42d05521ab4566e6b30c6827dae2521652602abf7ca`.
