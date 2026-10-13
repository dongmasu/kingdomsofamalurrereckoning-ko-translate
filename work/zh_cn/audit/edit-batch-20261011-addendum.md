# Accepted Edit Addenda: Korean CSV corrections (updated 2026-10-12)

## `default` audit correction at ID 48358 (D-19464; 2026-10-12)

| ID | Previous phrase | Applied phrase | Rationale |
| ---: | --- | --- | --- |
| 48358 | `싸움꾼들의 불길한 함성` | `싸움꾼들의 거친 함성` | English `fell`, Japanese's violent commotion, and Chinese's low rumbling sound do not establish an omen. Revert only the unsupported implication; retain D-19463's `Engard` and House-name corrections. |

Pre-edit SHA-256:
`a65f8fddb68d8fc333593f488344ec2f6f707ad49b5a621020371d0c00068717`;
post-edit SHA-256:
`f8e237e820c7c362683c3cdb237b750011d6d72116af6165fd66c744e2cc5b96`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261012/before-fell-claim-revision-D19464/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the exact substitution reproduces the backup byte-for-byte.
No disposition count changed. Details:
[`audit correction`](consolidated-context-review-default-fell-clamors-correction-20261012.md).

## `default` quest status labels (D-19465; 2026-10-12)

No Korean `Texto` cells changed. D-19465 resolves 29 `Quest Complete` and
12 `Quest Failed` holds as `not an issue`; all five ID-aligned resources
agree on the completion/failure meaning. Totals: **2,349 accepted / 25,048
not an issue / 11,127 uncertain** (38,524). Active default SHA-256 remains
`f8e237e820c7c362683c3cdb237b750011d6d72116af6165fd66c744e2cc5b96`.
Report:
[`quest status labels`](consolidated-context-review-default-quest-status-labels-20261012.md).

## `default` period-only labels (D-19466; 2026-10-12)

No Korean `Texto` cells changed. Nine exact period-only keys were resolved
as `not an issue`; all five ID-aligned resources contain exactly `.`.
Totals: **2,349 accepted / 25,057 not an issue / 11,118 uncertain**
(38,524). Active default SHA-256 remains
`f8e237e820c7c362683c3cdb237b750011d6d72116af6165fd66c744e2cc5b96`.
Report:
[`period-only labels`](consolidated-context-review-default-period-only-labels-20261012.md).

## `default` greetings and farewells (D-19467; 2026-10-12)

No Korean `Texto` cells changed. Twenty-three repeated greeting/farewell
holds were resolved as `not an issue`; standalone `안녕히.` at ID 30193
remains uncertain. Totals: **2,349 accepted / 25,080 not an issue /
11,095 uncertain** (38,524). Active default SHA-256 remains
`f8e237e820c7c362683c3cdb237b750011d6d72116af6165fd66c744e2cc5b96`.
Report:
[`greetings and farewells`](consolidated-context-review-default-greetings-farewells-20261012.md).

## `default` `Hail.` labels (D-19468; 2026-10-12)

No Korean `Texto` cells changed. Four open salutation labels were cleared as
`not an issue`; Japanese and Chinese confirm the greeting function. Totals:
**2,349 accepted / 25,084 not an issue / 11,091 uncertain** (38,524).
Active default SHA-256 remains
`f8e237e820c7c362683c3cdb237b750011d6d72116af6165fd66c744e2cc5b96`.
Report:
[`Hail labels`](consolidated-context-review-default-hail-labels-20261012.md).

## `default` `Yes?` response labels (D-19469; 2026-10-12)

No Korean `Texto` cells changed. Seven response labels were resolved as
`not an issue`; the Korean alternatives preserve the English acknowledgment
without imposing a shared speaker voice. Totals: **2,349 accepted / 25,091
not an issue / 11,084 uncertain** (38,524). Active default SHA-256 remains
`f8e237e820c7c362683c3cdb237b750011d6d72116af6165fd66c744e2cc5b96`.
Report:
[`Yes? response labels`](consolidated-context-review-default-yes-response-labels-20261012.md).

## `default` House of Valor group (D-19463; 2026-10-12)

Fifteen cells were edited for established House of Valor naming and exact
proper-name traceability. D-19464 subsequently corrected ID 48358's
unsupported `불길한 함성` to `거친 함성`; it did not reverse the approved
House or Engard changes. Exact source and target values for each edit remain
available in the D-19463 backup and group report. The entry below records
the final correction separately rather than presenting the superseded term
as current.

Pre-edit SHA-256:
`048004332ac9b2d5125a9d68c63b369ebf766f41261b8e23d95b85a62a329f37`;
D-19463 post-edit SHA-256:
`a65f8fddb68d8fc333593f488344ec2f6f707ad49b5a621020371d0c00068717`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261012/before-house-of-valor-uncertainties-D19463/locatexts_zh_cn.koalocatext_default.csv`.
Report:
[`House of Valor follow-up`](consolidated-context-review-default-house-of-valor-followup-20261012.md).

## `default` repeated exact `FAIL LINE` label (D-19442; 2026-10-12)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 16425 | `실패 줄` | `FAIL LINE` | Match the exact untranslated English/Japanese label and prior Korean precedents D-1647/D-2204/D-3135. |
| 31138 | `실패 대사` | `FAIL LINE` | Same repeated label precedent. |
| 38240 | `실패 줄` | `FAIL LINE` | Same repeated label precedent. |
| 39619 | `실패 대사` | `FAIL LINE` | Same repeated label precedent. |
| 40523, 40647 | `대사 실패` | `FAIL LINE` | Same repeated label precedent; separate title/name holds are not resolved. |
| 52813 | `실패 행` | `FAIL LINE` | Same repeated label precedent. |

Pre-edit SHA-256:
`67215c90989cd5b530b5e5d5b9df6f7f07be264faf9f4ad65dda1438f39c861d`;
post-edit SHA-256:
`7feb04d2ef991183e310657f610ce2ae67b14b0f6cbe9e57dc90327ff7511ecb`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261012/before-fail-line-cluster-D19442/locatexts_zh_cn.koalocatext_default.csv`.
Reversing only these seven exact line edits reconstructs the backup
byte-for-byte. Details:
[`FAIL LINE group`](consolidated-context-review-default-fail-line-20261012.md).

## House of Ballads follow-up D-19440 (`base` 621 / 11; `default` 587)

Both English rows explicitly name the House of Ballads. Replaced only
`발라드 가문` with the approved `발라드의 집`; no default uncertainty is
reclassified. Pre/post SHA-256: `base`
`3089555293d97b0bb4ecebe6b3604287f754a61ec4f2dc8f3d8262b6a7cf462c`
→ `8e2abc916ec012d3322fb5a9ea23cb91c3188665c01c7b4bc8f8772b68ef7cd2`;
`default`
`548090935d9149be8ea4514afaf3d83e58cebfaded685a078f2257afa3c7a5ac`
→ `67215c90989cd5b530b5e5d5b9df6f7f07be264faf9f4ad65dda1438f39c861d`.
Byte-identical backups for both:
`/private/tmp/ko-translate-backups/20261012/before-ballads-followup-D19440/`.
Reverting each exact one-line `Texto` edit reproduces each backup byte-for-byte.

## `default` House of Ballads group (D-19437-D-19438; 2026-10-12)

Approved name-only `Texto` changes at IDs 605, 2794, 4261, 8598, 29916,
30278, 30786, 30909, 30980, 37029, and 45808. English explicitly names
the House of Ballads in every row. Apply the previously accepted
`발라드의 집` form (D-711/D-10221); retain an existing `(House of Ballads)`
suffix where present. ID 29916 uses `발라드의 집을 다스리는 왕` rather than
a doubled genitive. Four rows (605, 4261, 30980, 45808) retain other
uncertain issues and are not reclassified. See
[`group report`](consolidated-context-review-default-ballads-cluster-20261012.md).

Pre-edit SHA-256:
`6f80a870f122f45d9e87553e4c76d39e547d6194843dc244b20eec82be5ec513`;
post-edit SHA-256:
`548090935d9149be8ea4514afaf3d83e58cebfaded685a078f2257afa3c7a5ac`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261012/before-ballads-cluster-D19437/locatexts_zh_cn.koalocatext_default.csv`.
Reversing only the 11 line-level Texto changes reconstructs the backup
byte-for-byte, including the BOM and original mixed line endings.

## `default` IDs 27517, 27523, and 27533 (D-19370-D-19372; 2026-10-12)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27517 | `이딜라(Idylla)는 어떤가, 부름받은 자여? 이곳은 세상의 경이로움이 되도록 지었지.` | `이디라(Idylla)는 어떤가, 부름받은 자여? 이곳은 세상의 경이로움이 되도록 지었지.` | Reuse accepted D-18904 spelling. |
| 27523 | `먼저 앤원 가문(Anwon)의 이중적인 배신부터 처리할 생각이었어. 그다음 라시어(Rathir) 전역으로 나아가려 했지. 내 차례가 올 때까지 죽이고 또 죽일 작정이었어.` | `먼저 앤원 가문(Anwon)의 이중적인 배신부터 시작했겠지. 그다음 라시어(Rathir) 전역으로 퍼져 나가, 내가 가는 곳마다 죽음이 이어졌을 거야. 마침내 내 차례가 올 때까지.` | Remove the explicit repeated-killing agent not established by the fragment; retain its death image. |
| 27533 | `깊은 잠(Deep Slumber)을 깨뜨리면 캘러 경(Lord Callor)이 널 가만두지 않을 거야. 필멸자는 뭐든 조심히 다룰 줄 모르는 건가? 의심스럽군.` | `깊은 잠(Deep Slumber)을 깨뜨렸으니 캘러 경(Lord Callor)이 네 목을 노릴 거야. 필멸자는 뭐든 조심히 다룰 줄 모르는 건가? 의심스럽군.` | English and Chinese describe an already completed violation and resulting threat; English controls over Japanese's conflicting line. |

Pre-edit SHA-256:
`c425b430379278ed2114f79403f7266163f586fa1960bf12a6622643228cd310`;
post-edit SHA-256:
`322b1eda415b9168b885450832544c863be14e549c60ecfc90f2209d2e69eae3`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261012/before-context-27501-27550-D19370/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the three exact substitutions reproduces the backup byte-for-byte.
Only these three Korean `Texto` cells changed; the BOM and existing 72,011
CRLF / 73 bare-LF endings remain. Details:
[`27501-27550`](consolidated-context-review-default-27501-27550-20261012.md).

## `default` IDs 27457, 27491, 27492, and 27495 (D-19365-D-19367, D-19369; 2026-10-12)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27457 | `지도 안내` | `지도 튜토리얼` | English, Japanese, and Chinese identify a map tutorial; other Korean tutorial labels use `튜토리얼`. |
| 27491 | `'술을 지나치게 남용했다'는 이유로 쫓겨났어. 날 위험하고 타락한 인간이라고 했지.` | `'과도한 음주'를 이유로 쫓겨났어. 날 위험하고 타락한 인간이라고 했지.` | English and Japanese identify excessive drinking; replace the unnatural Korean collocation without changing the accusation. |
| 27492 | `'개화 의식'은 새로 태어난 요정들의 탄생 의식이었어. 평소 내 역할을 맡던 페이 보더릴(Boderill)은 의식에 희생됐지만 다음 계절에 돌아온다고 해. 다행히 오스두인(Osduin)은 필멸자인 내가 페이처럼 그 역할을 할 수 없다는 걸 받아들였어.` | `'개화 의식'은 새 요정들이 태어나는 의식이었어. 평소 내 역할을 맡던 페이 보더릴(Boderill)은 의식에 희생됐지만 다음 계절에 돌아온다고 해. 다행히 오스두인(Osduin)은 필멸자인 내가 페이처럼 그 역할을 할 수 없다는 걸 받아들였어.` | Japanese identifies a rite producing sprites; remove the redundant birth wording and retain the rest. |
| 27495 | `이딜라(Idylla)` | `이디라(Idylla)` | Reuse the accepted Idylla form from D-18904; preserve the existing bilingual label format. |

Pre-edit SHA-256:
`378a7da73dc8ed13930d1d5d99f754068d9c968179b25d271a00250116a72fb5`;
post-edit SHA-256:
`c425b430379278ed2114f79403f7266163f586fa1960bf12a6622643228cd310`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261012/before-context-27451-27500-D19365/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the four exact substitutions reproduces the backup byte-for-byte.
Only these four Korean `Texto` cells changed; the BOM and existing 72,011
CRLF / 73 bare-LF endings remain. Details:
[`27451-27500`](consolidated-context-review-default-27451-27500-20261012.md).

## `default` ID 27404 (D-19362; 2026-10-12)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27404 | `전사한 고용 용병들에게 경의를 표한다. 그들은 맹세를 지키며… 적과 싸우다… 죽었다…` | `전사한 고용 용병들에게 경의를 표한다. 그들은 맹세를 지킨 채… 적에게… 죽었다…` | English says the Hirelings died to a foe; it does not establish that they were fighting at death. Preserve the oath and fragmented layout. |

Pre-edit SHA-256:
`499513202eedc841d94943b8e1e0710c2ff94e3da7073722aa65a7b1ec384e60`;
post-edit SHA-256:
`378a7da73dc8ed13930d1d5d99f754068d9c968179b25d271a00250116a72fb5`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261012/before-context-27401-27450-D19362/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the exact substitution reproduces the backup byte-for-byte.
Only the ID 27404 Korean `Texto` cell changed; the BOM and existing 72,011
CRLF / 73 bare-LF endings remain. Details:
[`27401-27450`](consolidated-context-review-default-27401-27450-20261012.md).

## `default` ID 27306 (D-19358; 2026-10-12)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27306 | `전리품 전시하기` | `트로피 전시하기` | English and Chinese identify trophies; Japanese specifies displaying heads. `전리품` means loot more broadly and loses the source category. |

Pre-edit SHA-256:
`67551a53d84bb5eec6e6ae4c76dd6bcdcd8d296379e6cb5d075b8cc253fa8f2f`;
post-edit SHA-256:
`499513202eedc841d94943b8e1e0710c2ff94e3da7073722aa65a7b1ec384e60`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261012/before-context-27301-27350-D19358/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the exact substitution reproduces the backup byte-for-byte.
Only the ID 27306 Korean `Texto` cell changed; the BOM and existing 72,011
CRLF / 73 bare-LF endings remain. Details:
[`27301-27350`](consolidated-context-review-default-27301-27350-20261012.md).

## `default` IDs 27164, 27214, and 27243 (D-19349, D-19352-D-19353)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27164 | `체력 소폭 증가` | `체력 중간 증가` | Match English `Moderate` and Japanese medium; Chinese alone gives a slight increase. |
| 27214 | `공격을 받았을 때 적을 얼릴 확률이 75%로 일시적으로 증가합니다.` | `일시적으로 공격받을 때 적을 75% 확률로 얼립니다.` | The source grants a temporary fixed chance; reuse the accepted structure at ID 19482. |
| 27243 | `그녀는 어둠 속의 정의를 수호하는 자, 죄인을 벌하고 경계하는 자에게 상을 내리는 감시자다.` | `그녀는 어둠 속에서 정의를 집행하는 감시자로, 죄인을 벌하고 경계하는 자에게 상을 내린다.` | Restore the English agent/action relation and retain both consequences. |

Pre-edit SHA-256 for ID 27164:
`51cad27f1a98bd20e71141c52ef1afc8ba4794991fdb5712b16d37e17d12f3f3`;
post-edit SHA-256:
`b0a8c419c601bab35c2ce7db3dc55d9c52751c70f2b77b2d4d986fbf95dcb8ef`.
Pre-edit SHA-256 for IDs 27214/27243:
`b0a8c419c601bab35c2ce7db3dc55d9c52751c70f2b77b2d4d986fbf95dcb8ef`;
post-edit SHA-256:
`67551a53d84bb5eec6e6ae4c76dd6bcdcd8d296379e6cb5d075b8cc253fa8f2f`.
Byte-identical pre-edit backups:
`/private/tmp/ko-translate-backups/20261011/before-context-27151-27200-D19349/locatexts_zh_cn.koalocatext_default.csv`;
`/private/tmp/ko-translate-backups/20261011/before-context-27201-27250-D19355/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the exact substitutions reproduces each backup byte-for-byte.
Only these three Korean `Texto` cells changed; the BOM and existing 72,011
CRLF / 73 bare-LF endings remain. Details:
[`27151-27200`](consolidated-context-review-default-27151-27200-20261011.md),
[`27201-27250`](consolidated-context-review-default-27201-27250-20261011.md).

## `default` IDs 27030, 27050, 27061, and 27098 (D-19340-D-19344)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27030 | First passage lacked an opening quote. | Added the opening ASCII apostrophe before `네가`; kept the seven line breaks and every other quote boundary. | All source locales open the first passage; Korean already had its closing quote. |
| 27050 | `...우리는 금 자루를 들고 올라와 그쪽 인부 한 명 한 명을 매수했어.` | `...우리는 그쪽 인부 한 명 한 명에게 줄 금 자루를 들고 올라왔어.` | English says they brought gold for each worker; Japanese/Chinese support gold being offered or given, but English does not explicitly say a bribe occurred. |
| 27061 | `{*1[지속]}` | `{*1[지속 효과]}` | Use the clear, recurring Korean UI label for a passive ability while preserving the runtime wrapper. |
| 27098 | `그림을 찾아 들키지 않게 밀서들을 그에게 심어야 한다.` | `그림을 찾아 그림이 모르게 밀서들을 그에게 심어야 한다.` | English explicitly identifies Grim as the person who must not know. |

Pre-edit SHA-256 for IDs 27030/27050:
`4bb07ea79da77893c0d264f316c3dbcc2d73b86f681b84c9918ff23291f78801`;
post-edit SHA-256:
`c3f6c8ddcd3bede275fdfc6388d5c437845f9899394fd355e4b22b628b4cb1ba`.
Pre-edit SHA-256 for IDs 27061/27098:
`c3f6c8ddcd3bede275fdfc6388d5c437845f9899394fd355e4b22b628b4cb1ba`;
post-edit SHA-256:
`51cad27f1a98bd20e71141c52ef1afc8ba4794991fdb5712b16d37e17d12f3f3`.
Byte-identical pre-edit backups:
`/private/tmp/ko-translate-backups/20261011/before-context-27001-27050-D19340/locatexts_zh_cn.koalocatext_default.csv`;
`/private/tmp/ko-translate-backups/20261011/before-context-27051-27100-D19343/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the exact substitutions reproduces each backup byte-for-byte.
Only the four authorized `Texto` cells changed; the BOM and existing 72,011
CRLF / 73 bare-LF endings are preserved. Details:
[`27001-27050`](consolidated-context-review-default-27001-27050-20261011.md),
[`27051-27100`](consolidated-context-review-default-27051-27100-20261011.md).

## `default` IDs 26951 and 26969 (D-19336-D-19337)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26951 | `며칠 전 밤, 보가트 세 마리가 마을 광장에 들어왔어.` | `얼마 전 밤, 보가트 세 마리가 마을 광장에 들어왔어.` | English and Japanese indicate a recent night without specifying several days. |
| 26969 | `우... 우리가 해냈어. 여기서 무슨 일이 벌어졌는지 봤겠지. 하이페리안이 우리 도시 위로 떠 있어.` | `우... 우리가 해냈어. 여기서 무슨 일이 벌어졌는지 봤겠지. 하이페리안이 우리 도시 안에 떠 있어.` | English `within our city` and Chinese place the Hyperian in the city, not above it; do not add a merger absent from English. |

Pre-edit SHA-256:
`430114874b5145814debd4b4abaa66c74e5f623a94ce8cbedc7bec48233ebdd3`;
post-edit SHA-256:
`4bb07ea79da77893c0d264f316c3dbcc2d73b86f681b84c9918ff23291f78801`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-26951-27000-D19336/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the exact substitutions reproduces the backup byte-for-byte.
Only these two `Texto` cells changed; the BOM and existing 72,011 CRLF /
73 bare-LF endings are preserved. Details:
[`IDs 26951-27000`](consolidated-context-review-default-26951-27000-20261011.md).

## `default` IDs 26923 and 26926 (D-19332-D-19333)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26923 | `이 세상 곳곳에 유물이 흩어져 있지만, 에테네의 암호문은... 책과 두루마리에서 윤곽만 봤을 뿐, 실물을 본 적은 없어.` | `이 세상 곳곳에 유물이 흩어져 있지만, 에테네의 사이퍼(Cipher)는... 책과 두루마리에서 윤곽만 봤을 뿐, 실물을 본 적은 없어.` | English identifies a capitalized named artifact the speaker has only seen in books; Japanese transliterates Cipher. |
| 26926 | `콜로새` | `콜로사이` | Reuse the latest accepted Kollossae spelling from D-18878/D-18933. |

Pre-edit SHA-256:
`a1a01d3373fce22842b8a99ad24c37963133c023d69755456a310fa739535aea`;
post-edit SHA-256:
`430114874b5145814debd4b4abaa66c74e5f623a94ce8cbedc7bec48233ebdd3`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-26901-26950-D19332/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the exact substitutions reproduces the backup byte-for-byte.
Only these two `Texto` cells changed; the BOM and existing 72,011 CRLF /
73 bare-LF endings are preserved. Details:
[`IDs 26901-26950`](consolidated-context-review-default-26901-26950-20261011.md).

## `default` IDs 26856, 26878, 26891 (D-19328-D-19330)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26856 | `발라드의 가문에서 비어 있는 자리를 채우기 위해서야.` | `발라드의 집에서 비어 있는 자리를 채우기 위해서야.` | Reuse the established House of Ballads name `발라드의 집`. |
| 26878 | `친절을 베풀어 무기를 준비해 주게. 곧 공격받을 것 같아.` | `미안하지만 무기를 준비해 주게. 곧 공격받을 것 같네.` | Replace an unnatural literal courtesy formula; Japanese supports the apologetic request and the revised Korean keeps a consistent register. |
| 26891 | `나는 아리아드를 지휘한다. 우리는 알파르의 눈이 되어 주는 전투 정찰병이다.` | `나는 아리아드대를 지휘한다. 우리는 알파르의 눈이 되어 주는 전투 정찰병이다.` | Clarify the explicitly identified scouting group using the established `아리아드대` form. |

Pre-edit SHA-256:
`3c8eac63846bd2c7a765d5b39688cc32797eeba41f13994e05a604161c2652ca`;
post-edit SHA-256:
`a1a01d3373fce22842b8a99ad24c37963133c023d69755456a310fa739535aea`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-26851-26900-D19328/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the exact substitutions reproduces the backup byte-for-byte.
Only these three `Texto` cells changed; the BOM and existing 72,011 CRLF /
73 bare-LF endings are preserved. Details:
[`IDs 26851-26900`](consolidated-context-review-default-26851-26900-20261011.md).

## `default` ID 26233 (D-19291)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26233 | `그 이름은 들어 봤겠지. 아데사에서 가장 큰 광물 채굴 세력이잖아.` | `그 이름은 들어 봤겠지. 아데사에서 가장 영향력 있는 광산업체잖아.` | English `mineral-mining interest` and Japanese/Chinese company readings establish a mining concern; “most powerful” describes influence, not physical size. |

Pre-edit SHA-256:
`2b46d9e070def1062d970ec44efb50fa28f1a0c636b707f6a85be7a92f39e504`;
post-edit SHA-256:
`db79b0974c2883e009f6d1daca4f6ff9683b93daf5140d624b8a48560cb34ee5`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-26201-26250-D19288/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`IDs 26201-26250`](consolidated-context-review-default-26201-26250-20261011.md).

## `default` IDs 26255 and 26283 (D-19295)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26255 | `미타란에게 쫓겨난 데 이어, 이번엔 캠프가 무작위 습격을 받고 있어.` | `미타란이 우리를 받아주지 않더니, 이제는 캠프가 무작위 습격을 받고 있어.` | English `lock us out`, Japanese `閉め出された`, and Chinese `拒之门外` describe being denied entry rather than expelled after entry. |
| 26283 | `콜로새는 자신들이 극복한 악의 유혹을 뱀의 형상으로 표현하기 시작했다.` | `콜로사이는 자신들이 극복한 악의 유혹을 뱀의 형상으로 표현하기 시작했다.` | Reuse accepted Kollossae spelling `콜로사이` at D-18878/D-18933. |

Pre-edit SHA-256:
`db79b0974c2883e009f6d1daca4f6ff9683b93daf5140d624b8a48560cb34ee5`;
post-edit SHA-256:
`799c0009b7158403e3d88827c9aa2f740b6c177d3f64695931e77ebad3dac434`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-26251-26300-D19294/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`IDs 26251-26300`](consolidated-context-review-default-26251-26300-20261011.md).

## `default` IDs 26303 and 26333 (D-19298, D-19300)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26303 | `발러의 가문은 이 원초적 힘의 보금자리가 되었다.` | `용맹의 집(House of Valor)은 이 원초적 힘의 보금자리가 되었다.` | Reuse the accepted Fae House name D-148/D-650. |
| 26333 | `다이덴힐 장인들의 이름난 공방` | `다이덴힐 장인들의 이름난 공예 회관` | English Hall, Japanese 館, and Chinese 大厅 support a hall/building rather than a workshop. |

Pre-edit SHA-256:
`799c0009b7158403e3d88827c9aa2f740b6c177d3f64695931e77ebad3dac434`;
post-edit SHA-256:
`4860f8afb05a56218be723a00331c25f768180e073ed73241971deaa904e0b52`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-26301-26350-D19298/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`IDs 26301-26350`](consolidated-context-review-default-26301-26350-20261011.md).

## `default` ID 26395 (D-19303)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26395 | `워스워른 경비 한 명` | `워스원(Warsworn) 경비병 한 명` | Reuse the accepted Warsworn form D-2857 and render `guard` as `경비병`. |

Pre-edit SHA-256:
`4860f8afb05a56218be723a00331c25f768180e073ed73241971deaa904e0b52`;
post-edit SHA-256:
`cf82bebc2dba96dadfb61fdf8ff484e78347e7bedcae773c546be03be566861b`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-26351-26400-D19303/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`IDs 26351-26400`](consolidated-context-review-default-26351-26400-20261011.md).

## `default` IDs 25811, 25827, 25844, 25846, and 25847 (D-19239-D-19247)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25811 | `소울딥 페스팅은 어디야?` | `소울딥 지하 통로는 어디야?` | Match the same location at ID 13928 and the Japanese/Chinese underground-passage readings. |
| 25827 | `흥미롭군. 필멸자면서도 발걸음에는 보통 필멸자라면 감히 짊어지지 못할 무게가 실려 있어.` | `흥미롭군. 자네는 필멸자지만, 발걸음에는 필멸자 한 명이 감당할 수 있으리라 기대조차 못 할 무게가 실려 있군.` | Remove the unsupported “ordinary” and “dare” nuance while preserving the supernatural burden and conversational voice. |
| 25844 | `우리는 들판과 샘의 자식들, 깊은 마력의 숨결로 가득 찬 페이의 육신이다. 네 주위에 보이는 것은 모두 우리 것이다.` | `우리는 들판과 샘의 자식들, 깊은 마력의 숨결로 가득 찬 페이 무리다. 네 주위에 보이는 것은 모두 우리 것이다.` | English `a Fae body` is a collective here; Japanese explicitly uses `集団`, not a physical body. |
| 25846 | `에어게이즈와 만나기` | `에어가스와 만나기` | Match the English `Aergase`, Japanese `エアガス`, and repeated active Korean form at IDs 3267, 9498, and 64033. |
| 25847 | `발밑을 조심하시오, 선택받은 자여. 콜로새의 실패로 이미 많은 이들이 목숨을 잃었소. 희생자가 더 늘어나는 건 원치 않소.` | `발밑을 조심하시오, 부름받은 자여. 콜로사이의 실패로 이미 많은 이들이 목숨을 잃었소. 희생자가 더 늘어나는 건 원치 않소.` | Reuse accepted `Beckoned` (D-692/D-3443) and the recent preferred `Kollossae` form (D-18878/D-18933); retain the warning and claimed prior losses. |

Only the listed `Texto` values changed. Pre-edit SHA-256:
`5e8e39450e3254c1cf3c50413bdd1683624f772234256372798a956e5e33dac1`.
Post-edit SHA-256:
`65a3e909862eeab29618c5283567adaf4b565f0405c79760276838f8cab643e3`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-25801-25850-D19239/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`IDs 25801-25850`](consolidated-context-review-default-25801-25850-20261011.md).

## Context Review Without CSV Edit (D-18276)

IDs 20122, 20126, 20127, 20128, 20130, 20135, and 20136 are reclassified as
`not an issue` after five-file comparison. Their local meanings and
structures are preserved; the English placeholder is translated, and the
Warsworn line retains its `they... we...` self-correction. No CSV cell
changed. Active default SHA-256 remains
`bd26350291e42a380af9e6c4bbc25bbe7c584ea613c15bdf225b46a714549dbb`.
Details:
[`IDs 20122-20136`](consolidated-context-review-default-20122-20136-20261011.md).

## Context Review Without CSV Edit (D-18275)

IDs 20110, 20115, 20117, and 20118 are reclassified as `not an issue`.
ID 20104 remains uncertain for the unresolved murghan entity/name. ID 20103
was already cleared at D-18262 and is not counted again. No CSV cell
changed. Active default SHA-256 remains
`bd26350291e42a380af9e6c4bbc25bbe7c584ea613c15bdf225b46a714549dbb`.
Details:
[`IDs 20103-20118`](consolidated-context-review-default-20103-20118-20261011.md).

## Context Review Without CSV Edit (D-18274)

IDs 20088, 20090, 20092, 20094, and 20096 are reclassified as `not an
issue`. Direct comparison confirms the broad wall reference, the five-line
poem's meaning and imagery, Gaea's blessing, the ring's return objective,
and Grian's Keep-entry permission. No CSV cell changed. Active default
SHA-256 remains
`bd26350291e42a380af9e6c4bbc25bbe7c584ea613c15bdf225b46a714549dbb`.
Details:
[`IDs 20088-20096`](consolidated-context-review-default-20088-20096-20261011.md).

## `default` IDs 20082 and 20089 (D-18273)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 20082 | `버튼을 눌러 마법 표식으로 대상을 지정합니다. 버튼을 길게 눌러 표식이 찍힌 적 모두를 화염 폭발로 터뜨리세요.` | `버튼을 짧게 눌러 마법 표식으로 대상을 지정합니다. 버튼을 길게 눌러 표식이 찍힌 적 모두를 화염 폭발로 터뜨리세요.` | The source distinguishes `Tap` from `Press and hold`; make the first action explicitly short without changing markers or effects. |
| 20089 | `이 교단에는 대륙 최고의 비전술 장인들이 모여 있다.` | `이 단체에는 대륙 최고의 비전술사들이 모여 있다.` | Use a neutral organization term supported by “order”/university/academy readings, and describe practitioners rather than artisans. |

IDs 20082 and 20089 are accepted. ID 20069 is `not an issue` without an
edit; IDs 20057, 20061, and 20074 remain uncertain for missing referents or
title context. Pre-edit SHA-256:
`bbc20b8c1988d924b86a0cb06d8600d9612c6960fac63208b68a94257290aa73`;
post-edit SHA-256:
`bd26350291e42a380af9e6c4bbc25bbe7c584ea613c15bdf225b46a714549dbb`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-mark-arcane-practitioner-20082-20089-D18273/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`Mark tutorial and arcane practitioners`](consolidated-context-review-default-mark-arcane-practitioners-20261011.md).

## Context Review Without CSV Edit (D-18272)

IDs 20052, 20053, 20054, 20056, 20059, 20062, 20072, 20080, and 20097
are reclassified as `not an issue`. Cross-language comparison confirms
their local quest facts, referents, and labels; unresolved name
standardization is separate. The `who wish` mismatch at ID 20054 is in the
English source and does not require a Korean source edit. Active default
SHA-256 remains
`bbc20b8c1988d924b86a0cb06d8600d9612c6960fac63208b68a94257290aa73`.
Details:
[`IDs 20052-20097`](consolidated-context-review-default-20052-20097-20261011.md).

## `default` ID 20012 (D-18271)

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `리리아 만세! 네가 끝내 오지 않을 줄 알았어.` | `리리아를 찬양하라! 네가 끝내 오지 않을 줄 알았어.` | All three source languages explicitly say to praise Lyria; `찬양하라` matches established Korean devotional usage, while `만세` shifts the line to a rallying cheer. |

ID 20012 is accepted. IDs 20028, 20036, and 20038 remain uncertain for
separate unresolved image/register questions. Pre-edit SHA-256:
`26b471e1d909b9960563e91ceb9dfa943c7b6bdf501730e04f716c097f76af74`;
post-edit SHA-256:
`bbc20b8c1988d924b86a0cb06d8600d9612c6960fac63208b68a94257290aa73`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-praise-lyria-20012-D18272/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`Praise Lyria`](consolidated-context-review-default-lyria-line-20012-20261011.md).

## Context Review Without CSV Edit (D-18269-D-18270)

ID 19996 and IDs 20002, 20007, 20018, 20022, 20035, 20041-20043, 20046,
and 20050 are reclassified as `not an issue` after direct five-file
comparison. ID 19963 remains uncertain only for the unresolved image in
`the fools who fell`; its five-line structure is aligned. No CSV cell changed
and no backup was needed.

Active default SHA-256 before and after:
`26b471e1d909b9960563e91ceb9dfa943c7b6bdf501730e04f716c097f76af74`.
Details:
[`Varik's letter and IDs 20002-20050`](consolidated-context-review-default-letter-and-20002-20050-20261011.md).

## `default` ID 19997 (D-18268)

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `학자 엥가르는 아르카나 대학의 숙련자 레르카라 펠을 찾으라고 나를 멜 아글리르 마을로 보냈다. 가는 길에 강령술사가 마을 사람들을 납치하고 있다는 사실을 알아냈다. 레르카라도 그중 하나였고, 최근 되살린 아내에게 먹이로 주려는 짓이었다. 그를 막은 공로로 강사로 승진했다.` | `사반트 엥가르는 스콜리아 아르카나의 숙련자 레르카라 펠을 찾으라고 나를 멜 아글리르 마을로 보냈다. 가는 길에 강령술사가 마을 사람들을 납치하고 있다는 사실을 알아냈다. 레르카라도 그중 하나였고, 최근 되살린 아내에게 먹이로 주려는 짓이었다. 그를 막은 공로로 도슨트로 승진했다.` | English explicitly presents formal Scholia Arcana ranks; reuse the established `사반트`, `숙련자`, `도슨트`, and `스콜리아 아르카나` forms supported by rank context and Korean reference text. |

ID 19997 is accepted. ID 19963's poem remains uncertain for its compressed
imagery and rhythm; its five-line structure is unchanged.

Pre-edit SHA-256:
`af27d91862dfdd9fbd609ea5504a6e9f7ab817aad49fb25e987950f9139250c5`.
Post-edit SHA-256:
`26b471e1d909b9960563e91ceb9dfa943c7b6bdf501730e04f716c097f76af74`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-scholia-ranks-19997-D18268/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`Scholia Arcana ranks`](consolidated-context-review-default-scholia-ranks-19997-20261011.md).

## Context Review Without CSV Edit (D-18267)

IDs 19950 (`Fateless One`), 19951 (`Tinker's Daughter`), 19954
(treatise/symposium), and 19962 (Dokkalfar/strategic claim) are
reclassified as `not an issue`. Their wording is supported by the aligned
sources and accepted `운명 없는 자` / `도크알브` terminology. ID 19963's
five-line poem remains uncertain over compressed imagery and rhythm. No CSV
edit or backup was needed. Details:
[`Fateless One, Tinker's Daughter, and Dokkalfar`](consolidated-context-review-default-fateless-tinkers-dokkalfar-20261011.md).

## `default` ID 19984 (D-18265)

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `티르노크를 막지 못하면, 그녀는 졸개들을 시켜 감옥에서 완전히 탈출하고 세상을 새로운 장난감으로 삼을 거야.` | `티르노크를 막지 못하면, 그녀는 졸개들의 도움을 받아 감옥에서 완전히 탈출해 세상을 새로운 장난감으로 삼을 거야.` | English and Chinese say Tirnoch uses her pawns/minions to escape herself; the old Korean could make the minions the escaping subject. |

ID 19984 is accepted. IDs 19979, 19981, 19989, 19991, and 19992 are
reclassified as `not an issue` without edits. IDs 19997 and 19998 remain
uncertain only for global Scholia Arcana rank and Cape Solace spelling
decisions.

Pre-edit SHA-256:
`056e952ecc9c6153c2136e9c61123598171b586a88291ec14565b3534ddd3f57`.
Post-edit SHA-256:
`af27d91862dfdd9fbd609ea5504a6e9f7ab817aad49fb25e987950f9139250c5`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-tirnoch-escape-D18265/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`Lore and journal lines`](consolidated-context-review-default-lore-lines-20261011.md).

## `default` IDs 19965 and 19973 (D-18264)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 19965 | `룬 드러내기 활성화` | `룬 드러내기가 활성화되었습니다.` | English/Japanese/Chinese describe an already activated rune/status; reuse the completed-status pattern accepted for ID 17191 / D-5417. |
| 19973 | `필수 당사자 중 한 명이 죽었다. 이 계약은 더 이상 완료할 수 없어.` | `계약 당사자 중 한 명이 죽었다. 이 계약은 더 이상 완료할 수 없어.` | Contract context is explicit, and the same natural term is already used in related Korean rows. |

IDs 19965 and 19973 are accepted. IDs 19969, 19974, and 19976 are
reclassified as `not an issue` without edits. ID 19972 was separately
resolved at D-18263 and is not recounted.

Pre-edit SHA-256:
`4bd4f2877865a19ed1f2b072bb3a8bfa779e45b2675dd454ba8c3e10fa8c009b`.
Post-edit SHA-256:
`056e952ecc9c6153c2136e9c61123598171b586a88291ec14565b3534ddd3f57`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-rune-contract-context-D18264/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`Rune status and contract lines`](consolidated-context-review-default-runes-contract-lines-20261011.md).

## `default` ID 19972 (D-18263)

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `저리 가. 전승 의식을 방해하게 될 거야.` | `저리 가. 전승을 방해하게 될 거야.` | English/Japanese/Chinese say the addressee will disturb the Telling; none establishes a ritual. |

ID 19972 is accepted. ID 12861 is reclassified as `not an issue` without
editing its accurate `차지하려는` wording. Pre-edit SHA-256:
`9ad0c54788bacf1adb14f875bac12bc40c4219e3d514969a14b647318d5e56b8`.
Post-edit SHA-256:
`4bd4f2877865a19ed1f2b072bb3a8bfa779e45b2675dd454ba8c3e10fa8c009b`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-telling-context-19972-D18263/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`Claiming and disturbing the Telling`](consolidated-context-review-default-telling-claim-disturb-20261011.md).

## Context Review Without CSV Edit (D-18262)

IDs 7399, 7526, 8293, 14303, 16563, 20103, 22166, 25134, and 59826 use
`전승` for the recurring Fae lore concept `The Telling`. Their local
meanings are supported by English, Japanese `伝承`, repeated context, and
accepted terminology decisions. Reclassify the nine keys as `not an issue`;
other uses with unresolved rite/event/performance senses remain open.

Active default SHA-256 before and after:
`9ad0c54788bacf1adb14f875bac12bc40c4219e3d514969a14b647318d5e56b8`.
No CSV edit or backup was needed. Details:
[`The Telling rows`](consolidated-context-review-default-telling-rows-20261011.md).

## `default` ID 8162 (D-18261)

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `... 그렇지요, 폐하? 그렇죠?` | `... 그렇지요, 각하? 그렇죠?` | Retain the established `전승(The Telling)` term and respectful tone without adding royal rank. |

Only the `Texto` cell at ID 8162 changed. ID 8162 is accepted, and ID 14991
is reclassified as `not an issue` without a CSV edit. Pre-edit SHA-256:
`5cf2c5e3c51332a954fb3226bbad0c6e276e691223708f07e4bf155912c12946`.
Post-edit SHA-256:
`9ad0c54788bacf1adb14f875bac12bc40c4219e3d514969a14b647318d5e56b8`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-telling-8162-D18261/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`The Telling and Sagrell context`](consolidated-context-review-default-telling-sagrell-20261011.md).

## Repeated `Your Grace` Addresses (D-18260)

Change `전하` to the previously accepted general formal address `각하` at
IDs 5073, 5120, 12854, 14405, 23928, 24090, 25064, 30891, 40797, 45342,
55335, 55446, 58750, 64150, and 64494. IDs 5829, 5894, and 45690 already
used `각하` and required no CSV edit. Seventeen rows are reclassified as
accepted; ID 30891 remains uncertain only for `Viator`.

Pre-edit SHA-256:
`651c4d78ec4a888cff19e1e6cb765391ec7fb50ac2a979ef2a58fab1723a70c4`.
Post-edit SHA-256:
`5cf2c5e3c51332a954fb3226bbad0c6e276e691223708f07e4bf155912c12946`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-your-grace-cluster-D18260/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`Your Grace cluster`](consolidated-context-review-default-your-grace-cluster-20261011.md).

## `default` ID 64972 (D-18259)

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `몸조심하세요, 전하.` | `몸조심하세요, 각하.` | English `your grace` establishes respect, not royalty. Repeated lore identifies the addressee as the House of Ballads ruler but says he has no crown; reuse the accepted general formal address. |

Only the `Texto` cell at ID 64972 changed. The uncertain disposition is
reclassified as accepted. Pre-edit SHA-256:
`005887b958934afaa962fe88cfc2994cc0fcdfbe1215b4f3e87a068a6daa59c1`.
Post-edit SHA-256:
`651c4d78ec4a888cff19e1e6cb765391ec7fb50ac2a979ef2a58fab1723a70c4`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-grace-64972-D18259/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`Your Grace context`](consolidated-context-review-default-your-grace-20261011.md).

## Context Review With No CSV Edit (D-18258)

ID 64960 identifies Esharra as the magical plane to which all Fae belong and
preserves the ancient tree's roots touching both this world and that plane.
All five ID-aligned source/draft files agree on the relation. Retain the
accurate current `에샤라`; global transliteration variation alone is not a
row-level translation error. Reclassify ID 64960 as `not an issue`; no CSV
edit or backup was needed.

Active default SHA-256 before and after:
`005887b958934afaa962fe88cfc2994cc0fcdfbe1215b4f3e87a068a6daa59c1`.
Details:
[`Esharra context`](consolidated-context-review-default-esharra-20261011.md).

## `default` ID 64951 (D-18257)

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `... 이걸로 미시브(Missives)를 다시 찾을 수 있어.` | `... 이걸로 세이블의 서신(Missives of Sable)을 다시 찾을 수 있어.` | Repeated English context identifies the Missives as the Missives of Sable, an old book/pages; Japanese and Chinese give localized book titles, and existing Korean exact-name rows use this established form. |

Only the `Texto` cell at ID 64951 changed. The key is reclassified from
uncertain to accepted. Pre-edit SHA-256:
`ed5639b5ba84ea7f1f236220faf6b889d87d5f0009d0b0b024878f91380bedab`.
Post-edit SHA-256:
`005887b958934afaa962fe88cfc2994cc0fcdfbe1215b4f3e87a068a6daa59c1`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-missives-64951-D18257/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`Missives of Sable context`](consolidated-context-review-default-missives-20261011.md).

## Context Review With No CSV Edit (D-18256)

ID 65101 says that Cillian Keen at Cape Solace will be interested in seeing
the item. English, Japanese, Chinese, the Japanese-derived Korean draft,
and active Korean preserve the same person, place, and relation. Cape
Solace's global Korean spelling remains inconsistent, but the current row
preserves its identity; that consistency issue alone is not a row-level
translation error. Reclassify ID 65101 as `not an issue` without changing
the CSV.

Active default SHA-256 before and after:
`ed5639b5ba84ea7f1f236220faf6b889d87d5f0009d0b0b024878f91380bedab`.
No backup was needed. Details:
[`Cape Solace context`](consolidated-context-review-default-cape-solace-20261011.md).

## `default` Gwyn Anwy name consistency (D-18255)

Across all 51 English-keyed rows containing `Gwyn Anwy`, normalize the Korean
name fragment to `그윈 안웨이`. The source-supported Japanese spelling is
`グウィン・アンウェイ`; the Chinese transliteration is `格文·安维`.

| Previous Korean form | Rows | Applied form |
| --- | ---: | --- |
| `그윈 안위` | 27 | `그윈 안웨이` |
| `그윈 앤위` | 17 | `그윈 안웨이` |
| `귄 안위` | 4 | `그윈 안웨이` |
| `귄 앤위` | 1 | `그윈 안웨이` |
| `오윈 안위` | 1 | `그윈 안웨이` |
| `귀윈 언위` | 1 | `그윈 안웨이` |

ID 65127 is reclassified from uncertain to accepted. The other 50 keys keep
their existing dispositions because any unrelated row questions remain
open. Standalone `Anwy` at ID 14520 is not this identified character and is
unchanged. Only the 51 approved Korean name fragments changed.

Pre-edit SHA-256:
`a0f2e86b36c9ba3878403e4ec09a701247c7a1531d42c87e9d80f97d5e204618`.
Post-edit SHA-256:
`ed5639b5ba84ea7f1f236220faf6b889d87d5f0009d0b0b024878f91380bedab`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-gwyn-anwy-D18255/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`Gwyn Anwy name review`](consolidated-context-review-default-gwyn-anwy-20261011.md).

## `default` IDs 65066, 65089, and 65127 (D-18254)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 65066 | `진정해, 풋내기. 먼저 플레지실드가 돼. 그러고 나서 5년이나 10년쯤 성실히 복무하면 오스블레이드가 될 거야.` | `진정해, 풋내기. 먼저 서약방패병이 돼. 그러고 나서 5년이나 10년쯤 성실히 복무하면 맹세의 칼날이 될 거야.` | English and repeated contexts explicitly establish the rank progression; Chinese supports the oath/shield and oath/blade meanings. |
| 65089 | `완벽한 미타란 도살자의 받침대` | `완벽한 미타란 도살자의 지렛목` | The English/Japanese/Chinese item family identifies a Fulcrum component, not a pedestal. |
| 65127 | `오스블레이드 그윈 안위` | `맹세의 칼날 그윈 안위` | Correct only the confirmed rank term. The row remains uncertain over the conflicting Korean spelling of `Gwyn Anwy`. |

IDs 65066 and 65089 are reclassified from uncertain to accepted. ID 65127
remains uncertain and is not recounted. Only these three `Texto` cells
changed; the UTF-8 BOM, row order, and original mixed line endings are
preserved.

Pre-edit SHA-256:
`a19d10e66a7946ce925300d542d37951a123189804571b701269b11fbfb7a35a`.
Post-edit SHA-256:
`a0f2e86b36c9ba3878403e4ec09a701247c7a1531d42c87e9d80f97d5e204618`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-ranks-fulcrum-D18254/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`Warsworn ranks and Fulcrum`](consolidated-context-review-default-ranks-fulcrum-20261011.md).

## `default` Hanged Men Context Review (D-18244)

The accepted crew-name form established by D-3145/D-3665 is applied to
source-confirmed references. IDs 11418, 11833, 21179, 31464, 32516, 34680,
35010, 40810, and 41055 remain uncertain for separate issues. Standalone
IDs 28296 and 29944 were left unchanged because their Korean display
convention remains open.

| ID | Previous Korean fragment | Applied Korean fragment |
| ---: | --- | --- |
| 9364 | `행드 맨(Hanged Men)` | `교수형 사내들(Hanged Men)` |
| 11418 | `교수형자들(Hanged Men)` | `교수형 사내들(Hanged Men)` |
| 11833 | `교수형자들(Hanged Men)의 선원들이` | `교수형 사내들(Hanged Men)의 선원들이` |
| 21179 | `처형자들의 마지막인` | `교수형 사내들(Hanged Men) 중 마지막인` |
| 26687 | `교수형에 처한 자들` | `교수형 사내들(The Hanged Men)` |
| 27856 | `데드 켈(Dead Kel)의 행맨(Hanged Men) 선원들은` | `데드 켈(Dead Kel)의 교수형 사내들(Hanged Men)은` |
| 28302 | `행맨(The Hanged Men)` | `교수형 사내들(The Hanged Men)` |
| 31464 | `행잉 멘도 같이 있었나?` | `교수형 사내들(Hanged Men)도 함께였나?` |
| 32516 | `목매달린 자들 중 하나` | `교수형 사내들(Hanged Men) 중 하나` |
| 34680 | `교수형 집행인단의 마지막 생존자인` | `교수형 사내들(Hanged Men) 중 마지막 생존자인` |
| 35010 | `교수형 집행인단을 거느리고` | `교수형 사내들(Hanged Men)을 거느리고` |
| 40810 | `데드 켈과 교수형 해적단은` | `데드 켈과 교수형 사내들(Hanged Men)은` |
| 41055 | `데드 켈의 교수형 해적단에서 가장 잔혹한 바론넷` | `데드 켈의 교수형 사내들(Hanged Men) 중 가장 잔혹한 바론넷` |
| 47514 | `교수형 당한 자들이 실재했구나.` | `교수형 사내들(Hanged Men)이 실재했구나.` |
| 57244 | `교수형 당한 자들이 황야를` | `교수형 사내들(Hanged Men)이 황야를` |
| 63469 | `행드 맨(Hanged Men)` | `교수형 사내들(Hanged Men)` |

Pre-edit SHA-256:
`d2812e4d72b9d5ae24615f80475c73051fe28b4d96823dae218db4c9c4ee460a`.
Post-edit SHA-256:
`1aa595e9d3fd82767b4db2cf641daab1bf4e6b846a8573017feef8857bc95400`.
Only these 16 `Texto` cells changed; 65,135 data rows, key order, UTF-8 BOM,
72,011 CRLF endings, 73 bare-LF endings, line breaks, and runtime markers
are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-hanged-men-context-20261011.csv`.
Details:
[`Hanged Men context review`](consolidated-context-review-default-hanged-men-20261011.md).

## `default` ID 51271 (D-18249)

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `그녀는 5분도 안 되는 동안 12명을 도륙했고` | `그녀는 5분 동안 12명을 도륙했고` | English says the killings occur in a five-minute span, not necessarily in less than five minutes. Japanese says about five minutes; Chinese is secondary. |

The row remains uncertain for the separate `Arc of Light` rendering and
other context questions. No disposition key is recounted.

Pre-edit SHA-256:
`1aa595e9d3fd82767b4db2cf641daab1bf4e6b846a8573017feef8857bc95400`.
Post-edit SHA-256:
`bd80c7003f0fb1785206d94c61b703e1d47c7529d399664e647c0821e28a84a5`.
Only the `Texto` cell at ID 51271 changed. UTF-8 BOM, row order, 65,135 data
rows, line endings, and runtime markers are preserved. Byte-identical
pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-fiveminute-context-20261011.csv`.
Details:
[`five-minute span review`](consolidated-context-review-default-five-minute-span-20261011.md).

## `default` IDs 28296 and 29944 (D-18252)

The exact standalone English label `The Hanged Men` now uses the same
established crew-name form already accepted for the identical label at ID
28302:

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 28296 | `행맨(The Hanged Men)` | `교수형 사내들(The Hanged Men)` |
| 29944 | `행맨(The Hanged Men)` | `교수형 사내들(The Hanged Men)` |

This supersedes the uncertainties recorded at D-18246. Only these two
`Texto` cells changed; all other bytes, including the UTF-8 BOM and original
mixed line endings, are identical to the pre-edit file.

Pre-edit SHA-256:
`bd80c7003f0fb1785206d94c61b703e1d47c7529d399664e647c0821e28a84a5`.
Post-edit SHA-256:
`a19d10e66a7946ce925300d542d37951a123189804571b701269b11fbfb7a35a`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-hanged-men-standalone-context-20261011/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`standalone Hanged Men review`](consolidated-context-review-default-hanged-men-standalone-20261011.md).

## Context Review With No CSV Edit (D-18247-D-18248)

D-18247 clears uncertain ID 6172: all locales identify the Frostbreak as
the sea dominated by Dead Kel and his Hanged Men, and the current Korean
preserves both the sea and crew meanings. D-18248 clears ID 31343 because
the English tides, Japanese waves, Chinese sea waves, and Korean rolling
waves all convey the same sea image. These decisions do not settle the
global Korean spelling or clear separate Frostbreak questions at other IDs.

Active default SHA-256 before and after:
`1aa595e9d3fd82767b4db2cf641daab1bf4e6b846a8573017feef8857bc95400`.
No CSV cell changed and no backup was required. Details:
[`Frostbreak context review`](consolidated-context-review-default-frostbreak-20261011.md).

## `default` ID 13358 (D-18232)

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `남은 봉헌 초 찾기` | `남은 봉헌물 찾기` | English `votives`, Japanese `装身具`, Chinese `许愿石`, and repeated quest context identify portable objects but do not support candles. Replace only the over-specific object noun. |

Pre-edit SHA-256:
`ea3a78994d8a47dc49ef1a92434be768ae5ea1092d37ee25cf84468ebf0782ee`.
Post-edit SHA-256:
`d2812e4d72b9d5ae24615f80475c73051fe28b4d96823dae218db4c9c4ee460a`.
Only the approved `Texto` cell changed. The UTF-8 BOM, row order, ID keys,
72,011 CRLF and 73 bare-LF endings are preserved. Byte-identical pre-edit
backup:
`/private/tmp/ko-translate-backups/20261011/before-votive-context-20261011/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`consolidated context review`](consolidated-context-review-default-freemen-litanies-20261011.md).

## Context Review With No CSV Edit (D-18235)

D-18235 reclassifies the eleven exact `Court of Enchantments` labels
158, 5395, 5588, 8114, 11873, 13650, 15635, 16952, 26547, 28140, and 29765
as `not an issue`. Repeated context identifies the named House of Ballads
court and its hero-members, while accepted D-1815 establishes the current
Korean `마법의 궁정`.

Active default CSV SHA-256 before and after:
`d2812e4d72b9d5ae24615f80475c73051fe28b4d96823dae218db4c9c4ee460a`.
No backup was needed because the CSV was not changed. Details:
[`consolidated context review`](consolidated-context-review-default-freemen-litanies-20261011.md).

## Context Review With No CSV Edit (D-18236)

D-18236 reclassifies `default` IDs 4187, 9537, 13888, and 16310 as
`not an issue`. Accepted D-1384 and repeated quest text establish `The
Midden` as a named magical place, matching the current Korean
`미든(The Midden)`. The distinct ID 16311 question remains uncertain.

Active default CSV SHA-256 before and after:
`d2812e4d72b9d5ae24615f80475c73051fe28b4d96823dae218db4c9c4ee460a`.
No backup was needed because the CSV was not changed. Details:
[`consolidated context review`](consolidated-context-review-default-freemen-litanies-20261011.md).

## Context Review With No CSV Edit (D-18237-D-18239)

D-18237 reclassifies `default` ID 16946 (`Court of Enchantments`) as
`not an issue`, reusing accepted D-1815 and the repeated-context review at
D-18235. D-18238 clears six standalone `Scholia Arcana` labels (IDs 16312,
25400, 29179, 30269, 31625, and 31862) because their current Korean matches
the accepted institution name. D-18239 rechecks IDs 1331, 12405, and 14580
(`The Font`) but retains their existing uncertainties; approval of
`샘(The Font)` at ID 10833 does not by itself authorize a display-form change
in these rows.

Active default CSV SHA-256 before and after:
`d2812e4d72b9d5ae24615f80475c73051fe28b4d96823dae218db4c9c4ee460a`.
No CSV cell changed and no backup was required. Details:
[`consolidated context review`](consolidated-context-review-default-magical-institution-labels-20261011.md).

## Context Review With No CSV Edit (D-18240)

D-18240 reclassifies IDs 11305, 12628, 17879, 19513, and 24447 as
`not an issue`. Repeated infection/spread context and exact standalone
labels confirm the accepted Korean disease name `혈역병` from D-6997. Other
active Korean variants remain open and were not normalized.

Active default CSV SHA-256 before and after:
`d2812e4d72b9d5ae24615f80475c73051fe28b4d96823dae218db4c9c4ee460a`.
No CSV cell changed and no backup was required. Details:
[`Blood Plague context review`](consolidated-context-review-default-blood-plague-20261011.md).

## Context Review With No CSV Edit (D-18241)

D-18241 reclassifies standalone `Theater of Andronikos` IDs 25579, 27217,
29959, and 31112 as `not an issue`. All five locales identify the same
venue; repeated context and accepted D-6269/D-6611 support the Korean
`안드로니코스 극장`. The separate canonical-spelling question at ID 50964
remains open.

Active default CSV SHA-256 before and after:
`d2812e4d72b9d5ae24615f80475c73051fe28b4d96823dae218db4c9c4ee460a`.
No CSV cell changed and no backup was required. Details:
[`Theater of Andronikos context review`](consolidated-context-review-default-theater-andronikos-20261011.md).

## Context Review With No CSV Edit (D-18242)

D-18242 reclassifies standalone `Adessa` IDs 18653, 28075, 29549, and 48500
as `not an issue`. All five locales align on the place name, and the same
Korean form `아데사` is used in 57 exact English-label rows. The other 53
labels were already dispositioned and are not recounted.

Active default CSV SHA-256 before and after:
`d2812e4d72b9d5ae24615f80475c73051fe28b4d96823dae218db4c9c4ee460a`.
No CSV cell changed and no backup was required. Details:
[`Adessa context review`](consolidated-context-review-default-adessa-labels-20261011.md).

## Context Review With No CSV Edit (D-18243)

D-18243 reclassifies standalone `Mayor Eswin` IDs 20355 and 24709 as
`not an issue`. All five locales preserve the mayor and name, and accepted
D-12956/D-13755/D-16073 support `에스윈 시장`. The separate full-name
spelling question at ID 57930 remains open.

Active default CSV SHA-256 before and after:
`d2812e4d72b9d5ae24615f80475c73051fe28b4d96823dae218db4c9c4ee460a`.
No CSV cell changed and no backup was required. Details:
[`Mayor Eswin context review`](consolidated-context-review-default-mayor-eswin-20261011.md).

## `default` ID 64974 and Context Review (D-18219-D-18230)

D-18219 changes only ID 64974 `Texto` from `자유민단` to
`프리맨(Freemen)`, reusing previously accepted named-faction forms.
D-18220 reclassifies 64952, 64954 and 65069 as `not an issue` with
no edits. D-18221 likewise reclassifies 65048 based on repeated
fighter-training context. D-18222 reclassifies five `Good luck.` and five
`Welcome.` standalone labels as `not an issue` based on exact five-locale
comparison. No further CSV cells changed. IDs 65005 and 65101 remain
uncertain. D-18223 reclassifies eighteen additional repeated plain-language
rows, and D-18224 reclassifies fourteen repeated conversation rows, as
`not an issue` after source-aligned five-locale comparison; no CSV cells
changed. D-18225 clears three standalone `Champion.` rows on the same
source-aligned basis, and D-18226 clears three polite `Hello.` rows.
D-18227 clears four `Room` and three `Gambling Den` labels from cross-locale
and game context. D-18228 clears two generic `The War` labels; D-18229
clears two `Team Tournament` labels; D-18230 clears three `I want you to
stay.` rows. None of D-18225-D-18230 requires edits.

Pre-edit SHA-256:
`b498cb4f2b4980a510cac168a01bbfa9bbd2246efcdef70a0686a6c39d8b8969`.
Post-edit SHA-256:
`ea3a78994d8a47dc49ef1a92434be768ae5ea1092d37ee25cf84468ebf0782ee`.
Only the approved `Texto` cell changed. BOM, 72,011 CRLF and 73 bare-LF
endings remain unchanged; exact single-replacement byte comparison passed.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-freemen-context-20261011/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`consolidated-context-review-default-freemen-litanies-20261011.md`](consolidated-context-review-default-freemen-litanies-20261011.md).

## Context Review With No CSV Edit (D-18218)

D-18218 reclassifies `default` IDs 65107 and 65132 from uncertain to
`not an issue`. The specimen-test translation preserves the high-cost combat
test without specifying unsupported sender details; the attached-note
translation matches the Chinese source's explicit outside-box placement.

Active default CSV SHA-256 before and after:
`b498cb4f2b4980a510cac168a01bbfa9bbd2246efcdef70a0686a6c39d8b8969`.
No backup was needed because the CSV was not changed. Details:
[`consolidated-context-review-default-specimens-box-note-20261011.md`](consolidated-context-review-default-specimens-box-note-20261011.md).

## Context Review With No CSV Edit (D-18217)

D-18217 confirms that Oathblade is a Warsworn rank at `default` IDs 65066
and 65127. Both remain uncertain because the Korean rank form varies across
the corpus; ID 65127 also uses the unsettled name form `그윈 안위`.

Active default CSV SHA-256 before and after:
`b498cb4f2b4980a510cac168a01bbfa9bbd2246efcdef70a0686a6c39d8b8969`.
No backup was needed because the CSV was not changed. Details:
[`consolidated-context-review-default-oathblade-20261011.md`](consolidated-context-review-default-oathblade-20261011.md).

## Context Review With No CSV Edit (D-18216)

D-18216 reclassifies `default` IDs 65110 (`Foes' Hearth`) and 65134
(`Three Swords`) from uncertain to `not an issue`. Repeated context confirms
the first is a place and the second an individual Varani blademaster; both
Korean cells already preserve the supported meaning.

Active default CSV SHA-256 before and after:
`b498cb4f2b4980a510cac168a01bbfa9bbd2246efcdef70a0686a6c39d8b8969`.
No backup was needed because the CSV was not changed. Details:
[`consolidated-context-review-default-foes-hearth-three-swords-20261011.md`](consolidated-context-review-default-foes-hearth-three-swords-20261011.md).

## `default` ID 65118 (D-18215)

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `넌 변화의 사자지만, 가져오는 것은 파괴야.` | `넌 변화를 가져오는 존재지만, 네가 가져오는 건 파괴야.` | Reuse the exact `agent of change` distinction accepted at ID 29528 / D-9294. English and Chinese support an agent/catalyst, not necessarily a messenger; retain the direct address and destruction contrast. |

Pre-edit CSV SHA-256:
`4ea2a72df4b226d555ad672473b0417754b847dcd699a77f80a5c90b6b0a94da`.
Post-edit CSV SHA-256:
`b498cb4f2b4980a510cac168a01bbfa9bbd2246efcdef70a0686a6c39d8b8969`.
Only this approved `Texto` cell changed. The UTF-8 BOM, row order, embedded
line breaks, and CRLF record separators are preserved. Byte-identical
pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-agent-change-context-20261011/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`consolidated-context-review-default-agent-of-change-20261011.md`](consolidated-context-review-default-agent-of-change-20261011.md).

## Context Review With No CSV Edit (D-18214)

D-18214 reclassifies `default` ID 65112 from uncertain to `not an issue`.
The standalone English `Servant`, Japanese `召使`, related corpus examples,
and Chinese cross-check support the existing Korean `하인`; capitalization
does not establish a formal rank.

Active default CSV SHA-256 before and after:
`4ea2a72df4b226d555ad672473b0417754b847dcd699a77f80a5c90b6b0a94da`.
No backup was needed because the CSV was not changed. Details:
[`consolidated-context-review-default-servant-20261011.md`](consolidated-context-review-default-servant-20261011.md).

## Context Review With No CSV Edit (D-18213)

D-18213 reclassifies `default` ID 36763 from uncertain to `not an issue`.
The current `Texto` already means that no good man would arrive at Gallows
End. The Korean place-name spelling remains unresolved, so no normalization
was authorized.

Active default CSV SHA-256 before and after:
`4ea2a72df4b226d555ad672473b0417754b847dcd699a77f80a5c90b6b0a94da`.
No backup was needed because the CSV was not changed. Details:
[`consolidated-context-review-default-gallows-end-20261011.md`](consolidated-context-review-default-gallows-end-20261011.md).

## `default` IDs 8822, 43478, 48472, 48905, 49380, 49876, and 49898 (D-18212)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 8822 | `선택받은 자여` | `부름받은 자여` | Match the accepted player-title correction at D-692/D-3115; `선택받은` changes Beckoned to “chosen.” |
| 43478 | `선택받은 자여` | `부름받은 자여` | Match the accepted player-title correction at D-692/D-3115. |
| 48472 | `선택받은 자` | `부름받은 자` | Preserve the English farewell title without changing “beckoned” to “chosen.” |
| 48905 | `선택받은 자` | `부름받은 자` | Match the accepted player-title correction at D-692/D-3115. |
| 49380 | `선택받은 자여` | `부름받은 자여` | Retain the explicit English title in the formal welcome. |
| 49876 | `선택받은 자여` | `부름받은 자여` | Retain the direct address in the request for aid. |
| 49898 | `선택받은 자여` | `부름받은 자여` | Retain the direct address and gratitude. |

Pre-edit CSV SHA-256:
`7c3cde61768c72e5f5517dc495ba76a4e534121b2920f4f82d9c6459f4039f21`.
Post-edit CSV SHA-256:
`4ea2a72df4b226d555ad672473b0417754b847dcd699a77f80a5c90b6b0a94da`.
Only these seven `Texto` cells changed. The UTF-8 BOM, 65,135 records, row
order, 72,011 CRLF endings, and 73 existing bare-LF endings are preserved.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-beckoned-context-20261011/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`consolidated-context-review-default-beckoned-20261011.md`](consolidated-context-review-default-beckoned-20261011.md).

## `default` IDs 8780, 9530, 24295, and 29458 (D-18206)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 8780 | `아르카나 학회` | `스콜리아 아르카나` | Restore the established proper name for the exact English label `Scholia Arcana`. |
| 9530 | `알카나 대학` | `스콜리아 아르카나` | Correct the inconsistent transliteration and remove the unsupported generic institution rendering. |
| 24295 | `아르카나 학술회` | `스콜리아 아르카나` | Reuse the established proper-name form without adding an institution type. |
| 29458 | `슈올리아 아르카나` | `스콜리아 아르카나` | Correct the inconsistent spelling to the established Korean name. |

Pre-edit CSV SHA-256:
`72dd2be711abc43b037f6560e55518823452f147ebb4b6f9d68bc17bcce806f7`.
Post-edit CSV SHA-256:
`7c3cde61768c72e5f5517dc495ba76a4e534121b2920f4f82d9c6459f4039f21`.
Only these four `Texto` cells changed. The UTF-8 BOM, 65,135 ascending IDs,
row order, and existing record separators are preserved. Byte-identical
pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-cluster-20261011/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`consolidated-context-review-default-quest-scholia-20261011.md`](consolidated-context-review-default-quest-scholia-20261011.md).

## `default` ID 60043 (D-18204)

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `붕괴` | `접기` | `Collapse` is a UI command. Match the existing `펼치기` / `모두 접기` / `모두 펼치기` controls; Japanese `詳細を隠す` and Chinese `收拢` confirm the fold/hide action. |

Pre-edit CSV SHA-256:
`e6baa895a059ae0de03aad514db5354049b877cc6d49ef34178cc8de560af2e7`.
Post-edit CSV SHA-256:
`72dd2be711abc43b037f6560e55518823452f147ebb4b6f9d68bc17bcce806f7`.
Only this `Texto` cell changed. The UTF-8 BOM, row order, and all existing
CRLF/bare-LF endings are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-default-60043-collapse-20261011/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`collapse-ui-review-default-60043-20261011.md`](collapse-ui-review-default-60043-20261011.md).

## `default` IDs 18933 and 42850 (D-18203)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 18933 | `자동. ($STR0)` | `자동 ($STR0)` | Apply the user's label-punctuation exception; preserve the runtime marker and its spacing exactly. |
| 42850 | `네.` | `예` | The string is the affirmative option in a system Yes/No selector. The user prefers the more polite standard form `예`. |

Pre-edit CSV SHA-256:
`58d4b88f79266b94f30af1bcb86d1b38d7d5407d859c3effbae49f3cfd51995c`.
Post-edit CSV SHA-256:
`e6baa895a059ae0de03aad514db5354049b877cc6d49ef34178cc8de560af2e7`.
Only these two `Texto` cells changed. The UTF-8 BOM, row order, line endings,
all other fields, and the `$STR0` marker are preserved. Byte-identical
pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-default-18933-42850-20261011/locatexts_zh_cn.koalocatext_default.csv`.
Details:
[`punctuation-review-default-18933-42850-20261011.md`](punctuation-review-default-18933-42850-20261011.md).

## `base` ID 4674 / variant 11 (D-18202)

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `반지` | `밴드` | The user confirms the item is not a ring. English `Band` and Japanese `バンド` support `밴드`; Chinese `戒指` is contradicted by the item identification. This correction supersedes D-003 and is specific to ID 4674, not a blanket `Band` terminology rule. |

Pre-edit CSV SHA-256:
`dfb88cd35f545c8ebb51d3c78133c29cb29871e79f0fb065d55ce43abe0bd297`.
Post-edit CSV SHA-256:
`3089555293d97b0bb4ecebe6b3604287f754a61ec4f2dc8f3d8262b6a7cf462c`.
Only this `Texto` cell changed. UTF-8 BOM, 4,844 data rows, key order, and
all 4,845 CRLF record endings are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-base-band-4674-20261011/locatexts_zh_cn.koalocatext_base.csv`.
Details: [`base-band-4674-review-20261011.md`](base-band-4674-review-20261011.md).

## English `of ...` Affix Formatting (D-18201)

The English `affix` source is the selector: all 175 IDs whose English
`Texto` starts with `of ` receive literal asterisk delimiters in Korean,
regardless of whether the previous Korean ended in `의`. Across these IDs,
1,045 active target keys were updated. A final possessive `의` was removed
inside the delimiters when present; internal relations were retained. The
four IDs without a final `의` (125, 147, 192, and 471) were wrapped without
changing their inner wording.

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 3 | `화염 방호의` | `*화염 방호*` |
| 50 | `폭풍의 분노의` | `*폭풍의 분노*` |
| 128 | `얼음 방패의` | `*얼음 방패*` |
| 287 | `폭풍의 이빨의` | `*폭풍의 이빨*` |
| 411 | `폭풍의 울부짖음의` | `*폭풍의 울부짖음*` |

The original structure and every non-target byte are preserved. This is a
format/attachment correction, not a new semantic scan; previous semantic
dispositions remain in force. D-004 at ID 128 is resolved for its six
postposed-fragment keys and reclassified from uncertain to accepted.

Pre-edit CSV SHA-256:
`937a8da098291eb9e6f277a49e1cf0a3ef81cb59977df59d03c8dcdc742ddea3`.
Post-edit CSV SHA-256:
`c31f35a98a4b2875cc6d44c46c4404c2249f4ec6f758dae3543a07c917def676`.
Exactly 1,045 `Texto` cells changed. UTF-8 BOM, all 3,451 data rows, key
order, and all 3,452 CRLF record endings are preserved. Byte-identical
pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-of-affix-format-20261011/locatexts_zh_cn.koalocatext_affix.csv`.
Details:
[`of-affix-format-review-20261011.md`](of-affix-format-review-20261011.md).

## `base` IDs 1418, 1524, 1685, 1687, 1905, 1908, 1998, 2192, 2518, 2588, 2701, 2961, 3135, 3140, 4172, 4252, and 4839

Decision D-18198 authorizes these 17 targeted `Texto` changes:

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 1418 | `도칼파르(Dokkalfar)의 브로치` | `도크알브(Dokkalfar)의 브로치` |
| 1524 | `병영` | `공동 숙소` |
| 1685 | `전쟁의 드라이든(Thrydon) 정강이받이` | `드라이든(Thrydon)의 전쟁 정강이받이` |
| 1687 | `전쟁의 시어던(Thyrdon) 투구` | `시어던(Thyrdon)의 전쟁 투구` |
| 1905 | `기술서(현자술)` | `기술서(마법물품 제작)` |
| 1908 | `페이랜드` | `패란즈` |
| 1998 | `미타루(Mitharu) III` | `미사루(Mitharu) III` |
| 2192 | `혼돈의 영역에서만 발견되는 원소로 벼려낸 날렵한 단검이다. 에샤라(Esharra)의 무시무시한 혼돈의 야수에게 피해를 줄 수 있는 몇 안 되는 무기다.` | `혼돈의 영역에서만 발견되는 원소로 벼려낸 날렵한 단검 두 자루는 에샤라(Esharra)의 무시무시한 혼돈의 야수에게 피해를 줄 수 있는 몇 안 되는 무기 중 두 자루다.` |
| 2518 | `미타루(Mitharu)의 성소` | `미사루(Mitharu)의 성소` |
| 2588 | `오드윅(Odwig)의 미타루 성소` | `오드윅(Odwig)의 미사루 성소` |
| 2701 | `미타루(Mitharu)를 위한 연도문` | `미사루(Mitharu)를 위한 연도문` |
| 2961 | `시폼(Seafoam) 여관` | `시폼(Seafoam) 주점` |
| 3135 | `DLC2 개발용 폼 단검` | `개발용 화려한 폼 단검` |
| 3140 | `혼돈의 영역에서만 발견되는 원소로 벼려낸 빛나는 차크람이다. 에샤라(Esharra)의 무시무시한 혼돈의 야수에게 피해를 줄 수 있는 몇 안 되는 무기다.` | `혼돈의 영역에서만 발견되는 원소로 벼려낸 빛나는 차크람 두 자루는 에샤라(Esharra)의 무시무시한 혼돈의 야수에게 피해를 줄 수 있는 몇 안 되는 무기 중 두 자루다.` |
| 4172 | `버려진 건물` | `버려진 건물의 별관` |
| 4252 | `우라노스(Uranos)의 망치` | `우라노스(Ouranos)의 전투망치` |
| 4839 | `알메인 커틀러스` | `알마인 커틀러스` |

Pre-edit CSV SHA-256:
`71885c90357e952f9a35b03dd958f33bcb447f4094cbb571c4eeaa31d2917e3e`.
Post-edit CSV SHA-256:
`dfb88cd35f545c8ebb51d3c78133c29cb29871e79f0fb065d55ce43abe0bd297`.
Only these 17 `Texto` cells changed. UTF-8 BOM, 4,844 data rows, key order,
and all 4,845 CRLF record endings are preserved. Byte-identical pre-edit
backup:
`/private/tmp/ko-translate-backups/20261011/before-base-review-1300-4843/locatexts_zh_cn.koalocatext_base.csv`.
Disposition details and the 296 unchanged uncertain rows:
[`combined-name-disposition-base-01300-04843.md`](combined-name-disposition-base-01300-04843.md).

## `affix` IDs 258, 333, 361, 447, and 563

D-18195 authorizes these ten targeted `Texto` changes:

| ID / variants | Previous Korean | Applied Korean | Rationale |
| --- | --- | --- | --- |
| 258 / 11 | `미사란 영혼직조` | `미타란 영혼직조` | Apply the accepted `Mitharan = 미타란` modifier. |
| 333 / 11, 12, 14, 21, 22, 24 | `충격적인` | `전격` | Preserve the electrical item/effect sense of `Shocking`; align with base `Shocking Sentinel` (`전격 감시자`). |
| 361 / 11 | `미사란 백금` | `미타란 백금` | Apply the accepted `Mitharan = 미타란` modifier. |
| 447 / 11 | `미사란 드레드스케일` | `미타란 드레드스케일` | Apply the accepted `Mitharan = 미타란` modifier. |
| 563 / 11 | `미사란 프리즘미어` | `미타란 프리즘미어` | Apply the accepted `Mitharan = 미타란` modifier. |

Pre-edit CSV SHA-256:
`7697d7d09933ca7f7f8f6e41fcd82bb5f29e4b092368b856489a8c62f1dc21b9`.
Post-edit CSV SHA-256:
`937a8da098291eb9e6f277a49e1cf0a3ef81cb59977df59d03c8dcdc742ddea3`.
Only these ten `Texto` cells changed. UTF-8 BOM, 3,451 data rows, all keys,
key order, and all 3,452 CRLF record endings are preserved. Byte-identical
pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-affix-review-0130-0585/locatexts_zh_cn.koalocatext_affix.csv`.
Disposition and linked fallback counts:
[`combined-name-disposition-affix-00130-00585.md`](combined-name-disposition-affix-00130-00585.md).

## `base` IDs 1277 and 1298

Decisions D-18180 and D-18181 authorize these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 1277 | `알메인(Almain) 대투구` | `알마인(Almain) 대투구` | Apply the official Korean `Almain = 알마인` form established by D-093. |
| 1298 | `전쟁의 시어던(Thyrdon) 각반` | `시어던(Thyrdon)의 전쟁 각반` | Restore the English/Japanese/Chinese-supported possessor and item-modifier relations. |

Pre-edit CSV SHA-256:
`124bae756b438f4819fbfd71c3f722df07487206514723ab24d0aa4a107a4ca8`.
Post-edit CSV SHA-256:
`71885c90357e952f9a35b03dd958f33bcb447f4094cbb571c4eeaa31d2917e3e`.
Only these two `Texto` cells changed. UTF-8 BOM, 4,844 data rows, keys,
order, and all 4,845 CRLF record endings are preserved. Byte-identical
pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-base-affix-review-1200-1299/locatexts_zh_cn.koalocatext_base.csv`.
See
[`combined-name-disposition-01200-01299-round13.md`](combined-name-disposition-01200-01299-round13.md).

## `base` IDs 1122 and 1187

Decisions D-18164 and D-18165 authorize these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 1122 | `료살파르(Ljosalfar) 목걸이` | `료스알브(Ljosalfar) 목걸이` | Apply the official-manual term established by D-050. |
| 1187 | `하드윈(Hadwyn)의 미타루(Mitharu) 성소` | `하드윈(Hadwyn)의 미사루(Mitharu) 성소` | Apply the official-manual deity form established by D-152. |

Pre-edit CSV SHA-256:
`b02cdeec1640b0fbb89ccd8240961f6b41aad75f9c1c029c057ef5fb5f4a9e3f`.
Post-edit CSV SHA-256:
`124bae756b438f4819fbfd71c3f722df07487206514723ab24d0aa4a107a4ca8`.
Only these two `Texto` cells changed. UTF-8 BOM, 4,844 data rows, keys,
order, and 4,845 CRLF record endings are preserved. Byte-identical pre-edit
backup:
`/private/tmp/ko-translate-backups/20261011/before-base-affix-review-1100-1199/locatexts_zh_cn.koalocatext_base.csv`.
See
[`combined-name-disposition-01100-01199-round12.md`](combined-name-disposition-01100-01199-round12.md).

## `default` ID 65109

Decision D-18161 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `돈을 내겠어. ($VMC_NQD.cost_mine$골드)` | `돈을 내겠어. ($VMC_NQD.cost_mine$ 골드)` | Add the source-supported separator before the gold unit, matching the accepted runtime-price spacing at ID 64685 while preserving the variable. |

Pre-edit CSV SHA-256:
`7e4578a43ddb86b9e9a3e5a128ae4e56732b3be53c2f1c82afab50a28066f5cf`.
Post-edit CSV SHA-256:
`58d4b88f79266b94f30af1bcb86d1b38d7d5407d859c3effbae49f3cfd51995c`.
Only this `Texto` cell changed. UTF-8 BOM, 65,135 data rows, key order,
and record separators are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-65101/locatexts_zh_cn.koalocatext_default.csv`.
See
[`disposition-batch-default-65101-65134-20261011.md`](disposition-batch-default-65101-65134-20261011.md).

## `default` IDs 65051, 65068, 65089, and 65100

Decision D-18158 authorizes these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 65051 | `뭐야? 너 같은 떠돌이가 나랑 무슨 수다를 떨겠다고? 난 장사꾼이 아니야, 멍청아.` | `뭐야? 너 같은 떠돌이가 나랑 무슨 흥정을 하겠다고? 난 장사꾼이 아니야, 멍청아.` | Japanese explicitly supports negotiating; the line's merchant context rules out casual-chatter wording. |
| 65068 | `신들께서 프리모스를 선택해 우리 콜로사이를 이끌고 신들의 뜻을 행하게 하신다.` | `신들께서 프리모스를 선택해 우리 콜로세를 이끌고 신들의 뜻을 행하게 하신다.` | Reuse the accepted `Kollossae = 콜로세` form. |
| 65089 | `완벽한 미타루 도살자의 받침대` | `완벽한 미타란 도살자의 받침대` | Reuse the accepted `Mitharan = 미타란` modifier and distinguish it from `Mitharu = 미사루`. |
| 65100 | `이딜라 철학 학교의 수장 오네시모스가 학자 몇 명과 토론해 달라고 부탁했다. 첫 상대는 타이스라는 콜로사이다. 그를 찾아 도전을 받아들여야겠다.` | `이딜라 철학 학교의 수장 오네시모스가 학자 몇 명과 토론해 달라고 부탁했다. 첫 상대는 타이스라는 콜로세인이다. 그를 찾아 도전을 받아들여야겠다.` | Use the accepted `콜로세인` form for an individual Kollossae; retain unresolved personal-name forms. |

Pre-edit CSV SHA-256:
`2e952f22ba847a023aeeaf70c05c2ff3181549296109f9a3a8ecb63da0e1e46c`.
Post-edit CSV SHA-256:
`7e4578a43ddb86b9e9a3e5a128ae4e56732b3be53c2f1c82afab50a28066f5cf`.
Only these four `Texto` cells changed. UTF-8 BOM, 65,135 data rows, key
order, and record separators are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-65051/locatexts_zh_cn.koalocatext_default.csv`.
See
[`disposition-batch-default-65051-65100-20261011.md`](disposition-batch-default-65051-65100-20261011.md).

## `default` ID 65015

Decision D-18155 authorizes this targeted structural correction to the
`Texto` cell:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| Internal separator after `{*1[지속 효과]}`: CRLF | LF | Match the English, Japanese source, Japanese draft, and Chinese separator without changing marker identity/order or the sentence. |

Pre-edit CSV SHA-256:
`0df634ae50365ff1f01d9b952e339ab4f62662482b65d8e3c21bd789902caf5b`.
Post-edit CSV SHA-256:
`2e952f22ba847a023aeeaf70c05c2ff3181549296109f9a3a8ecb63da0e1e46c`.
Only this embedded separator changed. UTF-8 BOM, 65,135 data rows, key
order, and outer record separators are preserved. Byte-identical pre-edit
backup:
`/private/tmp/ko-translate-backups/20261011/before-65001/locatexts_zh_cn.koalocatext_default.csv`.
See
[`disposition-batch-default-65001-65050-20261011.md`](disposition-batch-default-65001-65050-20261011.md).

## `default` IDs 64969, 64970, 64984, and 64999

Decision D-18152 authorizes these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 64969 | `좋은 하루야, 여행자.` | `안녕, 여행자.` | Replace an unnatural literal “Good day” with a greeting supported by English, Japanese, and Chinese. |
| 64970 | `성배와 반지, 두건은 훔쳤지만 마이레를 달 야영지로 돌아오게 설득하지는 못했다. 전리품을 가지고 이리온에게 돌아가 다른 일이 있는지 물어봐야겠다.` | `성배와 반지, 두건은 훔쳤지만 마이레를 달 야영지로 돌아오게 설득하지는 못했다. 전리품을 가지고 이리온에게 돌아가 달 야영지에 다른 의뢰가 있는지 알아봐야겠다.` | Restore the explicit `in Moon Camp` location for the possible jobs while retaining the failed persuasion and loot-return steps. |
| 64984 | `이 눈처럼?` | `이 눈 좋아해?` | Render the elliptical line as the snow-preference question supported by Japanese and Chinese. |
| 64999 | `안녕히, 행운을 빌어.` | `잘 가, 행운을 빌어.` | Preserve the farewell and wish in a consistent informal register. |

Pre-edit CSV SHA-256:
`c8477257078f832fad1caa3507b48275b253314b1d1559909e91b7e95444c44c`.
Post-edit CSV SHA-256:
`0df634ae50365ff1f01d9b952e339ab4f62662482b65d8e3c21bd789902caf5b`.
Only these four `Texto` cells changed. UTF-8 BOM, 65,135 data rows, key
order, and 72,012 CRLF/72 bare-LF endings are preserved. Byte-identical
pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-64951/locatexts_zh_cn.koalocatext_default.csv`.
See
[`disposition-batch-default-64951-65000-20261011.md`](disposition-batch-default-64951-65000-20261011.md).

## `default` ID 64937

Decision D-18149 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `너무 커.` | `키가 너무 커.` | English and Japanese specify height; avoid the broader “too big.” |

Pre-edit CSV SHA-256:
`c30ad5460e23b8ed0e4783e07cffd0a703f0da264d335e605f53942739d631dc`.
Post-edit CSV SHA-256:
`c8477257078f832fad1caa3507b48275b253314b1d1559909e91b7e95444c44c`.
Only this `Texto` cell changed. UTF-8 BOM, 65,135 data rows, key order,
and 72,012 CRLF/72 bare-LF endings are preserved. Byte-identical pre-edit
backup:
`/private/tmp/ko-translate-backups/20261011/before-64901/locatexts_zh_cn.koalocatext_default.csv`.
See
[`disposition-batch-default-64901-64950-20261011.md`](disposition-batch-default-64901-64950-20261011.md).

## `default` IDs 64852, 64862, and 64887

Decision D-18146 authorizes these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 64852 | `내가 도울 일은 없어?` | `내가 도울 일 있어?` | Preserve the offer of help expressed by English, Japanese, and Chinese without the negative implication. |
| 64862 | `일찍부터 제멋대로 행동하기로 유명했던` | `조숙하기로 유명했던` | Restore the meaning of English `precociousness` as unusual maturity, not willful behavior from an early age. This is a narrow phrase edit; the entry's other literary questions remain open. |
| 64887 | `그래, 아니라가 죽었다고. 놈의 살이 찢어지는 소리를 들었다면 좋았을 텐데.` | `그래, 아니라(Anira)가 죽었다고. 그 여자의 살이 찢어지는 소리를 들었다면 좋았을 텐데.` | Make the source name distinguishable from the Korean negation and match English/Japanese feminine reference. |

Pre-edit CSV SHA-256:
`320843d3272835813e15512503ba4ac6a41a91ab6a06825161c461337eef6d7e`.
Post-edit CSV SHA-256:
`c30ad5460e23b8ed0e4783e07cffd0a703f0da264d335e605f53942739d631dc`.
Only these three `Texto` cells changed. UTF-8 BOM, 65,135 data rows, key
order, and 72,012 CRLF/72 bare-LF endings are preserved. Byte-identical
pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-64851/locatexts_zh_cn.koalocatext_default.csv`.
See
[`disposition-batch-default-64851-64900-20261011.md`](disposition-batch-default-64851-64900-20261011.md).

## `default` IDs 64834 and 64841

Decision D-18143 authorizes these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 64834 | `문이 열렸어.` | `문이 잠겨 있지 않아.` | Preserve the unlocked state; do not change it to an open door. |
| 64841 | `여전히 미타루의 인도를 구하는군. 우리 중 가장 강한 자도 때로는 도움이 필요하지.` | `여전히 미사루의 인도를 구하는군. 우리 중 가장 강한 자도 때로는 도움이 필요하지.` | Apply the official/manual-backed deity form `Mitharu = 미사루` from D-152. |

Pre-edit CSV SHA-256:
`613fedf52fc2faa70afe234c3487102823c69aabca465af26a22b5c1c6f24cbc`.
Post-edit CSV SHA-256:
`320843d3272835813e15512503ba4ac6a41a91ab6a06825161c461337eef6d7e`.
Only these two `Texto` cells changed. UTF-8 BOM, 65,135 data rows, key
order, and 72,012 CRLF/72 bare-LF endings are preserved. Byte-identical
pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-64801/locatexts_zh_cn.koalocatext_default.csv`.
See
[`disposition-batch-default-64801-64850-20261011.md`](disposition-batch-default-64801-64850-20261011.md).

## `default` IDs 64760, 64785, and 64796

Decision D-18140 authorizes these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 64760 | `대, 대현자님?! 영광입니다. 제가 도움이 될 일이 있을까요?` | `대, 대현자님?! 영광이자 특권입니다. 제가 도움이 될 일이 있을까요?` | Correct the English source typo `privileged` as `privilege` and restore the privilege component stated in Japanese and Chinese. |
| 64785 | `하지만 이건 새로운 시대야. 앞으로 어떤 계절이 올지 아무도 모르지. 너조차 처녀가 무슨 일을 할지 예측하지 못했잖아.` | `하지만 이건 새로운 시대야. 앞으로 어떤 계절이 올지 아무도 모르지. 너조차 시녀가 무슨 일을 할지 예측하지 못했잖아.` | Apply the established `Maid` title `시녀` from D-18128 and avoid the misleading virgin sense of `처녀`. |
| 64796 | `히에로판트가 우리를 지휘하는 건 일의 처음부터 끝까지 환영으로 보기 때문이라는 건 다들 알아. 무엇을 훔쳐야 할지 알려 주는 예언이지.` | `히에로판트가 이 일의 시작부터 끝까지를 환시로 내다볼 수 있어 우리에게 명령한다는 건 다들 알아. 무엇을 훔쳐야 할지 알려 주는 예언이지.` | Correct the mistaken `vision` as apparition/illusion; English and Japanese describe prophetic sight of the operation from start to end. |

Pre-edit CSV SHA-256:
`7086479d1e71f628eb2e660065546261e3da3de5329ae53691ff3cca4b986e04`.
Post-edit CSV SHA-256:
`613fedf52fc2faa70afe234c3487102823c69aabca465af26a22b5c1c6f24cbc`.
Only these three `Texto` cells changed. The UTF-8 BOM, 65,135 data rows,
key order, and 72,012 CRLF/72 bare-LF endings are preserved. Byte-identical
pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-64751/locatexts_zh_cn.koalocatext_default.csv`.
See
[`disposition-batch-default-64751-64800-20261011.md`](disposition-batch-default-64751-64800-20261011.md).

## `default` IDs 64715, 64722, and 64733

Decision D-18137 authorizes these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 64715 | `와! 그 경기는 굉장했어! 조심해, 그러다 내 일자리가 사라지겠어.` | `와! 그 경기는 굉장했어! 조심해, 그러다간 내가 한물가겠어.` | Preserve the playful “make me obsolete” meaning without narrowing it to literal job loss. |
| 64722 | `적어도 그래야 마땅하지. 하지만 최근에 그 권한을 맡은 아노카토스는 의무를 다하지 못했어.` | `적어도 그래야 마땅하지. 하지만 그 권한을 가진 가장 최근 인물인 아노카토스는 의무를 다하지 못했어.` | Clarify that Anokatos is the latest holder in the succession, not merely a recent appointee. |
| 64733 | `... 나로스의 이빨에서 기다리는 행운을 찾아 출발할 수 있었다.` | `... 나로스의 이빨에서 기다리는 보물을 찾아 출발할 수 있었다.` | Japanese and Chinese support the concrete treasure/wealth sense of `fortune` in this travel account. |

Pre-edit CSV SHA-256:
`480a376b85be9b4215e4a453acb9d25c48ee8c3ae9ecfbe56f33d2829caff586`.
Post-edit CSV SHA-256:
`7086479d1e71f628eb2e660065546261e3da3de5329ae53691ff3cca4b986e04`.
Only these three `Texto` cells changed. The UTF-8 BOM, 65,135 data rows,
key order, embedded lineation, and 72,012 CRLF/72 bare-LF endings match the
byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-64701/locatexts_zh_cn.koalocatext_default.csv`.
See
[`disposition-batch-default-64701-64750-20261011.md`](disposition-batch-default-64701-64750-20261011.md).

## `default` IDs 64685, 64690, and 64700

Decision D-18134 authorizes these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 64685 | `베팅하기 ($NQD_City_Rathir.ante_mid$골드)` | `베팅하기 ($NQD_City_Rathir.ante_mid$ 골드)` | Restore the source spacing before the gold unit while preserving the runtime variable. |
| 64690 | `멜 센시르는 7년간 고된 싸움을 치르는 동안 내 집이었어. 튼튼한 성벽은 고맙지만, 이제 새로운 세상도 보고 싶어.` | `멜 센시르는 7년간 고된 싸움을 치르는 동안 내 집이었어. 튼튼한 성벽은 고맙지만, 새로운 지평을 향해 나아가고 싶어.` | Retain the English `new horizon` image instead of broadening it to “a new world.” |
| 64700 | `완벽한 미타루 화염 손잡이` | `완벽한 미타란 화염 손잡이` | Correct the `Mitharan` modifier to distinguish it from the deity `Mitharu`, following D-18122. |

Pre-edit CSV SHA-256:
`de94a48b8e251d53037939da68d1b6ec4abe4597ae218b5965082c5f11076a0d`.
Post-edit CSV SHA-256:
`480a376b85be9b4215e4a453acb9d25c48ee8c3ae9ecfbe56f33d2829caff586`.
Only these three `Texto` cells changed. The UTF-8 BOM, 65,135 data rows,
key order, embedded lineation, and 72,012 CRLF/72 bare-LF endings match the
byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-64651/locatexts_zh_cn.koalocatext_default.csv`.
See
[`disposition-batch-default-64651-64700-20261011.md`](disposition-batch-default-64651-64700-20261011.md).

## `default` ID 64603

Decision D-18131 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `이야기는 결코 멈추지 않아. 그 큰 줄기를 이루던 발라드는 시들어 사라지겠지만, 줄기에는 또 새로운 이야기가 꽃피겠지.` | `전승(The Telling)은 결코 끝나지 않아. 그 거대한 얼개를 이루는 발라드들은 시들어 사라지겠지만, 덩굴에는 새 발라드가 피어나겠지.` | Restore the accepted lore-specific name and retain the source's constituent-ballad and vine imagery. |

Pre-edit CSV SHA-256:
`518e1b5f0dadf224874f42509d1b77822341d703b4384dd5ef2ee74f2afd6c4f`.
Post-edit CSV SHA-256:
`de94a48b8e251d53037939da68d1b6ec4abe4597ae218b5965082c5f11076a0d`.
Only the `Texto` cell at ID 64603 changed. The UTF-8 BOM, 65,135 data
rows, key order, embedded lineation, and 72,012 CRLF/72 bare-LF endings
match the byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-64601/locatexts_zh_cn.koalocatext_default.csv`.
See
[`disposition-batch-default-64601-64650-20261011.md`](disposition-batch-default-64601-64650-20261011.md).

## `default` IDs 64575, 64577, and 64579

Decision D-18128 authorizes these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 64575 | `웬센과 나는 수많은 발라드에서 함께 싸웠다. 너는 웬센이 아니다. 처녀의 마법은 풀었을지 몰라도, 이야기까지 깨뜨렸어.` | `웬센과 나는 수많은 발라드에서 함께 싸웠다. 너는 웬센이 아니다. 시녀의 마법은 풀었을지 몰라도, 전승(The Telling)까지 깨뜨렸어.` | Avoid the misleading virgin/maiden sense of `처녀`; use the literal `시녀` title and the previously accepted `전승(The Telling)` lore form. |
| 64577 | `우리는 이 지역에서 도적과 저주받을 투아타를 몰아낸다.` | `우리는 도적과 저주받은 투아타가 이 지역에 들어오지 못하게 막는다.` | Restore the ongoing protective sense of `keep this area clear of` and correct the participial `cursed` without changing the faction name. |
| 64579 | `윈드스톤을 제대로 사용했지만 에라시는 나타나지 않았다. 대신 마법의 힘을 조금 불러낸 것 같다. 앞으로 에이튼의 원형 제단을 방문하면 이 효과를 다시 경험할 수 있겠지.` | `윈드스톤을 제대로 사용했지만 에라시는 나타나지 않았다. 대신 마법의 힘을 조금 불러낸 것 같다. 앞으로 에이튼 서클(Ayten Circle)에 가면 이 효과를 다시 경험할 수 있겠지.` | Retain the source-named location and remove the unsupported altar interpretation. |

Pre-edit CSV SHA-256:
`465e0b528634901232fb01589a550b472a1f2a8908970ebeaf5b819292d3491d`.
Post-edit CSV SHA-256:
`518e1b5f0dadf224874f42509d1b77822341d703b4384dd5ef2ee74f2afd6c4f`.
Only these three `Texto` cells changed. The UTF-8 BOM, 65,135 data rows,
key order, embedded lineation, and 72,012 CRLF/72 bare-LF endings match the
byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-64551/locatexts_zh_cn.koalocatext_default.csv`.
See
[`disposition-batch-default-64551-64600-20261011.md`](disposition-batch-default-64551-64600-20261011.md).

## `default` IDs 64505, 64514, 64515, and 64530

Decision D-18125 authorizes these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 64505 | `이야기는 네 손에 달렸다. 우리는 늘 그래 왔듯 뒤를 따를 뿐이야.` | `전승(The Telling)은 네 손에 달렸어. 우리는 늘 그래 왔듯 뒤를 따를 뿐이야.` | Reuse the accepted named-lore form `전승(The Telling)` from IDs 10017, 10040, 38977, and 43751. |
| 64514 | `너는 나로스의 이빨에서 콜로사이가 운명의 굴레에서 벗어나도록 도왔다.` | `너는 나로스의 이빨에서 콜로세인들이 운명의 굴레에서 벗어나도록 도왔다.` | Reuse the accepted `Kollossae` forms `콜로세` and `콜로세인` from D-9868, D-9942, and D-16473. |
| 64515 | `소로우의 집` | `비탄의 집` | Reuse the accepted named-House rendering `비탄의 집`. |
| 64530 | `이빨 자국이 가득한 망가진 작은 나무 팻말. '토그의 집(Togh Homeste‒'라고 적혀 있다.` | `이빨 자국이 가득한 망가진 작은 나무 팻말. '토그 홈스테‒'라고 적혀 있다.` | Retain the visibly truncated sign text without completing it; remove the unsupported gloss and unmatched parenthesis. |

Pre-edit CSV SHA-256:
`af949dd351ee7e33b46d1648f48b601e4e988ad77fc1e852b4b601fe7b04535f`.
Post-edit CSV SHA-256:
`465e0b528634901232fb01589a550b472a1f2a8908970ebeaf5b819292d3491d`.
Only these four `Texto` cells changed. The UTF-8 BOM, 65,135 data rows,
key order, embedded lineation, and 72,012 CRLF/72 bare-LF endings match the
byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-64501/locatexts_zh_cn.koalocatext_default.csv`.
See
[`disposition-batch-default-64501-64550-20261011.md`](disposition-batch-default-64501-64550-20261011.md).

## `default` IDs 64470 and 64483

Decision D-18122 authorizes these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 64470 | `필멸자여, 무엇을 찾고 있니? 내가 찾는 걸 도와줄게.` | `필멸자여, 무엇을 찾고 있니? 네가 찾는 걸 도와줄게.` | Restore the addressee as the person searching, consistent with English, Japanese, and Chinese. |
| 64483 | `곡선형 미타루 프리즈미어 칼날` | `곡선형 미타란 프리즈미어 칼날` | Correct `Mitharu` to the distinct `Mitharan` material/adjective form used elsewhere in the corpus. |

Pre-edit CSV SHA-256:
`91991b444d52ac7e65a3bc606afc39fde32ed42b5b3371eec79026b9c6310952`.
Post-edit CSV SHA-256: pending byte-level verification.
Only the `Texto` cells at IDs 64470 and 64483 changed. Byte-identical
pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-64451/locatexts_zh_cn.koalocatext_default.csv`.
Disposition report:
[`disposition-batch-default-64451-64500-20261011.md`](disposition-batch-default-64451-64500-20261011.md).

## `default` IDs 64284 and 64300

Decision D-18113 authorizes these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 64284 | `서쪽으로 행군한 지 얼마 안 되어 버림받은 평원에서 죽었다고 하더군. 유명한 아조의 반지와 함께 묻혔다는 소문이 있어. 그거라면 일 년은 먹고살 수 있을 텐데.` | `서쪽으로 행군한 지 얼마 안 되어 버림받은 평원에서 죽었다고 하더군. 유명한 아조의 반지들과 함께 묻혔다는 소문이 있어. 그 반지들이라면 일 년은 먹고살 수 있을 텐데.` | Match English's plural rings and plural “those” reference. |
| 64300 | `용기들의 마법 해제하기` | `보관함의 마법 해제하기` | Resolve the misleading `용기` reading and identify the containers whose magic is dispelled. |

Pre-edit CSV SHA-256:
`11a39473ba5d892362a397bbbf34c78e43c7774dc2a5e791ac2074b705f5f1f1`.
Post-edit CSV SHA-256:
`91991b444d52ac7e65a3bc606afc39fde32ed42b5b3371eec79026b9c6310952`.
Only the `Texto` cells at IDs 64284 and 64300 changed. Byte-identical
pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-64251/locatexts_zh_cn.koalocatext_default.csv`.
Disposition report:
[`disposition-batch-default-64251-64300-20261011.md`](disposition-batch-default-64251-64300-20261011.md).

## `default` IDs 64155 and 64195

Decision D-18108 authorizes these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 64155 | `반갑네, 오랜 친구. 우리 마을에서 편히 쉬어 가게. 이 근방에서 몇 마일이나 떨어진 곳까지 마을은 여기뿐이니까.` | `반갑네, 오랜 친구. 우리 마을에서 편히 쉬어 가게. 몇 마일을 둘러봐도 마을은 여기뿐이니까.` | English says this is the only village for miles; remove the awkward implication that the village itself is miles away. |
| 64195 | `하지만 텔로그루스는 도시와 미스로스 전역을 타락시켰어. 그의 혼돈 마법은 닿는 모든 것을 무너뜨리지.` | `하지만 텔로그루스는 도시와 미스로스 전역을 타락시켰어. 그의 혼돈 마법은 닿는 모든 것을 혼란에 빠뜨려.` | Preserve the disorder/disruption sense of English `disrupts` without narrowing it to physical collapse. |

Pre-edit CSV SHA-256:
`fa77505806d0afdd2c60724a0277cd64d4c0042d6df4562184ce7128606d663f`.
Post-edit CSV SHA-256:
`11a39473ba5d892362a397bbbf34c78e43c7774dc2a5e791ac2074b705f5f1f1`.
Only the `Texto` cells at IDs 64155 and 64195 changed. Byte-identical
pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-64151/locatexts_zh_cn.koalocatext_default.csv`.
Disposition report:
[`disposition-batch-default-64151-64200-20261011.md`](disposition-batch-default-64151-64200-20261011.md).

## `default` IDs 64114 and 64118

Decision D-18105 authorizes these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 64114 | `그 사람은 프란츠라고 불려. 프란츠 엥겔하트(Franz Englehart). 그자와 같은 '직업'인 사람들은 누구든 믿지 않지만, 그중에서도 특히 못 믿겠어.` | `그 사람은 프란츠라고 불려. 프란츠 엥겔하트(Franz Englehart). 그 '직업'에 종사하는 다른 사람들만큼이나 그 사람도 믿을 수 없어.` | Preserve the source's equal comparison; remove the unsupported “especially” intensifier. |
| 64118 | `언덕 반대편에 있는 우리 우리로, 풀을 뜯는 땅에서 영양을 가능한 한 많이 몰고 와 줘.` | `방목지에서 영양을 최대한 많이 몰아 언덕 반대편의 우리 안으로 데려와 줘.` | Clarify the direction from grazing land into the corral and remove the awkward duplicated `우리`. |

Pre-edit CSV SHA-256:
`6e9a73072bf8fe9f5a85855c71450dcea4397c4ef6fe7df44a67873509c7ff4f`.
Post-edit CSV SHA-256:
`fa77505806d0afdd2c60724a0277cd64d4c0042d6df4562184ce7128606d663f`.
Only the `Texto` cells at IDs 64114 and 64118 changed. Byte-identical
pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-64101/locatexts_zh_cn.koalocatext_default.csv`.
Disposition report:
[`disposition-batch-default-64101-64150-20261011.md`](disposition-batch-default-64101-64150-20261011.md).

## `default` ID 63990

Decision D-18098 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `내가 혼돈 마법을 통달했다는 걸 보여 봐.` | `자네가 혼돈 마법을 어떻게 통달했는지 보여 봐.` | English/Japanese/Chinese ask the addressee to demonstrate how they mastered Chaos Magic; correct the Korean subject reversal. |

Pre-edit CSV SHA-256:
`fe9c6eb731f331c3f1b12fb4fac7f1054a5cfc48426f327242832c183f892595`.
Post-edit CSV SHA-256:
`6e9a73072bf8fe9f5a85855c71450dcea4397c4ef6fe7df44a67873509c7ff4f`.
Only the `Texto` cell at ID 63990 changed. Byte-level verification confirmed
that the UTF-8 BOM, 65,135 records, key order, embedded lineation, and outer
CRLF record separators are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-63951/locatexts_zh_cn.koalocatext_default.csv`.

The accompanying disposition report records 35 `not an issue` IDs and 14
uncertain findings; see
[`disposition-batch-default-63951-64000-20261011.md`](disposition-batch-default-63951-64000-20261011.md).
Corrected cumulative counts: 1,824 accepted, 16,403 `not an issue`, and
12,578 uncertain (30,805 dispositions). Resume at ID 64001; 1,134 IDs remain.

## `default` ID 63852

Decision D-18093 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `제대로 손질하면 이 기묘한 진홍색 뿌리가 거의 모든 물약에 추가 {*3힘}을 더해 준다.` | `제대로 손질하면 이 기묘한 진홍색 뿌리는 거의 모든 물약에 {*3힘}을 보탤 수 있다.` | Preserve the `{*3힘}` Power marker while removing the doubled additional/add wording; retain the English/Japanese/Chinese meaning that the root can lend Power to potions. |

Pre-edit CSV SHA-256:
`895fc78f57c832036eda6744f53fab18b60fa2a44aece2ac5d8d5a290200e7c0`.
Post-edit CSV SHA-256:
`fe9c6eb731f331c3f1b12fb4fac7f1054a5cfc48426f327242832c183f892595`.
Only the `Texto` cell at ID 63852 changed. Byte-level verification confirmed
that the UTF-8 BOM, 65,135 records, key order, embedded lineation, runtime
marker, and outer CRLF record separators are preserved. Byte-identical
pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-63851/locatexts_zh_cn.koalocatext_default.csv`.

The accompanying disposition report records 35 `not an issue` IDs and 14
uncertain findings; see
[`disposition-batch-default-63851-63900-20261011.md`](disposition-batch-default-63851-63900-20261011.md).
Corrected cumulative counts: 1,823 accepted, 16,332 `not an issue`, and
12,550 uncertain (30,705 dispositions). Resume at ID 63901; 1,234 IDs remain.

## `default` ID 63845

Decision D-18090 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `내 전임자 아르케스(Arkes)는 하이페리언을 억지로 띄우려 했다. 하지만 하이페리언은 그를 거부해 추종자들과 함께 죽였고, 스스로 봉인되었다.` | `내 전임자 아르케스(Arkes)는 하이페리언을 억지로 띄우려 했다. 하지만 하이페리언은 그를 거부하고, 그와 추종자들을 죽인 뒤 스스로를 봉인했다.` | English and Japanese make Hyperian the subject that rejects and kills Arkes and his followers, then seals itself away. Clarify the killed group and retain Hyperian's agency in the sealing. |

Pre-edit CSV SHA-256:
`e35b8ab1940b0612adbd8956fefe0d5a30a5df00d0464ee019d7d7e3a623ad47`.
Post-edit CSV SHA-256:
`895fc78f57c832036eda6744f53fab18b60fa2a44aece2ac5d8d5a290200e7c0`.
Only the `Texto` cell at ID 63845 changed. Byte-level verification confirmed
that the UTF-8 BOM, 65,135 records, key order, embedded lineation, and outer
CRLF record separators are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-63801/locatexts_zh_cn.koalocatext_default.csv`.

The accompanying disposition report records 36 `not an issue` IDs and 13
uncertain findings; see
[`disposition-batch-default-63801-63850-20261011.md`](disposition-batch-default-63801-63850-20261011.md).
Corrected cumulative counts: 1,822 accepted, 16,297 `not an issue`, and
12,536 uncertain (30,655 dispositions). Resume at ID 63851; 1,284 IDs remain.

## `default` IDs 63771 and 63794

Decision D-18087 authorizes these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 63771 | `저들은 가장 천한 부류야. 신앙을 잃은 콜로사이(Kollossae), 생각도 없이 폭력만 휘두르고 영원히 절망에 빠진 자들이지.` | `저들은 가장 천한 자들이야. 신앙 없는 콜로사이(Kollossae), 생각도 없이 폭력만 휘두르고 영원히 절망에 빠진 자들이지.` | English, Japanese, and Chinese say “without faith”; remove the unsupported implication that they previously had faith and lost it. |
| 63794 | `그대는 우리에게 정말 많은 것을 주었소. 신들이 줄곧 우리 민족의 삶에, 내 삶에 연민과 영향을 베풀어 왔다는 걸 이제야 알겠소.` | `그대는 우리에게 정말 많은 것을 주었소. 신들이 줄곧 우리 민족의 삶에, 내 삶에 연민을 베풀고 영향을 미쳐 왔다는 걸 이제야 알겠소.` | Preserve the separate compassion and influence relations, and correct the unnatural `영향을 베풀다` collocation. |

Pre-edit CSV SHA-256:
`ff85c0bde3c2e577f690e25742121272b3aaa871fc13d8c8b21a44b62a5641da`.
Post-edit CSV SHA-256:
`e35b8ab1940b0612adbd8956fefe0d5a30a5df00d0464ee019d7d7e3a623ad47`.
Only the `Texto` cells at IDs 63771 and 63794 changed. Byte-level
verification confirmed that the UTF-8 BOM, 65,135 records, key order,
embedded lineation, and outer CRLF record separators are preserved.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-63751/locatexts_zh_cn.koalocatext_default.csv`.

The accompanying disposition report records 37 `not an issue` IDs and 11
uncertain findings; see
[`disposition-batch-default-63751-63800-20261011.md`](disposition-batch-default-63751-63800-20261011.md).
Corrected cumulative counts: 1,821 accepted, 16,261 `not an issue`, and
12,523 uncertain (30,605 dispositions). Resume at ID 63801; 1,334 IDs remain.

## `default` ID 63103

Decision D-18051 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `그를 몇 번 만났어. 확실히 사람을 끄는 분위기가 있더군.` | `그를 몇 번 만났어. 확실히 존재감이 있더군.` | Render “radiates a certain presence” without adding an attractive quality. |

Pre-edit CSV SHA-256:
`7e913decad932afb88469dc92a77740dfb4535f06108bc95e99aec80063ed783`.
Post-edit CSV SHA-256:
`be4ceff6b323624013b588a41fd5904a7cf2628d3d1aa6e465236fc2164c8cab`.
Only the `Texto` cell at ID 63103 changed. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-63101/locatexts_zh_cn.koalocatext_default.csv`.

## `default` IDs 63038 and 63043

D-18045-D-18046 authorize these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 63038 | `아주 어릴 때부터 다른 이들에겐 보이지 않는 것들을 이해했어.` | `아주 어릴 때부터 다른 이들이 알지 못하는 것들을 이해했어.` | Remove the unsupported literal-visibility implication; English/Japanese/Chinese describe things others did not understand. |
| 63043 | `... 아르진이 우리가 온 걸 눈치챌 거야.` | `... 아르진이 우리가 온 걸 눈치챌 가능성이 커.` | Preserve the source's probabilistic “likely” rather than asserting certainty. |

Pre-edit CSV SHA-256:
`cb7e48cbd2e1d2a1772b9051201b895db27670a596e6df087d58b33c92bea8b9`.
Post-edit CSV SHA-256:
`7e913decad932afb88469dc92a77740dfb4535f06108bc95e99aec80063ed783`.
Only these two `Texto` cells changed. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-63001/locatexts_zh_cn.koalocatext_default.csv`.

## `default` ID 62912

Decision D-18040 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `그 벌레 같은 놈은 아니라 같은 이들을 시켜 부려 먹어.` | `그 벌레 같은 놈은 아니라(Anira) 같은 이들을 시켜 부려 먹어.` | Clarify that Anira is a proper name, not the Korean negation `아니라`; retain the current transliteration pending canonical-name review. |

Pre-edit CSV SHA-256:
`8816ee65510e160de2608425d217dfc07cdce0daa4b56bc77547200e903e622a`.
Post-edit CSV SHA-256:
`cb7e48cbd2e1d2a1772b9051201b895db27670a596e6df087d58b33c92bea8b9`.
Only the `Texto` cell at ID 62912 changed. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-62901/locatexts_zh_cn.koalocatext_default.csv`.

## `default` IDs 62851-62900

D-18034-D-18037 authorize these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 62862 | `한때 워스워른 용병으로 일했지. 승진에서 몇 번이나 밀려난 끝에 그만뒀어. 마지막 일거리에서 갤렛 지하에 묻힌 보물 지도를 찾았지.` | `한때 워스워른 용병으로 일했지. 승진에서 너무 여러 번 밀려났어. 마지막 일거리에서는 갤렛 지하에 묻힌 보물 지도를 찾았지.` | Remove the definite resignation absent from the English/Japanese text while retaining the repeated-denial emphasis. |
| 62866 | `물론 투아타를 몰아내는 거지.` | `물론 투아타를 궤멸시키는 거지.` | Restore the stronger “Destroying the Tuatha” meaning. |
| 62876 | `... 왕실 근위대에 산악지대로 퇴각하라고 명하셨어.` | `... 왕실 근위대에 산악지대로 들어가라고 명하셨어.` | Remove unsupported retreat and match the order to enter the mountains. |
| 62879 | `부인께서 제정신이 아니셔.` | `부인께서 몹시 동요하셨어.` | Render severe distress without an unsupported mental-illness implication. |

Pre-edit CSV SHA-256:
`8195382d5065ec32df5c4b42d1dee026a3e17fdfd11db9a500b3e4115ed19f3a`.
Post-edit CSV SHA-256:
`8816ee65510e160de2608425d217dfc07cdce0daa4b56bc77547200e903e622a`.
Only these four `Texto` cells changed. A byte-level comparison verified
that all non-target bytes, including the UTF-8 BOM and outer record
separators, are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-62851/locatexts_zh_cn.koalocatext_default.csv`.

## `default` ID 62520

Decision D-18006 authorizes this targeted correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `흙 위에 세운 신상을 숭배하고,` | `흙바닥에서 숭배하고,` | English says they worship on earthen ground; it does not introduce a statue. |

The four internal verse separators were also normalized from CRLF to LF to
match English, Japanese, and Chinese. The five-line poem and verse layout are
unchanged.

Pre-edit CSV SHA-256:
`8e7373bcd130c6bf662834d3f978be3e1c6d6f0ef93e01a630a1928eac8a4605`.
Post-edit CSV SHA-256:
`816f3ca27b568db9dbd2437449bd71cacd82368fbf5eb0b8e5dff58f23e36c0c`.
Only the `Texto` cell at ID 62520 changed. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-62501/locatexts_zh_cn.koalocatext_default.csv`.
The UTF-8 BOM, 65,135 records, key order, total newline count, and outer CSV
record separators are preserved.

## `default` IDs 62472, 62491, 62496, and 62500

Decision D-18003 authorizes these targeted `Texto` corrections:

| ID | Previous Korean / structure | Applied Korean / structure | Rationale |
| ---: | --- | --- | --- |
| 62472 | Two internal separators were CRLF. | Two internal separators are LF. | Match all reference locales while retaining the three-line ability layout and values. |
| 62491 | Eight poem separators were CRLF. | Eight poem separators are LF. | Match source lineation while preserving the poem and blank stanza break. |
| 62496 | `이제 내게 남은 건 여동생 아라(Aara)뿐이야.` | `이제 내게 남은 건 자매인 아라(Aara)뿐이야.` | English leaves relative age unspecified; Japanese and Chinese conflict. Reuse accepted age-neutral `자매` terminology. |
| 62500 | Nine internal section/paragraph separators were CRLF. | Nine internal separators are LF. | Match reference lineation while preserving all sections and paragraphs. |

Pre-edit CSV SHA-256:
`6c5a72c1eb52f824320eb4ab0a20025ce2350196c4f5d922a297176d665474d6`.
Post-edit CSV SHA-256:
`8e7373bcd130c6bf662834d3f978be3e1c6d6f0ef93e01a630a1928eac8a4605`.
Only these four `Texto` cells changed. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-62451/locatexts_zh_cn.koalocatext_default.csv`.
The UTF-8 BOM, 65,135 records, key order, and total newline count are
preserved. Nineteen embedded CRLF separators were normalized to LF; outer
CSV record separators remain unchanged.

## `default` ID 62450

Decision D-18000 authorizes this targeted `Texto` structure correction:

| Previous structure | Applied structure | Rationale |
| --- | --- | --- |
| Four internal recipe separators were CRLF. | Four internal recipe separators are LF. | Match English, Japanese, and Chinese while preserving the blank paragraph and all three reagent lines. |

Pre-edit CSV SHA-256:
`a41a7a89e28b3d42c9856ce05e6626aa6950475b401f30635c4eee7becdfaf39`.
Post-edit CSV SHA-256:
`6c5a72c1eb52f824320eb4ab0a20025ce2350196c4f5d922a297176d665474d6`.
Only the embedded separators in the `Texto` cell at ID 62450 changed.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-62401/locatexts_zh_cn.koalocatext_default.csv`.
The UTF-8 BOM, 65,135 records, key order, total newline count, and outer CSV
record separators are preserved.

## `default` IDs 62372, 62383, 62394, and 62397

Decision D-17997 authorizes these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 62372 | `신들께 기도드린 지 오래됐지만... 기도문이 다시 노래하는 게 느껴져.` | `신들께 기도드린 지 오래됐지만... 기도문이 다시 울려 퍼지는 게 느껴져.` | Render the litanies' return naturally while retaining the sense of them being heard again. |
| 62383 | `발러(Balor)? 신경 안 써.` | `발러(Balor)? 걱정할 것 없어.` | English/Chinese indicate lack of worry, not indifference. |
| 62394 | `이 일에 필요한 나이는 정확히 됐어.` | `이 일을 하기에 딱 맞는 나이야.` | Preserve the age-eligibility joke/assurance in natural Korean. |
| 62397 | Internal marker/text separator was CRLF. | Internal marker/text separator is LF. | Match all three reference locales; preserve one embedded break and marker order. |

Pre-edit CSV SHA-256:
`936e4e0283aded4087ef9eedbb5125f05e29f3d58aed47cdcc8d40aa98c4213`.
Post-edit CSV SHA-256:
`a41a7a89e28b3d42c9856ce05e6626aa6950475b401f30635c4eee7becdfaf39`.
Only these four `Texto` cells changed. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-62351/locatexts_zh_cn.koalocatext_default.csv`.
The UTF-8 BOM, 65,135 records, key order, and total newline count are
preserved. One embedded CRLF separator was normalized to LF; outer CSV
record separators remain unchanged.

## `default` IDs 62309, 62319, 62321, and 62345

Decision D-17994 authorizes these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 62309 | `이런 식으로 굴지 마.` | `이런 식으로 굴 사람은 아니잖아.` | Preserve the reproach that the addressee is better than this, rather than only ordering them to stop. |
| 62319 | `슬퍼. 혼자서는 의식을 치를 수 없어서 슬퍼.` | `그래, 애도하고 있어. 혼자서는 의식을 치를 수 없어서 애도하는 거야.` | Render `mourn` specifically as `애도하다`; leave the object implicit as in the source. |
| 62321 | `치유를 시작할 때가 왔어. 에스윈(Eswin)의 부하들은 이제 내 사람들이야. 그들을 이끌고 재탄생의 새 시대를 열겠어.` | `치유를 시작할 때가 왔어. 에스윈(Eswin)의 부하들은 이제 내 사람들이야. 그들을 활용해 재탄생의 새 시대를 열겠어.` | Restore the instrumental use of Eswin's men in shaping the new era. |
| 62345 | `그녀가 네가 훔친 운명의 일부를 떼어 내 너에게 되돌려 사용했어.` | `그녀는 네가 훔친 운명의 일부를 떼어 내 너를 공격하는 데 썼어.` | Restore `turned it against you` without adding a return action. |

Pre-edit CSV SHA-256:
`e1d67333e135a6e08dd74664aa16996bdf6fd3dff9909571ea127171a9dc6ef8`.
Post-edit CSV SHA-256:
`936e4e0283aded4087ef9eedbb5125f05e29f3d58aed47cdcc8d40aa98c4213`.
Only these four `Texto` cells changed. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-62301/locatexts_zh_cn.koalocatext_default.csv`.
The UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved.

## `default` ID 62210

Decision D-17989 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `다른 요새들은 여기저기서, 높은 곳이든 낮은 곳이든 일감을 받아.` | `다른 요새들은 여기저기서 일감을 받아.` | English `here and there, high and low` is an idiom for varied places, not physical elevations. Japanese and Chinese likewise say other keeps take work in different places. |

Pre-edit CSV SHA-256:
`b751370ef027a52c868a46aca1b317e9ae8efe7d343490c1762b4fd71ec69f90`.
Post-edit CSV SHA-256:
`e1d67333e135a6e08dd74664aa16996bdf6fd3dff9909571ea127171a9dc6ef8`.
Only the `Texto` cell at ID 62210 changed. The byte-identical pre-edit
backup is
`/private/tmp/ko-translate-backups/20261011/before-62201/locatexts_zh_cn.koalocatext_default.csv`.
The UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved.

## `default` IDs 62154 and 62179

Decisions D-17985 and D-17986 authorize these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 62154 | `슬픔의 집(House of Sorrows)` | `비탄의 집(House of Sorrows)` | Reuse the accepted named-faction form `비탄의 집` from D-13809 and later corpus applications. |
| 62179 | `동전의 악당 크릴가린(Crilgarin)` | `동전의 잭, 크릴가린(Crilgarin)` | Reuse the accepted rendering for the same English `Crilgarin, Knave of Coins` label at D-4435/D-4450. The broader card/rank lore remains open. |

Pre-edit CSV SHA-256:
`c1b8264b7946af0bc92c28be72d0ddaf9ca7d5cb05cd63c5ddcc8e2835101fb0`.
Post-edit CSV SHA-256:
`b751370ef027a52c868a46aca1b317e9ae8efe7d343490c1762b4fd71ec69f90`.
Only the `Texto` cells at IDs 62154 and 62179 changed. The byte-identical
pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-62151/locatexts_zh_cn.koalocatext_default.csv`.
The UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved.

## `default` ID 62147

Decision D-17982 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `동전 한 닢짜리 마을에 발이 묶인 퇴역 용병일 뿐이야. 그런 자가 방어선을 세우거나 무너뜨릴 리 없지.` | `별 볼 일 없는 마을에 발이 묶인 퇴역 용병일 뿐이야. 그런 자가 방어의 성패를 좌우할 리 없지.` | English `one-coin town` is dismissive, not a literal price; `make or break a defense` means determine its outcome, not physically build or demolish a defensive line. Japanese/Chinese support the insignificant/small-town and non-decisive readings. |

Pre-edit CSV SHA-256:
`83d03952531d16d9dfca710e6503a1ef68a59ae96142cd9a6b707be271096a5e`.
Post-edit CSV SHA-256:
`c1b8264b7946af0bc92c28be72d0ddaf9ca7d5cb05cd63c5ddcc8e2835101fb0`.
Only the `Texto` cell at ID 62147 changed. The byte-identical pre-edit
backup is
`/private/tmp/ko-translate-backups/20261011/before-62101/locatexts_zh_cn.koalocatext_default.csv`.
The UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved.

## `default` ID 62001

Decision D-17977 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `이건 이건(Egan) 수사님이신가요?` | `이건(Egan) 수사님이신가요?` | English asks whether the addressee is Brother Egan. Remove the duplicated `이건` while retaining the existing Korean name form and respectful question; Japanese and Chinese confirm the addressee. |

Pre-edit CSV SHA-256:
`e83119bfc13a079d055339826466e00c46bcdc58bf60d44b9a9bcf5c4b7e6afe`.
Post-edit CSV SHA-256:
`83d03952531d16d9dfca710e6503a1ef68a59ae96142cd9a6b707be271096a5e`.
Only the `Texto` cell at ID 62001 changed. The byte-identical pre-edit
backup is
`/private/tmp/ko-translate-backups/20261011/before-62001/locatexts_zh_cn.koalocatext_default.csv`.
The UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved.

## `default` ID 61971

Decision D-17974 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `우리 야영지에서 나가.` | `우리 야영지에 들어오지 마.` | English `Stay out of our camp` warns the listener not to enter; the previous Korean instead orders someone already there to leave. Japanese and Chinese also say not to approach. |

Pre-edit CSV SHA-256:
`e4375b201d7dcfa2d47770da447a93cf8afd0fe670c23e5c23d013fbe02970e4`.
Post-edit CSV SHA-256:
`e83119bfc13a079d055339826466e00c46bcdc58bf60d44b9a9bcf5c4b7e6afe`.
Only the `Texto` cell at ID 61971 changed. The byte-identical pre-edit
backup is
`/private/tmp/ko-translate-backups/20261011/before-61951/locatexts_zh_cn.koalocatext_default.csv`.
The UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved.

## `default` ID 61922

Decision D-17971 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `투아사가 이 땅을 공격했을 때, 무엇이 굳건히 버텼을까? 리리아(Lyria)를 가장 사랑한 자들이지.` | `투아사가 이 땅을 공격했을 때, 무엇이 굳건히 버텼을까? 리리아(Lyria)를 가장 사랑한 존재였지.` | English asks `which stood strong? That which loved Lyria most`; Japanese and Chinese also answer with a singular “one.” Replace the unsupported plural answer with a neutral singular without identifying the riddle's answer. |

Pre-edit CSV SHA-256:
`1799a2f5a68b44d63ac89974709186c098998c292c49a1f13ff83118c930931b`.
Post-edit CSV SHA-256:
`e4375b201d7dcfa2d47770da447a93cf8afd0fe670c23e5c23d013fbe02970e4`.
Only the `Texto` cell at ID 61922 changed. The byte-identical pre-edit
backup is
`/private/tmp/ko-translate-backups/20261011/before-61901/locatexts_zh_cn.koalocatext_default.csv`.
The UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved.

## `default` ID 61723

Decision D-17962 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `네 운명은 네가 정하는 거야.` | `네 운명은 네 거야.` | English says `Your destiny is yours`; Japanese and Chinese likewise say the destiny belongs to the addressee. Remove the stronger, unsupported claim that the addressee determines their destiny. |

Pre-edit CSV SHA-256:
`33d7945a1cef6ac2b4b6d4c6d8bc3dfa137c5417b107ae61ce89195ea1b4fa72`.
Post-edit CSV SHA-256:
`1799a2f5a68b44d63ac89974709186c098998c292c49a1f13ff83118c930931b`.
Only the `Texto` cell at ID 61723 changed. The byte-identical pre-edit
backup is
`/private/tmp/ko-translate-backups/20261011/before-61701/locatexts_zh_cn.koalocatext_default.csv`.
The UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved.

## `default` ID 61681

Decision D-17959 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `쥐새끼 같으니. 대장간에서 망치질하는 꼴 좀 봐. 빌어먹을 자기 그림자도 무서워하겠어!` | `겁쟁이 같으니. 대장간에서 망치나 톡톡 두드리는 꼴 좀 봐. 빌어먹을 자기 그림자도 무서워하겠어!` | English `What a mouse` means a coward here; Japanese explicitly says coward and Chinese says timid as a mouse. Replace the misleading “rat/bastard” reading and retain the timid tapping at the forge. |

Pre-edit CSV SHA-256:
`71fa33d7249abd4f5369dd1a63031cfe808908db0ea6445efc499649685627f7`.
Post-edit CSV SHA-256:
`33d7945a1cef6ac2b4b6d4c6d8bc3dfa137c5417b107ae61ce89195ea1b4fa72`.
Only the `Texto` cell at ID 61681 changed. The byte-identical pre-edit
backup is
`/private/tmp/ko-translate-backups/20261011/before-61651/locatexts_zh_cn.koalocatext_default.csv`.
The UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved.

## `default` IDs 61543 and 61548

Decision D-17952 authorizes these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 61543 | `나… 아니야. 여긴 어디지? 데이트리안(Deytrean) 맥주는 다시는 안 마시겠다고 맹세했는데!` | `나… 아니야. 여긴 어디지? 맹세코, 데이트리안 에일(Deytrean ale)은 이번이 마지막이야!` | Restore the source's present vow that this is the last time the speaker drinks Deytrean ale; reuse the corpus spelling at ID 230. |
| 61548 | `보가트(boggart)와 싸우기도 전에 기진맥진하면 아무 소용 없겠지?` | `보가트(boggart)들을 물리칠 힘도 없으면 아무 소용 없겠지?` | Restore the source's concern that the speaker may be too weak to fight off the boggarts, rather than tired before the fight. |

Pre-edit CSV SHA-256:
`98cfab59327b03c6f828f877a61f4a370099374e2fb2ebe0d92e049c525e50ff`.
Post-edit CSV SHA-256:
`71fa33d7249abd4f5369dd1a63031cfe808908db0ea6445efc499649685627f7`.
Only the `Texto` cells at IDs 61543 and 61548 changed. The byte-identical
pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-61501/locatexts_zh_cn.koalocatext_default.csv`.
The UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved.

## `default` ID 61379

Decision D-17945 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `...그중 하나라도 네 영지를 위태롭게 지켜 내면 좋겠구나...` | `...그중 하나라도 네가 간신히 쥐고 있는 영지의 지배력을 유지하면 좋겠군...` | English and Chinese say one of Ansilla's bastard children might retain the tenuous control he has over his land. The previous Korean could instead mean physically defending the territory. |

Pre-edit CSV SHA-256:
`e5e66ddbda54055c0197021698b1c0f72f65fe2575b873d5acce0f0e14c3b121`.
Post-edit CSV SHA-256:
`98cfab59327b03c6f828f877a61f4a370099374e2fb2ebe0d92e049c525e50ff`.
Only the `Texto` cell at ID 61379 changed. The byte-identical pre-edit
backup is
`/private/tmp/ko-translate-backups/20261011/before-61351/locatexts_zh_cn.koalocatext_default.csv`.
The UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved.

## `default` ID 61021

Decision D-17930 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `산은 위험한 곳이야. 마차 행렬 습격을 봐! 돈이 된다면 누구나 보호를 받아야 해.` | `산은 위험한 곳이야. 마차 행렬 습격을 봐! 호위 비용을 감당할 수 있다면 누구나 호위를 받아야 해.` | English `if they can afford it` is about ability to pay, not profitability. Japanese specifies an escort and Chinese confirms affordability. |

Pre-edit CSV SHA-256:
`6e7a50bdb14c95e64de1d53289b321ded8c74b956f585686525cee59bc78f4b3`.
Post-edit CSV SHA-256:
`e5e66ddbda54055c0197021698b1c0f72f65fe2575b873d5acce0f0e14c3b121`.
Only the `Texto` cell at ID 61021 changed. The byte-identical pre-edit
backup is
`/private/tmp/ko-translate-backups/20261011/before-61001/locatexts_zh_cn.koalocatext_default.csv`.
The UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved.

## `default` ID 61000

Decision D-17927 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `젠장, 그 여자를 믿어선 안 된다고 했잖아!` | `젠장, 우린 그 여자를 믿을 수 없다는 걸 알고 있었는데!` | The source says the speaker knew the group could not trust her; the previous Korean adds an unsupported prior warning. Japanese and Chinese support the corrected meaning. |

Pre-edit CSV SHA-256:
`2257e21337be598b757ccd263fb16b44de2e5eca05273a35ffc866127caa6777`.
Post-edit CSV SHA-256:
`6e7a50bdb14c95e64de1d53289b321ded8c74b956f585686525cee59bc78f4b3`.
Only the `Texto` cell at ID 61000 changed. The byte-identical pre-edit
backup is
`/private/tmp/ko-translate-backups/20261011/before-60951/locatexts_zh_cn.koalocatext_default.csv`.
The UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved.

## `default` IDs 60915, 60917, and 60945

Decision D-17924 authorizes these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 60915 | `우리는 반드시 필요한 존재라고 들었어. 우리 형제자매인 여름 페이(Summer Fae)와 그들이 세운 궁정에 맞서기 위해 태어났다고.` | `우리는 꼭 필요한 존재라고 들었어. 우리 형제자매인 여름 페이(Summer Fae)와 그들이 세운 궁정에 대한 대응으로 말이야.` | English describes the group as a necessary answer to the Summer Fae and their Court; it does not say they were born to oppose them. |
| 60917 | `...필멸자여, 우리의 도움이 필요하오. 그대에게 손을 내미오.` | `...필멸자여, 우리에게 도움이 필요하오. 그대에게 손을 내미오.` | Restore the source's direction: the speaker's group needs help from the mortal. |
| 60945 | `...그 지역은 적들이 장악하고 있지.` | `...그 지역은 적들이 선호하는 곳이오.` | Restore “favored by our enemies” without adding that they control or occupy the area. |

Pre-edit CSV SHA-256:
`60ad652a26ed00b53be458e6c8e510dc6d2fac86462982a90923423c1dae690b`.
Post-edit CSV SHA-256:
`2257e21337be598b757ccd263fb16b44de2e5eca05273a35ffc866127caa6777`.
Only the `Texto` cells at those three IDs changed. The byte-identical
pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-60901/locatexts_zh_cn.koalocatext_default.csv`.
The UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved.

## `default` ID 60453

Decision D-17905 authorizes this targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 60453 | `별난 곳을 꽤 다녀 봤지만, 여긴 그중에서도 최고야.` | `별난 곳을 꽤 다녀 봤지만, 여기가 제일 별나.` | In context, English `this place tops them all` means this is the strangest place. Japanese explicitly confirms that reading, and Chinese agrees. |

Pre-edit CSV SHA-256:
`909c317ec787268d43835ede07f6f539fd6d35465fa4ed62a248aea37f2dd55c`.
Post-edit CSV SHA-256:
`60ad652a26ed00b53be458e6c8e510dc6d2fac86462982a90923423c1dae690b`.
Only the ID 60453 `Texto` cell changed. The byte-identical pre-edit backup
is `/private/tmp/ko-translate-backups/20261011/before-60451/locatexts_zh_cn.koalocatext_default.csv`.
The UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved.

## `default` IDs 60271 and 60274

Decisions D-17895 and D-17896 authorize these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 60271 | `미사루 신앙의 혼혈인들` | `미사루계 혼혈인들` | English, Japanese, and Chinese identify mixed Mitharan ancestry/people, not mixed religious believers. |
| 60274 | `다시 만날 일은 없을 거라고.` | `다시는 마주치고 싶지 않다고.` | Restore the speaker's aversion to another encounter; remove the unsupported prediction that they will never meet again. |

Pre-edit CSV SHA-256:
`ff22979f04f46fe56ac89b01371fb15f61e580a0b4e34a1d7e4ee1707cbe3a89`.
Post-edit CSV SHA-256:
`909c317ec787268d43835ede07f6f539fd6d35465fa4ed62a248aea37f2dd55c`.
Only the `Texto` cells at IDs 60271 and 60274 changed. Byte-identical
pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-60251/locatexts_zh_cn.koalocatext_default.csv`.

## `default` ID 60212

Decision D-17892 authorizes this targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 60212 | `조사 결과를 내가 봤던가? 단 한 장도 못 봤지.` | `조사 결과를 내가 봤던가? 조사 결과는 단 하나도 못 봤지.` | English `not a scrap of it`, Japanese `何一つ`, and Chinese `一点都没有` mean no findings/results at all, not zero pages. Remove the unsupported page interpretation and preserve the rhetorical tone. |

Pre-edit CSV SHA-256:
`5fa172635c879c74e23e78edcd04fa26c9b6213b7d8537171d01de120c2fd645`.
Post-edit CSV SHA-256:
`ff22979f04f46fe56ac89b01371fb15f61e580a0b4e34a1d7e4ee1707cbe3a89`.
Only the `Texto` cell at ID 60212 changed. The byte-identical pre-edit
backup is `/private/tmp/ko-translate-backups/20261011/before-60201/locatexts_zh_cn.koalocatext_default.csv`.

## `default` IDs 60101 and 60130

Decisions D-17886 and D-17887 authorize these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 60101 | `...죽기 전에 고문(Counsel)을 찾을 것인가... 고문을 찾기로 했다.` | `...죽기 전에 조언자(Counsel)를 찾을 것인가... 조언자를 찾기로 했다.` | The English frames “the Counsel” as a person to find, and Japanese/Chinese use adviser/consultant terms. Clarify the role in Korean while retaining the source title. |
| 60130 | `이렇게 사람들이 돌아다니는데, 열쇠를 잃어버렸을 때 아무도 도와주지 않았다니.` | `이렇게 사람들이 많은데, 열쇠를 잃어버렸으면 누군가는 도와줄 줄 알았지.` | Restore the source's expectation that someone would help after the keys were lost; remove the unsupported factual assertion that nobody helped. |

Pre-edit CSV SHA-256:
`09c2194038314e7842351349607b05a62266816b7d8e85beca79e0471509a5c6`.
Post-edit CSV SHA-256:
`5fa172635c879c74e23e78edcd04fa26c9b6213b7d8537171d01de120c2fd645`.
Only `Texto` cells at IDs 60101 and 60130 changed. The UTF-8 BOM,
65,135-record count, key order, 72,045 CRLF endings, and 39 pre-existing
bare-LF endings are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-60101/locatexts_zh_cn.koalocatext_default.csv`.

## `default` ID 60048

Decision D-17881 authorizes this targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 60048 | `우리를 위해 그만큼 해 주셨는데 정가를 다 받을 수는 없죠. 부디 할인된 가격으로 즐기세요.` | `우리를 위해 그만큼 해 주셨는데 정가를 다 받을 수는 없죠. 부디 할인 혜택을 받으세요.` | English, Japanese, and Chinese offer a discount. Replace the unnatural “enjoy a discounted price” collocation with natural Korean while retaining the polite offer. |

Pre-edit CSV SHA-256:
`f46a326c9e4eb82f21fc637cf2b7a6a0a3685227ae7f6e1a9fbbec520a3ed2ef`.
Post-edit CSV SHA-256:
`09c2194038314e7842351349607b05a62266816b7d8e85beca79e0471509a5c6`.
Only the `Texto` cell at ID 60048 changed. The byte-identical pre-edit
backup is `/private/tmp/ko-translate-backups/20261011/before-60001/locatexts_zh_cn.koalocatext_default.csv`.

## `default` IDs 59959 and 59963

Decisions D-17877 and D-17878 authorize punctuation-only corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 59959 | Three source-quoted passages had no quotation delimiters. | Added `‘…’` around the three corresponding passages; wording unchanged. | English, Japanese, and Chinese mark three distinct quotations. Restore their boundaries without resolving the separate uncertain pronoun and antecedent. |
| 59963 | Lord Airmer's three spoken lines were unmarked in the Korean poem. | Added `“…”` around the three corresponding lines; wording and line order unchanged. | English and Chinese explicitly mark the dialogue, and context says Airmer approached and spoke. |

Pre-edit CSV SHA-256:
`f58f8637f8b0a3969fd095cff62216dc2b168011f8eabbad6748e6fc6827e92b`.
Post-edit CSV SHA-256:
`f46a326c9e4eb82f21fc637cf2b7a6a0a3685227ae7f6e1a9fbbec520a3ed2ef`.
Only quotation marks at IDs 59959 and 59963 changed. The UTF-8 BOM, record
count, key order, CRLF count, and pre-existing bare-LF endings are preserved.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-59951/locatexts_zh_cn.koalocatext_default.csv`.

## `default` ID 59934

Decision D-17874 authorizes this targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| --- | --- | --- | --- |
| 59934 | `이 전쟁으로 비탄의 왕이 살아 움직이던 시절을 알던 겨울 페이는 거의 모두 사라진 것 같아.` | `이 전쟁으로 비탄의 왕이 살아 움직이던 시절을 알던 다른 겨울 페이들은 모두 지친 것 같아.` | English says the war exhausted the other Winter Fae; Chinese explicitly identifies exhaustion of their energy. Remove the unsupported disappearance/death implication while retaining the speaker's uncertainty and memory clause. |

Pre-edit CSV SHA-256:
`4d0c818192353a4179a6057e8d0eb4d576d0cbea62faae92a5caf536c99abe72`.
Post-edit CSV SHA-256:
`f58f8637f8b0a3969fd095cff62216dc2b168011f8eabbad6748e6fc6827e92b`.
Only ID 59934 changed. UTF-8 BOM, 65,135 records, key order, 72,045
CRLF endings, and 39 pre-existing bare-LF endings are preserved.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-59901/locatexts_zh_cn.koalocatext_default.csv`.

## `default` ID 59849

Decision D-17869 authorizes this targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 59849 | `혼돈 교단의 자칭 예언자라면 미스로스 어딘가에 있어. 하지만 실은 형편없는 호색한이야. 돼지 같은 놈이지.` | `혼돈 교단의 자칭 예언자라면 미스로스 어딘가에 있어. 하지만 실은 대체로 비열한 인간이야. 돼지 같은 놈이지.` | English `cad` is a broad character insult, not necessarily a womanizer; Chinese likewise uses a broad scoundrel term. Restore that broader meaning and retain the separate pig insult. |

Pre-edit CSV SHA-256:
`6c99e14cd030efea39ef70b94e6ac00cb1893beee359113bbbc1d4b0eb9e2292`.
Post-edit CSV SHA-256:
`4d0c818192353a4179a6057e8d0eb4d576d0cbea62faae92a5caf536c99abe72`.
Only ID 59849 changed. UTF-8 BOM, 65,135 records, key order, 72,045
CRLF endings, and 39 pre-existing bare-LF endings are preserved.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-59801/locatexts_zh_cn.koalocatext_default.csv`.

## `default` ID 59703

Decision D-17864 authorizes this targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 59703 | `교수대 끝에는 신이 머문 적이 없지만, 그렇다고 그 이름으로 선행이 베풀어지지 않았다는 뜻은 아니야.` | `교수대 끝에 신이 있었던 적은 없지만, 그렇다고 그 이름으로 선행이 베풀어지지 않았다는 뜻은 아니야.` | English says there was never a god at Gallows End; Chinese agrees. Restore local absence without implying that a god existed but did not dwell there. |

Pre-edit CSV SHA-256:
`ab2e48c9068c3afe99c271bfb3fe90a61b5f4a8f68fd96df130067b85c870880`.
Post-edit CSV SHA-256:
`6c99e14cd030efea39ef70b94e6ac00cb1893beee359113bbbc1d4b0eb9e2292`.
Only ID 59703 changed. UTF-8 BOM, 65,135 records, key order, 72,045
CRLF endings, and 39 pre-existing bare-LF endings are preserved.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-59701/locatexts_zh_cn.koalocatext_default.csv`.

## `default` ID 59603

Decision D-17859 authorizes this targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 59603 | `라시논이라는 투아사 사제가 이 성채를 점령했다. 그가 개스티르 가문을 폐위시키고 대대로 내려온 집을 빼앗았으니, 반드시 처치하겠다고 맹세했다.` | `라시논이라는 투아사 사제가 이 성채를 점령했다. 그가 개스티르 가문을 몰아내고 대대로 내려온 집을 빼앗았으니, 반드시 처치하겠다고 맹세했다.` | English and Chinese say Racinon deposed House Gastyr; replace the awkward collocation `가문을 폐위시키다` with a natural expression for removing the ruling house. Preserve the theft and vow. |

Pre-edit CSV SHA-256:
`72de66d4c484b838c241f0a02bf969436477e8bbd4ce663ecc18eb82678ba35c`.
Post-edit CSV SHA-256:
`ab2e48c9068c3afe99c271bfb3fe90a61b5f4a8f68fd96df130067b85c870880`.
Only ID 59603 changed. UTF-8 BOM, 65,135 records, key order, 72,045
CRLF endings, and 39 pre-existing bare-LF endings are preserved.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-59601/locatexts_zh_cn.koalocatext_default.csv`.

## `default` IDs 59553, 59563, and 59600

Decisions D-17854 through D-17856 authorize these targeted `Texto`
corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 59553 | `아르진이 그림을 배신하라고 해.` | `아르진이 그림(Grim)을 배신하라고 해.` | The sources identify a person named Grim; the English disambiguator avoids the ordinary-noun reading of `그림`. |
| 59563 | `연금술 박물관에서 그런 식물에 관해 읽은 기억이 나서` | `스파지릭 박물관(Spagyric Museum)에서 그런 종류의 식물에 관해 읽은 기억이 나서` | Preserve the English-named institution despite the `Museaum` typo; the Chinese locale also transliterates the name. |
| 59600 | `필요한 당사자 중 한 명 이상이 사망하여 이 퀘스트를 더는 완료할 수 없습니다.` | `필요한 인물 중 한 명 이상이 사망하여 이 퀘스트를 더는 완료할 수 없습니다.` | Use a natural broad term for the required quest people without implying legal/transactional parties or inventing a role. |

Pre-edit CSV SHA-256:
`71ec16a797ee214a868b8510de6ce9d4239f065445fbc1b75dfc19eac1e8432d`.
Post-edit CSV SHA-256:
`72de66d4c484b838c241f0a02bf969436477e8bbd4ce663ecc18eb82678ba35c`.
Only the approved `Texto` cells at IDs 59553, 59563, and 59600 changed.
UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-59551/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records 11 uncertain findings; these are working
dispositions, not independent linguistic approval.

## `default` IDs 59521, 59531, and 59538

Decisions D-17849 through D-17851 authorize these targeted `Texto`
corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 59521 | `마법이 제대로 걸려 있다면 어떤 자물쇠든 열 수 있다고 알려진 대가의 곡괭이는 도둑맞을 당시 손상된 듯하다. 아리부스 엔진이 곡괭이의 마법에 간섭했을 것이다.` | `마법이 제대로 걸려 있다면 어떤 자물쇠든 열 수 있다고 알려진 달인의 자물쇠따개(Master's Pick)는 도둑맞을 당시 손상된 듯하다. 아리부스 엔진이 그 마법에 간섭했을 것이다.` | The item opens locks; Japanese and Chinese identify a lockpick. Reuse the accepted `달인의 자물쇠따개(Master's Pick)` wording at D-734 and D-7086. |
| 59531 | `영리한 페이 장난꾸러기 아만이 보물 상자를 여는 열쇠 여러 개를 남겼다는 전설이 있다. 요르반의 잠긴 상자마다 맞는 열쇠를 찾아 보물을 챙겨야겠다.` | `전설적인 페이 장난꾸러기인 영리한 아만(Amman the Clever)은 보물 상자를 여는 열쇠 여러 개를 남겼다. 요르반의 잠긴 상자마다 맞는 열쇠를 찾아 내가 보물을 챙겨야겠다.` | Restore the source's direct claim and make the Fae trickster's name/epithet relation clear; retain the narrator's intent to take the valuables. |
| 59538 | `군대를 모아 히에로판트에 전선을 가져가 전쟁을 일으킬 계획이라고 들었어... 뭐, 그런 비슷한 얘기야.` | `군대를 모아 히에로판트를 상대로 전쟁을 벌일 계획이라고 들었어... 뭐, 그런 비슷한 얘기야.` | Replace the calqued “bring a war front to” phrasing with the against-the-Hierophant relation supported by Japanese and Chinese; preserve the speaker's uncertainty. |

Pre-edit CSV SHA-256:
`3b89ddb25d40a316e826f584df26ba36ca831345d86be84debb0090a34ba531b`.
Post-edit CSV SHA-256:
`71ec16a797ee214a868b8510de6ce9d4239f065445fbc1b75dfc19eac1e8432d`.
Only the approved `Texto` cells at IDs 59521, 59531, and 59538 changed.
UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-59501/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records 14 uncertain findings and 35 `not an issue`
IDs; two uncertain findings overlap accepted IDs for separate questions.
These are working dispositions, not independent linguistic approval.

## `default` IDs 59499 and 59500

Decisions D-17845 and D-17846 authorize these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 59499 | `그들이야말로 본래의 생명이지. 돌벽 안에 틀어박히거나 허다한 물건과 치장으로 삶을 짓누르지 않는 필멸자들 말이야.` | `그들이야말로 삶이 마땅히 그래야 할 모습이지. 돌벽 안에 틀어박히거나 허다한 물건과 치장으로 삶을 짓누르지 않는 필멸자들 말이야.` | Restore English `life as it is meant to be` as the proper way of living; the existing Korean shifts the meaning to “original life.” |
| 59500 | `그곳에는 아데사에서 가장 뛰어난 지성들이 모여 있어. 유형의 과학이나 현실적인 한계를 고민할 필요 없이 이론만 연구하지.` | `그곳은 아데사에서 가장 뛰어난 지성들이 모인 곳이야. 그들은 실증 과학이나 현실적인 한계를 고민할 필요 없이 이론적인 실험만 하지.` | Restore the source's theoretical-experiment meaning and replace the unnatural literal `유형의 과학`; Japanese and Chinese retain the experimental action. |

Pre-edit CSV SHA-256:
`d3073fb282cecf05b2e351b270b83272642cacc52dfb86057cfdda6e4d07a731`.
Post-edit CSV SHA-256:
`3b89ddb25d40a316e826f584df26ba36ca831345d86be84debb0090a34ba531b`.
Only the approved `Texto` cells at IDs 59499 and 59500 changed. UTF-8
BOM, 65,135 records, key order, 72,045 CRLF endings, and 39 pre-existing
bare-LF endings are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-59451/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records ten uncertain IDs and 38 `not an issue`
IDs; these working dispositions are not independent linguistic approval.

## `default` ID 59421

Decision D-17842 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `광포수에게 광부 세 명을 벌써 잃었어.` | `바게스트(Barghest)에게 광부 세 명을 벌써 잃었어.` | English and Japanese name barghests, and the active Korean corpus consistently uses `바게스트(Barghest)`; `광포수` changes the creature name/category. Preserve the three miners lost. |

Pre-edit CSV SHA-256:
`56463e8babc814428ff5e17402d0e6d5c4e4d6f8c3f53ab8e9ba166405801e5f`.
Post-edit CSV SHA-256:
`d3073fb282cecf05b2e351b270b83272642cacc52dfb86057cfdda6e4d07a731`.
Only the approved ID 59421 `Texto` cell changed. UTF-8 BOM, 65,135
records, key order, 72,045 CRLF endings, and 39 pre-existing bare-LF
endings are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-59401/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records one uncertain ID and 48 `not an issue` IDs;
these working dispositions are not independent linguistic approval.

## `default` IDs 59358, 59383, and 59399

Decisions D-17837 through D-17839 authorize these targeted `Texto`
corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 59358 | `올라와 대화` | `오를라와 대화` | Match the established Orla spelling in the active corpus and avoid the unintended reading “come up and talk.” |
| 59383 | `돌을 활성화할 때마다 네 배에 저주를 걸고, 약해진 네가 상대할 적들을 불러낸다.` | `돌을 활성화할 때마다 네 몸에 저주를 걸고, 약해진 상태에서 상대할 적들을 불러낸다.` | Japanese and Chinese explicitly identify the player's body as the cursed vessel; remove the Korean ship/belly ambiguity. |
| 59399 | `...대가의 곡괭이...` | `...달인의 자물쇠따개(Master's Pick)...` | Correct the tool category using the Chinese source and accepted lockpick decisions D-734 and D-7086; defer remaining canonical-name consistency questions. |

Pre-edit CSV SHA-256:
`2e52cecf80077f8041fd80ac890053de10feee2cc37f33ddfd7d1b81d728e5ff`.
Post-edit CSV SHA-256:
`56463e8babc814428ff5e17402d0e6d5c4e4d6f8c3f53ab8e9ba166405801e5f`.
Only the approved `Texto` cells at IDs 59358, 59383, and 59399 changed.
UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-59351/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records nine uncertain IDs and 38 `not an issue`
IDs; these working dispositions are not independent linguistic approval.

## `default` ID 59310

Decision D-17834 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `+20% 방어 효율` | `+20% 막기 효율` | Reuse accepted decisions D-147 and D-1359: `Block Efficacy` is the blocking stat, not general defense efficacy. |

Pre-edit CSV SHA-256:
`28388ecc40ead328283e0d75b8224f5da6f8c3656131713ef4e4be64a94b6b5d`.
Post-edit CSV SHA-256:
`2e52cecf80077f8041fd80ac890053de10feee2cc37f33ddfd7d1b81d728e5ff`.
Only the approved 59310 `Texto` cell changed. UTF-8 BOM, 65,135 IDs,
72,045 CRLF endings, and 39 pre-existing bare-LF endings are preserved.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-59301/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records six uncertain IDs and 43 `not an issue` IDs;
these are working dispositions, not independent final linguistic approval.

## `default` ID 59282

Decision D-17830 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `고마워, 그대여. 이걸 열어 주지 않으면 여기서 나가려고 살을 몇십 킬로는 빼야 할 판이야.` | `고마워, 그대여. 이걸 열어 주지 않으면 여기서 나가려면 몇십 파운드는 빼야 할 판이야.` | English and Chinese specify pounds; preserve the source unit and magnitude. The separate `dove` vocative remains uncertain. |

## `default` ID 59287

Decision D-17831 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `슬픔의 가문 정문이 안쪽에서 잠겨 있고 주변에 싸운 흔적이 있는 것을 발견했다. 무슨 일이 있었는지 조사해야 한다. 하지만 가문 안으로 들어가려면 시련의 전당을 통과해야 한다.` | `비탄의 집 정문이 안쪽에서 잠겨 있고 주변에 싸운 흔적이 있는 것을 발견했다. 무슨 일이 있었는지 조사해야 한다. 하지만 집 안으로 들어가려면 시련의 전당을 통과해야 한다.` | Reuse the approved `House of Sorrows` form `비탄의 집` from D-9869, D-9965, and D-10186. |

Pre-edit CSV SHA-256:
`450d462e3d21db010167ee56c5966590323a21e48dd16f475656eb298f9638bf`.
Post-edit CSV SHA-256:
`28388ecc40ead328283e0d75b8224f5da6f8c3656131713ef4e4be64a94b6b5d`.
Only the approved 59282 and 59287 `Texto` cells changed. UTF-8 BOM,
65,135 IDs, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are
preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-59251/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records 10 uncertain findings (one overlaps an
accepted ID) and 39 `not an issue` IDs; these are working dispositions, not
independent final linguistic approval.

## `default` ID 59239

Decision D-17826 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `팅크처, 약제, 연고와 향유가 있어.` | `팅크처, 사랑의 묘약, 연고와 향유가 있어.` | Restore the love-potion meaning of `philter`, supported by Japanese `媚薬` and Chinese `春药`; generic `약제` loses that category. |

## `default` ID 59247

Decision D-17827 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `그는 우리가 알라바스트라에 도착하기 전에 그를 붙잡으면 투아사 장군 하나를 제거할 수 있다고 생각했어.` | `그는 투아사 장군 하나가 알라바스트라에 도착하기 전에 우리가 붙잡으면 제거할 수 있다고 생각했어.` | Correct the arrival subject and remove the redundant pronoun; English, Japanese, and Chinese identify the captured Tuatha general as the one who must not reach Alabastra. |

Pre-edit CSV SHA-256:
`67fde35f908683e49100528bbddd9fe25faaf88a252cb3ca5f99f7e6ec63c419`.
Post-edit CSV SHA-256:
`450d462e3d21db010167ee56c5966590323a21e48dd16f475656eb298f9638bf`.
Only the approved 59239 and 59247 `Texto` cells changed. UTF-8 BOM,
65,135 IDs, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are
preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-59201/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records eight uncertain IDs and 40 `not an issue`
IDs; these are working dispositions, not independent final linguistic
approval.

## `default` ID 59191

Decision D-17823 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `장인의 수지` | `장인의 동물성 지방` | Reuse accepted decisions D-145, D-16246, D-16267, and D-16809: `tallow` is animal fat, not resin. |

Pre-edit CSV SHA-256:
`5701579c2802da8dc27fa21a36bd279e22a4c990b7735dbf40ce15301e3bbae3`.
Post-edit CSV SHA-256:
`67fde35f908683e49100528bbddd9fe25faaf88a252cb3ca5f99f7e6ec63c419`.
Only the approved 59191 `Texto` cell changed. UTF-8 BOM, 65,135 IDs,
72,045 CRLF endings, and 39 pre-existing bare-LF endings are preserved.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-59151/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records 10 uncertain IDs and 39 `not an issue` IDs;
these are working dispositions, not independent final linguistic approval.

## `default` ID 58917

Decision D-17810 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `이 사람들은 전쟁에 금화를 대면서 난민에게 침을 뱉어. 바보와 위선자들, 그리고... 내 아버지를 위한 마을이야.` | `이 사람들은 전쟁에 금화를 대면서 난민에게 침을 뱉어. 바보와 위선자들로 가득한 마을이야. 그리고... 내 아버지도 그중 하나지.` | English, Japanese, and Chinese include the speaker's father in the town's fools/hypocrites. Correct the Korean relation, which made the town something intended for the father, while retaining the hesitant pause. |

Pre-edit CSV SHA-256:
`ff2bbb1c0f40ddc1ff78cc5834f4d479416ec3cbdc9a8b7e65325d295ff1a01e`.
Post-edit CSV SHA-256:
`f55e5d6ffbff7616d5879fc6b79513006e57b3a097201f46f691c757e4ee7b18`.
Only the approved 58917 `Texto` cell changed. UTF-8 BOM, 65,135 IDs,
72,045 CRLF endings, and 39 pre-existing bare-LF endings are preserved.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-58901/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records 11 uncertain IDs and 38 `not an issue` IDs;
these are working dispositions, not independent final linguistic approval.

## `default` ID 59051

Decision D-17817 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `이제 에세네의 빛이 우리 모두를 비추는 게 느껴져.` | `이제 에테네의 빛이 우리 모두를 비추는 게 느껴져.` | The same English name `Ethene` is rendered `에테네` in Korean lore at ID 58934; align this inconsistent transliteration locally. |

Pre-edit CSV SHA-256:
`f55e5d6ffbff7616d5879fc6b79513006e57b3a097201f46f691c757e4ee7b18`.
Post-edit CSV SHA-256:
`92d76ca676e4a4e945811a5f8ef71ddd961dfe6decbf2712f30ea2429981e35b`.
Only the approved 59051 `Texto` cell changed. UTF-8 BOM, 65,135 IDs,
72,045 CRLF endings, and 39 pre-existing bare-LF endings are preserved.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-59051/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records seven uncertain IDs and 42 `not an issue`
IDs; these are working dispositions, not independent final linguistic
approval.

## `default` IDs 59051-59100

Disposition report
[`disposition-batch-default-59051-59100-20261011.md`](disposition-batch-default-59051-59100-20261011.md)
records seven uncertain IDs and 42 `not an issue` IDs, plus the accepted
correction at 59051.

## `default` ID 59144

Decision D-17820 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `에스윈 시장의 계획` | `시장의 계획` | English, Japanese, and Chinese distinguish the mayor's agenda from the instruction to return to Eswin; remove the unsupported identity relation. |

Pre-edit CSV SHA-256:
`92d76ca676e4a4e945811a5f8ef71ddd961dfe6decbf2712f30ea2429981e35b`.
Post-edit CSV SHA-256:
`5701579c2802da8dc27fa21a36bd279e22a4c990b7735dbf40ce15301e3bbae3`.
Only the approved 59144 `Texto` cell changed. UTF-8 BOM, 65,135 IDs,
72,045 CRLF endings, and 39 pre-existing bare-LF endings are preserved.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-59101/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records 11 uncertain IDs and 38 `not an issue` IDs;
these are working dispositions, not independent final linguistic approval.

## `default` IDs 59001-59050: No Accepted CSV Edits

Disposition report
[`disposition-batch-default-59001-59050-20261011.md`](disposition-batch-default-59001-59050-20261011.md)
records 12 uncertain IDs and 38 `not an issue` IDs. No correction was
accepted, so the translation CSV was not changed. The byte-identical
pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-59001/locatexts_zh_cn.koalocatext_default.csv`.
Its SHA-256 and the active CSV hash remain
`f55e5d6ffbff7616d5879fc6b79513006e57b3a097201f46f691c757e4ee7b18`.
These are working dispositions, not independent final linguistic approval.

## `default` IDs 58951-59000: No Accepted CSV Edits

Disposition report
[`disposition-batch-default-58951-59000-20261011.md`](disposition-batch-default-58951-59000-20261011.md)
records 14 uncertain IDs and 36 `not an issue` IDs. No correction was
accepted, so the translation CSV was not changed. The byte-identical
pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-58951/locatexts_zh_cn.koalocatext_default.csv`.
Its SHA-256 and the active CSV hash remain
`f55e5d6ffbff7616d5879fc6b79513006e57b3a097201f46f691c757e4ee7b18`.
These are working dispositions, not independent final linguistic approval.

## `default` IDs 58851-58900

Decisions D-17807 and D-17808 authorize these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 58872 | `그들이 뒤쪽의 작은 격자문으로 돌아가는 것도 봤어.` | `그들이 뒤쪽의 작은 격자문으로 돌아가는 것도 들었어.` | English, Japanese, and Chinese say the speaker heard the return; remove the unsupported visual observation. |
| 58891 | `과부의 지시대로 캐너록의 주민들을 모두 없앴다.` | `과부의 지시대로 캐너록의 주민들을 모두 죽였다.` | Restore the explicit killing in English `wiped out` and Japanese/Chinese; avoid an ambiguous euphemism. |

Pre-edit CSV SHA-256:
`21a1c477f5770af596fac3cd799849a49bac61dd68828c1bb0b20306c6392eed`.
Post-edit CSV SHA-256:
`ff2bbb1c0f40ddc1ff78cc5834f4d479416ec3cbdc9a8b7e65325d295ff1a01e`.
Only these two approved `Texto` cells changed. UTF-8 BOM, 65,135
records, key order, 72,045 CRLF endings, and 39 pre-existing bare-LF
endings are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-58851/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records 12 uncertain IDs and 36 `not an issue` IDs;
these are working dispositions, not independent final linguistic approval.

## `default` IDs 58801-58850: No Accepted CSV Edits

Disposition report
[`disposition-batch-default-58801-58850-20261011.md`](disposition-batch-default-58801-58850-20261011.md)
records 33 `not an issue` IDs and 17 uncertain IDs. No correction was
accepted, so the translation CSV was not changed. The byte-identical
pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-58801/locatexts_zh_cn.koalocatext_default.csv`.
Its SHA-256 and the active CSV hash remain
`21a1c477f5770af596fac3cd799849a49bac61dd68828c1bb0b20306c6392eed`.

## `default` IDs 58751-58800: No Accepted CSV Edits

Disposition report
[`disposition-batch-default-58751-58800-20261011.md`](disposition-batch-default-58751-58800-20261011.md)
records 34 `not an issue` IDs and 16 uncertain IDs. No correction was
accepted, so the translation CSV was not changed. The byte-identical
pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-58751/locatexts_zh_cn.koalocatext_default.csv`.
Its SHA-256 and the active CSV hash remain
`21a1c477f5770af596fac3cd799849a49bac61dd68828c1bb0b20306c6392eed`.

## `default` IDs 58701-58750: No Accepted CSV Edits

Disposition report
[`disposition-batch-default-58701-58750-20261011.md`](disposition-batch-default-58701-58750-20261011.md)
records 38 `not an issue` IDs and 12 uncertain IDs. No correction was
accepted, so the translation CSV was not changed. The byte-identical
pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-58701/locatexts_zh_cn.koalocatext_default.csv`.
Its SHA-256 and the active CSV hash remain
`21a1c477f5770af596fac3cd799849a49bac61dd68828c1bb0b20306c6392eed`.

## `default` IDs 58651-58700

Decisions D-17743 through D-17745 authorize these targeted `Texto`
corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 58690 | `... 악명 높은 해적왕을 죽이려는 내 여정을 계속할 수 있도록 ...` | `... 위험한 해적왕을 죽이려는 내 여정을 계속할 수 있도록 ...` | Restore the danger/lethality in English `deadly`; `악명 높은` means notorious, as separately used for English `notorious` at 60797. |
| 58698 | `#NAMED_ICON_360_LB# 운명의 시간 모드 #NAMED_ICON_360_RB#` | `#NAMED_ICON_360_LB# 레코닝 모드 #NAMED_ICON_360_RB#` | Apply the established mode name from accepted terminology decision D-079; preserve both icon markers and their order. |
| 58699 | `무운다운 야영지에서 널 찾고 있어.` | `무운다운 야영지에서 네가 필요해.` | Restore `They need you at Camp Moondown`; remove the unsupported “looking for you” action. |

Pre-edit CSV SHA-256:
`a16f77dba0bb6c5795ce71e9c258537368aa09653b668e8cde86fd599ab98f53`.
Post-edit CSV SHA-256:
`21a1c477f5770af596fac3cd799849a49bac61dd68828c1bb0b20306c6392eed`.
Only these three approved `Texto` cells changed. UTF-8 BOM, 65,135
records, key order, 72,045 CRLF endings, and 39 pre-existing bare-LF
endings are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-58651/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records 15 uncertain IDs and 32 `not an issue` IDs;
these are working dispositions, not independent final linguistic approval.

## `default` IDs 58601-58650: No Accepted CSV Edits

Disposition report
[`disposition-batch-default-58601-58650-20261011.md`](disposition-batch-default-58601-58650-20261011.md)
records 34 `not an issue` IDs and 16 uncertain IDs. No correction was
accepted, so the translation CSV was not changed. The byte-identical
pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-58601/locatexts_zh_cn.koalocatext_default.csv`.
Its SHA-256 and the active CSV hash remain
`a16f77dba0bb6c5795ce71e9c258537368aa09653b668e8cde86fd599ab98f53`.

## `default` IDs 58551-58600: No Accepted CSV Edits

Disposition report
[`disposition-batch-default-58551-58600-20261011.md`](disposition-batch-default-58551-58600-20261011.md)
records 32 `not an issue` IDs and 18 uncertain IDs. No correction was
accepted, so the translation CSV was not changed. The byte-identical
pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-58551/locatexts_zh_cn.koalocatext_default.csv`.
Its SHA-256 and the active CSV hash remain
`a16f77dba0bb6c5795ce71e9c258537368aa09653b668e8cde86fd599ab98f53`.

## `default` IDs 58501-58550: No Accepted CSV Edits

Disposition report
[`disposition-batch-default-58501-58550-20261011.md`](disposition-batch-default-58501-58550-20261011.md)
records 32 `not an issue` IDs and 18 uncertain IDs. No correction was
accepted, so the translation CSV was not changed. The byte-identical
pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-58501/locatexts_zh_cn.koalocatext_default.csv`.
Its SHA-256 and the active CSV hash remain
`a16f77dba0bb6c5795ce71e9c258537368aa09653b668e8cde86fd599ab98f53`.

## `default` IDs 58451 and 58474

Decisions D-17670 and D-17671 authorize these corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 58451 | `흔히 입는 예복` | `흔히 입는 평범한 로브` | All source locales describe ordinary robes, not ceremonial dress. |
| 58474 | `네 친구와 어울려 주지` | `네 친구와 연주해 주지` | Japanese and Chinese explicitly interpret English `play` as performing music. |

Pre-edit CSV SHA-256:
`b2d5ab3cf5c926b254ada54d7444f60ce14f1953ae023bc0e024b54b0ab3cc9d`.
Post-edit CSV SHA-256:
`a16f77dba0bb6c5795ce71e9c258537368aa09653b668e8cde86fd599ab98f53`.
The byte-identical pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-58451/locatexts_zh_cn.koalocatext_default.csv`.
Only these two `Texto` cells changed; BOM, record/key order, and line
endings are preserved.

## `default` ID 58437

Decision D-17652 authorizes the correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `바라니에게서 빼앗은 뒤` | `바라니에게서 따낸 뒤` | English `won from a Varani` and the Japanese/Chinese readings describe a tournament win, not forcible seizure. |

Pre-edit CSV SHA-256:
`60e4e69d0f0ac9d09bcd66480d8eaee68194b4acafbdfe5cf1963ba97c457c99`.
Post-edit CSV SHA-256:
`b2d5ab3cf5c926b254ada54d7444f60ce14f1953ae023bc0e024b54b0ab3cc9d`.
The byte-identical pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-58351/locatexts_zh_cn.koalocatext_default.csv`.
Only the `Texto` cell at ID 58437 changed; BOM, record/key order, and line
endings are preserved.

## `default` IDs 58351-58400: No Accepted CSV Edits

Disposition report
[`disposition-batch-default-58351-58400-20261011.md`](disposition-batch-default-58351-58400-20261011.md)
records 35 `not an issue` IDs and 15 uncertain IDs in 14 findings. No
correction was accepted, so the translation CSV was not changed. The
byte-identical pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-58351/locatexts_zh_cn.koalocatext_default.csv`.
Its SHA-256 and the active CSV hash remain
`60e4e69d0f0ac9d09bcd66480d8eaee68194b4acafbdfe5cf1963ba97c457c99`.

## `default` IDs 58301-58350

Decisions D-17606 and D-17607 authorize these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 58313 | `음유시인, 곡예사, 재주꾼, 무용수` | `음유시인, 저글러, 곡예사, 무용수` | Distinguish the English `jugglers` and `tumblers`, supported by the Chinese role list. |
| 58319 | `무의미하게 썩어 가는 육신` | `흔적도 없이 썩어 가는 육신` | Correct the meaning to bodies decaying into nothingness. |

The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-58301/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `b3df129cd0f225781f6337a2d643e90a67d7ab5f3ec9168c3cab0b8ea27ca1fb`).
Post-edit CSV SHA-256:
`60e4e69d0f0ac9d09bcd66480d8eaee68194b4acafbdfe5cf1963ba97c457c99`.
Only these two `Texto` cells differ from the checkpoint backup. The UTF-8
BOM, 65,135 records, key order, 72,045 CRLF endings, and 39 pre-existing
bare-LF endings are preserved.

## `default` IDs 58251-58300: No Accepted CSV Edits

Disposition report
[`disposition-batch-default-58251-58300-20261011.md`](disposition-batch-default-58251-58300-20261011.md)
records 33 `not an issue` IDs and 17 uncertain IDs in 16 findings. No
correction was accepted, so the translation CSV was not changed. The
byte-identical checkpoint backup is
`/private/tmp/ko-translate-backups/20261011/before-58251/locatexts_zh_cn.koalocatext_default.csv`.
Its SHA-256 and the active CSV hash remain
`b3df129cd0f225781f6337a2d643e90a67d7ab5f3ec9168c3cab0b8ea27ca1fb`.

## `default` IDs 58201-58250

Decision D-17570 authorizes the correction at ID 58210:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `제값을 쳐 줄 구매자들에게` | `평판이 좋은 구매자들에게` | English/Japanese/Chinese describe the buyers' reputation, not their price. |

Decision D-17571 authorizes the correction at ID 58219:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `사투르닌이 널 원한다` | `사투르닌은 이것을 원한다` | Restore the English/Japanese object `this`; do not change it to the addressee. |

Pre-edit CSV SHA-256:
`5b21c9f2dea2df846c0845dc6ff26bdc72aa5145dd7cf498197e9c918aadf93f`.
Post-edit CSV SHA-256:
`b3df129cd0f225781f6337a2d643e90a67d7ab5f3ec9168c3cab0b8ea27ca1fb`.
The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-58201/locatexts_zh_cn.koalocatext_default.csv`.
Only the `Texto` cells at IDs 58210 and 58219 changed. The UTF-8 BOM,
65,135 records, key order, 72,045 CRLF endings, and 39 pre-existing bare-LF
endings remain.

## `default` IDs 58151-58200

Decision D-17553 authorizes the correction at ID 58154:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `그곳에 가서 아메테어와 담판을 지어야 한다.` | `그곳에 가서 아메테어를 상대해야 한다.` | Reuse accepted D-2432 at ID 8649; avoid narrowing English `deal with` to negotiation. |

Decision D-17554 authorizes the named-Widow wording at ID 58156:

| Previous Korean / affected text | Applied Korean / replacement | Rationale |
| --- | --- | --- |
| Three repetitions of `과부가 걸어온다.` | First: `위도우(The Widow)가 걸어온다.`; later repetitions: `위도우가 걸어온다.` | Align this Webwood spider-ruler with accepted D-703/D-3054; retain both embedded line breaks. |

Pre-edit CSV SHA-256:
`85450fbeeb4974a39be47f5e6121c88cdba450642f645b1e665ea21a83c45218`.
Post-edit CSV SHA-256:
`5b21c9f2dea2df846c0845dc6ff26bdc72aa5145dd7cf498197e9c918aadf93f`.
The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-58151/locatexts_zh_cn.koalocatext_default.csv`.
Only the `Texto` cells at IDs 58154 and 58156 changed. The UTF-8 BOM,
65,135 records, key order, 72,045 CRLF endings, and 39 pre-existing bare-LF
endings remain.

## `default` ID 58143

Decision D-17532 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `네가 쫓는 표적이야. 꽤나 값진 사냥감이기도 하지. 노움의 소유물치곤 별나지만, 의뢰인이 걸어 둔 현상금은 받을 만해.` | `네가 쫓는 사냥감이야. 말 그대로 꽤 괜찮은 채석장이기도 하지. 노움 소유라니 별나긴 하지만, 의뢰인이 현상금을 걸었으니 어쨌든 잡아야 해.` | Restore both English senses of `quarry` (the pursued prey and a stone quarry), while retaining the gnome ownership and patron's bounty. |

Pre-edit CSV SHA-256:
`8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`.
Post-edit CSV SHA-256:
`85450fbeeb4974a39be47f5e6121c88cdba450642f645b1e665ea21a83c45218`.
The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-58101/locatexts_zh_cn.koalocatext_default.csv`.
Only the `Texto` cell at 58143 changed. The UTF-8 BOM, 65,135 records,
key order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings remain.

## `default` IDs 58051-58100: No Accepted CSV Edits

Disposition report
[`disposition-batch-default-58051-58100-20261011.md`](disposition-batch-default-58051-58100-20261011.md)
records 32 `not an issue` IDs and 18 uncertain IDs. No correction was
accepted, so the translation CSV was not changed. The byte-identical
pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-58051/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`).
The active CSV hash remains
`8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`.

## `default` IDs 58001-58050: No Accepted CSV Edits

Disposition report
[`disposition-batch-default-58001-58050-20261011.md`](disposition-batch-default-58001-58050-20261011.md)
records 21 `not an issue` IDs and 29 uncertain IDs. No correction was
accepted, so the translation CSV was not changed. The byte-identical
pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-58001/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`).
The active CSV hash remains
`8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`.

## `default` IDs 57951-58000: No Accepted CSV Edits

Disposition report
[`disposition-batch-default-57951-58000-20261011.md`](disposition-batch-default-57951-58000-20261011.md)
records 26 `not an issue` IDs and 24 uncertain IDs. No correction was
accepted, so the translation CSV was not changed. The byte-identical
pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-57951/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`).
The active CSV hash remains
`8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`.

## `default` IDs 57901-57950: No Accepted CSV Edits

Disposition report
[`disposition-batch-default-57901-57950-20261011.md`](disposition-batch-default-57901-57950-20261011.md)
records 24 `not an issue` IDs and 26 uncertain IDs. No correction was
accepted, so the translation CSV was not changed. The byte-identical
pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-57901/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`).
The active CSV hash remains
`8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`.

## `default` IDs 57851-57900: No Accepted CSV Edits

Disposition report
[`disposition-batch-default-57851-57900-20261011.md`](disposition-batch-default-57851-57900-20261011.md)
records 27 `not an issue` IDs and 23 uncertain IDs. No correction was
accepted, so the translation CSV was not changed. The byte-identical
pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-57851/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`).
The active CSV hash remains
`8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`.

## `default` ID 57811

Decision D-17408 authorizes this targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 57811 | `저 사람이 내 예쁜 사랑이야. 그녀 없이는 어찌 살았을지 모르겠어.` | `저 사람이 내가 사랑하는 예쁜 사람이야. 그녀가 없었다면 어떻게 지냈을지 모르겠어.` | English/Chinese use an affectionate “pretty love,” and Japanese specifies an affectionate wife. Replace the awkward literal wording with natural Korean without asserting marital status. |

Pre-edit SHA-256:
`e853b47160e5cd3670a35d213563388eb41c0ee27e20ec047f733db4ded304f7`.
Post-edit SHA-256:
`8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`.
The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-57751/locatexts_zh_cn.koalocatext_default.csv`.
Only the `Texto` cell at 57811 changed. The UTF-8 BOM, 65,135 records,
key order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings remain.

## `default` IDs 57751-57800: No Accepted CSV Edits

Disposition report
[`disposition-batch-default-57751-57800-20261011.md`](disposition-batch-default-57751-57800-20261011.md)
records 16 uncertain findings covering 21 IDs and 29 `not an issue` IDs.
No correction within this range was accepted; the batch made no translation
CSV changes. A later accepted correction at 57811 changed the active CSV
SHA-256 as recorded above. Its byte-identical pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-57751/locatexts_zh_cn.koalocatext_default.csv`.

## `default` IDs 57701-57750: No Accepted CSV Edits

Disposition report
[`disposition-batch-default-57701-57750-20261011.md`](disposition-batch-default-57701-57750-20261011.md)
records 19 uncertain findings and 22 `not an issue` IDs. No correction was
accepted within this range. The CSV hash at that batch checkpoint remained
`e853b47160e5cd3670a35d213563388eb41c0ee27e20ec047f733db4ded304f7`;
a later correction at 57811 changed the active hash as recorded above.
The byte-identical pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-57701/locatexts_zh_cn.koalocatext_default.csv`.
The report documents the Japanese-only extra `{LINE_SPACE}` at 57708 and
the differing letter timing/paragraph layout at 57728.

## `default` ID 57654

Decision D-17369 authorizes this targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 57654 | `정말 큰 도움을 받았어. 이 마을이 새로운 황금기를 맞이해도 네 은혜는 잊지 않을 거야.` | `정말 큰 도움을 받았어. 이 마을이 새로운 황금기를 맞이해도 널 잊지 않을 거야.` | Restore the promise that the helper will be remembered, rather than narrowing it to their kindness. |

Pre-edit SHA-256:
`b3cead1202ab4a0faf8d31562bcdb9a58aed95f1bd68682188ca1d1fb7f30b41`.
Post-edit SHA-256:
`e853b47160e5cd3670a35d213563388eb41c0ee27e20ec047f733db4ded304f7`.
The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-57651/locatexts_zh_cn.koalocatext_default.csv`.
Only this `Texto` cell changed; the UTF-8 BOM, 65,135 records, key order,
72,045 CRLF endings, and 39 pre-existing bare-LF endings remain.

## `default` ID 57648

Decision D-17350 authorizes this targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 57648 | `손이 강인하군… 검술을 배우는 사람인가?` | `손힘이 좋군… 검술을 배우나?` | Replace an unnatural direct rendering with idiomatic Korean, retaining the strength compliment and sword-study question. |

Pre-edit SHA-256:
`4f8a74d3805122302e9168a7c35a072078300ca77b302fc077ce297534752163`.
Post-edit SHA-256:
`b3cead1202ab4a0faf8d31562bcdb9a58aed95f1bd68682188ca1d1fb7f30b41`.
The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-57601/locatexts_zh_cn.koalocatext_default.csv`.
Only this `Texto` cell changed; the UTF-8 BOM, 65,135 records, key order,
72,045 CRLF endings, and 39 pre-existing bare-LF endings remain.

## `default` ID 57582

Decision D-17337 authorizes this targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 57582 | `시니릭 형제들은 이걸 장난으로 여겨. 지금은 웃고 있지만, 자기들이 저지른 것과 똑같이 잔혹한 일을 당하면 어떤 기분일지 두고 보자고.` | `시니릭 쪽 녀석들은 이걸 장난으로 여겨. 지금은 웃고 있지만, 자기들이 저지른 것과 똑같이 잔혹한 일을 당하면 어떤 기분일지 두고 보자고.` | English `Cynric boys` and Japanese `シンリックの連中` do not establish a sibling relationship. |

Pre-edit SHA-256:
`b0636ddaf2ef52ac466f0e9bc800197e0444238e09bfdd76f48ebccbff8e83e6`.
Post-edit SHA-256:
`4f8a74d3805122302e9168a7c35a072078300ca77b302fc077ce297534752163`.
The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-57551/locatexts_zh_cn.koalocatext_default.csv`.
Only this `Texto` cell changed; the UTF-8 BOM, 65,135 records, key order,
72,045 CRLF endings, and 39 pre-existing bare-LF endings remain.

## `default` ID 57524

Decision D-17327 authorizes this targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 57524 | `좋아. 그걸 내게 주면 충분히 보상해 줄게.` | `좋아. 그것들을 내게 주면 충분히 보상해 줄게.` | English `them` and Chinese `它们` are plural; retain the number without inventing the payment object's identity. |

Pre-edit SHA-256:
`29718d93889718a13a59d3c0c2537add7e3e40cf7581d7433fd2e99e3c391344`.
Post-edit SHA-256:
`b0636ddaf2ef52ac466f0e9bc800197e0444238e09bfdd76f48ebccbff8e83e6`.
The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-57501/locatexts_zh_cn.koalocatext_default.csv`.
Only this `Texto` cell changed; the UTF-8 BOM, 65,135 records, key order,
72,045 CRLF endings, and 39 pre-existing bare-LF endings remain.

## `default` IDs 57462, 57472, and 57495

Decisions D-17313 through D-17315 authorize these targeted `Texto`
corrections:

| ID | Previous Korean excerpt | Applied Korean excerpt | Rationale |
| ---: | --- | --- | --- |
| 57462 | `적은 많고 우리는 너무 적지.` | `위험은 많고 우리는 너무 적지.` | English's `They` refers to the land's dangers, and Japanese explicitly says dangers are numerous. |
| 57472 | `전쟁 지도자이자 이야기꾼으로 큰 추종 세력을 모았고` | `전쟁 지도자이자 전승에 밝은 학자로서 큰 추종 세력을 모았고` | English `loremaster`, Japanese `伝承師`, and Chinese `博学者` support lore/knowledge rather than simply storytelling. Hironar/Faelandsh spelling remains open under D-17307. |
| 57495 | `용맹의 전당 순회 격투 대회인 승리 게임` | `용맹의 집 순회 격투 대회인 승리 게임` | Reuse the established House of Valor name. Vox Victorium and Victory Games remain open under D-17310. |

Pre-edit SHA-256:
`04e69b1a162f330c2191be2575b28400b66b82fc9811e41b2f4ed2031b6b68bd`.
Post-edit SHA-256:
`29718d93889718a13a59d3c0c2537add7e3e40cf7581d7433fd2e99e3c391344`.
The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-57451/locatexts_zh_cn.koalocatext_default.csv`.
Only these three `Texto` cells changed; the UTF-8 BOM, 65,135 records,
key order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings remain.

## `default` ID 57433

Decision D-17301 authorizes this targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 57433 | `안타깝게도 이건은 내가 돌보는 아이들 중 하나일 뿐이야. 이곳에는 세월과 경험의 짐을 짊어진 이들이 많아.` | `안타깝게도 이건은 내가 돌보는 사람들 중 하나일 뿐이야. 이곳에는 세월과 경험의 짐을 짊어진 이들이 많아.` | English `charges` is broader than children; Japanese says disciple and Chinese subordinate. Use a non-narrowing Korean term pending context. |

Pre-edit SHA-256:
`c9e190f6d25a07ad6cc935f83387f99ab85ed7ca74fbdd827bae35bd3f950d2e`.
Post-edit SHA-256:
`04e69b1a162f330c2191be2575b28400b66b82fc9811e41b2f4ed2031b6b68bd`.
The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-57401/locatexts_zh_cn.koalocatext_default.csv`.
Only this `Texto` cell changed in this batch; the UTF-8 BOM, 65,135
records, key order, 72,045 CRLF endings, and 39 bare-LF endings are retained.

## `default` IDs 57356, 57368, and 57396

Decisions D-17276, D-17279, and D-17286 authorize these targeted
`Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 57356 | `이 대상에 새로 합류했나? 내 충고를 듣게. 항상 한쪽 눈은 뜨고 있어. 이 오합지졸은 아무도 믿지 마.` | `이 상단에 새로 합류했나? 내 충고를 듣게. 항상 경계를 늦추지 마. 이 오합지졸은 아무도 믿지 마.` | Translate the caravan as a merchant group and render the vigilance idiom naturally. |
| 57368 | `모두 잘 들어라! 이미 들었겠지만, 발라드의 전당에 드문 자리가 하나 비었다!` | `모두 잘 들어라! 이미 들었겠지만, 발라드의 집에 드문 공석이 생겼다!` | Reuse the accepted House of Ballads term and clarify an open position. |
| 57396 | `물약 이름은 기억나지 않아요. 놀랍지도 않죠. 제 이름조차 기억하지 못하니까요. 그게 erron… erroni… 거짓말쟁이가 치르는 대가예요.` | `물약 이름은 기억나지 않아요. 놀랍지도 않죠. 제 이름조차 기억하지 못하니까요. 거짓... 거짓말쟁이가 치르는 대가예요.` | Localize the stammer and self-correction rather than leaving English inside Korean dialogue. |

The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-57351/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `36ea4753de9b50fcd5459c76ad29ff0b7b0ca228acf43934b429fb3b22a34a4a`).
Post-edit CSV SHA-256:
`c9e190f6d25a07ad6cc935f83387f99ab85ed7ca74fbdd827bae35bd3f950d2e`.
Only these three `Texto` cells changed. The UTF-8 BOM, 65,135 records, key
order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are preserved.

## `default` IDs 57307, 57339, and 57347

Decisions D-17261, D-17267, and D-17270 authorize these targeted
`Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 57307 | `이 언덕에서 본 것만 알고 있어. 페이는 야생의 종족이고 자연과 긴밀히 이어져 살아가지. 선교회에 있는 우리는 그 관계를 경이롭게 여겨.` | `이 언덕에서 본 것만 알고 있어. 페이는 야생의 종족이고 자연과의 친밀한 관계에서 영감을 얻지. 선교회에 있는 우리는 그 관계를 경이롭게 여겨.` | Preserve the source's claim that the Fae are inspired by their intimacy with nature. |
| 57339 | `내 선택이었다면 그 노인은 살려 줬을 거야. 하지만 용맹의 전당의 경기는 죽을 때까지 싸우는 거니까.` | `내 선택이었다면 그 노인은 살려 줬을 거야. 하지만 용맹의 집에서 벌어지는 경기는 죽을 때까지 싸우는 거니까.` | Reuse the accepted House of Valor term and retain the fatal rule. |
| 57347 | `우리 둘이 새로운 계절을 열고, 나란히 발라드의 전당을 다스리는 거야. 윈더미어의 시녀는 이제 악역 연기를 끝냈어.` | `우리 둘이 새로운 계절을 열고, 나란히 발라드의 집을 다스리는 거야. 윈더미어의 시녀는 이제 악역 연기를 끝냈어.` | Reuse the accepted House of Ballads form `발라드의 집`; the Maid title remains open under D-17271. |

The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-57301/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `dfd47516558f6c69796ee462e09e914808fe8f5c3fb5e6bf5f559f968b39888b`).
Post-edit CSV SHA-256:
`36ea4753de9b50fcd5459c76ad29ff0b7b0ca228acf43934b429fb3b22a34a4a`.
Only these three `Texto` cells changed. The UTF-8 BOM, 65,135 records, key
order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are preserved.

## `default` IDs 57264, 57280, 57287, 57292, and 57297

Decisions D-17249, D-17253, D-17255, D-17257, and D-17258 authorize these
targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 57264 | `행운의 시녀` | `행운의 시녀호` | Japanese and Chinese identify this proper name as a ship. |
| 57280 | `용맹의 전당` | `용맹의 집` | Reuse the accepted House of Valor term from D-148. |
| 57287 | `네가 도와주면 보상하겠다고 약속했었지. 기꺼운 마음은 아니지만, 여기 돈이야. 이제 날 혼자 내버려 둬.` | `네가 해 준 일에 보상하겠다고 약속했었지. 기꺼운 마음은 아니지만, 여기 돈이야. 이제 날 혼자 내버려 둬.` | The service was completed before this promised compensation is paid; remove the unsupported future condition. |
| 57292 | `질서의 흔적` | `질서의 겉모습` | Match English/Japanese “semblance/appearance” without adding an explicit illusion. |
| 57297 | `우린 불리한 조건으로 싸우니까, 우리한테 돈을 걸 도박꾼은 별로 없을 거야.` | `우리에게 불리한 조건이 있으니, 우리 쪽에 돈을 걸 도박꾼은 별로 없을 거야.` | Remove the unsupported activity “fight”; English and Japanese only establish a handicap. |

The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-57251/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `9b4ef4ac64ab27cb1a8a690cbca4bca92e27f1089798afea32af8991cacaec2c`).
Post-edit CSV SHA-256:
`dfd47516558f6c69796ee462e09e914808fe8f5c3fb5e6bf5f559f968b39888b`.
Only these five `Texto` cells changed. The UTF-8 BOM, 65,135 records, key
order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are preserved.

## `default` IDs 57216 and 57229

Decisions D-17235 and D-17239 authorize these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 57216 | `우린 네게 정말 많은 걸 받았어. 신들이 우리 민족의 삶에, 내 삶에 처음부터 자비와 영향력을 베풀어 왔다는 걸 이제야 알겠어.` | `우린 네게 정말 많은 걸 받았어. 신들이 줄곧 우리 민족의 삶에, 내 삶에 자비를 베풀고 영향을 미쳐 왔다는 걸 이제야 알겠어.` | Render compassion and influence with their natural Korean verb relations and retain the ongoing sense. |
| 57229 | `어디 좀 보자. 참 피부가 희구려, 주군. 나는 필멸자들과 어울리는 걸 좋아하오. 살집이 신선하거든.` | `어디 좀 보자. 참으로 아름다우시구려, 주군. 나는 필멸자들과 어울리는 걸 좋아하오. 살집이 신선하거든.` | Render `fair` as an appearance compliment, supported by Japanese and Chinese, rather than asserting pale skin. The `So fleshy` clause and archaic register remain uncertain under D-17240. |

The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-57201/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `798449b6c6a4705a353159b12699215f307ef6e66d7182740165fc0323f7ceee`).
Post-edit CSV SHA-256:
`9b4ef4ac64ab27cb1a8a690cbca4bca92e27f1089798afea32af8991cacaec2c`.
Only these two `Texto` cells changed. The UTF-8 BOM, 65,135 records, key
order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are preserved.

## `default` IDs 57157, 57165, 57181, and 57199

Decisions D-17218, D-17222, D-17225, and D-17229 authorize these targeted
`Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 57157 | `조툰은 야만적인 종족이지만, 그 잔혹함은 키워 낼 수도 있고 쉽게 억누를 수도 있어.` | `조툰은 야만적인 종족이지만, 그 잔혹함은 쉽게 부추길 수도 있고 쉽게 억누를 수도 있어.` | Make English's equal ease explicit for both fostering and controlling cruelty. |
| 57165 | `들었어? 안원(Anwon) 집안 아들이 독살당했대!` | `들었어? 안원(Anwon) 집안 아들이 독을 먹었대!` | Avoid implying that the poisoning was fatal when no source says the boy died. |
| 57181 | `서둘러. 마을 사람들이 내 형량을 줄이겠다며 날 죽이기로 하기 전에.` | `서둘러. 마을 사람들이 내 형기를 줄여 주겠다며 날 처형하기 전에.` | Preserve the execution/shortened-sentence joke in natural Korean. |
| 57199 | `살가죽을 벗기고, 살을 발라내고, 뼈에서 찢어 놓겠다.` | `네 살가죽을 벗기고 뼈에서 살을 발라내 주마.` | Retain the graphic skin/flesh/bone threat while repairing the unclear final phrase. |

The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-57151/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `ad156bc1d92e5249d20c628cfda8bd8b175d4a1cee1e3acc07ce327bd62f6506`).
Post-edit CSV SHA-256:
`798449b6c6a4705a353159b12699215f307ef6e66d7182740165fc0323f7ceee`.
Only these four `Texto` cells changed. The UTF-8 BOM, 65,135 records, key
order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are preserved.

## `default` ID 55729

D-16809 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `마스터스 탤로우(Master's Tallow)` | `명장의 동물성 지방(Master's Tallow)` | Reuse the accepted animal-fat meaning at D-16246 and D-16267. |

## `default` ID 55738

D-16810 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `모래의 아이(Child of the Dust)` | `먼지의 아이(Child of the Dust)` | Correct sand to dust, matching English and both supporting locale references. The epithet's formal lore status remains open at D-15763. |

The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261010/locatexts_zh_cn.koalocatext_default.before-resume-55701.csv`
(SHA-256 `4a6fe2e92b2eacfdfff0e5907554e3bd78d09e55bc877a8088c1db4487731384`).
Post-edit CSV SHA-256:
`d0fbc04970a351a4ea48aa460287dfc5dfb97205415d4faf7d57808829e20315`.
Only these two `Texto` cells changed. The UTF-8 BOM, 65,135 records, key
order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are preserved.

## `default` IDs 55751-55800

No accepted CSV corrections were authorized in this batch. The CSV remains
byte-identical to its pre-batch backup:
`/private/tmp/ko-translate-backups/20261011/before-resume-55751/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `d0fbc04970a351a4ea48aa460287dfc5dfb97205415d4faf7d57808829e20315`).

## `default` ID 55832

D-16837 authorizes this targeted `Texto` correction:

| Previous Korean | Applied Korean | Rationale |
| --- | --- | --- |
| `그 쌍두 놈들 중 하나가 그걸 억지로 떼어 냈어. 둘이 바보처럼 낄낄거리며 호수로 가져갔지.` | `그 쌍두 놈들 중 하나가 그걸 억지로 떼어 냈어. 마치 바보 한 쌍처럼 낄낄거리며 호수로 가져갔지.` | Restore English `like a pair of fools` as a simile; the previous `둘이` asserted two actual actors. |

The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-resume-55801/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `d0fbc04970a351a4ea48aa460287dfc5dfb97205415d4faf7d57808829e20315`).
Post-edit CSV SHA-256:
`c6ba5ed3d9e55a1ec7f209382408cd8496b29a7a4614794389bf8f95a2eb7c9d`.
Only this `Texto` cell changed. The UTF-8 BOM, 65,135 records, key order,
72,045 CRLF endings, and 39 pre-existing bare-LF endings are preserved.

## `default` IDs 55851-55900

No accepted CSV corrections were authorized in this batch. The CSV remains
byte-identical to its pre-batch backup:
`/private/tmp/ko-translate-backups/20261011/before-resume-55851/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `c6ba5ed3d9e55a1ec7f209382408cd8496b29a7a4614794389bf8f95a2eb7c9d`).

## `default` IDs 55901-55950

No accepted CSV corrections were authorized in this batch. The CSV remains
byte-identical to its pre-batch backup:
`/private/tmp/ko-translate-backups/20261011/before-resume-55901/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `c6ba5ed3d9e55a1ec7f209382408cd8496b29a7a4614794389bf8f95a2eb7c9d`).

## `default` IDs 55951-56000

No accepted CSV corrections were authorized in this batch. The CSV remains
byte-identical to its pre-batch backup:
`/private/tmp/ko-translate-backups/20261011/before-resume-55951/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `c6ba5ed3d9e55a1ec7f209382408cd8496b29a7a4614794389bf8f95a2eb7c9d`).

## `default` IDs 56001-56050

No accepted CSV corrections were authorized in this batch. The CSV remains
byte-identical to its pre-batch backup:
`/private/tmp/ko-translate-backups/20261011/before-resume-56001/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `c6ba5ed3d9e55a1ec7f209382408cd8496b29a7a4614794389bf8f95a2eb7c9d`).

## `default` IDs 56051-56100

D-16923, D-16929, and D-16930 authorize these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56051 | `사령부의 명령으로 우리는 클루리콘(Klurikon)에 잠복해 있었어. 몇 달 동안 그곳에서 쥐와 시체에서 노획한 보급품으로 버텼지.` | `사령부의 명령으로 우리는 클루리콘(Klurikon)에 주둔했어. 몇 달 동안 그곳에서 쥐와 시체에서 노획한 보급품으로 버텼지.` | English and both supporting locales describe the unit as stationed there; `잠복` adds unsupported concealment. |
| 56095 | `전쟁에서 정말 이긴 걸까? 동생을 다시 볼 수만 있다면 뭐든 내놓을 텐데.` | `전쟁에서 정말 이긴 걸까? 형제를 다시 볼 수만 있다면 뭐든 내놓을 텐데.` | English `brother` does not specify relative age. |
| 56096 | `왜, 거의 인간이나 다름없군.` | `아니, 거의 인간이나 다름없군.` | Render exclamatory `Why` as an interjection, not a question. |

The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-resume-56051-verified/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `c6ba5ed3d9e55a1ec7f209382408cd8496b29a7a4614794389bf8f95a2eb7c9d`).
Post-edit CSV SHA-256:
`e55637753c1659eb334d2712913c14bfc9c4a6e1fc20563106f27eab670e0609`.
Only these three `Texto` cells changed. The UTF-8 BOM, 65,135 records,
key order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are
preserved.

## `default` IDs 56101-56150

D-16937, D-16942, D-16944, and D-16945 authorize these targeted `Texto`
corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56110 | `- 해군 제독 개릭` | `- 해군 준장 개릭` | `Commodore` is a lower naval rank than admiral; Chinese `海军准将` corroborates. |
| 56136 | `그녀를 찾으면 다른 곳에 안전한 피신처를 마련하라고 해. 그녀 같은 말썽은 이제 지긋지긋해.` | `그녀를 찾으면 다른 곳에 안전한 피신처를 마련하라고 해. 그녀가 일으키는 말썽은 이제 지긋지긋해.` | Restore the source relation and natural Korean phrasing. |
| 56149 | `이 목걸이는 금빛 광채로 빛난다.` | `이 부적은 금빛 광채로 빛난다.` | English/Japanese say `amulet` and Chinese says `护符`; the source does not specify a necklace. |
| 56150 | `스레시(Thresh)는 동료들에게 둘러싸여 있어.` | `스레시(Thresh)는 동료들을 곁에 모아 두고 있어.` | Preserve Thresh as the agent who surrounds itself with allies. |

The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-resume-56101/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `e55637753c1659eb334d2712913c14bfc9c4a6e1fc20563106f27eab670e0609`).
Post-edit CSV SHA-256:
`a9eaeccaef312cf6d6349156732dbb985ae562d4dcd942331dde8f73e9403ab6`.
Only these four `Texto` cells changed. The UTF-8 BOM, 65,135 records,
key order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are
preserved.

## `default` IDs 56151-56200

D-16950 and D-16957 authorize these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56156 | `착용자의 마나 재생을 돕도록 마법이 깃든 천 손목 붕대.` | `착용자의 마나 재생을 돕도록 마법이 깃든 천 손싸개.` | Reuse the established Korean rendering of English `Handwraps` in the active `base` items. |
| 56177 | `제법 빛이 바랬군. 지금 손질할 시간은 없지만... 내가 가져가지. 자, 여기.` | `제법 광택이 죽었군. 지금 손질할 시간은 없지만... 내가 가져가지. 자, 여기.` | Render `tarnished` as lost surface sheen; the referent/transaction remains separately uncertain. |

The byte-identical pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-resume-56151/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `a9eaeccaef312cf6d6349156732dbb985ae562d4dcd942331dde8f73e9403ab6`).
Post-edit CSV SHA-256:
`1e2a0f49b3b74f7510c7d9cae6da1a52b73eb10c2aa5b6a0f60b625618888390`.
Only these two `Texto` cells changed. The UTF-8 BOM, 65,135 records,
key order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are
preserved.

## `default` IDs 56201-56250

No translation CSV cells were changed. The 12 uncertain findings and 38
`not an issue` IDs are recorded in
[`disposition-batch-default-56201-56250-20261011.md`](disposition-batch-default-56201-56250-20261011.md).
The active CSV remains at SHA-256
`1e2a0f49b3b74f7510c7d9cae6da1a52b73eb10c2aa5b6a0f60b625618888390`.
The pre-disposition byte-identical backup is
`/private/tmp/ko-translate-backups/20261011/before-resume-56201/locatexts_zh_cn.koalocatext_default.csv`.

## `default` IDs 56251-56300

D-16980, D-16982, D-16984, D-16989, and D-16990 authorize five targeted
`Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56260 | `...크루독(Crudok)은 이제 더는 단순한 청소부가 아니야.` | `...크루독(Crudok)은 이제 단순히 사체를 뒤지는 짐승이 아니야.` | Render the creature's `scavenger` role without the human-janitor sense of `청소부`. |
| 56265 | `이사는 정원의 창조를 설명하는 이 책을 거의 아무도 읽지 않은 듯하다. 책을 펼치면 제본이 아직도 삐걱거린다.` | `이사(Ysa)의 정원(Gardens of Ysa)이 어떻게 생겨났는지 설명하는 이 책은 거의 읽히지 않은 듯하다. 책을 펼치면 제본에서 아직도 삐걱거리는 소리가 난다.` | Restore the book as the sentence subject and reuse the accepted Ysa place-name form. |
| 56272 | `망치를 들어야 위기를 넘길 수 있다고? 그게 바로 옳고, 전쟁에 맹세한 자다운 모습이지.` | `망치를 들어야 위기를 넘길 수 있다고? 그게 바로 옳은 선택이자 전쟁에 맹세한 자다운 모습이지.` | Repair the parallel construction while retaining the source's right/Sworn-to-War wordplay. |
| 56282 | `이 서류들은 용맹의 전당 도박장의 도박 장부다.` | `이 서류들은 용맹의 집 도박장 장부다.` | Reuse the accepted House of Valor form `용맹의 집`. |
| 56286 | `이 발라드의 전당 에코스톤은 ...` | `이 발라드의 집 에코스톤은 ...` | Reuse the accepted House of Ballads form `발라드의 집`; Echostone terminology remains separately uncertain. |

Pre-edit CSV SHA-256:
`1e2a0f49b3b74f7510c7d9cae6da1a52b73eb10c2aa5b6a0f60b625618888390`.
Post-edit CSV SHA-256:
`787cc7ca3afcaef02a1b5c937c9a4c4f154b7372fe48eef81ccec40b561188f9`.
Only the five approved `Texto` cells changed. UTF-8 BOM, 65,135 records,
key order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are
preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-resume-56251/locatexts_zh_cn.koalocatext_default.csv`.

## `default` IDs 56301-56350

D-16995 and D-16996 authorize these two targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56325 | `저는 결계 해제를 수련하는 보잘것없는 마법사일 뿐입니다. 배우고자 하는 분이라면 누구에게든 제 지식을 나눕니다.` | `저는 마법 해제를 수련하는 보잘것없는 마법사일 뿐입니다. 배우고자 하는 분이라면 누구에게든 제 지식을 나눕니다.` | Reuse the accepted game-skill term for magical dispelling; the source does not specify barriers. |
| 56342 | `분화구 아래쪽에 있어. 건물들이 물 위에 떠 있는 것처럼 보여.` | `분화구 한가운데에 있어. 건물들이 물 위에 떠 있는 것처럼 보여.` | Preserve the crater-center location stated by English, Japanese, and Chinese. |

Pre-edit CSV SHA-256:
`787cc7ca3afcaef02a1b5c937c9a4c4f154b7372fe48eef81ccec40b561188f9`.
Post-edit CSV SHA-256:
`1a5b33cf9783fd63e408de9741903e115e281ed75bbed11aaa478cd320fff5f2`.
Only these two approved `Texto` cells changed. UTF-8 BOM, 65,135 records,
key order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are
preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-56301/locatexts_zh_cn.koalocatext_default.csv`.
The batch report records the eight uncertain findings and 40 `not an issue`
IDs; these dispositions are not independent final linguistic approval.

## `default` IDs 56351-56400

D-17006 and D-17007 authorize three targeted `Texto` cell corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56359 | `발라드의 전당 문장이자 하프 문장이 새겨진 반지.` | `발라드의 집을 상징하는 하프 문장이 새겨진 반지.` | State the single harp crest of the House of Ballads and reuse its accepted Korean name. |
| 56360 | `점술가` | `예언자` | Reuse the accepted Korean rendering of the generic `Augur` term. |
| 56393 | `점술가` | `예언자` | Align the repeated bare `Augur` label with ID 56360 and accepted D-13012. |

Pre-edit CSV SHA-256:
`1a5b33cf9783fd63e408de9741903e115e281ed75bbed11aaa478cd320fff5f2`.
Post-edit CSV SHA-256:
`1df89014fff45dd2484bc50157f47be409e969ba64dc15ad87c497ce647e7c43`.
Only these three approved `Texto` cells changed. UTF-8 BOM, 65,135 records,
key order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are
preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-56351/locatexts_zh_cn.koalocatext_default.csv`.
The ten uncertain findings include separate Augur-title questions at the
two accepted IDs. Literal backslash-quote text at ID 56377 was left intact.

## `default` IDs 56401-56450

D-17019 through D-17022 authorize four targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56414 | `물리적 묘사로 보면 크로우 피크일 수 있어. 멀진 않지만 위험한 곳이야.` | `지형에 관한 묘사로 보면 크로우 피크일 수도 있어. 멀진 않지만 위험한 곳이야.` | Clarify that the physical description concerns geographic features and preserve the tentative match. |
| 56420 | `네가 피리를 분다고 들었어.` | `네가 플루트를 분다고 들었어.` | Match the Western flute explicitly named by English and Japanese. |
| 56426 | `과거를 보존하려고. 우리 주위에는 진보라는 거대한 끌과 망치가 도사리며, 내 백성을 깨우침으로 끌고 가려 하지.` | `과거를 보존하려고. 우리 주위에는 진보라는 거대한 끌과 망치가 있고, 내 백성을 깨우침으로 끌고 가려 해.` | Keep the progress/enlightenment image without the unintended lurking implication. |
| 56428 | `용맹의 전당은 최고의 전사들만큼이나 웅장해. 달렌타스처럼 먼 곳에서도 경기를 보러 사람들이 찾아와.` | `용맹의 집은 최고의 전사들만큼이나 웅장해. 달렌타스처럼 먼 곳에서도 경기를 보러 사람들이 찾아와.` | Reuse the established House of Valor name `용맹의 집`. |

Pre-edit CSV SHA-256:
`1df89014fff45dd2484bc50157f47be409e969ba64dc15ad87c497ce647e7c43`.
Post-edit CSV SHA-256:
`54558f9e0ff43277084861328d8d69bfc931d53f76f9c3032fbc564cacd9ad44`.
Only these four approved `Texto` cells changed. UTF-8 BOM, 65,135 records,
key order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are
preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-56401/locatexts_zh_cn.koalocatext_default.csv`.
The batch report records six uncertain findings and 40 `not an issue` IDs;
these working dispositions are not independent final linguistic approval.

## `default` IDs 56451-56500

D-17030 authorizes one targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56485 | `챔피언, 네가 꺾어야 할 상대인가 보군.` | `챔피언, 네가 바로 모두가 꺾어야 할 상대인가 보군.` | English, Japanese, and Chinese identify the Champion as the opponent others must defeat; the previous wording reversed who must defeat whom. |

Pre-edit CSV SHA-256:
`54558f9e0ff43277084861328d8d69bfc931d53f76f9c3032fbc564cacd9ad44`.
Post-edit CSV SHA-256:
`6bcc9c3d1d1c1f37300e3a7bb7f40dd2aaa2a36a5e11333a76063777369289a2`.
Only this approved `Texto` cell changed. UTF-8 BOM, 65,135 records,
key order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are
preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-56451/locatexts_zh_cn.koalocatext_default.csv`.
The batch report records seven uncertain findings and 42 `not an issue`
IDs; these working dispositions are not independent final linguistic
approval.

## `default` IDs 63501-63550

D-18073 authorizes one targeted `Texto` correction at ID 63507:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 63507 | `내레이터가 자기 배역을 맡으러 오지 않았어! 마지막 장면은 내가 아니라 네가 대신 연기해야 해!` | `내레이터가 자기 배역을 맡으러 오지 않았어! 마지막 장면은 그 여자 대신 나와 함께 연기해야 해!` | English says the player performs with the speaker in the absent woman's stead; the previous Korean incorrectly made the player replace the speaker. |

Pre-edit CSV SHA-256:
`3f740bae45ce2332ed842127147c97a1d4e73aac863c0fafc93271e8d8459daa`.
Post-edit CSV SHA-256:
`ad661f7654a15da4ecf11c58b7821c9576343dff8f4fb3313e064c90442d35e7`.
Only the approved `Texto` field at ID 63507 changed. The UTF-8 BOM, 65,135
records, key order, lineation, and CRLF record endings are preserved.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-63501/locatexts_zh_cn.koalocatext_default.csv`.

D-18074 records 11 uncertain findings and D-18075 records 38 `not an issue`
IDs. See
[`disposition-batch-default-63501-63550-20261011.md`](disposition-batch-default-63501-63550-20261011.md).
Corrected cumulative counts: 1,815 accepted, 16,072 `not an issue`, and
12,468 uncertain (30,355 dispositions). Resume at ID 63551; 1,584 IDs remain.

## `default` IDs 63551-63600

D-18076 authorizes two targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 63562 | `... 우리가 모르는 걸 밝혀 줄 수 있는 사람은 한 명뿐인데, 내가 아는 사람 중엔 그 사람밖에 없어.` | `... 우리가 모르는 것을 밝혀 줄지도 모를 사람은 내가 아는 한 그 사람뿐이야.` | Remove the repeated “only one” clause while preserving the English meaning and uncertainty. |
| 63600 | `생략의 장막(Shroud of Omission)` | `망각의 장막(Shroud of Omission)` | Match the named item's forgetfulness effect and the established Korean term used elsewhere. |

Pre-edit CSV SHA-256:
`ad661f7654a15da4ecf11c58b7821c9576343dff8f4fb3313e064c90442d35e7`.
Post-edit CSV SHA-256:
`9379f24bcb2691d7916d93732286ad2f063a824cce050378fb65704220517ae1`.
Only the approved `Texto` fields at IDs 63562 and 63600 changed. The UTF-8
BOM, 65,135 records, key order, lineation, and CRLF record endings are
preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-63551/locatexts_zh_cn.koalocatext_default.csv`.

D-18077 records 11 uncertain findings and D-18078 records 37 `not an issue`
IDs. See
[`disposition-batch-default-63551-63600-20261011.md`](disposition-batch-default-63551-63600-20261011.md).
Corrected cumulative counts: 1,817 accepted, 16,109 `not an issue`, and
12,479 uncertain (30,405 dispositions). Resume at ID 63601; 1,534 IDs remain.

## `default` IDs 63601-63650

D-18079 authorizes one targeted `Texto` correction at ID 63603:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 63603 | `다시 말해, 대사제는 특정한 누구여서는 안 돼.` | `다시 말해, 대사제는 특정한 인물이어선 안 돼.` | English/Japanese require the Hierophant not to be an identifiable person; make the Korean natural and explicit. |

Pre-edit CSV SHA-256:
`9379f24bcb2691d7916d93732286ad2f063a824cce050378fb65704220517ae1`.
Post-edit CSV SHA-256:
`44aafb7ee493c258c27eb308d6a4ffabcc53db9b770dc1fc22da86bcd20b5929`.
Only the approved `Texto` field at ID 63603 changed. The UTF-8 BOM, 65,135
records, key order, lineation, runtime markers, and CRLF record endings are
preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-63601/locatexts_zh_cn.koalocatext_default.csv`.

D-18080 records 12 uncertain findings and D-18081 records 37 `not an issue`
IDs. See
[`disposition-batch-default-63601-63650-20261011.md`](disposition-batch-default-63601-63650-20261011.md).
Corrected cumulative counts: 1,818 accepted, 16,146 `not an issue`, and
12,491 uncertain (30,455 dispositions). Resume at ID 63651; 1,484 IDs remain.

## `default` IDs 63651-63700

No translation CSV cells were changed. The 12 uncertain findings and 38
`not an issue` IDs are recorded in
[`disposition-batch-default-63651-63700-20261011.md`](disposition-batch-default-63651-63700-20261011.md).
The active default CSV remains at SHA-256
`44aafb7ee493c258c27eb308d6a4ffabcc53db9b770dc1fc22da86bcd20b5929`,
byte-identical to the batch-start backup:
`/private/tmp/ko-translate-backups/20261011/before-63651/locatexts_zh_cn.koalocatext_default.csv`.
Corrected cumulative counts: 1,818 accepted, 16,184 `not an issue`, and
12,503 uncertain (30,505 dispositions). Resume at ID 63701; 1,434 IDs remain.

## `default` IDs 63701-63750

D-18084 authorizes one targeted `Texto` correction at ID 63708:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 63708 | `{*1\\\"징벌\\\"}과 {*1\\\"야만의 날개\\\"} 특수 공격으로 운명을 추가 획득한다.` | `{*1징벌}과 {*1야만의 날개} 특수 공격으로 운명을 추가 획득한다.` | Remove literal backslashes and quotes that are not in the English/Chinese marker payloads or the established Korean occurrence at 10890; preserve both marker identities and order. |

Pre-edit CSV SHA-256:
`44aafb7ee493c258c27eb308d6a4ffabcc53db9b770dc1fc22da86bcd20b5929`.
Post-edit CSV SHA-256:
`ff85c0bde3c2e577f690e25742121272b3aaa871fc13d8c8b21a44b62a5641da`.
Only the approved `Texto` field at ID 63708 changed. The UTF-8 BOM, 65,135
records, key order, lineation, marker order, and CRLF record endings are
preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-63701/locatexts_zh_cn.koalocatext_default.csv`.

D-18085 records nine uncertain findings and D-18086 records 40
`not an issue` IDs. See
[`disposition-batch-default-63701-63750-20261011.md`](disposition-batch-default-63701-63750-20261011.md).
Corrected cumulative counts: 1,819 accepted, 16,224 `not an issue`, and
12,512 uncertain (30,555 dispositions). Resume at ID 63751; 1,384 IDs remain.

## `default` IDs 56601-56650

D-17057 and D-17058 authorize two targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56607 | `에테네(Ethene)의 의도가 여기 있다는 걸 아직도 모르겠나? 네 목적과 그녀의 목적을 아직도 모르는 건가?` | `이 일에서 에테네(Ethene)의 의도를 아직도 알아차리지 못했나? 네 목적과 그녀의 목적도 아직 모르겠나?` | Restore the English meaning that Ethene's intent is evident in the situation rather than located physically “here.” |
| 56626 | `돈으로 갚을게.($SQ151.bribe_value$ 골드)` | `돈을 줄 수 있어. ($SQ151.bribe_value$ 골드)` | Offer payment as in English and both supporting references; remove the unintended existing-debt implication. |

Pre-edit CSV SHA-256:
`3fa42c7ff19c4d46a170905301d11ba82ca7a0a5032aa0a72300f95ea183a152`.
Post-edit CSV SHA-256:
`f80c024f19146d908fedda90a671a23b6a0687e6bfed8711707f03d741742415`.
Only these two approved `Texto` cells changed. UTF-8 BOM, 65,135 records,
key order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are
preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-56601/locatexts_zh_cn.koalocatext_default.before-56601-retry.csv`.
The disposition report records six uncertain findings and 42 `not an issue`
IDs; these working dispositions are not independent final linguistic
approval.

## `default` IDs 56651-56700

D-17066 through D-17069 authorize four targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56657 | `... 첫 생애를 계절의 전당 안내자로 보내며 위대한 순환의 흐름을 믿고 그 소리에 귀 기울이는 법을 배웠지.` | `... 초기의 여러 생애를 계절의 전당 안내자로 보내며, 위대한 순환의 흐름을 믿고 귀 기울이는 법을 배웠지.` | Follow English “first lifetimes” and Chinese “earliest several lives”; the old Korean made this singular. |
| 56661 | `... 연금술 작업대를 개조하고 싶어 하지만 ...` | `... 연금술 연구실을 개조하고 싶어 하지만 ...` | Match `Alchemy Lab` in English and the laboratory readings in Japanese and Chinese. |
| 56669 | `바쁘고 바쁘고 또 바쁘고… 이사가 맡은 관리인의 일이란 그렇지.` | `바쁘고 바쁘고 또 바쁘고… 이사(Ysa)에서 관리인으로 일하는 게 원래 그렇지.` | Clarify Ysa as the location of the steward role, following English and Chinese rather than Japanese's roster-clerk divergence. |
| 56680 | `곤란하군. 이제 크릴가린(Crilgarin)은 우리를 이끌어 줄 수 없어. 이 숲에서 살아갈 새로운 방법을 찾아야 해.` | `곤란하군. 이제 우리를 이끌어 줄 크릴가린(Crilgarin)은 여기에 없어. 이 숲에서 살아갈 새로운 방법을 찾아야 해.` | Restore English/Japanese that Crilgarin is no longer present to guide the group, not that he is unable to guide them. |

Pre-edit CSV SHA-256:
`f80c024f19146d908fedda90a671a23b6a0687e6bfed8711707f03d741742415`.
Post-edit CSV SHA-256:
`3bf94770a4c0c387f7eb4e7e5ff2b9990671608e49574a525cbd6da6e1a7db3f`.
Only these four approved `Texto` cells changed. UTF-8 BOM, 65,135 records,
key order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are
preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-56651/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records 13 uncertain findings (one overlaps accepted
ID 56657) and 34 `not an issue` IDs; these working dispositions are not
independent final linguistic approval.

## `default` IDs 56901-56950

D-17152 authorizes this targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56919 | `이 야영지는 음유시인과 가수, 곡예사와 저글러, 그리고 막이 내린 뒤에도 함께하는 이들의 터전이야.` | `이 야영지는 음유시인과 가수, 곡예사와 저글러, 커튼콜을 하는 이들의 터전이야.` | Restore the curtain-call performance image in the source and supporting locales. |

Pre-edit CSV SHA-256:
`41e22e7989b15ea6f2e8e459f30c566fa4e9c1c6272d6eba6796c4223f9e6b48`.
Post-edit CSV SHA-256:
`333016dfb93c55119c1093c64e26fd8e9885ee6ed575f4eca994383a102ffe3a`.
Only this `Texto` cell changed. UTF-8 BOM, 65,135 records, key order,
72,045 CRLF endings, and 39 pre-existing bare-LF endings are preserved.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-56901/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records 13 uncertain findings and 36 `not an issue`
IDs; ID 56950 is reviewed once here as the first row in historical range
`56950-57049`.

## `default` IDs 56851-56900

D-17132 and D-17133 authorize these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56877 | `하지만 우리만 싸우는 건 아니야. 에라셀 평원에는 이 싸움에서 너무 오래 떠나 있던 사람이 있어. 틸레라 장군에게 연락할 때가 됐어.` | `하지만 우리만 싸우는 건 아니야. 에라셀 평원에는 이 게임을 너무 오래 떠나 있던 플레이어가 있어. 이제 틸레라 장군에게 연락할 때가 됐어.` | Restore the explicit player/game reference in English and Chinese; remove the unsupported fight-only interpretation. |
| 56900 | `내가 웨인 에문다스(W. Emundas), 친구여. 무엇을 도와드릴까? 우리 사이는 특별하고, 오래도록 이어질 테니.` | `친구여, 웨인 에문다스(W. Emundas)가 무엇을 도와드릴 수 있을까? 우리 사이는 특별하고, 오래도록 이어질 테니.` | Repair the sentence fragment and restore the service offer while preserving the following relationship statement. |

Pre-edit CSV SHA-256:
`6c1897f4b72f83cb6fc239034020ac249cb31c6c950c68b89255d13ddcfb4244`.
Post-edit CSV SHA-256:
`41e22e7989b15ea6f2e8e459f30c566fa4e9c1c6272d6eba6796c4223f9e6b48`.
Only these two `Texto` cells changed. UTF-8 BOM, 65,135 records, key
order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are
preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-56851/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records 17 uncertain findings and 31 `not an issue`
IDs; these working dispositions are not independent final linguistic
approval.

## `default` IDs 56801-56850

D-17117 through D-17119 authorize these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56809 | `활 강공격으로 충전 화살 3발을 발사합니다.` | `활의 충전 사격으로 충전 화살 3발을 발사합니다.` | Distinguish the Charged Shot ability from a heavy attack and reuse the established Korean wording at ID 6911. |
| 56816 | `이 시체에서 '아스터 상속권 찾기'라는 제목의 쪽지가 나왔다.` | `이 시체에서 '아스터의 유산 찾기'라는 제목의 쪽지가 나왔다.` | Render the inheritance/property being sought, rather than a legal right to inherit. |
| 56836 | `네 손에 피를 묻혔어.` | `네 손에 피가 묻었어.` | Preserve the blame idiom in natural Korean. |

Pre-edit CSV SHA-256:
`e051f447e5776fc286aaf2d9374391ef67e817189f4a961477f4758abf2d0c09`.
Post-edit CSV SHA-256:
`6c1897f4b72f83cb6fc239034020ac249cb31c6c950c68b89255d13ddcfb4244`.
Only these three `Texto` cells changed. UTF-8 BOM, 65,135 records, key
order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are
preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-56801/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records 11 uncertain findings (one overlaps an
accepted ID) and 37 `not an issue` IDs; these working dispositions are not
independent final linguistic approval.

## `default` IDs 56751-56800

D-17102 and D-17103 authorize these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56753 | `그리고 너… 네 보상은 이미 정해졌다. 고통 없이 죽여 주마.` | `그리고 너… 네 보상은 이미 정해졌다. 단숨에 죽여 주마.` | Preserve the swift-death threat without adding that the death is painless. |
| 56770 | `다 헛소문일 뿐이야. 아카라는 이 섬 사람들에게 아무 관심도 없어. 관심이 있었다면 왜 우리 어머니를 구하지 않았겠어?` | `그저 이야기일 뿐이야. 아카라는 이 섬 사람들에게 아무 관심도 없어. 관심이 있었다면 왜 우리 어머니를 구하지 않았겠어?` | Remove the unsupported assertion that the stories are false rumors. |

Pre-edit CSV SHA-256:
`9a9de031a99b2130e038b93654e5500ae56c40df2bb88239762575f51bc89039`.
Post-edit CSV SHA-256:
`e051f447e5776fc286aaf2d9374391ef67e817189f4a961477f4758abf2d0c09`.
Only these two `Texto` cells changed. UTF-8 BOM, 65,135 records, key
order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are
preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-56751/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records 12 uncertain findings and 36 `not an issue`
IDs; these working dispositions are not independent final linguistic
approval.

## `default` IDs 56701-56750

D-17085 authorizes one targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56734 | `여기가 볼간의 땅인 줄 몰라? 저 붉은 악마들이 단단히 자리 잡고 있어.` | `여기가 볼간의 땅인 줄 몰라? 저 붉은 악마들이 진지를 단단히 구축하고 있어.` | Restore the explicit military-entrenchment image in English `digging in`, supported by Japanese and Chinese. |

Pre-edit CSV SHA-256:
`3bf94770a4c0c387f7eb4e7e5ff2b9990671608e49574a525cbd6da6e1a7db3f`.
Post-edit CSV SHA-256:
`9a9de031a99b2130e038b93654e5500ae56c40df2bb88239762575f51bc89039`.
Only this approved `Texto` cell changed. UTF-8 BOM, 65,135 records,
key order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are
preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-56701/locatexts_zh_cn.koalocatext_default.csv`.
The disposition report records 15 uncertain findings and 34 `not an issue`
IDs; these working dispositions are not independent final linguistic
approval.

## `default` IDs 62801-62850

D-18029-D-18031 authorize these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 62839 | `... 라고시와 히로나라 수없이 죽이며 피로 물들였지.` | `... 수많은 라고시와 히로나라의 피로 물들어 있지.` | Restore the source's passive description of the hammer as bloodstained without adding an explicit killer. |
| 62843 | `달빛 야영지` | `달 야영지` | Align this `Moon Camp` label with the established project form. |
| 62849 | `매딩 윈드 좌측 감옥 열쇠` | `매딩 윈드 좌측 목책 열쇠` | Preserve `Stockade` as a named sub-area rather than translating it as a generic prison. |

Pre-edit CSV SHA-256:
`7832a31c1c60901077468513678aca8f1445970ddb4aa067f906e5e41980202a`.
Post-edit CSV SHA-256:
`8195382d5065ec32df5c4b42d1dee026a3e17fdfd11db9a500b3e4115ed19f3a`.
Only the approved `Texto` cells at 62839, 62843, and 62849 changed. UTF-8
BOM, 65,135 records, key order, and outer CSV record separators are preserved.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-62801/locatexts_zh_cn.koalocatext_default.csv`.

## `default` IDs 62751-62800

D-18026 authorizes one targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 62793 | `가장 큰 위험은 눈에 잘 띄지 않는다." - 페이 속담.` | `"가장 큰 위험은 눈에 잘 띄지 않는다." - 페이 속담.` | Restore the missing opening quotation mark around the proverb. |

Pre-edit CSV SHA-256:
`b534f41825624ba7b4caccb5655f7c294207a761b34a48d458562cf20fafb494`.
Post-edit CSV SHA-256:
`7832a31c1c60901077468513678aca8f1445970ddb4aa067f906e5e41980202a`.
Only the approved `Texto` cell at ID 62793 changed. UTF-8 BOM, 65,135
records, key order, and outer CSV record separators are preserved.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-62751/locatexts_zh_cn.koalocatext_default.csv`.

## `default` IDs 62701-62750

D-18022 and D-18023 authorize these targeted `Texto` changes:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 62707 | Internal separator: CRLF | Internal separator: LF | Match English, Japanese, and Chinese while preserving the two-line damage/cost block and values. |
| 62722 | `우리가 아는 가장 가까운 상인은 선술집 주인 한 테트란(Han Tetran)이야.` | `우리에게 상인이라고 할 만한 사람은 선술집 주인 한 테트란(Han Tetran)이야.` | Translate “closest thing we have to a merchant” as an approximate role, not a nearby merchant. |

Pre-edit CSV SHA-256:
`1c4be3fd1d8e74998f83ff3fbb57b8ea8254936b88045ce73c424c8ec18dd6ac`.
Post-edit CSV SHA-256:
`b534f41825624ba7b4caccb5655f7c294207a761b34a48d458562cf20fafb494`.
Only the approved `Texto` cells at 62707 and 62722 changed. UTF-8 BOM,
65,135 records, key order, total newline count, and outer CSV record
separators are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-62701/locatexts_zh_cn.koalocatext_default.csv`.

## `default` IDs 62651-62700

D-18016-D-18019 authorize these targeted `Texto` changes:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 62652 | Two internal separators: CRLF | Two internal separators: LF | Match all three reference locales while retaining the three-line damage block and values. |
| 62667 | `미사루 기사단 소속 성인 오드위그(Odwig)` | `미사루 교단 소속 성인 오드위그(Odwig)` | Remove the unsupported implication that the Order of Mitharu is specifically a knightly order. |
| 62676 | `... 그가 도와 달라고 한 실험을 맡아야겠다.` | `... 그가 도와 달라고 한 실험을 도와야겠다.` | Preserve the requested assistance without implying the speaker takes charge of the experiment. |
| 62683 | `... 비극에만 매달리는 법은 이제 잊었어.` | `... 비극에만 매달리지 않는 법을 배웠어.` | Restore “learned not to dwell on tragedy.” |

Pre-edit CSV SHA-256:
`dae4be7f436581a82dc611bfaa100d1507f3ff898f82c98875c095ee0faaf136`.
Post-edit CSV SHA-256:
`1c4be3fd1d8e74998f83ff3fbb57b8ea8254936b88045ce73c424c8ec18dd6ac`.
Only the approved `Texto` cells at 62652, 62667, 62676, and 62683 changed.
UTF-8 BOM, 65,135 records, key order, total newline count, and outer CSV
record separators are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-62651/locatexts_zh_cn.koalocatext_default.csv`.

## `default` IDs 62601-62650

D-18011-D-18013 authorize these targeted `Texto` changes:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 62610 | Internal separator: CRLF | Internal separator: LF | Match English, Japanese, and Chinese while preserving the two-line damage/cost block and values. |
| 62637 | `... 네가 우리를 이런 꼴로 내버려 두고 갔는데, 내가 왜 놀라겠어?` | `... 네가 우리를 이런 꼴로 만들어 놓았는데, 내가 왜 놀라겠어?` | Restore the source-supported meaning that the addressee caused the group's condition without implying physical abandonment. |
| 62643 | `... 하지만 현명한 노움은 그 도시에서 멀리 떨어져 나가지.` | `... 하지만 현명한 노움은 그 도시를 멀리 떠나.` | Restore the affirmative “goes far away” proverb reading. |

Pre-edit CSV SHA-256:
`816f3ca27b568db9dbd2437449bd71cacd82368fbf5eb0b8e5dff58f23e36c0c`.
Post-edit CSV SHA-256:
`dae4be7f436581a82dc611bfaa100d1507f3ff898f82c98875c095ee0faaf136`.
Only the approved `Texto` cells at 62610, 62637, and 62643 changed. UTF-8
BOM, 65,135 records, key order, total newline count, and outer CSV record
separators are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-62601/locatexts_zh_cn.koalocatext_default.csv`.

## `default` IDs 62501-62550

D-18006 authorizes one targeted `Texto` correction at ID 62520:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 62520 | `흙 위에 세운 신상을 숭배하고,` | `흙바닥에서 숭배하고,` | English says the worship occurs on earthen ground and does not mention a statue. The four embedded verse separators were also normalized from CRLF to LF to match English, Japanese, and Chinese. |

Pre-edit CSV SHA-256:
`8e7373bcd130c6bf662834d3f978be3e1c6d6f0ef93e01a630a1928eac8a4605`.
Post-edit CSV SHA-256:
`816f3ca27b568db9dbd2437449bd71cacd82368fbf5eb0b8e5dff58f23e36c0c`.
Only the approved `Texto` cell and its four internal separators changed.
UTF-8 BOM, 65,135 records, key order, total newline count, and outer CSV
record separators are preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-62501/locatexts_zh_cn.koalocatext_default.csv`.

## `default` IDs 62551-62600

D-18009 records 12 uncertain findings and D-18010 records 38 `not an issue`
IDs. No translation CSV cells were changed. The disposition report is
[`disposition-batch-default-62551-62600-20261011.md`](disposition-batch-default-62551-62600-20261011.md).
The byte-identical batch-start backup is
`/private/tmp/ko-translate-backups/20261011/before-62551/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `816f3ca27b568db9dbd2437449bd71cacd82368fbf5eb0b8e5dff58f23e36c0c`).

## `default` IDs 56551-56600

No translation CSV cells were changed. The eight uncertain findings and 42
`not an issue` IDs are recorded in
[`disposition-batch-default-56551-56600-20261011.md`](disposition-batch-default-56551-56600-20261011.md).
The active CSV remains at SHA-256
`3fa42c7ff19c4d46a170905301d11ba82ca7a0a5032aa0a72300f95ea183a152`.
The byte-identical pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-56551/locatexts_zh_cn.koalocatext_default.csv`.
The source-structure exceptions at IDs 56553, 56572, and 56581 are
documented in the disposition report; Korean preserves the English-aligned
brackets/marker order and English/Japanese poem lineation.

## `default` IDs 56501-56550

D-17039 authorizes one targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56533 | `해안에 떠밀려 왔을 때 찾은 옷이 이게 전부였어.` | `해안에 도착했을 때 찾은 옷은 이게 전부였어.` | English, Japanese, and Chinese say the speaker arrived ashore; remove unsupported passive drift/force. |

Pre-edit CSV SHA-256:
`6bcc9c3d1d1c1f37300e3a7bb7f40dd2aaa2a36a5e11333a76063777369289a2`.
Post-edit CSV SHA-256:
`3fa42c7ff19c4d46a170905301d11ba82ca7a0a5032aa0a72300f95ea183a152`.
Only this approved `Texto` cell changed. UTF-8 BOM, 65,135 records,
key order, 72,045 CRLF endings, and 39 pre-existing bare-LF endings are
preserved. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-56501/locatexts_zh_cn.koalocatext_default.csv`.
The batch report records seven uncertain findings and 42 `not an issue`
IDs; these working dispositions are not independent final linguistic
approval.
# D-18277 and D-18280: Glass of Ambient / Blevins House / Beckoned

The first pre-edit byte-identical backup is
`/private/tmp/ko-translate-backups/20261011/before-glass-of-ambient-D18277/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `bd26350291e42a380af9e6c4bbc25bbe7c584ea613c15bdf225b46a714549dbb`).
D-18277 changes only the `Texto` cells at IDs 582, 4613, 20158, 25871,
31357, 34661, 35698, 38684, 39941, and 59803 to identify the
Glass of Ambient as `앰비언트의 거울` (retaining the existing English
parenthetical where applicable). The intermediate SHA-256 is
`a260b3dd48e9dfa1ad0177c23460fc6c2bcad401e8183a85ddc70db3597d96c5`.
ID 35698 remains dispositioned uncertain for other grouped terms.

The second pre-edit byte-identical backup is
`/private/tmp/ko-translate-backups/20261011/before-blevins-beckoned-D18280/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `a260b3dd48e9dfa1ad0177c23460fc6c2bcad401e8183a85ddc70db3597d96c5`).
D-18280 changes only ID 20270 `블레빈스 가문` to `블레빈스의 집`
and ID 20278's address `선택받은 자여` to `부름받은 자여`.
Post-edit SHA-256:
`3052cafefcc9c4aad4f4801669df82a1cd4dc9f934b8e3f3dd78d72e3199262e`.
The key-prefix and line-ending comparison to each immediate backup
finds only these approved physical lines changed. BOM, 72,011 CRLF
and 73 bare LF endings remain. See
[`context review`](consolidated-context-review-default-20153-20291-glass-20261011.md).
# D-18283: Gorhart amusement, ID 20336

Correct only ID 20336's `Texto`: `그들은 흥미로워` ->
`그들은 날 즐겁게 해`, reflecting English `They amuse me`.
Pre-edit SHA-256
`3052cafefcc9c4aad4f4801669df82a1cd4dc9f934b8e3f3dd78d72e3199262e`;
post-edit SHA-256
`64d798fa418e7b4aaed4e909ddc2a9321a6ebd234cb5f2681c8e9c8d649cf20f`.
Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-amuse-20336-D18283/locatexts_zh_cn.koalocatext_default.csv`.
Only the authorized physical line differs, with the same key and
CRLF ending; BOM, 72,011 CRLF, and 73 bare LF remain unchanged. See
[`context review`](consolidated-context-review-default-20305-20348-20261011.md).
# D-18285: Theft instruction, ID 20397

Correct only the ID 20397 `Texto` fragment `그에게서 되찾아` ->
`그에게서 훔쳐 와`. English does not say the object previously
belonged to the requester; Japanese confirms taking it by theft.
Pre-edit SHA-256:
`64d798fa418e7b4aaed4e909ddc2a9321a6ebd234cb5f2681c8e9c8d649cf20f`.
Post-edit SHA-256:
`40bc1d14a1a85a37ddb5fd9e884b7830fe2adbf2e9a5097c47c39bc48c28e5e8`.
Byte-identical immediate pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-relieve-20397-D18285/locatexts_zh_cn.koalocatext_default.csv`.
Only the approved `Texto` physical line differs; key, CRLF,
BOM, and the 73 pre-existing bare LF endings are preserved.
See [`context review`](consolidated-context-review-default-20351-20399-20261011.md).
# D-18287: Duel second and combat trainer, IDs 20412/20428

Correct ID 20412 `웨일런의 부관` -> `웨일런의 결투 보조자`
and ID 20428 `오리 매드슨`/`병기장 직` ->
`올리 매드슨`/`무술 교관직`. Only these two `Texto`
cells changed. Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-second-master-20412-20428-D18287/locatexts_zh_cn.koalocatext_default.csv`;
pre-edit SHA-256
`40bc1d14a1a85a37ddb5fd9e884b7830fe2adbf2e9a5097c47c39bc48c28e5e8`;
post-edit SHA-256
`7ea36a4aeeb94bcad98be6bd5aebb3fd970a40abccbbe4c98494857b6ac88d54`.
All other bytes match the immediate backup. BOM, 72,011
CRLF and 73 bare LF endings are unchanged. See
[`context review`](consolidated-context-review-default-20401-20500-20261011.md).
# D-18290: The Counsel is a single person, sixteen IDs

Correct `고문단`/`평의회`/`의회`/`자문회` to
the accepted personal title `조언자` only at IDs
1273, 1595, 8915, 9631, 11090, 14384, 18956,
18975, 20685, 21868, 24589, 38661, 56775,
56991, 58798, 62489. English IDs 42824 and 63143
identify the referent as Arkes. Adjust the short
dependent phrase at 38661 and pronoun reference at
56991; do not modify generic or EA Legal Counsel.
Only the sixteen approved `Texto` cells changed.
Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-counsel-person-D18290/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`7ea36a4aeeb94bcad98be6bd5aebb3fd970a40abccbbe4c98494857b6ac88d54`;
post-edit SHA-256:
`bc513e866f76da6bae4f3a3359696e1c4ae6f931d52cc4c69db68375e934cb71`.
BOM, key order, 72,011 CRLF and 73 bare LF
endings match the backup. See
[`context review`](consolidated-context-review-default-counsel-20261011.md).
# D-18291: Quarry targets at IDs 7954 and 20697

The hunted `Quarry:` target is not a `채석장:`.
Correct only IDs 7954 and 20697 to `추적 대상:`,
preserving the Dead Kel/Bloodgrin name segments.
Pre-edit SHA-256:
`bc513e866f76da6bae4f3a3359696e1c4ae6f931d52cc4c69db68375e934cb71`;
post-edit SHA-256:
`8bdd12af6306049626daee573b9f132d33eb14bab372d9abb5643a0ba99f4539`.
Byte-identical immediate pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-quarry-targets-D18291/locatexts_zh_cn.koalocatext_default.csv`.
Only the two approved `Texto` lines differ; BOM,
72,011 CRLF and 73 bare LF endings remain.
See [`context review`](consolidated-context-review-default-20601-20750-20261011.md).
# D-18293-D-18294: Litany objects and Block Efficacy

D-18293 changes only `Texto` at IDs 20802, 20834,
28553, 54923, 57626: `다섯 구절` ->
`연도문 다섯 개` for physical altar objects, and
`방어 효율` -> `막기 효율` for the specific
Block Efficacy stat and melee/ranged/magic subtypes.
All +40% values, quoted CSV cell formatting and
embedded CRLF paragraph/lines at 57626 are preserved.
Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-litanies-block-efficacy-D18293/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`8bdd12af6306049626daee573b9f132d33eb14bab372d9abb5643a0ba99f4539`;
post-edit SHA-256:
`54f6cf481554bf5db31992cbc48080699e60a35945b5212103e3df0bb8bd7fb2`.

D-18294 changes only `Texto` at ID 45634 from
`방어 효율 +22%` to `막기 효율 +22%`.
Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-block-45634-D18294/locatexts_zh_cn.koalocatext_default.csv`;
post-edit SHA-256:
`b6c9c87709fa86a553569210f934cbf4be1ff0474d51b6eacf18656a3c48227f`.
BOM, 65,135 keyed rows, non-target cells, 72,011 CRLF
and 73 bare LF endings survive both edits unchanged.
See [`context review`](consolidated-context-review-default-20751-20850-block-20261011.md).
# D-18296: Small community, property manager, and Idylla

Only `Texto` at default IDs 20889, 20890, and
20960 changed, replacing physical narrowness with
small-community scrutiny, real-estate wording with
facilities management, and geological uplift with
Idylla's actual rise. Immediate byte-identical backup:
`/private/tmp/ko-translate-backups/20261011/before-rathir-property-idylla-D18296/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`b6c9c87709fa86a553569210f934cbf4be1ff0474d51b6eacf18656a3c48227f`;
post-edit SHA-256:
`fb7d4c27b77a268a17f7d5997e68cb1af3948180591020041a32bb94f7a92710`.
BOM, 72,011 CRLF, 73 bare LF, 65,135
keyed records, and non-target cells are unchanged.
See [`context review`](consolidated-context-review-default-20851-21000-20261011.md).
# D-18298: Named Vipers team and Hero's herald

Correct six Vipers team `Texto` cells at default
IDs 18198, 18406, 21057, 29745, 61695,
62103 to the attested `바이퍼스` name, and
ID 21099's vocative to address the Hero's
herald instead of making Jottun the herald.
The multiline betting ledger at 18198 retains
all names, numbers, and separators.
Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-vipers-herald-D18298/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`fb7d4c27b77a268a17f7d5997e68cb1af3948180591020041a32bb94f7a92710`;
post-edit SHA-256:
`3a9c9f517d030e4404966e027b9936dca0a6038890e21aaef4264bf3f2aa1042`.
Whole-file CSV parse confirms exactly seven changed
`Texto` cells and unchanged 65,135 keys/row order.
BOM, 72,011 CRLF and 73 bare LF endings are
unchanged. See
[`context review`](consolidated-context-review-default-21001-21100-vipers-20261011.md).

# D-18314-D-18315: Download Access and Hospitalis Quarters

Only active Korean `Texto` at IDs 21316 and 21356 changed:
`다운로드 콘텐츠 확인 중...` to `다운로드 콘텐츠에 접근 중...`,
and `병동` to `병동 구역`. English/Chinese support access at 21316;
IDs 4037 and 62763 establish the Hospitalis Quarters as a residential
district at 21356.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-review-default-21101-21600-D18315/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`af9abedeac9da78887c4c2a9b7237fd06834c945e5f03df9ab254803b267c7a3`;
post-edit SHA-256:
`c9e43e113635c80eb6905bcee4bb9db3dc07e8e985a284c74a6c08cd4d784092`.
Reversing only those two exact substitutions reproduces the backup hash.
UTF-8 BOM, all keys/order, 72,011 CRLF and 73 bare-LF endings are unchanged.
The earlier ID 21281 edit was present before this batch and is registered
under D-18300; its separate pre-edit backup is
`/private/tmp/ko-translate-backups/20261011/before-eldest-21281-D18302/locatexts_zh_cn.koalocatext_default.csv`.

The same grouped uncertainty follow-up resolves 26 old uncertain keys in
D-18300-D-18325: three accepted and 23 `not an issue`. Reconciled totals are
2,012 accepted, 23,286 `not an issue`, and 13,226 uncertain (38,524 counted).
Next D-18326 at ID 21701. See
[`consolidated context review`](consolidated-context-review-default-21101-21700-20261011.md).

# D-18327: Dustling address, ID 21707

The active Korean cell had already been changed from `먼지 인간` to
`먼지나부랭이`, matching accepted D-335 at ID 2149 for the same dismissive
`dustling` address. This addendum registers that edit; this documentation pass
did not rewrite the cell.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-dustling-21707-D18327/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`c9e43e113635c80eb6905bcee4bb9db3dc07e8e985a284c74a6c08cd4d784092`.
Active SHA-256:
`a3450ede76523e77391a67a097ab29fd06839e04bea43ab04ef1f86fed935c83`.
Reversing only the exact ID 21707 substitution reproduces the backup
byte-for-byte. The UTF-8 BOM, key order, 72,011 CRLF endings, and 73 bare-LF
endings are preserved. See
[`context review`](consolidated-context-review-default-21701-21800-20261011.md).

D-18326-D-18335 resolves ten prior uncertainties: one accepted and nine
`not an issue`. Reconciled totals are 2,013 accepted, 23,295 `not an issue`,
and 13,216 uncertain (38,524 counted). Next D-18336 at ID 21801.

# D-18338: The Eldest, ID 21818

Change only ID 21818 `Texto` from `장로(The Eldest)` to
`엘더스트(The Eldest)`. English IDs 16729 and 64218 identify the Eldest as
the two former House of Sorrows Fae at Damalroc; this uses the same named
group form accepted at ID 21281 under D-18300.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-eldest-context-21818-D18338/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`a3450ede76523e77391a67a097ab29fd06839e04bea43ab04ef1f86fed935c83`.
Post-edit SHA-256:
`c58df25b91d9aa8d49fb0a4fe57de68e66f0f10f8fd1fe6209a99aaabe9eb1fb`.
Reversing only the approved substitution reproduces the backup byte-for-byte.
The UTF-8 BOM, key order, 72,011 CRLF endings, and 73 bare-LF endings are
preserved.

D-18336-D-18349 resolves 14 prior uncertainties: one accepted and 13
`not an issue`. ID 21868 links to its prior accepted correction D-18290 and
is not recounted. Reconciled totals are 2,014 accepted, 23,308 `not an issue`,
and 13,202 uncertain (38,524 counted). Next D-18350 at ID 21901.

# D-18350: Tari Holstig / tongue taken, ID 21918

Change only the active Korean `Texto` phrase `제 혀를 잘라 갔습니다` to
`제 혀를 빼앗아 갔습니다`. English says the tongue was taken by Dverga
slavers; Japanese and Chinese do not specify that it was cut. The revised
clause keeps the named agent, follows the source, and remains grammatical.

# D-18351: Missives of Sable, ID 21927

Change only the active Korean `Texto` phrase `세이블(Sable)의 서신` to
`세이블의 서신(Missives of Sable)`, applying the established named-book form
from D-18257. Keep the English accusation that the Hierophant tried to have
the speaker killed; Japanese's different theft accusation is not substituted.

Immediate byte-identical pre-edit backup for both approved cell changes:
`/private/tmp/ko-translate-backups/20261011/before-context-21918-21927-D18350-D18351/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`c58df25b91d9aa8d49fb0a4fe57de68e66f0f10f8fd1fe6209a99aaabe9eb1fb`.
Active SHA-256:
`e0e3ebe75944803a1760431988fc424659db1ac00f749c1534ca5bd275f34200`.
Reversing only the two approved substitutions reproduces the backup
byte-for-byte. UTF-8 BOM, key order, 72,011 CRLF endings, and 73 bare-LF
endings are unchanged. See
[`21901-21950 context review`](consolidated-context-review-default-21901-21950-20261011.md).

D-18350-D-18356 resolves seven prior uncertainties: two accepted and five
`not an issue`; IDs 21911 and 21950 remain uncertain.

D-18357-D-18364 resolves eight further uncertainties, all `not an issue`;
ID 21976 remains uncertain. Cross-resource totals through D-18364 are 2,016
accepted, 23,321 `not an issue`, and 13,187 uncertain (38,524 counted).
Next D-18365 at ID 22001. See
[`21951-22000 context review`](consolidated-context-review-default-21951-22000-20261011.md).

## Context Review Without CSV Edit (D-18365-D-18368)

IDs 22008, 22037, 22042, and 22050 are reclassified as `not an issue` after
five-file, ID-aligned comparison and repeated-term review. IDs 22001, 22014,
22021, and 22032 remain uncertain; in particular, the identical English
phrase at affix ID 309 does not prove default ID 22021 uses the affix slot.
No Korean CSV cell changed, so no backup was needed. Active default SHA-256
remains `e0e3ebe75944803a1760431988fc424659db1ac00f749c1534ca5bd275f34200`.

Totals through D-18368 are 2,016 accepted, 23,325 `not an issue`, and 13,183
uncertain (38,524 counted). Next D-18369 at ID 22051. Details:
[`22001-22050 context review`](consolidated-context-review-default-22001-22050-20261011.md).

## Context Review and Cell Edit (D-18369-D-18378)

D-18369-D-18378 resolves ten uncertainties in IDs 22051-22100: one accepted
and nine `not an issue`. ID 22077 remains uncertain because the isolated
`Web` label has no UI/effect context.

Change only ID 22070 `Texto` from `성채 관리인` to `성주`, using English
`Castellan`, Japanese/Chinese `城主`, and accepted D-18276 at ID 20127.
Pledgeshield remains `서약방패병(Pledgeshield)`; its global rank terminology
is not settled by this row.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-22070-D18374-20261011/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`e0e3ebe75944803a1760431988fc424659db1ac00f749c1534ca5bd275f34200`.
Post-edit SHA-256:
`2b85efb725bcfe0e181ed9419ff84ca7a4101ca39777dfb28241b80349a3f8d9`.
Reversing the exact ID 22070 substitution reproduces the backup byte for
byte. The UTF-8 BOM, row order, 72,011 CRLF endings, and 73 bare-LF endings
are unchanged.

Totals through D-18378 are 2,017 accepted, 23,334 `not an issue`, and 13,173
uncertain (38,524 counted). Next D-18379 at ID 22101. Details:
[`22051-22100 context review`](consolidated-context-review-default-22051-22100-20261011.md).

## Context Review and Cell Edits (D-18379-D-18387)

D-18379-D-18387 resolves nine uncertainties in IDs 22101-22150: two accepted
and seven `not an issue`. IDs 22135 (Adept) and 22137 (Pledgeshield) remain
uncertain for shared formal-rank terminology.

Change only active Korean `Texto` at ID 22126 from `성채 관리자들` to
`성주들`, supported by Japanese/Chinese `城主` and accepted local Castellan
decisions D-18276 and D-18374. At ID 22149 change `활동` to `행동`, supported
by Japanese `行動` and Chinese `动作` for `Activity - Training Dummy`.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-22126-22149-D18383-D18386-20261011/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`2b85efb725bcfe0e181ed9419ff84ca7a4101ca39777dfb28241b80349a3f8d9`.
Post-edit SHA-256:
`b7131e515a30d80a82e1a776476950eac4736daf81dd03f78314d5aca0fdb0ab`.
Reversing the exact ID 22126 and 22149 substitutions reproduces the backup
byte for byte. The UTF-8 BOM, row order, 72,011 CRLF endings, and 73 bare-LF
endings are unchanged.

Totals through D-18387 are 2,019 accepted, 23,341 `not an issue`, and 13,164
uncertain (38,524 counted). Next D-18388 at ID 22151. Details:
[`22101-22150 context review`](consolidated-context-review-default-22101-22150-20261011.md).

## Context Review Without CSV Edit (D-18388-D-18398)

D-18388-D-18398 resolves the eleven still-open uncertainties in IDs
22151-22200 as `not an issue`. ID 22166 links to D-18262's prior
`not an issue` disposition and is not recounted. No Korean CSV cells changed,
so no backup was needed; active default SHA-256 remains
`b7131e515a30d80a82e1a776476950eac4736daf81dd03f78314d5aca0fdb0ab`.

Totals through D-18398 are 2,019 accepted, 23,352 `not an issue`, and 13,153
uncertain (38,524 counted). Next D-18399 at ID 22201. Details:
[`22151-22200 context review`](consolidated-context-review-default-22151-22200-20261011.md).

## Context Review and Cell Edits (D-18399-D-18400)

Only the active Korean `Texto` values at IDs 22202 and 22205 changed:

- ID 22202: `전임 기사 사그렐(Sir Sagrell)` to
  `전임 사그렐 경(Sir Sagrell)`, reusing the accepted honorific form from
  D-13027.
- ID 22205: `과부의 자비로` to `과부의 자비(Widow's mercy)로`, reusing the
  exact phrase and named-reference treatment at ID 7681 / D-2121.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-22202-22205-D18399-D18400-20261011/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`b7131e515a30d80a82e1a776476950eac4736daf81dd03f78314d5aca0fdb0ab`.
Post-edit SHA-256:
`9eadf50ba60545828e82cde6fc1212fcc7a96ef24e5a98498f7ad80100bfb262`.
Only these two approved substitutions were made. Reversing them reproduces
the backup byte-for-byte; UTF-8 BOM, all other CSV bytes, row/key order,
72,011 CRLF endings, 73 existing bare-LF endings, and embedded lineation are
preserved.

D-18399-D-18405 resolves seven uncertainties: two accepted and five
`not an issue`. IDs 22216, 22220, 22226, 22241, and 22242 remain uncertain.
Totals through D-18405 are 2,021 accepted, 23,357 `not an issue`, and 13,146
uncertain (38,524 counted). Next D-18406 at ID 22251. Details:
[`22201-22250 context review`](consolidated-context-review-default-22201-22250-20261011.md).

## Context Review and Cell Edit (D-18407)

At ID 22256, change only the active Korean `Texto` from
`아르카나 학회(Scholia Arcana)에 들어가려고 공부 중이야. 라시르에 있을 다른 이유가 있겠어?`
to
`스콜리아 아르카나(Scholia Arcana)에 들어가려고 공부 중이야. 라시르(Rathir)에 있을 다른 이유가 있겠어?`.
The institution form follows accepted D-18206/D-13364. The Rathir
transliteration remains unsettled; pairing the English source preserves
traceability without claiming a corpus-wide Korean spelling decision.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-22256-D18407-20261011/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`9eadf50ba60545828e82cde6fc1212fcc7a96ef24e5a98498f7ad80100bfb262`.
Post-edit SHA-256:
`c269d4453b30a4cce68e9384bea21711fad6509139149b1597a00a79fb2b71d5`.
Reversing only this approved substitution reproduces the backup byte-for-byte.
The UTF-8 BOM, row order, 72,011 CRLF endings, 73 existing bare-LF endings,
runtime markers, and embedded lineation are preserved.

D-18406-D-18415 resolves ten uncertainties: one accepted and nine
`not an issue`. IDs 22252, 22258, 22264, 22272, 22285, and 22298 remain
uncertain. Totals through D-18415 are 2,022 accepted, 23,366 `not an issue`,
and 13,136 uncertain (38,524 counted). Next D-18416 at ID 22301. Details:
[`22251-22300 context review`](consolidated-context-review-default-22251-22300-20261011.md).

## Context Review and Cell Edit (D-18421)

At ID 22348, change only the active Korean `Texto` parenthetical from
`울릭(Ulrick)` to `울릭(Urlik)`. English and Chinese use `Urlik` in this row,
and other English-keyed occurrences confirm this character's spelling.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-22348-D18421-20261011/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`c269d4453b30a4cce68e9384bea21711fad6509139149b1597a00a79fb2b71d5`.
Post-edit SHA-256:
`fbdcdf3ec09a863b36e23d2d2a600c00f2f2775dd4c49d015fe493797698b3c4`.
Reversing only this approved substitution reproduces the backup byte-for-byte.
The UTF-8 BOM, row order, 72,011 CRLF endings, 73 existing bare-LF endings,
embedded lineation, and runtime markers are preserved.

D-18416-D-18421 resolves six uncertainties: one accepted and five
`not an issue`. IDs 22313, 22322, 22337, and 22343 remain uncertain. Totals
through D-18421 are 2,023 accepted, 23,371 `not an issue`, and 13,130
uncertain (38,524 counted). Next D-18422 at ID 22351. Details:
[`22301-22350 context review`](consolidated-context-review-default-22301-22350-20261011.md).

## Context Review and Cell Edits (D-18453-D-18475)

Only active Korean `Texto` values changed:

- ID 22559: `빛을 꿰뚫는 창(Piecing Light)` to
  `관통의 빛(Piercing Light)`, reusing the exact accepted item name at IDs
  459 and 8459.
- ID 22589: `발러의 가문(House of Valor)` to
  `용맹의 집(House of Valor)`, reusing D-148/D-650.
- ID 22667: revise the unsupported “share nothing” reading to say that
  giving a little extra to the dying is the least they can do.
- ID 22691: clarify that the addressee must not force the speaker to hurt
  them.
- ID 22699: `도슨트(Docent)` to `강사(Docent)`, supported by Japanese and
  Chinese instructional-role translations.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-22559-22589-22667-22691-22699-D18453-D18457/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`89aa30b7aca402c0b14498862d9b194a0828270f5f96bf0238ce21b5412faab6`.
Post-edit SHA-256:
`154574fbaba2a172558b0ec47c10f905e2e86ddfc2690213a752179c2ef6383c`.
Reversing all five exact substitutions reproduced the backup byte-for-byte.
The UTF-8 BOM, key/row order, 72,011 CRLF endings, 73 existing bare-LF
endings, and all unrelated CSV bytes are preserved.

D-18453-D-18456 resolves four prior uncertainties (two accepted, two
`not an issue`). D-18457-D-18462 resolves six (all `not an issue`) without
CSV edits. D-18463-D-18475 resolves thirteen (three accepted, ten
`not an issue`). Totals through D-18475 are 2,033 accepted, 23,404
`not an issue`, and 13,087 uncertain (38,524 counted). Next D-18476 at ID
22701. Reports:
[`22551-22600`](consolidated-context-review-default-22551-22600-20261011.md),
[`22601-22650`](consolidated-context-review-default-22601-22650-20261011.md),
[`22651-22700`](consolidated-context-review-default-22651-22700-20261011.md).

## Context Review Without CSV Edit (D-18476-D-18483)

D-18476-D-18483 resolves eight uncertainties in IDs 22701-22750 as
`not an issue`. IDs 22701, 22744, and 22747 remain uncertain. Five-file
ID/order comparison passed, and no Korean cell changed; no backup was
needed. Active default SHA-256 remains
`154574fbaba2a172558b0ec47c10f905e2e86ddfc2690213a752179c2ef6383c`.

Totals through D-18483 are 2,033 accepted, 23,412 `not an issue`, and
13,079 uncertain (38,524 counted). Next D-18484 at ID 22751. Report:
[`22701-22750`](consolidated-context-review-default-22701-22750-20261011.md).

## Context Review Without CSV Edit (D-18484-D-18490)

D-18484-D-18490 resolves seven uncertainties in IDs 22751-22800 as
`not an issue`. IDs 22757, 22769, 22781, 22793, and 22794 remain uncertain.
Five-file ID/order comparison passed; no Korean cell changed, so no backup
was needed. Active default SHA-256 remains
`154574fbaba2a172558b0ec47c10f905e2e86ddfc2690213a752179c2ef6383c`.

Totals through D-18490 are 2,033 accepted, 23,419 `not an issue`, and
13,072 uncertain (38,524 counted). Next D-18491 at ID 22801. Report:
[`22751-22800`](consolidated-context-review-default-22751-22800-20261011.md).

## Context Review and Cell Edits (D-18491-D-18497)

Change only active Korean `Texto` at two IDs:

- ID 22824: `발러의 가문(House of Valor)` to
  `용맹의 집(House of Valor)`, reusing D-148/D-650.
- ID 22831: `후계자(Scion)` to `사이온(Scion)`, reusing D-7035 at ID
  22408.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-22824-22831-D18492-D18493/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`154574fbaba2a172558b0ec47c10f905e2e86ddfc2690213a752179c2ef6383c`.
Post-edit SHA-256:
`a0bc31f53559fce97a3c25fe9cf1bb1176e5c2c8de97eb4340983bdd6de1031f`.
Reversing only these two substitutions reproduces the backup byte-for-byte.
The UTF-8 BOM, key/order, 72,011 CRLF endings, and 73 existing bare-LF
endings are preserved.

D-18491-D-18497 resolves seven prior uncertainties: two accepted and five
`not an issue`. IDs 22812, 22816, 22818, and 22848 remain uncertain.
Totals through D-18497 are 2,035 accepted, 23,424 `not an issue`, and
13,065 uncertain (38,524 counted). Next D-18498 at ID 22851. Report:
[`22801-22850`](consolidated-context-review-default-22801-22850-20261011.md).

## Context Review D-18498-D-18506

`default` IDs 22851-22900 had nine prior uncertainties rechecked by exact ID
across English, Japanese, Chinese, and active Korean. D-18499 (22855),
D-18501 (22872), and D-18505 (22897) resolve as `not an issue`; D-18498
(22852), D-18500 (22865), D-18502 (22876), D-18503 (22881), D-18504
(22893), and D-18506 (22900) remain uncertain. No accepted correction was
supported, so the active CSV was not edited and no new backup was needed.
The pre-existing 22893 backup is byte-identical to the active CSV.

Totals are 2,035 accepted, 23,427 `not an issue`, and 13,062 uncertain
(38,524 counted). Active default SHA-256 remains
`a0bc31f53559fce97a3c25fe9cf1bb1176e5c2c8de97eb4340983bdd6de1031f`.
Next D-18507 at ID 22901. Report:
[`22851-22900`](consolidated-context-review-default-22851-22900-20261011.md).

## Context Review D-18507-D-18514

`default` IDs 22901-22950 had the eight prior uncertainties rechecked by
exact ID across English, Japanese, Chinese, the Japanese-derived Korean
draft, and active Korean. D-18507-D-18512 (IDs 22907, 22913, 22914, 22917,
22923, and 22925) resolve as `not an issue`; IDs 22942 and 22947 remain
uncertain. No accepted correction was supported, so the active CSV was not
edited and no backup was needed.

Totals are 2,035 accepted, 23,433 `not an issue`, and 13,056 uncertain
(38,524 counted). Active default SHA-256 remains
`a0bc31f53559fce97a3c25fe9cf1bb1176e5c2c8de97eb4340983bdd6de1031f`.
Next D-18515 at ID 22951. Report:
[`22901-22950`](consolidated-context-review-default-22901-22950-20261011.md).

## Context Review D-18515-D-18526

`default` IDs 22951-23000 had all twelve prior uncertainties rechecked by
exact ID across English, Japanese, Chinese, the Japanese-derived Korean
draft, and active Korean. D-18515, D-18517-D-18520, and D-18522-D-18525
(IDs 22952, 22960, 22963, 22964, 22973, 22981, 22982, 22986, and 22990)
resolve as `not an issue`; IDs 22954, 22974, and 23000 remain uncertain.
No accepted correction was supported, so the active CSV was not edited and
no backup was needed.

Totals are 2,035 accepted, 23,442 `not an issue`, and 13,047 uncertain
(38,524 counted). Active default SHA-256 remains
`a0bc31f53559fce97a3c25fe9cf1bb1176e5c2c8de97eb4340983bdd6de1031f`.
Next D-18527 at ID 23001. Report:
[`22951-23000`](consolidated-context-review-default-22951-23000-20261011.md).

## Context Review D-18527-D-18540

`default` IDs 23001-23050 had all fourteen prior uncertainties rechecked by
exact ID across English, Japanese, Chinese, the Japanese-derived Korean
draft, active Korean, and registered terminology. Thirteen resolve as
`not an issue`; ID 23042 remains uncertain because the source's gods/monster/
joy relation is unclear. No accepted correction was supported, so the active
CSV was not edited and no backup was needed.

Totals are 2,035 accepted, 23,455 `not an issue`, and 13,034 uncertain
(38,524 counted). Active default SHA-256 remains
`a0bc31f53559fce97a3c25fe9cf1bb1176e5c2c8de97eb4340983bdd6de1031f`.
Next D-18541 at ID 23051. Report:
[`23001-23050`](consolidated-context-review-default-23001-23050-20261011.md).

## Context Review D-18541-D-18548

`default` IDs 23051-23100 had all eight prior uncertainties rechecked by
exact ID across English, Japanese, Chinese, the Japanese-derived Korean
draft, active Korean, and relevant terminology/context. IDs 23064, 23074,
23078, 23081, and 23093 resolve as `not an issue`; IDs 23063, 23080, and
23087 remain uncertain. No accepted correction was supported, so the active
CSV was not edited and no backup was needed.

Totals are 2,035 accepted, 23,460 `not an issue`, and 13,029 uncertain
(38,524 counted). Active default SHA-256 remains
`a0bc31f53559fce97a3c25fe9cf1bb1176e5c2c8de97eb4340983bdd6de1031f`.
Next D-18549 at ID 23101. Report:
[`23051-23100`](consolidated-context-review-default-23051-23100-20261011.md).

## Context Review D-18549-D-18561

`default` IDs 23101-23150 had the fourteen prior uncertainties checked by
exact ID. ID 23113 was already reviewed in the grouped Preordained report
and remains uncertain without being recounted. D-18549-D-18556, D-18560,
and D-18561 resolve ten keys as `not an issue`; D-18557 and D-18559 apply
accepted edits at IDs 23131 and 23143; ID 23137 remains uncertain.

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23131-23143-D18557-D18559/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`a0bc31f53559fce97a3c25fe9cf1bb1176e5c2c8de97eb4340983bdd6de1031f`.
Post-edit SHA-256:
`51865f8296a0403a4687c5c130ba65373d1d795dc1fd0252ebd0668da1822b46`.
Reversing only the two approved `Texto` substitutions reproduces the backup
byte for byte. BOM, row order, 72,011 CRLF endings, and 73 bare-LF endings
are preserved.

Totals are 2,037 accepted, 23,470 `not an issue`, and 13,017 uncertain
(38,524 counted). Next D-18562 at ID 23151. Report:
[`23101-23150`](consolidated-context-review-default-23101-23150-20261011.md).

## Context Review D-18562-D-18574

Change only active Korean `Texto` at IDs 23159, 23171, and 23181:

- ID 23159: remove the unsupported disappearance relation, changing
  `없어진 뒤로` to `없이`.
- ID 23171: restore plural `Seers` and retain the capitalized source term as
  `운명(Destiny)`.
- ID 23181: replace the unsupported bird translation `까마귀(Crow)` with
  `크로우(Crow)`, the named tournament state.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23159-23171-23181-D18562-D18574/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`51865f8296a0403a4687c5c130ba65373d1d795dc1fd0252ebd0668da1822b46`.
Post-edit SHA-256:
`ce88c5ad4bde545d5c7e85a49881b38c1549ff469424390cd8a739c9be6ad1a0`.
Reversing only the three approved cell substitutions reproduces the backup
byte-for-byte. The BOM, row order, 72,011 CRLF endings, and 73 pre-existing
bare-LF endings are preserved.

D-18562-D-18574 resolves thirteen keys: three accepted and ten `not an
issue`; IDs 23178 and 23200 link to existing Beckoned/Travelers uncertainties
without recounting. Totals are 2,040 accepted, 23,480 `not an issue`, and
13,004 uncertain (38,524 counted). Active default SHA-256 is
`ce88c5ad4bde545d5c7e85a49881b38c1549ff469424390cd8a739c9be6ad1a0`.
Next D-18575 at ID 23201. Report:
[`23151-23200`](consolidated-context-review-default-23151-23200-20261011.md).

## Context Review D-18575-D-18588

Change only active Korean `Texto` at IDs 23209 and 23249:

- ID 23209: change the awkward literal property label `아이섀도 어둠` to
  `아이섀도 어두운 정도`, matching the meaning in all three source locales.
- ID 23249: reuse accepted D-18219 and change `자유민(Freemen)` to
  `프리맨(Freemen)`.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23209-23249-D18577-D18588/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`ce88c5ad4bde545d5c7e85a49881b38c1549ff469424390cd8a739c9be6ad1a0`.
Post-edit SHA-256:
`1603ae26cd8770906a0c82e02e4b05d409cb2fc3a92023ce567211f3d9a5a2f7`.
Reversing only these two approved cell substitutions reproduces the backup
byte-for-byte. The BOM, row order, 72,011 CRLF endings, and 73 pre-existing
bare-LF endings are preserved.

D-18575-D-18588 resolves fourteen keys: two accepted and twelve `not an
issue`; no uncertainty remains in IDs 23201-23250. Totals are 2,042
accepted, 23,492 `not an issue`, and 12,990 uncertain (38,524 counted).
Active default SHA-256 is
`1603ae26cd8770906a0c82e02e4b05d409cb2fc3a92023ce567211f3d9a5a2f7`.
Next D-18589 at ID 23251. Report:
[`23201-23250`](consolidated-context-review-default-23201-23250-20261011.md).

## Context Review D-18589-D-18602

Change only active Korean `Texto` at IDs 23251, 23265, 23281, 23283, 23284,
and 23298:

- IDs 23251 and 23265: retain exact English spellings beside unresolved
  Headsman/Klurikon and Primos/Hyperian transliterations.
- ID 23281: change `항복할 수는 없어` to `양보할 수는 없어` for English
  `yield`.
- IDs 23283, 23284, and 23298: retain source spellings for Withering War,
  Whitestone, and Cynric.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23251-23265-23281-23283-23284-23298-D18589-D18602/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`1603ae26cd8770906a0c82e02e4b05d409cb2fc3a92023ce567211f3d9a5a2f7`.
Post-edit SHA-256:
`f96ba8454db8767b67b9b2c95ec23e31fbca7835fa7b3e091d1a39298fb6b317`.
Physical-line comparison confirms only the six listed IDs changed. The BOM,
row order, 72,011 CRLF endings, and 73 pre-existing bare-LF endings remain.

D-18589-D-18602 resolves fourteen keys: six accepted and eight `not an
issue`. Totals are 2,048 accepted, 23,500 `not an issue`, and 12,976
uncertain (38,524 counted). Active default SHA-256 is
`f96ba8454db8767b67b9b2c95ec23e31fbca7835fa7b3e091d1a39298fb6b317`.
Next D-18603 at ID 23301. Report:
[`23251-23300`](consolidated-context-review-default-23251-23300-20261011.md).

## Context Review D-18603-D-18615

Change only active Korean `Texto` at IDs 23308, 23320, 23330, 23334, and
23350:

- IDs 23308, 23320, and 23330: add exact English spellings beside unresolved
  Archsage/Scholia Arcana, Hyperian, and Hierophant forms.
- ID 23334: replace `도슨트` with the accepted instructional term
  `강사(Docent)`.
- ID 23350: change `공개 계약` to `수락 가능한 계약` for available
  contracts.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23308-23320-23330-23334-23350-D18604-D18615/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`f96ba8454db8767b67b9b2c95ec23e31fbca7835fa7b3e091d1a39298fb6b317`.
Post-edit SHA-256:
`cc899e2958feb37c44a2c45fb550a83f95b7ea303bee11307b2a1d54b53a9a4f`.
Physical-line comparison confirms only the five listed IDs changed. The BOM,
row order, 72,011 CRLF endings, and 73 pre-existing bare-LF endings remain.

D-18603-D-18615 resolves thirteen keys: five accepted and eight `not an
issue`. Totals are 2,053 accepted, 23,508 `not an issue`, and 12,963
uncertain (38,524 counted). Active default SHA-256 is
`cc899e2958feb37c44a2c45fb550a83f95b7ea303bee11307b2a1d54b53a9a4f`.
Next D-18616 at ID 23351. Report:
[`23301-23350`](consolidated-context-review-default-23301-23350-20261011.md).

## Context Review D-18616-D-18624

Change only active Korean `Texto` at IDs 23370, 23377, 23381, and 23400:

- ID 23370: retain `Hospitalis Quarters` beside the Korean area label.
- ID 23377: change literal `까마귀들` to source-traceable tournament group
  `크로우들(The Crows)`, reusing D-18325 context.
- IDs 23381 and 23400: retain exact source labels `Seelie Summoner` and
  `Hex` beside their Korean renderings.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23370-23377-23381-23400-D18621-D18624/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`cc899e2958feb37c44a2c45fb550a83f95b7ea303bee11307b2a1d54b53a9a4f`.
Post-edit SHA-256:
`d873312499857a290c61337e7bf34dca6e6beb6e623647db417959cc2465d089`.
Physical-line comparison confirms only the four listed IDs changed. The
BOM, row order, 72,011 CRLF endings, and 73 pre-existing bare-LF endings
remain.

D-18616-D-18624 resolves nine keys: four accepted and five `not an issue`.
Totals are 2,057 accepted, 23,513 `not an issue`, and 12,954 uncertain
(38,524 counted). Active default SHA-256 is
`d873312499857a290c61337e7bf34dca6e6beb6e623647db417959cc2465d089`.
Next D-18625 at ID 23401. Report:
[`23351-23400`](consolidated-context-review-default-23351-23400-20261011.md).

## Grouped Context Review D-18633: Crilgarin, Knave of Coins

Change active Korean `Texto` at IDs 12388, 16110, 16849, 18512, 21264,
23460, 26496, 28374, 29873, 32244, 49361, 51009, 53769, 55915, 64624, and
63397 to use the previously accepted `동전의 잭` title. The identical
duplicate label at ID 16890 was updated to match ID 16849 and remains linked
to D-5289 without recounting.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-knave-coins-cluster-D18633/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`9c4beea9aa24f2a77e102d19b82b2f1034500bff099277568c0494b6fe21dd5e`.
Post-edit SHA-256:
`1bfcfcb90cffd9eeb7012840e884c2391d0e7a40ae29dfbbb9764370349bf806`.
Byte comparison confirms only the sixteen listed cells and linked duplicate
ID 16890 changed. The BOM, row order, 72,011 CRLF endings, and 73
pre-existing bare-LF endings remain.

D-18633 resolves twenty uncertainties: sixteen accepted and four
`not an issue`. Totals are 2,075 accepted, 23,523 `not an issue`, and 12,926
uncertain (38,524 counted). Report:
[`Crilgarin / Knave of Coins`](consolidated-context-review-default-knave-coins-20261011.md).

## Context Review D-18634-D-18645

Change only active Korean `Texto` at ID 23478 from
`모투스 광업 조합(Motus Mining Interest)` to
`모투스 광업 회사(Motus Mining Interest)`, reusing accepted company
terminology at ID 14591 / D-4421.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-motus-interest-23478-D18641/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`1bfcfcb90cffd9eeb7012840e884c2391d0e7a40ae29dfbbb9764370349bf806`.
Post-edit SHA-256:
`948c47834e4f0bd68b03a25b09e6947ad850d488cb265b84e121840a26fb0d90`.
Byte comparison confirms only ID 23478 changed in this edit. The BOM,
row order, 72,011 CRLF endings, and 73 pre-existing bare-LF endings remain.

D-18634-D-18645 resolves twelve uncertainties: one accepted and eleven
`not an issue`. The complete 23451-23500 set, including ID 23460 under
D-18633, leaves totals at 2,076 accepted, 23,534 `not an issue`, and 12,914
uncertain (38,524 counted). Next D-18646 at ID 23501. Report:
[`23451-23500`](consolidated-context-review-default-23451-23500-20261011.md).

## Context Review D-18625-D-18632

Change only active Korean `Texto` at IDs 23441 and 23443:

- ID 23441: replace `포즈 하스(Foes' Hearth)` with `적들의 난롯가(Foes'
  Hearth)`, reusing the contextual place-name correction at ID 65110 /
  D-18216.
- ID 23443: replace `전쟁맹세단` with `워스원(Warsworn)`, reusing the
  established faction form and retaining exact source spelling.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23441-23443-D18625-D18626/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`d873312499857a290c61337e7bf34dca6e6beb6e623647db417959cc2465d089`.
Post-edit SHA-256:
`9c4beea9aa24f2a77e102d19b82b2f1034500bff099277568c0494b6fe21dd5e`.
Byte comparison confirms only the two listed cells changed. The BOM, row
order, 72,011 CRLF endings, and 73 pre-existing bare-LF endings remain.

D-18625-D-18632 resolves eight keys: two accepted and six `not an issue`.
Totals are 2,059 accepted, 23,519 `not an issue`, and 12,946 uncertain
(38,524 counted). Active default SHA-256:
`9c4beea9aa24f2a77e102d19b82b2f1034500bff099277568c0494b6fe21dd5e`.
Next D-18633 at ID 23451. Report:
[`23401-23450`](consolidated-context-review-default-23401-23450-20261011.md).

## Context Review D-18646-D-18658

Change only active Korean `Texto` at IDs 23506, 23508, 23515, 23520, 23525,
and 23533:

- ID 23506: change `제련` to `단조`, matching English `Forge` and the
  Japanese/Chinese forging verbs.
- ID 23508: replace `그 여자` with neutral `그 사람`.
- ID 23515: replace the unsupported sunlight-specific phrase with
  `이런 열기`, following the English-led heat context.
- ID 23520: remove `사람들` from the Skorias name so the Korean does not
  decide whether the group is a people, family, or clan.
- ID 23525: repair `투아사 침공 때 이후로` to `투아사 침공 이후로`.
- ID 23533: render `a mad king` as `미친 왕` and remove the unsupported
  final period.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23501-23550-D18646-D18658/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`948c47834e4f0bd68b03a25b09e6947ad850d488cb265b84e121840a26fb0d90`.
Post-edit SHA-256:
`c8abbd0b753ab0fed0af39016c71bff89d51121e84d523073537fd78d0c98c38`.
Byte comparison confirms only the six approved physical rows changed. The
BOM, row count/order, 72,011 CRLF endings, and 73 existing bare-LF endings
remain unchanged.

D-18646-D-18658 resolves thirteen uncertainties: six accepted and seven
`not an issue`. Totals are 2,082 accepted, 23,541 `not an issue`, and 12,901
uncertain (38,524 counted). Next D-18659 at ID 23551. Report:
[`23501-23550`](consolidated-context-review-default-23501-23550-20261011.md).

## Context Review D-18659-D-18668

Change only active Korean `Texto` at IDs 23574, 23589, and 23590:

- ID 23574: replace `용맹의 전당` with the accepted proper-name form
  `용맹의 집(House of Valor)` from D-148 and D-650.
- ID 23589: revise the promise from doing honorable work “with us” to
  promising honorable work to the group, supported by Japanese/Chinese and
  the following mercenary sentence.
- ID 23590: change the counter from `편` to `권`; Japanese identifies books
  of litanies, and ID 49766 confirms five volumes are placed on the altar.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23551-23600-D18659-D18668/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`c8abbd0b753ab0fed0af39016c71bff89d51121e84d523073537fd78d0c98c38`.
Post-edit SHA-256:
`cb4114c46edbba074be2850b4387f396ea2d0870aec71ac81dbf7e5e4ec29893`.
Byte comparison confirms only the three approved physical rows changed. The
BOM, row count/order, 72,011 CRLF endings, and 73 existing bare-LF endings
remain unchanged.

D-18659-D-18668 resolves ten uncertainties: three accepted and seven
`not an issue`. Totals are 2,085 accepted, 23,548 `not an issue`, and 12,891
uncertain (38,524 counted). Next D-18669 at ID 23601. Report:
[`23551-23600`](consolidated-context-review-default-23551-23600-20261011.md).

## Context Review D-18669-D-18679

Change only active Korean `Texto` at IDs 23622, 23626, and 23648:

- ID 23622: render the “hiding in a bottle” drinking idiom as `술에 빠져`,
  supported by the Japanese alcohol reading.
- ID 23626: add exact source spelling to `미타란 흑단 경비대` without
  deciding whether Ebony Guard is a formal unit or faction.
- ID 23648: repair the malformed question and use a natural “which side”
  reading without naming a faction.

ID 23641 remains uncertain under D-7502. Preserve its four exact wrappers
and English-source order until runtime substitution grammar is verified.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23601-23650-D18669-D18679/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`cb4114c46edbba074be2850b4387f396ea2d0870aec71ac81dbf7e5e4ec29893`.
Post-edit SHA-256:
`e36796ed1e0beea85968c26edcc603b608be406570f79c09c7c8f912c17d0b61`.
Byte comparison confirms only the three approved physical rows changed. The
BOM, row count/order, 72,011 CRLF endings, and 73 existing bare-LF endings
remain unchanged.

D-18669-D-18679 resolves eleven keys: three accepted and eight `not an
issue`; ID 23641 remains uncertain. Totals are 2,088 accepted, 23,556
`not an issue`, and 12,880 uncertain (38,524 counted). Next D-18680 at ID
23651. Report:
[`23601-23650`](consolidated-context-review-default-23601-23650-20261011.md).

## Context Review D-18680-D-18711

IDs 23651-23800 resolve 32 previously uncertain keys: five accepted cell
changes at 23659 (remove invented rank), 23664 (`발라드의 집`), 23676
(`용맹의 집`), 23679 (`숨겨진 물건 찾기`), and 23699 (`자냐 대장`),
plus 27 `not an issue`. ID 23680 links to D-18208 without recounting.
IDs 23729, 23758 and 23800 remain uncertain for explicit map/poetry
reasons. Reports:
[`23651-23700`](consolidated-context-review-default-23651-23700-20261011.md),
[`23701-23750`](consolidated-context-review-default-23701-23750-20261011.md),
[`23751-23800`](consolidated-context-review-default-23751-23800-20261011.md).

Immediate byte-identical backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23651-23800-D18680/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`e36796ed1e0beea85968c26edcc603b608be406570f79c09c7c8f912c17d0b61`.
Post-edit SHA-256:
`36dfdc0fafe0293be29a0e07fcbbd561a4d25f025bef503fb64eac9f800ff5a3`.
Physical-row comparison confirms only those five approved rows changed.
The BOM, 65,135 data keys, key order, 72,011 CRLF and 73 existing bare
LF endings remain. Totals: 2,093 accepted / 23,583 `not an issue` /
12,848 uncertain (38,524); next D-18712 at ID 23801.

## Context Review D-18712-D-18724

At IDs 23801-23850, correct only ID 23811's `숨어 있다` to
`숨어 있다가` in the existing quoted poem. Twelve more uncertainties
become `not an issue`; ID 23843 retains its skill-name hold.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23801-23850-D18712/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`36dfdc0fafe0293be29a0e07fcbbd561a4d25f025bef503fb64eac9f800ff5a3`.
Post-edit SHA-256:
`252a9296019a5c8c72bd21a56c22df30c6be37842794d0e07179e663695398dd`.
Physical-row comparison verifies exactly one changed line and unchanged
BOM, keys, row order and line-ending counts. Totals: 2,094 accepted,
23,595 `not an issue`, 12,835 uncertain (38,524); next D-18725 at ID
23851. Report:
[`23801-23850`](consolidated-context-review-default-23801-23850-20261011.md).

## Context Review D-18725-D-18742

IDs 23851-23900: change only ID 23874 from `도시 위로` to `도시 안에`
because English says `within our city`. Seventeen other prior
uncertainties resolve as `not an issue`; IDs 23851 and 23859 retain
specific context holds. Immediate byte-identical backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23851-23900-D18725/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`252a9296019a5c8c72bd21a56c22df30c6be37842794d0e07179e663695398dd`.
Post-edit SHA-256:
`811a763da836f39b6f77ecfbdf9aa343dd28d4569f80511123c7a0f3394fa05c`.
Physical comparison confirms only ID 23874 changed; BOM, order, row
count and line-ending distribution remain intact. Totals: 2,095 accepted,
23,612 `not an issue`, 12,817 uncertain (38,524). Next D-18743
at ID 23901. Report:
[`23851-23900`](consolidated-context-review-default-23851-23900-20261011.md).

## Context Review D-18743-D-18762

IDs 23901-23950: twenty prior uncertainties become `not an issue`;
ID 23930 remains under D-7652 pending runtime-marker grammar. No CSV
edit; active default SHA-256 remains
`811a763da836f39b6f77ecfbdf9aa343dd28d4569f80511123c7a0f3394fa05c`.
Totals: 2,095 accepted / 23,632 `not an issue` / 12,797
uncertain (38,524). Next D-18763 at ID 23951. Report:
[`23901-23950`](consolidated-context-review-default-23901-23950-20261011.md).

## Context Review D-18763-D-18782

IDs 23951-24000: fix only ID 23965's unsupported goal ownership
(`콜로사이들이 목표` -> `콜로사이가 우리 목표`). Nineteen other
prior uncertainties become `not an issue`; IDs 23987 and 23993 retain
referent/marker holds. Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23951-24000-D18763/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`811a763da836f39b6f77ecfbdf9aa343dd28d4569f80511123c7a0f3394fa05c`.
Post-edit SHA-256:
`64d5760d97abb0a51bba665b39697746a375afecf70556a22ad8161fc5670515`.
Only ID 23965's physical row differs from backup; BOM, keys and line
endings retained. Totals: 2,096 accepted / 23,651 `not an issue` /
12,777 uncertain (38,524); next D-18783 at ID 24001. Report:
[`23951-24000`](consolidated-context-review-default-23951-24000-20261011.md).

## Context Review D-18783-D-18796

IDs 24001-24050: accepted edits only at 24004 (House of Valor
approved name), 24006 (singular Exile), 24010 (remove invented count),
24018 (`anonymous` as nameless). Ten other uncertainties resolve as
`not an issue`; 24031 and 24048 retain contextual holds.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-24001-24050-D18783/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`64d5760d97abb0a51bba665b39697746a375afecf70556a22ad8161fc5670515`.
Post-edit SHA-256:
`f07c90265c46c1fc39c282cd06f560af7c187a7d3fee31938be13ae9b364706d`.
Physical-row comparison confirms exactly the four approved rows
changed, retaining BOM, keys and original line endings. Totals:
2,100 accepted / 23,661 `not an issue` / 12,763 uncertain
(38,524); next D-18797 at ID 24051. Report:
[`24001-24050`](consolidated-context-review-default-24001-24050-20261011.md).

## Context Review D-18797-D-18817

IDs 24051-24100: change only ID 24057 (`legacy` -> `유산`) and
24093 (House of Ballads -> `발라드의 집`). Nineteen other
uncertainties become `not an issue`; IDs 24071, 24089 and 24098
remain held for report/lore/`dustling` context. Byte-identical
pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-24051-24100-D18797/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`f07c90265c46c1fc39c282cd06f560af7c187a7d3fee31938be13ae9b364706d`.
Post-edit SHA-256:
`ed66f830f3c901fa0c68ff0dc0a040048053e5b5f92c40384ed0b9775297de7f`.
Only two approved physical rows differ; BOM, row order and line endings
are preserved. Totals: 2,102 accepted, 23,680 `not an issue`,
12,742 uncertain (38,524). Next D-18818 at ID 24101. Report:
[`24051-24100`](consolidated-context-review-default-24051-24100-20261011.md).

## Context Review D-18818-D-18882

Four consecutive batches (24101-24150, 24151-24200, 24201-24250,
24251-24300) resolve 65 prior uncertain keys: seven accepted edits
at IDs 24103, 24124, 24143, 24190, 24266, 24269, 24277;
58 `not an issue`. Existing D-18206 at 24295 is linked, not
recounted; 24125's duplicate original findings are still one held key.
Unresolved IDs and per-key rationale:
[`24101-24300`](consolidated-context-review-default-24101-24300-20261011.md).

## Context Review D-18883-D-18938

Four consecutive batches (24301-24350, 24351-24400, 24401-24450,
24451-24500) resolve 56 prior uncertain unique keys: eight accepted
Texto edits (24325, 24334, 24356, 24361, 24397, 24403, 24470,
24482) and 48 `not an issue`. Previously resolved 24447 links to
D-18240 without recounting; historical accepted edits at 24408,
24426 and 24485 remain untouched.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-24301-24500-D18883/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`1b8c9159ac52e200d486da6e38973a31a8b2794fc6aee101d883c57dbf5f0f01`.
Post-edit SHA-256:
`e491852ba6e82412c024bb525676b8b4c37647f9d5a70832811e006f89ecd91f`.
Only nine physical lines (eight approved cells, including one
two-line tooltip) differ. BOM, 65,135 IDs, row order, 72,011 CRLF
and 73 prior bare LF remain; all runtime tokens, embedded breaks and
numbers survive. Totals: 2,117 accepted / 23,786 `not an issue` /
12,621 uncertain (38,524); next D-18939 at ID 24501. Report:
[`24301-24500`](consolidated-context-review-default-24301-24500-20261011.md).

Byte-identical immediate pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-24101-24300-D18818/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`ed66f830f3c901fa0c68ff0dc0a040048053e5b5f92c40384ed0b9775297de7f`.
Post-edit SHA-256:
`1b8c9159ac52e200d486da6e38973a31a8b2794fc6aee101d883c57dbf5f0f01`.
Only the seven approved physical rows differ; BOM, 65,135 keys, order,
72,011 CRLF and 73 pre-existing bare LF remain. Totals: 2,109
accepted / 23,738 `not an issue` / 12,677 uncertain (38,524);
next D-18883 at ID 24301.

## Context Review D-18939-D-18950

IDs 24501-24550: resolved 12 prior finding groups covering 14 unique keys:
six accepted corrections at 24501, 24503, 24508, 24530, 24535, and 24537;
eight `not an issue` keys, including IDs 24523-24525. ID 24514's earlier
accepted correction remains unchanged and is not recounted.

| ID | Before | After | Rationale |
| ---: | --- | --- | --- |
| 24501 | `또 한 병? 이런, 세상에...` | `또? 이런, 세상에...` | No locale identifies a bottle; preserve the unspecified object. |
| 24503 | `도깨비불` | `윌 오 위스프` | Match the same named Fae creature in ID 42902. |
| 24508 | `실크숲에서 비단 농부 한 명` | `웹우드(Webwood)에서 비단 채집꾼 한 명` | Restore the named place and source-supported silk-harvesting occupation. |
| 24530 | `킬리언 킨` | `실리언 킨` | Japanese phonetics and related pet-training entries support `실리언 킨`. |
| 24535 | `우리가 타고난 야만성` | `운명으로 정해진 야만성` | Preserve English/Japanese fate-imposed meaning of `ordained`. |
| 24537 | `콜로세 귀족 여성` | `콜로사이 귀족 (여성)` | Match the paired male label at ID 9941 and current accepted form. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-24501-24550-D18939/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`e491852ba6e82412c024bb525676b8b4c37647f9d5a70832811e006f89ecd91f`.
Post-edit SHA-256:
`c60724df24fa74230a9f567ac1e77fa9997d0af86feb2c1b90e659b044d2755b`.
Only the six approved `Texto` cells differ. All five CSVs retain identical
65,135-key order; UTF-8 BOM, row structure, 72,011 CRLF and 73 existing bare
LF endings remain. The ID 24508 embedded paragraph break and all runtime
markers/numeric content are preserved. Totals: 2,123 accepted / 23,794
`not an issue` / 12,607 uncertain (38,524). Resume D-18951 at ID 24551.
The remaining sequential interval is 24551-65134 (40,584 IDs); earlier
specific holds and the D-18422-D-18452 register backfill also remain.
Report:
[`24501-24550`](consolidated-context-review-default-24501-24550-20261011.md).

## Context Review D-18951-D-18964

IDs 24551-24600: resolved 14 prior finding groups covering 16 unique keys:
three accepted corrections at IDs 24551, 24565, and 24594; thirteen
`not an issue` keys. Previous acceptance at 24552 and already closed keys
in the range are not counted again.

| ID | Before | After | Rationale |
| ---: | --- | --- | --- |
| 24551 | `부두` | `퀘이(Quay)` | Japanese/Chinese transliterate Quay as a person; match Korean ID 1304. |
| 24565 | `가장 박식한 이야기꾼` | `가장 박식한 전승지기` | Match Glianal's established loremaster role at ID 4603. |
| 24594 | `나그플라르 호` | `나글파르호` | Match the same royal ship at IDs 15086 and 42154. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-24551-24600-D18951/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`c60724df24fa74230a9f567ac1e77fa9997d0af86feb2c1b90e659b044d2755b`.
Post-edit SHA-256:
`9e64df4e20b3e1d51507663fbd6ba27829639c0753d1d8ff3d3de615346c6d11`.
Only the three approved `Texto` cells differ. All five CSVs retain identical
65,135-key order; UTF-8 BOM, row structure, 72,011 CRLF and 73 existing bare
LF endings remain. IDs 24578 and 24594 retain all 26 embedded breaks; the
seven day headings and runtime/numeric content remain. Totals: 2,126 accepted
/ 23,807 `not an issue` / 12,591 uncertain (38,524). Resume D-18965 at
ID 24601. Sequential IDs 24601-65134 remain (40,534), as do earlier specific
holds and the D-18422-D-18452 register backfill.
Report:
[`24551-24600`](consolidated-context-review-default-24551-24600-20261011.md).

## Context Review D-18965-D-18975

IDs 24601-24650: resolved 11 prior uncertain keys, with one accepted
correction at ID 24649 and ten `not an issue`. Retained specific holds:
24601, 24602-24603, 24608, 24641, and 24643.

| ID | Before | After | Rationale |
| ---: | --- | --- | --- |
| 24649 | `좋아, 지금 가자.` | `좋아, 그럼.` | English/Chinese do not say “let's go”; remove the unsupported movement. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-24601-24650-D18965/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`9e64df4e20b3e1d51507663fbd6ba27829639c0753d1d8ff3d3de615346c6d11`.
Post-edit SHA-256:
`ff06e9b14b35691d640b1c643b83d4b6bdbd21cb0efd6f634e1c43bb3bb05eeb`.
Only the approved `Texto` cell at 24649 differs. BOM, 65,135 IDs, row
order, 72,011 CRLF and 73 prior bare LF remain. Totals: 2,127 accepted /
23,817 `not an issue` / 12,580 uncertain (38,524). Resume D-18976 at
ID 24651; sequential IDs 24651-65134 remain (40,484), along with earlier
specific holds and the D-18422-D-18452 register backfill. Report:
[`24601-24650`](consolidated-context-review-default-24601-24650-20261011.md).

## Context Review D-18976-D-18988

IDs 24651-24700: all 14 prior uncertain keys resolved (two accepted edits,
12 `not an issue`). Linked prior hold 35478/D-11484 is also resolved and
counted once.

| ID | Before | After | Rationale |
| ---: | --- | --- | --- |
| 24651 | `벤티리니오` | `벤트리니오` | Normalize to the prevailing Ventrinio form in the active corpus. |
| 24660 | `첫 번째 검 처치` | `퍼스트 소드 처치` | Match the established Alfar title First Sword. |
| 35478 | `첫 번째 검 처치` | `퍼스트 소드 처치` | Apply the resolved title to the linked quest key; supersedes D-11484. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-24651-24700-D18976/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`ff06e9b14b35691d640b1c643b83d4b6bdbd21cb0efd6f634e1c43bb3bb05eeb`.
Post-edit SHA-256:
`366fd41062ab0daaf41329b3f32fe1ea2ed4698ea8767f762043f74dcf8e0bd6`.
Only these three approved `Texto` cells differ. BOM, 65,135 IDs, row
order, 72,011 CRLF and 73 prior bare LF remain; `{1}` and numeric content
remain. Totals: 2,130 accepted / 23,829 `not an issue` / 12,565 uncertain
(38,524). Resume D-18989 at ID 24701; sequential IDs 24701-65134 remain
(40,434), with earlier specific holds and the D-18422-D-18452 register
backfill. Report:
[`24651-24700`](consolidated-context-review-default-24651-24700-20261011.md).

## Context Review D-18989-D-19001

IDs 24701-24750: resolved 20 prior uncertain keys as `not an issue`.
IDs 24716 and 24743 remain on specific holds. Existing accepted ID 24739
(D-8065) was linked for runtime-marker/line-break verification and not
recounted. No CSV text changed; active default SHA-256 remains
`366fd41062ab0daaf41329b3f32fe1ea2ed4698ea8767f762043f74dcf8e0bd6`.
Totals: 2,130 accepted / 23,849 `not an issue` / 12,545 uncertain
(38,524). Resume D-19002 at ID 24751; sequential IDs 24751-65134 remain
(40,384), along with earlier specific holds and the D-18422-D-18452
register backfill. Report:
[`24701-24750`](consolidated-context-review-default-24701-24750-20261011.md).

## Context Review D-19002-D-19012

IDs 24751-24800: resolved 16 prior uncertain keys as `not an issue`.
ID 24753 remains held on lexical/UI context. Previously accepted ID 24739
and closed marker key 24796 were linked for integrity checks, not recounted.
No CSV text changed; active default SHA-256 remains
`366fd41062ab0daaf41329b3f32fe1ea2ed4698ea8767f762043f74dcf8e0bd6`.
Totals: 2,130 accepted / 23,865 `not an issue` / 12,529 uncertain
(38,524). Resume D-19013 at ID 24801; sequential IDs 24801-65134 remain
(40,334), with earlier specific holds and the D-18422-D-18452 register
backfill. Report:
[`24751-24800`](consolidated-context-review-default-24751-24800-20261011.md).

## Context Review D-19013-D-19018

IDs 24812-24813, 24822, 24825, 24838, 24841, and 24848 resolve seven prior
uncertain keys: one accepted edit and six `not an issue`. ID 24806 remains
held on the exact initiation/“see red” reading. ID 24841 changes from
`볼간 사제들의` / `볼간 사제 셋` to `볼간 대가들의` / `볼간 대가 셋`,
matching the explicit mind-control-mage role and repeated corpus usage.

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-24801-24850-D19013/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`366fd41062ab0daaf41329b3f32fe1ea2ed4698ea8767f762043f74dcf8e0bd6`.
Post-edit SHA-256:
`14260e68e2a32f339ba665e737db7c0b7dc0cbddfc3873f3b3a049b43978a1fd`.
The byte-level comparison confirms only the approved ID 24841 `Texto` cell
differs; BOM, row order, 72,011 CRLF endings, and 73 existing bare LF endings
are preserved. Totals: 2,131 accepted / 23,871 `not an issue` / 12,522
uncertain (38,524). Resume D-19019 at ID 24851; sequential IDs 24851-65134
remain (40,284), along with earlier specific holds and the D-18422-D-18452
register backfill. Report:
[`24801-24850`](consolidated-context-review-default-24801-24850-20261011.md).

## Context Review D-19019-D-19028

IDs 24851-24900: all 12 uncertain IDs were resolved, with two accepted
edits and ten `not an issue`. ID 24859 adds `(Tine)` to distinguish the
proper name from Korean `타인`; ID 24879 is aligned to the identical-source
poem at 55208, including names, epithets, and stanza structure.

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-24851-24900-D19019/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`14260e68e2a32f339ba665e737db7c0b7dc0cbddfc3873f3b3a049b43978a1fd`.
Post-edit SHA-256:
`33402ae212e395fd7001404a0b976bcfd46f17e0e229688566fc97cad31b791e`.
Only the approved `Texto` cells at IDs 24859 and 24879 differ; BOM, row
order, 72,011 CRLF endings, and 73 existing bare LF endings are preserved.
Totals: 2,133 accepted / 23,881 `not an issue` / 12,510 uncertain
(38,524). Resume D-19029 at ID 24901; sequential IDs 24901-65134 remain
(40,234), with earlier specific holds and the D-18422-D-18452 register
backfill. Report:
[`24851-24900`](consolidated-context-review-default-24851-24900-20261011.md).

## `default` IDs 24951, 24952, 24959, 24970, and 24988 (D-19042-D-19050)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 24951 | `비사레인` | `비사라네` | Match the prevailing active-corpus form for Bisarane. |
| 24952 | `아나라가 우리 장인들을` | `아니라(Anira)가 우리 명장들을` | Normalize Anira and use the established Master Makers term. |
| 24959 | `모투스 광산 회사의 학자 루인 이마스는 아포타이르 지역에서 새롭고 희귀한 광석이 발견될 거라고 생각한다.` | `모투스 광업 회사의 학자 루인 이마스는 아포타이어 지역에 새롭고 희귀한 광석이 매장되어 있다고 믿는다.` | Align company/place forms and restore the source's ore-deposit claim. |
| 24970 | `본라흐` | `본라크` | Match the recurring Bonnlach spelling. |
| 24988 | `내 탄생의 초가 촛대에서 사라졌어` | `내 탄생의 초를 촛대에서 가져가 버렸어` | Preserve that the candle was taken from its holder. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-24951-25000-D19042/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`c9e4bde6b55074652f978af990d8a07c740becb72499ca42867a1cf7b2e0b2eb`.
Post-edit SHA-256:
`9e41b6f836a37d9889327dbfd67c6db1e3a518c53b9992b7844de1b01608947c`.
Only these five approved `Texto` cells differ; BOM, row order, 72,011
CRLF endings, and 73 existing bare LF endings are preserved. Totals:
2,142 accepted / 23,908 `not an issue` / 12,474 uncertain (38,524).
Resume D-19054 at ID 25001. Report:
[`24951-25000`](consolidated-context-review-default-24951-25000-20261011.md).

## Context Review D-19029-D-19041

IDs 24901-24950: all 20 prior uncertain IDs were resolved, with four
accepted edits and 16 `not an issue`. Edits at IDs 24913, 24925, 24940, and
24950 identify the Paling Wand, complete Uriel Brugnar's name, standardize
Rialte Brocaire to the prevailing wine-name spelling, and normalize the
Witchknight Anira form.

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-24901-24950-D19029/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`33402ae212e395fd7001404a0b976bcfd46f17e0e229688566fc97cad31b791e`.
Post-edit SHA-256:
`c9e4bde6b55074652f978af990d8a07c740becb72499ca42867a1cf7b2e0b2eb`.
Only the approved `Texto` cells at IDs 24913, 24925, 24940, and 24950
differ; BOM, row order, 72,011 CRLF endings, and 73 existing bare LF endings
are preserved. Totals: 2,137 accepted / 23,897 `not an issue` / 12,490
uncertain (38,524). Resume D-19042 at ID 24951; sequential IDs 24951-65134
remain (40,184), with earlier specific holds and the D-18422-D-18452
register backfill. Report:
[`24901-24950`](consolidated-context-review-default-24901-24950-20261011.md).

## `default` IDs 25030 and 25040 (D-19060, D-19062)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25030 | `부름받은 자는... 우리 종족 중 하나일 거라고 생각했어. 하지만 넌 암호를 지니고 있군. 네 역할은 더없이 분명해.` | `부름받은 자는... 우리 종족 중 하나일 거라고 생각했어. 하지만 넌 사이퍼(Cipher)를 지니고 있군. 네 역할은 더없이 분명해.` | The capitalized Cipher is an object the addressee bears; use a scoped named-object rendering, not the generic code sense. |
| 25040 | `나는 스코리아 광산의 선임 작업반장이야. 예전엔 에라셀의 동굴에서 일했지만, 사촌 아사드가 모투스 광산에서 일하도록 데려왔지. 결과가 참 좋기도 하군.` | `나는 스코리아 광산의 선임 작업반장이야. 예전엔 에라셀의 동굴에서 일했지만, 사촌 아싸드(Athad)가 나를 모투스 광업 회사로 영입했지. 결과가 참 좋기도 하군.` | Align the established Athad spelling at ID 23995 and accepted company terminology; retain the recruitment and ironic outcome. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-25001-25050-D19054-final/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`9e41b6f836a37d9889327dbfd67c6db1e3a518c53b9992b7844de1b01608947c`.
Post-edit SHA-256:
`3c93f7992dec904f26fbe5e19b76ae6a1b8b1e8b850d7ada3b25f43ecde2722e`.
Only the two approved `Texto` cells differ; BOM, row order, 72,011 CRLF
endings, and 73 existing bare LF endings are preserved. Report:
[`25001-25050`](consolidated-context-review-default-25001-25050-20261011.md).

## `default` ID 25061 (D-19067)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25061 | `하지` | `솔스티스` | “Solstice” is a proper name here, supported by Japanese transliteration and active-corpus uses at IDs 3154, 15467, and 30187; `하지` incorrectly reads as a season/date. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-25051-25100-D19065/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`3c93f7992dec904f26fbe5e19b76ae6a1b8b1e8b850d7ada3b25f43ecde2722e`.
Post-edit SHA-256:
`7586a097493b833b0ecfcd5af7b80f416920b6ffa5b5a74aa0c3bfd3aed7d786`.
Only ID 25061 `Texto` differs; BOM, row order, 72,011 CRLF endings, and 73
existing bare LF endings are preserved. Report:
[`25051-25100`](consolidated-context-review-default-25051-25100-20261011.md).

## `default` ID 25118 (D-19078)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25118 | `전설적인 자경단원 처형인이 입었던 복장의 마지막 남은 조각인 최후의 숨결 장화를 찾아 회수해야 한다. 페린 쇼가 지도에 표시해 둔 비밀 장소에 있을 것이다.` | `전설적인 자경단원 처형인이 입었던 복장의 마지막 남은 조각인 라스트 브레스의 장화를 찾아 회수해야 한다. 페린 쇼가 지도에 표시해 둔 비밀 장소에 있을 것이다.` | Match Boots of Last Breath to the established exact item name at ID 33138. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-25101-25150-D19074/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`7586a097493b833b0ecfcd5af7b80f416920b6ffa5b5a74aa0c3bfd3aed7d786`.
Post-edit SHA-256:
`02e6c93bcbd329c59b3f476d7a7fb563f2e5dcf43712c69be0f7d40ed5aacea9`.
Only ID 25118 `Texto` differs; BOM, row order, 72,011 CRLF endings, and 73
existing bare LF endings are preserved. Report:
[`25101-25150`](consolidated-context-review-default-25101-25150-20261011.md).

## `default` IDs 25153, 25164, 25180, and 25199 (D-19088, D-19091, D-19096, D-19101)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25153 | `아라바스트라는 계곡의 미로야.` | `알라바스트라는 계곡의 미로야.` | Normalize Alabastra to the prevailing active-corpus spelling. |
| 25164 | `죽어라, 먼지 인간아.` | `죽어라, 먼지나부랭이야.` | Match accepted usage for the same contemptuous `dustling` form. |
| 25180 | `한 번 바꾸려다 실수했지. 그래도 언제든 다시 되돌리면 돼. 흐흐.` | `한 번 바꾼 게 실수였지. 그래도 언제든 다시 되돌릴 수 있어. 흐흐.` | English says the change was made and was a mistake, not merely attempted. |
| 25199 | `...용맹한 웬센은 마법 궁정의 수장이자...` | `...용맹한 웬센은 마법의 궁정의 수장이자...` | Apply the accepted `Court of Enchantments` form `마법의 궁정`. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-25151-25200-D19088/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`02e6c93bcbd329c59b3f476d7a7fb563f2e5dcf43712c69be0f7d40ed5aacea9`.
Post-edit SHA-256:
`4b54b657dfa9c9cdee9d15d301161925e6c469ae429614b6448016d26fb8c495`.
Only the four approved `Texto` cells differ; BOM, row order, 72,011 CRLF
endings, and 73 existing bare LF endings are preserved. Report:
[`25151-25200`](consolidated-context-review-default-25151-25200-20261011.md).

## `default` IDs 25202 and 25210 (D-19103, D-19106)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25202 | `이제 선택받은 자께서 오셨으니...` | `이제 부름받은 자께서 오셨으니...` | Apply the accepted Korean form for the Beckoned title from D-3443. |
| 25210 | `미타루의 축복이 있기를.` | `미사루의 축복이 있기를.` | Apply the established Mitharu name from accepted D-152. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-25201-25250-D19102/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`4b54b657dfa9c9cdee9d15d301161925e6c469ae429614b6448016d26fb8c495`.
Post-edit SHA-256:
`d211ed35eafdfe5bd5ce5cad084f6974e037238e552c2ed21be1b28e48eb049c`.
Only the two approved `Texto` cells differ; the ID 25208 structure, BOM,
row order, 72,011 CRLF endings, and 73 existing bare LF endings are
preserved. Report:
[`25201-25250`](consolidated-context-review-default-25201-25250-20261011.md).

## `default` IDs 25271, 25274, 25293, and 25300 (D-19124, D-19126, D-19131, D-19133)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25271 | `미스란 민속 음악으로, 미스로스 지역의 전통 선율을 담았어. 악단을 모으면 순회공연을 계획할 수 있겠지.` | `미타란 민속 음악으로, 미스로스 지역의 전통 선율을 담았어. 악단을 모으면 순회공연을 계획할 수 있겠지.` | Reuse accepted D-2927's `Mitharan music = 미타란 음악`; retain Mithros as `미스로스`. |
| 25274 | `미타루께서 너그러운 마음으로 너를 우리에게 돌려보내셨구나. 그럴 줄 알았어.` | `미사루께서 너그러운 마음으로 너를 우리에게 돌려보내셨구나. 그럴 줄 알았어.` | Apply manual-backed Mitharu form from D-152. |
| 25293 | `법을 어긴 자의 은신처` | `법을 어긴 자의 동굴` | Preserve the English Grotto/cave place type, supported by Chinese; Japanese has a conflicting Gorhart Prison string. |
| 25300 | `우린 여신 리리아를 섬겨. 에라셀에서 전쟁이 한창일 때, 여사제의 말씀이 우리를 이끌고 지켜 주셨어.` | `우린 여신 리리아께 기도해. 에라셀에서 전쟁이 한창일 때, 여사제의 말씀이 우리를 이끌고 지켜 주셨어.` | Restore English/Chinese's prayer meaning and retain casual register. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-25251-25300-D19119/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`d211ed35eafdfe5bd5ce5cad084f6974e037238e552c2ed21be1b28e48eb049c`.
Post-edit SHA-256:
`a29dd883e5bbe87a227d997eb14e034b8721cedb34d76538c368ada98ce2ee77`.
Byte comparison after reversing those four exact substitutions matches the
backup byte-for-byte. No other bytes differ; BOM, row order, 72,011 CRLF
endings, and 73 existing bare LF endings are preserved. Report:
[`25251-25300`](consolidated-context-review-default-25251-25300-20261011.md).

## `default` IDs 25325 and 25342 (D-19141, D-19145)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25325 | `포세이큰 평원` | `버림받은 평원` | Reuse the established Korean name for Forsaken Plain, including active `base` forms and D-18220. |
| 25342 | `마우라 찰린의 감옥은 유적 대회랑 지하 깊숙한 곳에 있다. 무장해라.` | `마우라 차린의 감옥은 유적 대회랑 지하 깊숙한 곳에 있다. 무장해라.` | Match the prevailing active-corpus spelling paired with Maura Chalin. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-25301-25350-D19134/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`a29dd883e5bbe87a227d997eb14e034b8721cedb34d76538c368ada98ce2ee77`.
Post-edit SHA-256:
`8d2e6059835827766674e67527c5f6a6441cd84d0c6e8d7244e517891b76fca8`.
Reversing these two exact substitutions reproduces the backup byte-for-byte.
No other bytes differ; BOM, row order, 72,011 CRLF endings, and 73 existing
bare LF endings are preserved. Report:
[`25301-25350`](consolidated-context-review-default-25301-25350-20261011.md).

## `default` IDs 25361, 25366-25367, and 25399 (D-19151, D-19153, D-19161)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25361 | `워스워른` | `워스원` | Reuse accepted Warsworn form D-2857. |
| 25366 | `알린 시르가 쓴 손편지` | `알린 시르가 보낸 손글씨 메모` | English `Note`, Japanese `メモ`, and Chinese `字条` support a handwritten note rather than a letter. |
| 25367 | `... 그곳에 사는 이들은 이미 마음을 잃었지요.` | `... 그곳에 사는 이들은 이미 흩어졌지요.` | Cross-locale context describes the House's tenants as lost/dispersed, not demoralized. |
| 25399 | `편히 쉬세요. 미타루의 축복은 ...` | `편하게 지내세요. 미사루의 축복은 ...` | Restore the welcoming register and use the official manual-backed Mitharu form from D-152. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-25351-25400-D19149/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`8d2e6059835827766674e67527c5f6a6441cd84d0c6e8d7244e517891b76fca8`.
Post-edit SHA-256:
`356d3b553daac30877f5557d49e1d9b7f48cfff1cff7ed2b42348e76ac65de5a`.
Reconstructing from the backup with exactly these four `Texto`
substitutions reproduces every byte; the BOM, row order, 72,011 CRLF endings,
and 73 existing bare-LF endings are unchanged. Report:
[`25351-25400`](consolidated-context-review-default-25351-25400-20261011.md).
Totals: 2,162 accepted / 24,079 `not an issue` / 12,283 uncertain
(38,524). Resume D-19162 at ID 25401; 25401-65134 (39,734 IDs) remain in
the sequential context-review pass, in addition to earlier specific holds
and the D-18422-D-18452 register backfill.

## `default` IDs 25435 and 25448 (D-19171, D-19174)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25435 | `... 지금은 그의 여왕이 지키고 있다.` | `... 지금은 그의 ‘여왕’이 지키고 있다.` | Preserve the English scare quotes around “queen,” corroborated by Japanese and Chinese. |
| 25448 | `... 하수도 저수조에 물이 고여 기반 시설에 압박을 주고 있다고 적혀 있었다.` | `... 하수도 저수조에 물이 고여 기초 부분에 부담을 주고 있다고 적혀 있었다.` | `Foundations` refers to structural foundations, not general infrastructure; Japanese and Chinese support the structural reading. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-25401-25450-D19162/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`356d3b553daac30877f5557d49e1d9b7f48cfff1cff7ed2b42348e76ac65de5a`.
Post-edit SHA-256:
`1f57782177c1bd030fbd9806c66ea11677b75f31d5b4f89eeb25a13e474bb44a`.
Exact reconstruction from the backup with only these two `Texto`
substitutions passes. The BOM, ID order, 72,011 CRLF endings, and 73
existing bare-LF endings are preserved. Totals: 2,164 accepted / 24,112
`not an issue` / 12,248 uncertain (38,524). Resume D-19176 at ID 25451.
Report:
[`25401-25450`](consolidated-context-review-default-25401-25450-20261011.md).

## `default` IDs 25458, 25484, and 25498 (D-19177, D-19184, D-19187)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25458 | `... 혹시 암호 장치인가?` | `... 혹시 사이퍼(Cipher)인가?` | Reuse the named carried-artifact reading accepted for ID 25030; Japanese also transliterates Cipher. |
| 25484 | `역병 방호제 조제하기` | `역병 방패 팅크제 조제하기` | Restore the explicit tincture preparation and match the same Plagueshield Tincture form at ID 19347. |
| 25498 | `프라이데리 상회는 하층 도시에 있어.` | `프라이데리는 하층 도시에 있어.` | Remove the company classification unsupported by English and Chinese. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-25451-25500-D19176/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`1f57782177c1bd030fbd9806c66ea11677b75f31d5b4f89eeb25a13e474bb44a`.
Post-edit SHA-256:
`7946e66523bc683030526c87e02d792cc4d3063e501f7301c9e2b242ceefc662`.
Reversing exactly these three `Texto` substitutions reproduces the backup
byte-for-byte; BOM, row order, 72,011 CRLF endings, and 73 existing bare-LF
endings are preserved. Totals: 2,167 accepted / 24,137 `not an issue` /
12,220 uncertain (38,524). Resume D-19188 at ID 25501. Report:
[`25451-25500`](consolidated-context-review-default-25451-25500-20261011.md).

## `default` IDs 25515 and 25526 (D-19191, D-19193)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25515 | `하루하루가 미타루께서 내리신 축복이지.` | `하루하루가 미사루께서 내리신 축복이지.` | Apply the official Korean manual and accepted D-152 form `Mitharu = 미사루`. |
| 25526 | `미스란 영혼베틀 옷감` | `미타란 영혼베틀 옷감` | Preserve English `Mitharan` and distinguish it from deity `Mitharu`, following accepted D-18122/D-18158. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-25501-25550-D19188/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`7946e66523bc683030526c87e02d792cc4d3063e501f7301c9e2b242ceefc662`.
Post-edit SHA-256:
`05c2b3ef6c6214576a41a6b34a0c7e29fd1ae2411ad1d5d9d23ac81e53521fdb`.
Reversing exactly these two `Texto` substitutions reproduces the backup
byte-for-byte; BOM, row order, 72,011 CRLF endings, and 73 existing bare-LF
endings are preserved. Totals: 2,169 accepted / 24,161 `not an issue` /
12,194 uncertain (38,524). Resume D-19198 at ID 25551. Report:
[`25501-25550`](consolidated-context-review-default-25501-25550-20261011.md).

## `default` ID 25569 (D-19202)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25569 | `건방진 먼지 인간! 페이의 전승에서 네 역할은 없어. 이 이야기는 우리 중 하나의 것이지, 요람에서 갓 나온 애송이의 것이 아니야.` | `건방진 먼지나부랭이! 페이의 전승에서 네 역할은 없어. 이 이야기는 우리 중 하나의 것이지, 요람에서 갓 나온 애송이의 것이 아니야.` | Reuse the accepted dismissive `dustling` address at IDs 2149 (D-335) and 21707 (D-18327). |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-25551-25600-D19198/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`05c2b3ef6c6214576a41a6b34a0c7e29fd1ae2411ad1d5d9d23ac81e53521fdb`.
Post-edit SHA-256:
`aeb60301ba8cd905e26601c1c8a823c82fd271e6d2db40f5816bb5d8e0d7f984`.
Reversing exactly this `Texto` substitution reproduces the backup
byte-for-byte; BOM, row order, 72,011 CRLF endings, and 73 existing bare-LF
endings are preserved. Totals: 2,170 accepted / 24,177 `not an issue` /
12,177 uncertain (38,524). Resume D-19210 at ID 25601. Report:
[`25551-25600`](consolidated-context-review-default-25551-25600-20261011.md).

## `default` IDs 25601-25650 (D-19210-D-19216)

Resolve 34 of 39 prior uncertain keys: two accepted corrections and 32
`not an issue`. Retain specific holds at 25601 (unknown day marker), 25611
(conflicting Kollossae standard), 25637 (`Walls` place/context), 25639
(`Font` name/context), and 25643 (Hireling category/rank). ID 25617 links to
D-18225 without recounting. Totals: 2,172 accepted / 24,209 `not an issue` /
12,143 uncertain (38,524). Resume D-19217 at ID 25651. Report:
[`25601-25650`](consolidated-context-review-default-25601-25650-20261011.md).

Accepted `Texto` changes:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25603 | `틸레라 장군과 함께 꿰뚫는 빛을 되찾았고, 멜 센시르에서 투아사와 싸울 준비를 마쳤다.` | `틸레라 장군과 함께 관통의 빛(Piercing Light)을 되찾았고, 멜 센시르에서 투아사와 싸울 준비를 마쳤다.` | Reuse the established named-weapon rendering at D-18453. |
| 25608 | `워스워른 궁수` | `워스원(Warsworn) 궁수` | Reuse accepted Warsworn form D-2857. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-25601-25650-D19210/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`aeb60301ba8cd905e26601c1c8a823c82fd271e6d2db40f5816bb5d8e0d7f984`.
Post-edit SHA-256:
`d715d9f5d1bd027530e4a66f41fad290e357d36f9b507ef730ae736165eb5b73`.
Reversing these two substitutions reproduces the backup byte-for-byte;
BOM, row order, CRLF/bare-LF counts, IDs, embedded line breaks, and runtime
markers are preserved.

## `default` IDs 25651-25700 (D-19217-D-19223)

Resolve 27 of 31 prior uncertain keys: one accepted correction and 26
`not an issue`. Retain specific holds at 25663 (`LoreWeapon` use), 25694
(`Brownie's Bite` sense), 25698 (`Shadowcaster` category/title), and 25699
(`Undersea Fasting` versus passage). Totals: 2,173 accepted / 24,235
`not an issue` / 12,116 uncertain (38,524). Resume D-19224 at ID 25701.
Report:
[`25651-25700`](consolidated-context-review-default-25651-25700-20261011.md).

Accepted `Texto` change:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25693 | `이 유적은 니스카루 공작 가자오르의 엄니로 만든 창, 꿰뚫는 빛이 잠든 곳이라고 전해진다.` | `이 유적은 니스카루 공작 가자오르의 엄니로 만든 창, 관통의 빛(Piercing Light)이 잠든 곳이라고 전해진다.` | Reuse the accepted `Piercing Light` name at D-18453 and D-19210. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-25651-25700-D19217/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`d715d9f5d1bd027530e4a66f41fad290e357d36f9b507ef730ae736165eb5b73`.
Post-edit SHA-256:
`fadaa0e6b096e8e7fa8f88ce58d186143656170a3dc8e6b58eb4f81293f9ffa8`.
Reversing the exact sentence substitution reproduces the backup byte-for-byte;
BOM, row order, CRLF/bare-LF counts, IDs, line breaks, and runtime markers
are preserved.

## `default` IDs 25701-25750 (D-19224-D-19232)

Resolve 28 of 30 prior uncertain keys: three accepted corrections and 25
`not an issue`. Retain specific holds at 25707 (`Grim's Special` dish/item
type) and 25727 (`Hexes` curse/card/game term). Totals: 2,176 accepted /
24,260 `not an issue` / 12,088 uncertain (38,524). Resume D-19233 at ID
25751. Report:
[`25701-25750`](consolidated-context-review-default-25701-25750-20261011.md).

Accepted `Texto` changes:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25711 | `형제자매들이여, 모여라! 선택받은 자의 죽음에 우리 주인님께서 상을 내리실 것이다!` | `형제자매들이여, 모여라! 부름받은 자의 죽음에 우리 주인님께서 상을 내리실 것이다!` | Reuse the established Beckoned title at D-3443. |
| 25735 | `선택받은 자여, 콜로새의 무기가 전투에서 실패하는 일은 드뭅니다.` | `부름받은 자여, 콜로사이의 무기가 전투에서 실패하는 일은 드뭅니다.` | Reuse Beckoned D-692 and the later accepted Kollossae form D-18878/D-18933. |
| 25742 | `도망친 놈들이며 무기와 갑옷은 필요 없어. 하지만 각 선원에게 보그스토언치 한 병씩 줬지. 그걸 되찾아야 해.` | `도망친 놈들이며 무기와 갑옷은 필요 없어. 하지만 선원단마다 보그스토언치 한 병씩 줬지. 그걸 되찾아야 해.` | English specifies a bottle per crew, not per sailor. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-25701-25750-D19224/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`fadaa0e6b096e8e7fa8f88ce58d186143656170a3dc8e6b58eb4f81293f9ffa8`.
Post-edit SHA-256:
`04e76ed8a6647ed1bd1594c9f6b8dc8376c870217b395a713d706642c20dfca4`.
Reversing these exact substitutions reproduces the backup byte-for-byte;
BOM, row order, CRLF/bare-LF counts, IDs, line breaks, and runtime markers
are preserved.

## `default` IDs 25751-25800 (D-19233-D-19238)

Resolve 25 of 26 prior uncertain keys: four accepted corrections and 21
`not an issue`. Retain the Plagueshield identity hold at ID 25755. Existing
accepted/not-issue items at 25751, 25777, 25779-25780, 25783, and 25800 are
linked without recounting. Totals: 2,180 accepted / 24,281 `not an issue` /
12,063 uncertain (38,524). Resume D-19239 at ID 25801. Report:
[`25751-25800`](consolidated-context-review-default-25751-25800-20261011.md).

Accepted `Texto` changes:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25785 | `건방진 먼지 인간, 죽을 때다.` | `건방진 먼지나부랭이, 죽을 때다.` | Reuse accepted dismissive `dustling` D-335/D-18327. |
| 25794 | `용맹의 전당` | `용맹의 집(House of Valor)` | Reuse D-148/D-650. |
| 25795 | `...우리 종족은 너희 먼지 인간만큼 쉽게 변하지 않으니까.` | `...우리 종족은 너희 먼지나부랭이들만큼 쉽게 변하지 않으니까.` | Preserve the contemptuous plural address per accepted `dustling` usage. |
| 25796 | `...용맹의 전당에서 연례 팀 대회를 준비 중이다...` | `...용맹의 집(House of Valor)에서 연례 팀 대회를 준비 중이다...` | Reuse D-148/D-650. |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-25751-25800-D19233/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`04e76ed8a6647ed1bd1594c9f6b8dc8376c870217b395a713d706642c20dfca4`.
Post-edit SHA-256:
`5e8e39450e3254c1cf3c50413bdd1683624f772234256372798a956e5e33dac1`.
Reversing these exact substitutions reproduces the backup byte-for-byte;
BOM, row order, CRLF/bare-LF counts, IDs, line breaks, and runtime markers
are preserved.

## `default` IDs 25851-25900 (D-19248-D-19254)

Accepted `Texto` changes:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25852 | `석학 레이나 니욘` | `사반트 라이나 노른(Raina Njorn)` | Reuse the formal Savant rank `사반트` from D-18268 and the same character's active Korean spelling at ID 17810. |
| 25860 | `빙의된 석학들` | `빙의된 사반트들` | Use the established formal Korean rank for English `Savants`, retaining the supported possession reading. |

Totals: 2,187 accepted / 24,307 `not an issue` / 12,030 uncertain
(38,524). Resume D-19255 at ID 25901. ID 25871 links to D-18277 without
recounting. Report:
[`25851-25900`](consolidated-context-review-default-25851-25900-20261011.md).

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-25851-25900-D19248/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`65a3e909862eeab29618c5283567adaf4b565f0405c79760276838f8cab643e3`.
Post-edit SHA-256:
`bd1f988e5997be7bc983ff9878cd52ba0e2ca19d42e5bbd432f5d93ab9202c91`.
Reversing the two exact substitutions reproduces the backup byte-for-byte.
Only these two `Texto` values changed; UTF-8 BOM, 65,135 rows, key order,
72,011 CRLF endings, and 73 existing bare-LF endings are preserved.

## `default` IDs 25901-25950 (D-19255-D-19261)

No Korean `Texto` value changed in this context review. Six prior uncertain
findings were resolved as `not an issue`; ID 25901 remains uncertain over
whether `누이` selects an age relation not stated by English `sister`.
Previously accepted corrections at IDs 25928 and 25936 remain in place and
are not recounted.

Totals: 2,187 accepted / 24,313 `not an issue` / 12,024 uncertain
(38,524). Resume D-19262 at ID 25951. Active default SHA-256 remains
`bd1f988e5997be7bc983ff9878cd52ba0e2ca19d42e5bbd432f5d93ab9202c91`.
No backup was needed. Report:
[`25901-25950`](consolidated-context-review-default-25901-25950-20261011.md).

## `default` IDs 25951-26000 (D-19262-D-19264)

No Korean `Texto` value changed. All three prior uncertain findings were
resolved as `not an issue`; the Plagueshield replenishment context supports
the existing `역병 방호제`. Previously accepted ID 25986 remains unchanged
and is not recounted.

Totals: 2,187 accepted / 24,316 `not an issue` / 12,021 uncertain
(38,524). Resume D-19265 at ID 26001. Active default SHA-256 remains
`bd1f988e5997be7bc983ff9878cd52ba0e2ca19d42e5bbd432f5d93ab9202c91`.
No backup was needed. Report:
[`25951-26000`](consolidated-context-review-default-25951-26000-20261011.md).

## `default` IDs 26001-26050 (D-19265-D-19269)

No Korean `Texto` value changed. All five prior uncertain findings were
resolved as `not an issue`; previously accepted corrections at IDs 26007 and
26047 remain unchanged and are not recounted.

Totals: 2,187 accepted / 24,321 `not an issue` / 12,016 uncertain
(38,524). Resume D-19270 at ID 26051. Active default SHA-256 remains
`bd1f988e5997be7bc983ff9878cd52ba0e2ca19d42e5bbd432f5d93ab9202c91`.
No backup was needed. Report:
[`26001-26050`](consolidated-context-review-default-26001-26050-20261011.md).

## `default` IDs 26051-26100 (D-19270-D-19273)

Accepted `Texto` changes:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26070 | `쓸모없는 탈영병 무리가 다섯 팀이나 있어. 그리고 값으로 매길 수 없는 보그스토언치 다섯 병을 각각 들고 있지. 내게 필요한 건 보그스토언치야.` | `쓸모없는 탈영병 무리가 다섯 팀이나 있어. 그놈들 손에 값으로 매길 수 없는 보그스토언치 다섯 병이 있지. 내게 필요한 건 보그스토언치야.` | Remove the unsupported allocation of one bottle to each crew. |
| 26082 | `워스워른! 만나서 반갑군!` | `워스원(Warsworn)! 만나서 반갑군!` | Reuse accepted Warsworn form D-2857. |

Resolve three of four prior uncertain findings (two accepted, one `not an
issue`); retain ID 26076 for the ambiguous “jest at her behalf” source
phrase. ID 26093 was already accepted at D-8521 and is not recounted.
Totals: 2,189 accepted / 24,322 `not an issue` / 12,013 uncertain
(38,524). Resume D-19274 at ID 26101. Report:
[`26051-26100`](consolidated-context-review-default-26051-26100-20261011.md).

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-26051-26100-D19270/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`bd1f988e5997be7bc983ff9878cd52ba0e2ca19d42e5bbd432f5d93ab9202c91`.
Post-edit SHA-256:
`a3eb5aa5d3277db9f9e8389e87f2eecc1db4f6369f14ec9d7305d7fe683a9375`.
Reversing the two exact substitutions reproduces the backup byte-for-byte.
Only these `Texto` values changed; BOM, row order, 72,011 CRLF and 73
pre-existing bare-LF endings are preserved.

## `default` IDs 26101-26150 (D-19274-D-19281)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26113 | `그럼 먼지 아이는 흥미를 끄는 걸 찾았나?` | `그럼 먼지나부랭이가 흥미를 느낄 만한 걸 찾았나?` | Reuse accepted dismissive `dustling` term D-335/D-18327 and clarify the interest clause. |
| 26126 | `발라드의 가문` | `발라드의 집` | Reuse the accepted House of Ballads form D-711. |
| 26127 | `...워스워른에 자네 같은 강자가 더 필요하네.` | `...워스원(Warsworn)에 자네 같은 강자가 더 필요하네.` | Reuse Warsworn form D-2857 and retain the exact source name. |
| 26142 | `...콜로새 중에 저 회랑에 발을 들인 이가 있는지도 모르겠어.` | `...콜로사이 중에 저 회랑에 발을 들인 이가 있는지도 모르겠어.` | Apply the later accepted Kollossae form D-18878/D-18933. |
| 26150 | `...최초의 알파르족에게서 갈라져 나왔다.` | `...최초의 알파르족의 후손이다.` | Correct the English/Japanese-supported descent relation. |

Four prior uncertain findings were accepted, three were resolved as `not an
issue`, and the Beckoned title at IDs 26101/26134 remains uncertain.
Duplicate ID 26106 evidence was linked without double-counting. Totals:
2,193 accepted / 24,325 `not an issue` / 12,006 uncertain (38,524).
Resume D-19282 at ID 26151.

Pre-edit SHA-256:
`a3eb5aa5d3277db9f9e8389e87f2eecc1db4f6369f14ec9d7305d7fe683a9375`.
Post-edit SHA-256:
`2e88c2e07b9e80038ded0dbec4d8fe3b55d90a8880cc00c9add34fe1d6df2783`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-26101-26150-D19274/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the five exact substitutions reproduces the backup byte-for-byte;
only the listed `Texto` values changed. The BOM, 65,135-row order,
72,011 CRLF endings, and 73 pre-existing bare-LF endings remain intact.
Details:
[`IDs 26101-26150`](consolidated-context-review-default-26101-26150-20261011.md).

## `default` IDs 26151-26200 (D-19282-D-19287)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26157 | `콜로새의 야만적인 사촌 종족인 데이니르는...` | `콜로사이의 야만적인 사촌 종족인 데이니르는...` | Reuse the later accepted Kollossae form D-18878/D-18933. |

One prior uncertain finding was accepted, three were resolved as `not an
issue`, and the `longlegs` referent and `Five-and-nine by night` riddle
remain uncertain. Totals: 2,194 accepted / 24,328 `not an issue` / 12,002
uncertain (38,524). Resume D-19288 at ID 26201.

Pre-edit SHA-256:
`2e88c2e07b9e80038ded0dbec4d8fe3b55d90a8880cc00c9add34fe1d6df2783`.
Post-edit SHA-256:
`2b46d9e070def1062d970ec44efb50fa28f1a0c636b707f6a85be7a92f39e504`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-26151-26200-D19282/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the exact substitution reproduces the backup byte-for-byte; only
the listed `Texto` value changed. The BOM, 65,135-row order, 72,011 CRLF
endings, and 73 pre-existing bare-LF endings are preserved. Details:
[`IDs 26151-26200`](consolidated-context-review-default-26151-26200-20261011.md).

## `default` IDs 26401-26450 (D-19306-D-19308)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26441 | `...고대 워스워른의 금고에서...` | `...고대 워스원(Warsworn)의 금고에서...` | Reuse the accepted Warsworn form D-2857. |
| 26443 | `워스워른` | `워스원(Warsworn)` | Apply the accepted faction form D-2857 to the standalone label. |

Twenty-two prior uncertain IDs were re-reviewed: two accepted, nineteen
`not an issue`, and one unresolved (`Crossing` at 26422). ID 26434 appeared
in two source groups and was counted once; the already accepted Warden
correction at 26436 was linked, not recounted. Totals: 2,202 accepted /
24,420 `not an issue` / 11,902 uncertain (38,524). Resume D-19309 at ID
26451. Report:
[`26401-26450`](consolidated-context-review-default-26401-26450-20261011.md).

Pre-edit SHA-256:
`cf82bebc2dba96dadfb61fdf8ff484e78347e7bedcae773c546be03be566861b`.
Post-edit SHA-256:
`655bd05983ef107d1962baa58c60de069bd86190fed707bb2fe4851ce639e658`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-26401-26450-D19306/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the two exact substitutions reproduces the backup byte-for-byte.
Only the listed `Texto` cells changed; the BOM and existing 72,011 CRLF /
73 bare-LF endings are preserved.

## `default` IDs 26616 and 26637 (D-19315)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26616 | `너는 《레퀴엠》을 손에 넣지 못할 거야.` | `너는 레퀴엠호를 손에 넣지 못할 거야.` | The Requiem is identified as Dead Kel's ship elsewhere in the English corpus; Japanese uses the ship suffix, and active Korean uses `레퀴엠호` for the same vessel. |
| 26637 | `구엘무인의 죽음!` | `구엘무인에서의 죽음!` | English `Death at Guelmuin` and the parallel Japanese/Chinese readings identify a death at the place, not a death belonging to Guelmuin. |

Pre-edit SHA-256:
`c7e3b09af219210751aee2adfa012866e64258e5d9958bcee6d7ba22810adb14`;
post-edit SHA-256:
`59c1c500a9baf9d335764f44db900b9bc7e50fbb94d927a6bb6c70bfd36098a6`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-26601-26650-D19315/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the two exact substitutions reproduces the backup byte-for-byte.
Only these `Texto` cells changed; the BOM and existing 72,011 CRLF /
73 bare-LF endings are preserved. Details:
[`IDs 26601-26650`](consolidated-context-review-default-26601-26650-20261011.md).

## `default` ID 26652 (D-19318)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26652 | `워스워른과 여행자들이 물과 기름처럼 섞이지 못한다는 건 다들 알아.` | `워스원(Warsworn)과 여행자들이 물과 기름처럼 섞이지 못한다는 건 다들 알아.` | Reuse the accepted Warsworn form from D-2857. |

Pre-edit SHA-256:
`59c1c500a9baf9d335764f44db900b9bc7e50fbb94d927a6bb6c70bfd36098a6`;
post-edit SHA-256:
`db85756a1b919985fb49fa0bb4a1ff4066513b66b2b9fd2939bffc61ae5bf040`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-26651-26700-D19318/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the exact substitution reproduces the backup byte-for-byte.
Only ID 26652's `Texto` changed; the BOM and existing 72,011 CRLF /
73 bare-LF endings are preserved. Details:
[`IDs 26651-26700`](consolidated-context-review-default-26651-26700-20261011.md).

## `default` IDs 26501-26550 (D-19311)

No additional Korean `Texto` cells changed. Re-review all 22 remaining
uncertain IDs as `not an issue`; ID 26547 links to D-18235, and the accepted
corrections at IDs 26531, 26539, and 26548 are linked without recounting.
Totals: 2,204 accepted / 24,462 `not an issue` / 11,858 uncertain (38,524).
Resume D-19312 at ID 26551. Active default SHA-256 remains
`6d60b9da225f25c8f925b2a1ca328c9643f3d14ddbb51d17367cd3586e88c74c`.
No backup was needed. Report:
[`26501-26550`](consolidated-context-review-default-26501-26550-20261011.md).

## `default` IDs 26551-26600 (D-19312-D-19314)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26558 | `용맹의 가문` | `용맹의 집(House of Valor)` | Reuse the accepted House of Valor form from D-148/D-650 and ID 26303. |
| 26567 | `...선 캠프처럼 되고 싶진 않아.` | `...태양 야영지(Sun Camp)처럼 되고 싶진 않아.` | Reuse the accepted Sun Camp form from D-16041. |

Re-review 24 unique uncertainties: two accepted, twenty-one `not an issue`,
and the specific `gift`/power-direction uncertainty at 26573 remains held.
The D-19311 resolutions for IDs 26515 and 26517 are linked; the accepted
corrections at 26565 and 26598 are not recounted. Totals: 2,206 accepted /
24,483 `not an issue` / 11,835 uncertain (38,524). Resume D-19315 at ID
26601. Report:
[`26551-26600`](consolidated-context-review-default-26551-26600-20261011.md).

Pre-edit SHA-256:
`6d60b9da225f25c8f925b2a1ca328c9643f3d14ddbb51d17367cd3586e88c74c`.
Post-edit SHA-256:
`c7e3b09af219210751aee2adfa012866e64258e5d9958bcee6d7ba22810adb14`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-26551-26600-D19312/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the two exact substitutions reproduces the backup byte-for-byte.
Only the listed `Texto` cells changed; the BOM and existing 72,011 CRLF /
73 bare-LF endings are preserved.

## `default` IDs 26451-26500 (D-19309-D-19310)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26473 | `번트` | `번(The Burn)` | Reuse the accepted identical standalone label at ID 7284 (D-1976). |
| 26479 | `달빛 캠프` | `달 야영지` | Reuse the accepted Moon Camp rendering at IDs 2836 and 62843 (D-18030). |

Twenty-two unique prior uncertainties were re-reviewed: two accepted and
twenty `not an issue`. Fateweaving at 26476 (D-18208) and the accepted
Crilgarin title at 26496 (D-18633) were linked, not recounted. Overlapping
IDs 26481, 26483, and 26490 were counted once. Totals: 2,204 accepted /
24,440 `not an issue` / 11,880 uncertain (38,524). Resume D-19311 at ID
26501. Report:
[`26451-26500`](consolidated-context-review-default-26451-26500-20261011.md).

Pre-edit SHA-256:
`655bd05983ef107d1962baa58c60de069bd86190fed707bb2fe4851ce639e658`.
Post-edit SHA-256:
`6d60b9da225f25c8f925b2a1ca328c9643f3d14ddbb51d17367cd3586e88c74c`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-26451-26500-D19309/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the two exact substitutions reproduces the backup byte-for-byte.
Only the listed `Texto` cells changed; the BOM and existing 72,011 CRLF /
73 bare-LF endings are preserved.

## `default` ID 26735 (D-19322)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26735 | `드베르가는 이 섬에 사는 토착 야수를 수십 마리나 부렸다. 야수들을 길들여 부역에 동원했지.` | `드베르가는 이 섬 토착 야수 수십 마리를 훈련해 자신들을 위해 일하게 했다.` | Preserve the source's training and service meaning without adding an unsupported forced-labor implication. |

Pre-edit SHA-256:
`db85756a1b919985fb49fa0bb4a1ff4066513b66b2b9fd2939bffc61ae5bf040`;
post-edit SHA-256:
`1057624d5e2dba12082120f33f320ae46050dd81f691eb407979dba81eb455a7`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-26701-26750-D19322/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the exact substitution reproduces the backup byte-for-byte.
Only ID 26735's `Texto` changed; the BOM and existing 72,011 CRLF /
73 bare-LF endings are preserved. Details:
[`IDs 26701-26750`](consolidated-context-review-default-26701-26750-20261011.md).

## `default` ID 26770 (D-19324)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26770 | `...그림이 대사제에게 함정에 빠졌다는 충격적인 소식도...` | `...대사제가 그림을 함정에 빠뜨렸다는 충격적인 소식도...` | English, Japanese, and Chinese identify the Hierophant as the agent who trapped Grim; state that relation clearly in Korean. |

Pre-edit SHA-256:
`1057624d5e2dba12082120f33f320ae46050dd81f691eb407979dba81eb455a7`;
post-edit SHA-256:
`26f103c961c0bf576e6f070f6fd043030abbbca3e92fa925797e62292f8181ef`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-26751-26800-D19324/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the exact substitution reproduces the backup byte-for-byte.
Only ID 26770's `Texto` changed; the BOM and existing 72,011 CRLF /
73 bare-LF endings are preserved. Details:
[`IDs 26751-26800`](consolidated-context-review-default-26751-26800-20261011.md).

## `default` ID 26815 (D-19326)

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26815 | `...마지막 드베르가 유물은 섬 동쪽에 있을 것 같아.` | `...마지막 드베르가 조각들은 섬 동쪽에 있을 것 같아.` | English, Japanese, and Chinese say pieces/fragments without identifying them as relics. |

Pre-edit SHA-256:
`26f103c961c0bf576e6f070f6fd043030abbbca3e92fa925797e62292f8181ef`;
post-edit SHA-256:
`3c8eac63846bd2c7a765d5b39688cc32797eeba41f13994e05a604161c2652ca`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-26801-26850-D19326/locatexts_zh_cn.koalocatext_default.csv`.
Reversing the exact substitution reproduces the backup byte-for-byte.
Only ID 26815's `Texto` changed; the BOM and existing 72,011 CRLF /
73 bare-LF endings are preserved. Details:
[`IDs 26801-26850`](consolidated-context-review-default-26801-26850-20261011.md).
