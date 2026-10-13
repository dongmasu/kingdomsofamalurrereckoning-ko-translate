# Edit Addendum D-20208

Verified the pre-edit active CSV SHA-256
`522fe409323161858dd7b0e1f3556ec0173a3e1f16f13aa484c8d59f2e06ea84`
and byte-identical backup
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20208/locatexts_zh_cn.koalocatext_default.csv`
immediately before changing ID 56687's Korean `Texto` cell:

- `세력 퀘스트` -> `팩션 퀘스트`
- `보조 퀘스트` -> `사이드 퀘스트`
- `과제` -> `임무`
- `완료한 퀘스트` -> `완수한 퀘스트`

These five category labels now match the official Korean manual's
classification on PDF p. 7. `apply-named-scope-D20208.rb` verified inverse
non-target bytes, UTF-8 BOM, mixed line endings, all 65,135 ordered IDs,
and all 50 four-locale keys, line breaks, and runtime-marker signatures.
Post-edit SHA-256:
`a9133d8c8411081dd243a8494b7aa66ebc47b2052639be49785ae818a5eed631`.
