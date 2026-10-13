# Consolidated Context Review: Uncertain Batch D-19643

- Closed all 200 source-keyed uncertain findings listed in
  `uncertain-200-D1448-D1883-20261012.jsonl`. Reviewed each Korean row
  against English as the meaning anchor, Japanese for voice/register, and
  Chinese as supporting evidence. The snapshot was independently matched
  against all four locale CSVs before edits. The official Korean manual was
  used as the setting and terminology reference; no PAK-derived material was
  consulted.
- Result: 20 evidence-backed corrections accepted; the other 180 rows are
  `not an issue`. The latter preserve the English meaning and do not warrant
  speculative changes merely to force agreement between locales or normalize
  unresolved spellings.

| ID | Result | Evidence and correction |
| --- | --- | --- |
| 5712 | accepted | English/Japanese/Chinese say `elements`; Korean `시설` narrows that to facilities. Use `모든 요소`. |
| 5714, 5882, 6167 | accepted | These are Warsworn faction references. Reuse the established `워스원(Warsworn)` form rather than `전쟁맹`. |
| 5941, 6146 | accepted | The capitalized Traveler is a faction member; align with the official Korean manual's `트래블러(Travelers)`. |
| 6016 | accepted | The sealed Sorrows are the established magical force `비탄의 힘`, not generic sorrow; clarify the force and its seal. |
| 6184 | accepted | English and Japanese leave the referent abstract. Use `비탄의 힘` without inventing Sorrows as spirits. |
| 6386 | accepted | Japanese and Chinese explicitly say the person's status is revoked; replace the awkward `직함은 박탈` phrasing with `지위를 박탈당한`. |
| 6405 | accepted | Japanese explicitly says the speaker will give up their life and do it personally; render the English euphemism as `스스로 목숨을 내놓겠어`, not surrender. |
| 6416 | accepted | English `my size` and Japanese/Chinese describe overall size/build, not height alone; use `체격`. |
| 6422 | accepted | The English names the formal Warsworn rank Oathblade. Reuse the accepted `맹세의 칼날` rank from D-18254. |
| 6435 | accepted | The plant is said to `drink` Petrichor after fire; Japanese and Chinese retain that action. Use `마실 거야` rather than the less specific `흡수할 거야`. |
| 6461 | accepted | Japanese renders the opening as an idiomatic expression of surprise, not a literal restraint threat. Replace the literal Korean reading with `이런, 별일이 다 있군`. |
| 6470 | accepted | The Korean quote had duplicated quote delimiters absent from the source. Remove the extra delimiters only; preserve the speech. |
| 6530 | accepted | `Trigger Rats` is a creature name; `쥐 트리거` reverses the compound. Use `트리거 쥐`. |
| 6628, 6934 | accepted | Hierophant is the established religious office `대사제`; align both dialogue references from `계시자`. |
| 6688 | accepted | Align Great Cycle with the established `위대한 순환` term rather than `대순환`. |
| 6737 | accepted | English `Receivership` and Japanese `管財` identify an administrative/property office, not a receptionist or a manager's wife. Use the role title `재산관리관`. |

ID 6429 was closed as `not an issue`: English `More blood for the wall`
permits the existing Korean, while Japanese and Chinese support the same
blood-on-the-wall image. A proposed paraphrase did not correct a demonstrated
meaning error and was reverted.

The 180 `not an issue` IDs are the remaining IDs in the linked 200-row
snapshot after excluding accepted IDs above. Each was checked independently
in source context; their existing Korean preserves the relevant English
meaning. The snapshot records the exact four-locale text and original finding
for every ID.

Accepted `Texto` edits: 5712, 5714, 5882, 5941, 6016, 6146, 6167,
6184, 6386, 6405, 6416, 6422, 6435, 6461, 6470, 6530, 6628,
6688, 6737, 6934. ID 6429 remains unchanged.

Initial pre-edit SHA-256:
`e6c4df562b57bd72ed3ffb26c8a997c387fffb5dfa625467c75af57db0889548`.
Byte-identical initial backup:
`/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19643/locatexts_zh_cn.koalocatext_default.csv`.
After the first application, ID 6429 was reclassified and restored; its
byte-identical intermediate backup is
`/private/tmp/ko-translate-backups/20261012/before-reclassify-6429-D19643/locatexts_zh_cn.koalocatext_default.csv`.
Final active default SHA-256:
`661748971420138f4dc0685d8d5f789733c384a692c32f18b88a927e313470e2`.
The first transformation was exactly reversible; the final one-cell
reclassification was independently inverse-checked. BOM, row order, all
unrelated bytes, 72,011 CRLF endings, and 73 bare-LF endings are preserved.

Totals: **2,625 accepted / 26,225 not an issue / 9,674 uncertain**
(38,524). Affix fallback uncertain remains zero; active affix SHA-256:
`516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e`.
Resume **D-1884 / default ID 7011**. Default review is incomplete.
