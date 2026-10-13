# Consolidated Context Review: `default` IDs 23101-23150

- Review date: 2026-10-11.
- Scope: the fourteen rows previously uncertain in `default` IDs 23101-23150,
  compared by exact ID across English, Japanese, Chinese,
  Japanese-derived Korean, active Korean, and registered context/terminology.
- Decisions: two accepted edits and ten `not an issue`; two remain uncertain.

## Decisions

| Decision | ID | Finding | Disposition | Rationale |
| --- | ---: | --- | --- | --- |
| D-18549 | 23111 | Watchers / final departure / honor guard | not an issue | All locales identify a female referent preparing a final departure and warn about a powerful guard. Korean's `마지막 여정` and `호위대인 감시자들` preserve the English-led meaning; formal faction status is unnecessary here. |
| Linked | 23113 | Preordained imprisoning enemies | uncertain; not recounted | The exact ID was already reviewed in `consolidated-context-review-default-lower-preordained-20261011.md`. It confirms the named-group referent but leaves its Korean form uncertain because corpus usage conflicts. This review does not allocate another decision number or recount the key. |
| D-18550 | 23114 | Amphora | not an issue | English/Japanese identify an amphora and Chinese clarifies the vessel type. Korean's phonetic `암포라` identifies the same object; the short objective does not require further subtype wording. |
| D-18551 | 23116 | The Testament / Faelands | not an issue | Korean explicitly retains English `The Testament` and the wildfire-like spread. Japanese/Chinese instead name the Belen covenant, a source-locale conflict; under the English semantic baseline this does not show a Korean mistranslation. The upstream name conflict remains separate. |
| D-18552 | 23117 | petition / cloaked in shadow | not an issue | English/Chinese support a petition and Japanese's prophecy reading does not override them. Korean retains the request, surprise, and concealment without inventing the speaker's office or a mechanism. |
| D-18553 | 23120 | fortunate / spire / temple / darkness | not an issue | Korean preserves the contrast and unnamed `she` in the compressed source. Chinese supports the same temple/spire relation; no referent needs to be supplied. |
| D-18554 | 23126 | Buru's Boots / Ametair / Lord of the Hunt | not an issue | The theft objective and former Summer Court membership are retained. Repeated lore identifies Ametair as the Lord of the Hunt; both Ametair and Buru remain traceable in parentheses. |
| D-18555 | 23129 | Sir Elswin / Weeping Gorge bridge | not an issue | All sources agree that Elswin must be defeated to summon a magical bridge across the Gorge and that the speaker expects to win. Korean preserves each relation and pairs the place name with English. |
| D-18556 | 23130 | QA blade / fire, pierce, bleed DoTs | not an issue | The QA label and all three damage-over-time types are preserved. Whether QA denotes test or final content does not change the meaning of this string. |
| D-18557 | 23131 | Docent Del Gadra | accepted | Change `도슨트 델 가드라(Docent Del Gadra)` to `강사 델 가드라(Docent Del Gadra)`. The same instructional office was accepted as `강사(Docent)` at ID 22699 / D-18475; Japanese says mentor and Chinese says lecturer. |
| D-18558 | 23137 | Faehunter's Assemblage | uncertain | English's `Assemblage` and Chinese's gathering support an assembly/place, but Japanese says clothing. The source conflict leaves the entity type and Korean head noun unresolved. |
| D-18559 | 23143 | Detect Hidden | accepted | Change `숨은 것 탐지 능력` to `숨겨진 물건 찾기 능력`, reusing the approved skill name at ID 8651 / D-2434 and ID 43804 / D-13458. All four discoverable categories remain unchanged. |
| D-18560 | 23147 | Australia | not an issue | All four locales name Australia, and Korean gives the standard country name. The row supplies no evidence of a localization error; speculative test/debug status does not alter the text. |
| D-18561 | 23150 | Memory Walk / false Fae gods | not an issue | The cursed unnatural place and warning to avoid it are preserved. Japanese's `追憶の道`, Chinese, and the English-paired Korean `기억의 길` support the same memory-path/place reading. |

## Edits and Verification

Only active Korean `Texto` values at IDs 23131 and 23143 changed. The
byte-identical pre-edit backup is:
`/private/tmp/ko-translate-backups/20261011/before-context-23131-23143-D18557-D18559/locatexts_zh_cn.koalocatext_default.csv`.

Pre-edit SHA-256:
`a0bc31f53559fce97a3c25fe9cf1bb1176e5c2c8de97eb4340983bdd6de1031f`.
Post-edit SHA-256:
`51865f8296a0403a4687c5c130ba65373d1d795dc1fd0252ebd0668da1822b46`.
Reversing only those two cell substitutions reproduces the backup byte for
byte. The UTF-8 BOM, 65,135 rows, ID order, 72,011 CRLF endings, and 73
pre-existing bare-LF endings are preserved.

The English, Japanese, Chinese, Japanese-derived Korean, and active Korean
default files all have the same full ID order. D-18549-D-18561 resolves
twelve keys: two accepted and ten `not an issue`; linked ID 23113 and ID
23137 remain uncertain. Totals are 2,037 accepted, 23,470 `not an issue`,
and 13,017 uncertain (38,524 counted). Resume at D-18562, `default` ID
23151.
