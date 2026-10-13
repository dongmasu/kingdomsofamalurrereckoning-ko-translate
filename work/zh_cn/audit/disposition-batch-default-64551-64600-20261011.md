# Disposition Batch: `default` IDs 64551-64600

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, recurring terminology, and structure.
- Three accepted targeted corrections, 33 `not an issue` IDs, and 14
  uncertain findings. These are working dispositions, not independent
  linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18128 | 64575 | `웬센과 나는 수많은 발라드에서 함께 싸웠다. 너는 웬센이 아니다. 처녀의 마법은 풀었을지 몰라도, 이야기까지 깨뜨렸어.` | `웬센과 나는 수많은 발라드에서 함께 싸웠다. 너는 웬센이 아니다. 시녀의 마법은 풀었을지 몰라도, 전승(The Telling)까지 깨뜨렸어.` | `Maid` is not `처녀` (“virgin/maiden”) here; use the literal title rendering `시녀` while leaving its lore identity open. `The Telling` is the capitalized lore concept; reuse the accepted `전승(The Telling)` form from prior decisions. |
| D-18128 | 64577 | `우리는 이 지역에서 도적과 저주받을 투아타를 몰아낸다.` | `우리는 도적과 저주받은 투아타가 이 지역에 들어오지 못하게 막는다.` | English `keep this area clear of` describes an ongoing protective duty, not necessarily an active expulsion. Correct `저주받을` to the source's `cursed` without changing the group name. |
| D-18128 | 64579 | `윈드스톤을 제대로 사용했지만 에라시는 나타나지 않았다. 대신 마법의 힘을 조금 불러낸 것 같다. 앞으로 에이튼의 원형 제단을 방문하면 이 효과를 다시 경험할 수 있겠지.` | `윈드스톤을 제대로 사용했지만 에라시는 나타나지 않았다. 대신 마법의 힘을 조금 불러낸 것 같다. 앞으로 에이튼 서클(Ayten Circle)에 가면 이 효과를 다시 경험할 수 있겠지.` | English and Japanese identify `Ayten Circle` as the visited location; the current `원형 제단` invents an altar. Retain the Circle name without deciding its exact lore function. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18129 | 64553 | `PMO Manager` may be an out-of-world credit; retain PMO without inventing its expansion or assuming display context. |
| D-18129 | 64554 | The English/Japanese describe an unraised portion of the city, while Chinese describes a detached building/monastery; Korean follows English, but the city's spatial construction needs context. |
| D-18129 | 64558 | Korean preserves the Longbow/blocking instruction and status effects; actual control behavior requires gameplay verification. |
| D-18129 | 64561 | `Pledgeshield` is treated as a rank by Korean and as a mercenary grade by Japanese; its formal status remains unresolved. |
| D-18129 | 64568 | Alyn Shir's Korean transliteration varies across the project; the quest sequence and Agarth's distrust are preserved. |
| D-18129 | 64574 | `Gallows Tree` has competing literal and phonetic Korean forms; retain the current form pending corpus-wide name alignment. |
| D-18129 | 64585 | `flirtation with the divine` is figurative; Korean describes involvement with divine forces, while Japanese and Chinese shade the attitude differently. |
| D-18129 | 64589 | `Scholia Arcana` is identifiable and its accepted Korean form is used, but this row does not establish whether the hoped-for discovery is a prior theory or a confirmed discovery. |
| D-18129 | 64592 | `Quarry` is correctly read as a target; the referent and canonical styling of `The Baronett` remain unclear. |
| D-18129 | 64593 | The site and guidance are retained, but the subject/agency of `hopes to shed light on my nature` depends on narrative context and differs among supporting locales. |
| D-18129 | 64595 | The qualified offer is preserved; `Domus Politica`'s institutional identity and canonical Korean name remain unverified. |
| D-18129 | 64597 | The ten embedded line breaks and speaker order are preserved; exact quote attribution and canonical Oliskar/Atham spellings require broader context. |
| D-18129 | 64599 | The Widow and Halter Ninepins may be named characters, cards, or game terms; the isolated title cannot settle the referents. |
| D-18129 | 64600 | The viewing action is clear, but the established Korean UI term for `Destinies` is not settled. |

## Not an Issue

Decision D-18130 records these 33 IDs: 64551-64552, 64555-64557,
64559-64560, 64562-64567, 64569-64573, 64576, 64578, 64580-64584,
64586-64588, 64590-64591, 64594, 64596, and 64598. They preserve
available meaning, voice, values, and structure.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 64551-64600 once,
  in identical ascending order.
- Embedded newline counts match for every row. Runtime-marker identities and
  order match; 64583 preserves `{2}` followed by `{1}/{2}`.
- The multi-speaker account at 64597 retains all ten embedded newline
  characters in every locale.
- Rechecked source-keyed historical questions for PMO Manager, Nyxaros,
  Pledgeshield, Alyn Shir, Gallows Tree, Maid/Telling, Windstone/Ayten
  Circle, Quarry, Theater of Fate, Domus Politica, and the Oliskar/Atham
  account.
- Only the `Texto` cells at IDs 64575, 64577, and 64579 changed. UTF-8 BOM,
  all 65,135 data rows, key order, and line-ending counts are preserved.
  The file has 72,012 CRLF and 72 bare-LF endings, unchanged from the
  byte-identical batch-start backup.
- Pre-edit SHA-256:
  `465e0b528634901232fb01589a550b472a1f2a8908970ebeaf5b819292d3491d`.
  Post-edit SHA-256:
  `518e1b5f0dadf224874f42509d1b77822341d703b4384dd5ef2ee74f2afd6c4f`.
  Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-64551/locatexts_zh_cn.koalocatext_default.csv`.

- D-18128 records three accepted corrections, D-18129 records 14 uncertain
  findings, and D-18130 records 33 `not an issue` IDs. Totals at D-18130:
  1,839 accepted, 16,822 `not an issue`, and 12,744 uncertain
  (31,405 dispositions); next D-18131.

Resume at `default` ID 64601; 534 IDs remain through ID 65134. These are
working dispositions, not independent linguistic approval.
