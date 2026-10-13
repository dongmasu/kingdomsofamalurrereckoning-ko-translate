# Consolidated Context Review: `default` IDs 25001-25050

- Date: 2026-10-11.
- Re-reviewed all 17 keys previously left uncertain in the preliminary
  disposition against English meaning, Japanese voice/register and draft,
  Chinese supporting evidence, active Korean, recurring corpus forms, and
  earlier decisions.
- Resolved all 17: two accepted corrections and 15 `not an issue`.

## Decisions D-19054-D-19064

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19054 | 25009, 25013 | not an issue | Nyralim, Titarion, Summer Court, Scions, Erathi, and Akara remain identifiable; the Korean phonetic/name and lore renderings are plausible, and locale transliteration differences do not establish a row-local error. |
| D-19055 | 25012 | not an issue | `오록스` is a defensible Korean transliteration of Aurochs; the Chinese generic wild-ox rendering does not establish that the English creature name should be replaced. |
| D-19056 | 25017 | not an issue | The barrier draws on vulnerable energy nexuses, and destroying them enables reaching Bisarane. Korean preserves both the dependency and objective; Japanese's descriptive paraphrase does not establish a canonical Korean technical term. |
| D-19057 | 25019-25020 | not an issue | Mitharu's exclamation, Egan's return, Bridgette Malloi's betrayal/disappearance, the safety objective, and Fate-magic trail remain. `소울딥의 금식처` is also used at ID 24263; the locale wording differences do not prove a different Korean place name. |
| D-19058 | 25025 | not an issue | The relic is lent to Edgar to extract valuable minerals because he seemed worthy of friendship; Korean's `캐내다` preserves the defensible mining/extraction reading without overcommitting to a mechanism. |
| D-19059 | 25027 | not an issue | Tarrick Smith is introduced as the challenger; the repeated hammering joke is retained through `두드리다`. |
| D-19060 | 25029-25030 | mixed | ID 25029 preserves the Camp Moondown defense objective. At ID 25030, capitalization, Japanese `サイファー`, and the verb “bear” identify the Cipher as a carried named lore object rather than an ordinary password; use `사이퍼(Cipher)`. The expectation about the Beckoned and the speaker's conclusion remain. |
| D-19061 | 25031, 25037, 25045 | not an issue | The Mitharan equipment origin and Kollossae people/citizen labels are preserved. Differences in locale transliteration do not establish canonical Korean forms or a local semantic defect. |
| D-19062 | 25040 | accepted | Normalize the cousin to the already established `아싸드(Athad)` at ID 23995 and Motus Mining to the accepted company form `모투스 광업 회사`; `영입했지` preserves “recruited me” and the speaker's ironic final remark. |
| D-19063 | 25041 | not an issue | The question about whether the Codex is forged is retained. English, Japanese, and Chinese vary between codex/document/book/legal-code readings, so the generic `문서` is safer than an unsupported narrower choice. |
| D-19064 | 25049-25050 | not an issue | The Children of Dust's prewritten-story belief, first-dawn timing, and deserted-island appearance joke remain; no supported row-local correction is established. |

## Edits

| ID | Before | After | Rationale |
| ---: | --- | --- | --- |
| 25030 | `부름받은 자는... 우리 종족 중 하나일 거라고 생각했어. 하지만 넌 암호를 지니고 있군. 네 역할은 더없이 분명해.` | `부름받은 자는... 우리 종족 중 하나일 거라고 생각했어. 하지만 넌 사이퍼(Cipher)를 지니고 있군. 네 역할은 더없이 분명해.` | The source names a capitalized object the addressee bears; the Japanese transliteration supports a named object rather than an ordinary code. Scoped to this row; other Cipher usages remain governed by their own decisions. |
| 25040 | `나는 스코리아 광산의 선임 작업반장이야. 예전엔 에라셀의 동굴에서 일했지만, 사촌 아사드가 모투스 광산에서 일하도록 데려왔지. 결과가 참 좋기도 하군.` | `나는 스코리아 광산의 선임 작업반장이야. 예전엔 에라셀의 동굴에서 일했지만, 사촌 아싸드(Athad)가 나를 모투스 광업 회사로 영입했지. 결과가 참 좋기도 하군.` | Reuse the active-corpus Athad form at ID 23995 and the accepted Motus Mining company terminology; restore the explicit recruitment relation. |

## Verification

- English, Japanese, Chinese, Japanese-derived Korean draft, and active
  Korean each contain IDs 25001-25050 exactly once and in identical order;
  all five contain 65,135 data rows.
- ID/variant keys align in the target range. Embedded line-break counts
  match across all five files; runtime-marker counts match between English
  and active Korean. `{LINE_CENTER}` and the URL at ID 25038 are unchanged.
- The pre-edit backup was byte-identical to the active CSV before editing.
  A byte-level comparison proves only the approved `Texto` cells at IDs
  25030 and 25040 differ. BOM, row order, 72,011 CRLF endings, and 73
  existing bare LF endings are preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-25001-25050-D19054-final/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `9e41b6f836a37d9889327dbfd67c6db1e3a518c53b9992b7844de1b01608947c`.
- Post-edit SHA-256:
  `3c93f7992dec904f26fbe5e19b76ae6a1b8b1e8b850d7ada3b25f43ecde2722e`.
- Totals: 2,144 accepted / 23,923 `not an issue` / 12,457 uncertain
  (38,524 counted keys). Resume D-19065 at ID 25051. Sequential IDs
  25051-65134 remain (40,084), along with earlier specific holds and the
  D-18422-D-18452 register backfill.
