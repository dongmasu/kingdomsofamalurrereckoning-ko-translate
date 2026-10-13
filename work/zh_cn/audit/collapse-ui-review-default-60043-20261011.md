# UI `Collapse` Review: `default` ID 60043

- Date: 2026-10-11
- Decision: D-18204
- Scope: `default` ID 60043
- Disposition: accepted; supersedes the uncertain finding in D-17882

## Evidence and Decision

| Source / sibling control | Text |
| --- | --- |
| English ID 60043 | `Collapse` |
| Japanese source ID 60043 | `詳細を隠す` |
| Chinese source ID 60043 | `收拢` |
| Previous Korean ID 60043 | `붕괴` |
| Applied Korean ID 60043 | `접기` |
| English / Korean ID 48418 | `Expand` / `펼치기` |
| English / Korean ID 17416 | `Collapse All` / `모두 접기` |
| English / Korean ID 30134 | `Expand All` / `모두 펼치기` |

The user confirms that ID 60043 is the UI action for folding a menu, not
destruction or a resulting state. The Japanese and Chinese sources support
hiding/folding interface content. Existing Korean controls establish the
opposing `펼치기` form and the matching `모두 접기` form. `접기` is therefore
the consistent action label.

## Edit and Verification

Only the active Korean `Texto` cell at ID 60043 changed.

| Check | Result |
| --- | --- |
| Pre-edit SHA-256 | `e6baa895a059ae0de03aad514db5354049b877cc6d49ef34178cc8de560af2e7` |
| Post-edit SHA-256 | `72dd2be711abc43b037f6560e55518823452f147ebb4b6f9d68bc17bcce806f7` |
| Byte comparison | Exactly the one authorized cell replacement |
| CSV structure | UTF-8 BOM, 65,135 data rows, key order, and all CRLF/bare-LF endings preserved |
| Backup | `/private/tmp/ko-translate-backups/20261011/before-default-60043-collapse-20261011/locatexts_zh_cn.koalocatext_default.csv` |

D-17882 counted this key as uncertain. D-18204 reclassifies it as accepted.
Cross-resource totals are now 1,906 accepted, 22,910 `not an issue`, and
13,706 uncertain (38,522 total); next decision: D-18205.
