# Edit Addendum D-20257

The active CSV and byte-identical backup immediately before editing had
SHA-256 `f9c8e65d6c9cd8c8d694031636a675d1bcc0c49a444c14fa1130b6e6e0bd293f`.
Backup:
`/private/tmp/ko-translate-backups/20261014/before-named-scope-D20257/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Before | After | Evidence |
| ---: | --- | --- | --- |
| 59101 | `실의 아만의 굴은 멀지 않아. 바로 여기 여름의 요람에 있지. 지금 그리로 가는 중이야. 그곳이 날 구원해 줄 거야.` | `실에 있는 아만의 굴은 멀지 않아. 바로 여기 여름의 요람에 있지. 지금 그리로 가는 중이야. 그곳이 날 구원해 줄 거야.` | Japanese explicitly locates Amman's hollow in Syl; Chinese supports this reading. Replace the awkward stacked genitives without changing the objective or place names. |
| 59150 | `미타루께서 결국 우리를 해방해 주실 거야. 이 모든 것도 그분의 위대한 계획의 일부지.` | `미사루께서 결국 우리를 해방해 주실 거야. 이 모든 것도 그분의 위대한 계획의 일부지.` | The official Korean manual (PDF p. 2) gives the deity Mitharu as `미사루`; Japanese and Chinese identify the same god. |

Only these two `Texto` values changed; their record endings and every other
byte were preserved. Inverse substitutions recreated the backup exactly.
UTF-8 BOM, 72,011 CRLF and 73 bare-LF endings, all 65,135 ordered IDs, and
the 50-ID scope across English, Japanese, Chinese, and Korean passed.
Post-edit SHA-256:
`86e67d1a168918fa73291ec377bd24d5354af85ae33a2c833a4d3b4fd7d0f45c`.
