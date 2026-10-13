# Consolidated Context Review: `default` IDs 27501-27550

- Review date: 2026-10-12.
- Scope: Re-review the 15 unique uncertain IDs in D-8726-D-8731.
  Existing accepted corrections and `not an issue` findings were linked,
  not recounted.
- Compared English, Japanese source and draft, Chinese, active Korean, and
  prior audit decisions by `ID_Linha`. The Japanese-derived draft is a
  migration source, not independent evidence.
- English controls meaning; Japanese informs voice/register; Chinese is
  supporting evidence.

## Decisions D-19370-D-19374

| Decision | Key | Disposition | Evidence |
| --- | --- | --- | --- |
| D-19370 | `default` 27517 | accepted | Reuse the accepted Korean Idylla form `이디라` from D-18904; retain the existing parenthetical and address. |
| D-19371 | `default` 27523 | accepted | English leaves the death image compressed; Japanese and Chinese describe death spreading through Rathir until it is the speaker's turn. The current `죽이고 또 죽일 작정` adds an explicit repeated-killing agent. Rephrase to preserve the source's death image and fragment without assigning that agency. |
| D-19372 | `default` 27533 | accepted | English says Callor will have the addressee's head for already breaking the Deep Slumber; Chinese also says the addressee broke it. Change the Korean conditional to completed action and preserve the threat. Japanese conflicts on the event, so English controls. |
| D-19373 | `default` 27503, 27506, 27508, 27520, 27527, 27531, 27538-27539, 27541, 27543, 27546 | not an issue | The current Korean preserves the local source identities and meanings. English/Chinese identify `scuttle` as food while Japanese misreads it as a bucket; the Korean keeps the source name without inventing a species. Existing lore describes the Sorrows as collected magic, consistent with `슬픔의 힘`. Remaining canonical terminology preferences do not establish row-local errors. |
| D-19374 | `default` 27545 | uncertain | English, Japanese, and Chinese support a purchasable title/designation, but nearby Korean Almain lines use `작위` while generic title-store prompts use `칭호`. Without the game's purchase/display context, the exact status system and best Korean term remain unsettled; keep `강력한 작위` unchanged. |

The `Well`, Preordained, Bloodlust, Hospitalis Quarters, Festival of Ethene,
Skoria Mine deed, Stone of Valor, and House Ansilla readings remain traceable
at row level. This disposition does not establish global canonical forms.

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27517 | `이딜라(Idylla)는 어떤가, 부름받은 자여? 이곳은 세상의 경이로움이 되도록 지었지.` | `이디라(Idylla)는 어떤가, 부름받은 자여? 이곳은 세상의 경이로움이 되도록 지었지.` | Reuse the accepted Idylla spelling from D-18904. |
| 27523 | `먼저 앤원 가문(Anwon)의 이중적인 배신부터 처리할 생각이었어. 그다음 라시어(Rathir) 전역으로 나아가려 했지. 내 차례가 올 때까지 죽이고 또 죽일 작정이었어.` | `먼저 앤원 가문(Anwon)의 이중적인 배신부터 시작했겠지. 그다음 라시어(Rathir) 전역으로 퍼져 나가, 내가 가는 곳마다 죽음이 이어졌을 거야. 마침내 내 차례가 올 때까지.` | Remove the unsupported explicit repeated-killing agency; retain the fragmentary death image and the speaker's turn. |
| 27533 | `깊은 잠(Deep Slumber)을 깨뜨리면 캘러 경(Lord Callor)이 널 가만두지 않을 거야. 필멸자는 뭐든 조심히 다룰 줄 모르는 건가? 의심스럽군.` | `깊은 잠(Deep Slumber)을 깨뜨렸으니 캘러 경(Lord Callor)이 네 목을 노릴 거야. 필멸자는 뭐든 조심히 다룰 줄 모르는 건가? 의심스럽군.` | Restore the completed-action cause and the threat in English `have your head`. |

## Verification

- All four locale CSVs have 65,135 IDs in identical order.
- IDs 27501-27550 have matching embedded line-break counts and runtime
  marker identities/order across English, Japanese, Chinese, and Korean.
- Only the three authorized Korean `Texto` cells at IDs 27517, 27523, and
  27533 changed. Exact reverse substitutions reproduce the pre-edit file
  byte-for-byte.
- UTF-8 BOM, 72,011 CRLF endings, 73 bare-LF endings, 65,135 rows, and ID
  order remain unchanged.
- Chinese ID 27543 retains its source-only U+FEFF; it was not edited.
- Pre-edit SHA-256:
  `c425b430379278ed2114f79403f7266163f586fa1960bf12a6622643228cd310`.
- Post-edit SHA-256:
  `322b1eda415b9168b885450832544c863be14e549c60ecfc90f2209d2e69eae3`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-context-27501-27550-D19370/locatexts_zh_cn.koalocatext_default.csv`.
- Totals: 2,235 accepted / 24,740 `not an issue` / 11,549 uncertain
  (38,524). Resume at D-19375, ID 27551; sequential review remains for
  27551-65134 (37,584 IDs), prior specific holds, and register reconciliation.
