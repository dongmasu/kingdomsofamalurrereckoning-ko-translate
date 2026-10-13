# Edit Addendum D-20207

Verified the pre-edit active CSV SHA-256
`8b02767230305512a5286f1721ba00a647d2280981279d71c3c548c9ccdafaa3`
and byte-identical backup
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20207/locatexts_zh_cn.koalocatext_default.csv`
immediately before changing these Korean `Texto` cells:

- 56615: `조툰` -> `요툰` (aligns Jottun with established active-corpus usage and accepted D-19685/56749).
- 56639: `여행자 야영지` -> `트래블러 야영지` (the source identifies the Travelers faction camp; use the official-manual faction name and established camp wording).
- 56643: `조툰` -> `요툰` (aligns Jottun with established active-corpus usage and accepted D-19685/56749).

`apply-named-scope-D20207.rb` verified inverse non-target bytes, UTF-8 BOM,
mixed line endings, all 65,135 ordered IDs, and all 50 four-locale keys,
line breaks, and runtime-marker signatures. Post-edit SHA-256:
`522fe409323161858dd7b0e1f3556ec0173a3e1f16f13aa484c8d59f2e06ea84`.
