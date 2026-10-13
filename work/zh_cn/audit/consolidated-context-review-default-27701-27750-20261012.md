# Consolidated Context Review: `default` IDs 27701-27750

- Review date: 2026-10-12.
- Scope: re-review the nineteen still-open ID findings in D-8774-D-8776.
- Result: two accepted corrections, sixteen `not an issue`, and one
  specific uncertainty remains (the Korean form of `Fateless One` at 27705).
  The earlier accepted purpose correction at 27705 and the location
  relationship at 27742 are linked, not counted again.
- English controls meaning; Japanese informs voice/register; Chinese is
  supporting evidence. English, Japanese source, Japanese-derived Korean,
  Chinese, and active Korean were joined by ID.

## Decisions D-19392-D-19395

| Decision | Key | Disposition | Evidence and rationale |
| --- | --- | --- | --- |
| D-19392 | `default` 27720 | accepted | Replace `발라드 가문` with the established `발라드의 집(House of Ballads)` (D-711, D-18683, D-18892, D-19328). Preserve the Fae's celebration of past glories and the northward direction. |
| D-19393 | `default` 27734 | accepted | Retain the exact `MQ05` quest identifier, as English, Japanese, and Chinese do; do not expand it to `주요 퀘스트 05`. The remaining shrine-function note is translated consistently with the other localized files. |
| D-19394 | `default` 27701-27702, 27704, 27711-27713, 27715, 27725, 27731, 27735-27736, 27740-27742, 27747, 27750 | not an issue | Gask/Adept/Hierophant labels remain source-traceable; the Sagecrafting altar uses the established `마법물품 제작`; the Beckoned form `부름받은 자` has accepted precedent D-692; the generic “next piece,” Well of Souls, Ljosalfar, Windstones, House of Vengeance, potion, Travelers metaphor, quest synopsis, and Court/Gardens relation preserve the English-led meaning. The two poems retain their images and structure. |
| D-19395 | `default` 27705 | uncertain | The purpose correction from D-8772 remains accepted. The separate canonical Korean form of the protagonist title `Fateless One` is unresolved; keep `운명 없는 자(Fateless One)` unchanged pending title alignment. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27720 | `발라드 가문(House of Ballads)은 페이들이 과거의 영광을 되새기며 즐기는 곳이야.` | `발라드의 집(House of Ballads)은 페이들이 과거의 영광을 되새기며 즐기는 곳이야.` | Reuse the established House of Ballads name. The rest of the sentence is unchanged. |
| 27734 | `주요 퀘스트 05에서 사용하지 않을 때의 소규모 신전형 기능` | `MQ05에서 사용하지 않을 때의 소규모 신전형 기능` | Preserve the quest identifier exactly as in the English, Japanese, and Chinese sources. |

## Structural and Context Notes

- IDs 27701-27750 occur once, in identical ascending order, in all five
  resources. Default rows contain `ID_Linha` and `Texto`; there is no variant
  column in these files.
- ID 27731 has five embedded line breaks (six lines) in all five resources;
  Korean preserves all six lines and the poem's desert-runner, wolf, mantis,
  salamander, serpent, and shark images.
- ID 27735 preserves runtime marker `{1}` before the translated Windstones
  label. No runtime marker identity/order change was made.
- The Japanese source, Japanese-derived draft, and Chinese translation all
  translate the internal/system-style note at 27741; the Korean localization
  follows that practice and preserves Agarth's reading, contradiction, and
  abandonment of the reading.
- The malformed English at 27742 is interpreted as meeting in the Court of
  Summer located in the Gardens of Ysa, supported by Japanese and Chinese.
  This relationship was already dispositioned at D-8779 and is linked here.
- No unsupported name, speaker, or game-world referent was inferred.

## Verification

- Only active Korean `Texto` cells at IDs 27720 and 27734 changed. Parsed
  comparison against the pre-edit copy found exactly those two row changes.
- Reversing the two exact substitutions reproduces the pre-edit backup
  byte-for-byte. UTF-8 BOM, all 65,135 rows, sorted row order, 72,011 CRLF
  endings, and 73 pre-existing bare-LF endings are preserved.
- The active default CSV remains ID-sorted; IDs 27701-27750 are exactly
  present once. Source files were not changed.
- Pre-edit SHA-256:
  `591c2e33cff598e6f9ab274025532761164658320892324fd4b220958fcea5e2`.
- Post-edit SHA-256:
  `ee4e3f792f073c0050bc201ab095cc04603815845a30f4652c3bb06476a56650`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-context-27701-27750-D19392/locatexts_zh_cn.koalocatext_default.csv`.
- Totals: 2,247 accepted / 24,797 `not an issue` / 11,480 uncertain
  (38,524). Resume D-19396 at ID 27751; sequentially unreviewed interval is
  27751-65134 (37,384 IDs). One specific hold remains in this batch.

These are working dispositions, not independent final linguistic approval.
