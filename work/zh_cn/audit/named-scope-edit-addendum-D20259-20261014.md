# Edit Addendum D-20259

The active CSV and byte-identical backup immediately before editing had
SHA-256 `16488cee2defe300d20a5eb0bfc0498562275ccb512cd6d3cdda505d38216e56`.
Backup:
`/private/tmp/ko-translate-backups/20261014/before-named-scope-D20259/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Before | After | Evidence |
| ---: | --- | --- | --- |
| 59207 | `나르카가 어떻게 생겨났는지는 확실히 모르지만, 플로리온은 알세룬드에서 그들을 몰아낼 방법을 알고 있어.` | `나르카가 어떻게 생겨났는지는 확실히 모르지만, 플로리온은 알세룬드에서 그들을 몰아낼 방법을 생각해 둔 게 있어.` | English `has ideas` does not establish that Florion already knows the answer; retain a proposed approach. |
| 59209 | `아주 오래전, 나와 알라레인은 통곡하는 왕을 독실하게 따르며 미든을 거닐었어. 그녀는 텐더였고 나는 델버였지. 우리는 각자의 첫 번째였어.` | `아주 오래전, 나와 알라레인은 통곡하는 왕을 독실하게 따르며 미든을 거닐었어. 그녀는 텐더였고 나는 델버였지. 우리는 각자 그 역할의 시초였어.` | English/Japanese identify the pair's respective Tender/Delver roles before “first of our kind”; state that relation clearly. |
| 59235 | `엘로렌 크리에트의 주머니를 뒤졌지만, 보석함이 압수됐다는 압류 통지서만 찾았다. 아데사 무기고의 압수품 보관함에 있을 것이다.` | `엘로렌 크리에트의 주머니를 털었지만, 보석함이 압수됐다는 압류 통지서만 찾았다. 아데사 무기고의 압수품 보관함에 있을 것이다.` | English explicitly says `pick-pocketed`; `주머니를 털다` retains the theft rather than merely searching pockets. |

Only these three `Texto` values changed; their record endings and every
other byte were preserved. Inverse substitutions recreated the backup
exactly. UTF-8 BOM, 72,011 CRLF and 73 bare-LF endings, all 65,135 ordered
IDs, and the 50-ID scope across English, Japanese, Chinese, and Korean
passed. Post-edit SHA-256:
`b5bbf4f8bb0a5feaa2d0cb07e9971b3cbf96764f3109a46cd848891ebfa94166`.
