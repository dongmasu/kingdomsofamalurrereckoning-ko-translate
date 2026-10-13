# Edit Addendum D-20215

Verified active SHA-256
`335753d578b6235c6cd5657d56360a9d57d28dca75cfa26dca7c08002a35d96a`
and byte-identical pre-edit backup
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20215/locatexts_zh_cn.koalocatext_default.csv`
immediately before changing four Korean `Texto` cells:

- 57023: `또 여행자야?` -> `또 트래블러야?`
  (named Traveler faction, manual PDF p. 7).
- 57036: `후계자가 죽었다.` -> `사이온이 죽었다.`
  (formal Scion, D-19685).
- 57039: `정말 많이 좋아졌어요. 일어나서` ->
  `정말 많이 좋아졌어요. 감사합니다. 일어나서`
  (English explicitly says `thank you`).
- 57041: `전쟁맹세단에 들어갈` -> `워스원에 들어갈`
  (Warsworn, manual PDF p. 7).

`apply-named-scope-D20215.rb` verified inverse non-target bytes,
BOM, mixed line endings, all 65,135 ordered IDs, and 50 four-locale
keys, line breaks, and markers (including empty 57047).
Post-edit SHA-256:
`f48f341862ac2c72b9738c76357819b9c40576bceede203673a49a3d9097a674`.
