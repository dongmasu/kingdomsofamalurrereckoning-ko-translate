# Consolidated Context Review: `default` IDs 27451-27500

- Review date: 2026-10-12.
- Scope: Re-review the 16 unique uncertain IDs in D-8717-D-8720.
  Seven overlapping IDs already dispositioned as `not an issue` in D-8723
  were linked without recounting.
- Compared English, Japanese source and draft, Chinese, active Korean, and
  prior audit decisions by `ID_Linha`. The Japanese-derived draft is a
  migration source, not independent evidence.
- English controls meaning; Japanese informs voice/register; Chinese is
  supporting evidence.

## Decisions D-19365-D-19369

| Decision | Key | Disposition | Evidence |
| --- | --- | --- | --- |
| D-19365 | `default` 27457 | accepted | English, Japanese, and Chinese all identify a map tutorial. Other Korean tutorial labels use `튜토리얼` (`은신 튜토리얼`, `함정 튜토리얼`); `지도 안내` omits that category. Change to `지도 튜토리얼`. |
| D-19366 | `default` 27491 | accepted | English's “excessive abuse of drink” and Japanese's “alcohol abuse” mean excessive drinking. Replace the unnatural `술을 남용했다` with `과도한 음주`; preserve the expulsion and accusation. |
| D-19367 | `default` 27492 | accepted | Japanese explicitly describes a rite producing sprites. Korean's `새로 태어난 요정들의 탄생 의식` redundantly repeats birth; change to `새 요정들이 태어나는 의식` while retaining the subsequent role and seasonal-return details. |
| D-19368 | `default` 27452, 27454, 27471, 27476, 27478-27480, 27485-27487, 27494, 27496 | not an issue | The name, title, location, ritual, action, and dialogue meanings remain source-traceable. `여사` is supported by Japanese `女史`; the Skoria Mine question and Cryamor warning preserve their referents; the nearby Naros/woodland lore supports the pool's history; and St. Odwig's Mission is a religious institution in context, making `선교원` defensible. Canonical spellings remain glossary work, not evidence of row-local errors. ID 27496 is retained exactly as English and Japanese do; its display path need not be inferred to avoid an unsupported translation. |
| D-19369 | `default` 27495 | accepted | The standalone location is Idylla. Apply the accepted Korean form `이디라` from D-18904 while retaining this row's existing English parenthetical. |

The seven overlapping IDs linked to D-8723 are 27463, 27468, 27475, 27482,
27483, 27484, and 27493. They are not counted again. The accepted
dispositions above do not establish global canonical spellings for Scathe,
Mull-Rane, Cryamor, or St. Odwig's Mission.

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27457 | `지도 안내` | `지도 튜토리얼` | Match the source category and the established Korean wording for other tutorial labels. |
| 27491 | `'술을 지나치게 남용했다'는 이유로 쫓겨났어. 날 위험하고 타락한 인간이라고 했지.` | `'과도한 음주'를 이유로 쫓겨났어. 날 위험하고 타락한 인간이라고 했지.` | Render “excessive abuse of drink” idiomatically without changing the expulsion or accusation. |
| 27492 | `'개화 의식'은 새로 태어난 요정들의 탄생 의식이었어. 평소 내 역할을 맡던 페이 보더릴(Boderill)은 의식에 희생됐지만 다음 계절에 돌아온다고 해. 다행히 오스두인(Osduin)은 필멸자인 내가 페이처럼 그 역할을 할 수 없다는 걸 받아들였어.` | `'개화 의식'은 새 요정들이 태어나는 의식이었어. 평소 내 역할을 맡던 페이 보더릴(Boderill)은 의식에 희생됐지만 다음 계절에 돌아온다고 해. 다행히 오스두인(Osduin)은 필멸자인 내가 페이처럼 그 역할을 할 수 없다는 걸 받아들였어.` | Remove redundant birth wording; Japanese confirms the rite produces sprites. |
| 27495 | `이딜라(Idylla)` | `이디라(Idylla)` | Reuse the accepted Idylla form from D-18904 and preserve the existing bilingual label format. |

## Verification

- All four locale CSVs have 65,135 IDs in identical order.
- IDs 27451-27500 have matching embedded line-break counts and runtime
  marker identities/order across English, Japanese, Chinese, and Korean.
- Only the four authorized Korean `Texto` cells at IDs 27457, 27491, 27492,
  and 27495 changed. Exact reverse substitutions reproduce the pre-edit file
  byte-for-byte.
- UTF-8 BOM, 72,011 CRLF endings, 73 bare-LF endings, 65,135 rows, and ID
  order remain unchanged.
- Pre-edit SHA-256:
  `378a7da73dc8ed13930d1d5d99f754068d9c968179b25d271a00250116a72fb5`.
- Post-edit SHA-256:
  `c425b430379278ed2114f79403f7266163f586fa1960bf12a6622643228cd310`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-context-27451-27500-D19365/locatexts_zh_cn.koalocatext_default.csv`.
- Totals: 2,232 accepted / 24,729 `not an issue` / 11,563 uncertain
  (38,524). Resume at D-19370, ID 27501; sequential review remains for
  27501-65134 (37,634 IDs), prior specific holds, and register reconciliation.
