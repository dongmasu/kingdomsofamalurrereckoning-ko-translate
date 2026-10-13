# Edit Addendum D-20258

The active CSV and byte-identical backup immediately before editing had
SHA-256 `86e67d1a168918fa73291ec377bd24d5354af85ae33a2c833a4d3b4fd7d0f45c`.
Backup:
`/private/tmp/ko-translate-backups/20261014/before-named-scope-D20258/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Before | After | Evidence |
| ---: | --- | --- | --- |
| 59156 | `기란은 벨렌의 유언 결사에 현혹됐다. 어쩔 수 없이 그와 그가 조종하던 꼭두각시들을 죽였다. 콜름에게 가서 무사한지 확인해야겠다.` | `기란은 벨렌의 테스타먼트에 현혹됐다. 어쩔 수 없이 그와 그가 조종하던 꼭두각시들을 죽였다. 콜름에게 가서 무사한지 확인해야겠다.` | English names Belen's Testament; use the accepted organization's proper-name form `벨렌의 테스타먼트` (D-19674/D-19998/D-20007), not a last-will compound. |
| 59167 | `지금은 복수의 전당을 지나 그 커를 죽이기만 하면 돼.` | `지금은 복수의 집을 지나 그 커를 죽이기만 하면 돼.` | Reuse the established House of Vengeance rendering `복수의 집` (D-6926/D-19927). Cur remains uncertain and is not reinterpreted. |
| 59194 | `이건 너무 시시하잖아, 친구. 마음이 바뀌면 여기서 게임을 계속할 수 있어.` | `그건 좀 치사하잖아, 친구. 마음이 바뀌면 여기서 게임할 수 있어.` | English `hardly sporting` criticizes unfair conduct, not boredom; retain the invitation to play if the listener changes their mind. |

Only these three `Texto` values changed; their record endings and every
other byte were preserved. Inverse substitutions recreated the backup
exactly. UTF-8 BOM, 72,011 CRLF and 73 bare-LF endings, all 65,135 ordered
IDs, and the 50-ID scope across English, Japanese, Chinese, and Korean
passed. Post-edit SHA-256:
`16488cee2defe300d20a5eb0bfc0498562275ccb512cd6d3cdda505d38216e56`.
