# Consolidated Context Review: `default` IDs 25551-25600

- Date: 2026-10-11.
- Scope: 21 still-uncertain unique keys represented by the original findings
  for IDs 25551-25600, compared by ID against English, Japanese source and
  draft, Chinese, active Korean, prior decisions, and recurring terminology.
  ID 25579 was already reclassified by D-18241 and is linked without
  recounting; ID 25554 was already accepted by D-8384.
- Result: 17 keys resolved (one accepted correction and 16 `not an issue`);
  IDs 25585, 25592-25593, and 25599 retain specific location/object-referent
  and title-context holds.
- English is the semantic authority; Japanese informs register and provides
  supporting terminology evidence; Chinese is a secondary cross-check.

## Decisions D-19198-D-19209

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19198 | 25553 | not an issue | Korean preserves the isolated Hellbane name as a traceable phonetic form; the short prompt does not establish a different referent or a row-local semantic error. |
| D-19199 | 25557 | not an issue | Fynwick Iver's death and the resulting inability to claim a reward using the bandit armbands remain; name-form variation does not change the outcome. |
| D-19200 | 25558 | not an issue | The three-part goddess description and the speaker's belief about Order and Chaos are preserved. Japanese adds an idea absent from English; Korean correctly follows English. |
| D-19201 | 25562-25563 | not an issue | The Mission Brief, Shieldring Keep, Tenhwa's spell, story/ballad, and recovery objective follow English. Japanese corroborates the Fae Cairn reading; Chinese's spirit-orb rendering is a source divergence, not proof of a Korean error. |
| D-19202 | 25566-25569 | mixed | Cargo papers, shipper/sailor question, Edgard Bastion's wordplay, Erathi Nexus/Fateless One, and Fae-telling claim remain. Accept 25569: render the contemptuous `dustling` address as `먼지나부랭이`, matching accepted D-335 and D-18327. |
| D-19203 | 25571 | not an issue | `Quays` is rendered as `부두`, supported by the place/harbor readings in Japanese and Chinese; the merchant-ship hiding inference remains appropriately qualified. |
| D-19204 | 25576 | not an issue | Korean preserves English's named Testament and the stolen-item/intact-recovery request. Japanese's Belen-association reading is a source conflict; English and Chinese support the Korean's English-led rendering. |
| D-19205 | 25580-25581 | not an issue | The exit question and letter-recovery/evidence objectives remain. Korean avoids the English source's `his`/`her` pronoun conflict without changing the agent, quarry, or ordered-loss claim. ID 25579 links to D-18241 without recounting. |
| D-19206 | 25585 | uncertain | English/Chinese suggest the standalone label `Trellis`, while Japanese identifies a meeting place. Korean's transliteration avoids guessing, but without map or scene context it is unclear whether the label is a location or an ordinary structure. Keep unchanged. |
| D-19207 | 25592-25593 | uncertain | Dellach, the artifacts, and the Ettin shaman are retained, but “destroy them” can refer to the artifacts or the ettin. Korean's `그것들` does not resolve the conflicting antecedent safely. Keep unchanged pending quest context. |
| D-19208 | 25596-25599 | mixed | The Maid, armor request, Faeblades, Alarane, and difficult journey are preserved at 25596-25598. ID 25599 remains uncertain: English `Ancient`, Japanese `大将軍` (“great general”), and Chinese `长者` (“elder”) assign different status to Delfric; Korean's `고대의 ... 대장군` cannot be normalized safely from this row alone. |
| D-19209 | 25600 | not an issue | `Scouting Mission` is accurately rendered as the concise UI label `정찰 임무`, supported by Japanese; Chinese's divergent interpretation does not establish a Korean defect. |

## Accepted Text Edit

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25569 | `건방진 먼지 인간! 페이의 전승에서 네 역할은 없어. 이 이야기는 우리 중 하나의 것이지, 요람에서 갓 나온 애송이의 것이 아니야.` | `건방진 먼지나부랭이! 페이의 전승에서 네 역할은 없어. 이 이야기는 우리 중 하나의 것이지, 요람에서 갓 나온 애송이의 것이 아니야.` | English `Brash dustling!` is a dismissive address; reuse the accepted rendering for the same insult at IDs 2149 (D-335) and 21707 (D-18327). |

## Verification

- English source, Japanese source, Japanese-derived draft, Chinese source,
  active Korean, and the byte-identical pre-edit backup each contain 65,135
  unique ascending IDs. IDs 25551-25600 occur exactly once and in identical
  order in each file; decisions were joined by `ID_Linha`.
- All five files have matching embedded line-break counts and runtime/markup
  signatures throughout the interval. ID 25552's unfinished greeting and
  comma remain unchanged; no marker exception was found.
- The active CSV retains its UTF-8 BOM, 72,011 CRLF record endings, and 73
  existing bare-LF record endings. Reversing only the approved `Texto`
  substitution reproduces the pre-edit backup byte-for-byte.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-25551-25600-D19198/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `05c2b3ef6c6214576a41a6b34a0c7e29fd1ae2411ad1d5d9d23ac81e53521fdb`.
- Post-edit SHA-256:
  `aeb60301ba8cd905e26601c1c8a823c82fd271e6d2db40f5816bb5d8e0d7f984`.
- Cumulative context-review totals: 2,170 accepted / 24,177 `not an issue`
  / 12,177 uncertain (38,524 counted keys). Resume at D-19210, ID 25601.
  The remaining sequential interval is 25601-65134 (39,534 IDs), in
  addition to earlier specific holds and the D-18422-D-18452 register
  reconciliation.
