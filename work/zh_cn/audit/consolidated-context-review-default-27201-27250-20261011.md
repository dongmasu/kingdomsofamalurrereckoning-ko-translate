# Consolidated Context Review: `default` IDs 27201-27250

- Review date: 2026-10-11.
- Scope: Re-review previous uncertainties at 27202, 27214, 27217-27218,
  27223-27224, 27227, 27237, 27243, and 27249-27250.
- English controls meaning; Japanese informs voice/register; Chinese is
  supporting evidence.

## Decisions D-19352-D-19355

| Decision | Key | Disposition | Evidence |
| --- | --- | --- | --- |
| D-19352 | `default` 27214 | accepted | English says the effect temporarily grants a fixed 75% chance; Korean incorrectly says an existing chance increases to 75%. Reuse the accepted fixed-chance construction at ID 19482 and retain the 75% value. |
| D-19353 | `default` 27243 | accepted | English calls her the “dark arm of justice,” an agent who punishes the guilty and rewards the vigilant. Korean's “guardian of justice in darkness” shifts the relation; rephrase to say she executes justice in darkness and preserves both actions. |
| D-19354 | `default` 27223, 27237 | not an issue | `Revival Prison` and `Trellis` remain traceable in Korean; transliteration preserves the named location at 27237 without inventing a different referent. |
| D-19355 | `default` 27202, 27218, 27224, 27227, 27249, 27250 | uncertain | The First/Scion/Maid/House terms, Plant Snapper identity, The Tree's referent, and Aurenda spelling/context still require wider lore or glossary evidence. Preserve current wording. |

ID 27217 is linked to D-18241 as `not an issue`, without recounting.

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27214 | `공격을 받았을 때 적을 얼릴 확률이 75%로 일시적으로 증가합니다.` | `일시적으로 공격받을 때 적을 75% 확률로 얼립니다.` | Restore the source's temporary fixed chance, not an increase to an existing chance. |
| 27243 | `그녀는 어둠 속의 정의를 수호하는 자, 죄인을 벌하고 경계하는 자에게 상을 내리는 감시자다.` | `그녀는 어둠 속에서 정의를 집행하는 감시자로, 죄인을 벌하고 경계하는 자에게 상을 내린다.` | Restore the agent/action relation in English while retaining both punishment and reward. |

## Verification

- Existing key/order and marker checks remain valid; the `{1}`/`{LINE_SPACE}`
  structures in the range are unchanged.
- Only the two authorized Korean `Texto` cells changed. Reversing those
  substitutions reproduces the pre-edit file byte-for-byte.
- UTF-8 BOM, 72,011 CRLF endings, and 73 bare-LF endings remain.
- Pre-edit SHA-256:
  `b0a8c419c601bab35c2ce7db3dc55d9c52751c70f2b77b2d4d986fbf95dcb8ef`.
- Post-edit SHA-256:
  `67551a53d84bb5eec6e6ae4c76dd6bcdcd8d296379e6cb5d075b8cc253fa8f2f`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-27201-27250-D19355/locatexts_zh_cn.koalocatext_default.csv`.
- Totals: 2,226 accepted / 24,661 `not an issue` / 11,637 uncertain
  (38,524). Resume at D-19356, ID 27251.
