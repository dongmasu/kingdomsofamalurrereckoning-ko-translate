# Consolidated Context Review: Remaining Tender and Foes' Hearth Holds

- Date: 2026-10-12.
- Decision: D-19460.
- Scope: `default` IDs 2116, 14987, 31362, 36286, 63231, and 63232.
- Method: reuse the direct Tenders definitions and accepted terminology
  already checked at D-19454, D-19458, and D-19459; compare only each
  unresolved sentence and its exact English/Japanese/Chinese/Korean keys.

## Findings

| ID | Result | Rationale |
| ---: | --- | --- |
| 2116 | Not an issue | English uses lowercase `tenders` for the attendants who report the subject's statements. Korean `수행자들` preserves that ordinary attendant sense; the line does not establish the formal House order. Japanese `番人たち` and Chinese `看护者` likewise describe attendants/caretakers. |
| 14987 | Accepted | The Tenders role and House affiliation were corrected at D-19458. The remaining names now include exact English spellings, using the accepted Korean `카도로크(Cadoroc)` precedent at IDs 23904/24159 and established `사투르닌(Saturnyn)` form. The suspicion and alternative identity remain intact. |
| 31362 | Accepted | English `a Tender of the Midden`, Japanese's quoted Tender title, and Chinese's “caretaker of the Midden” preserve a relation to the Midden. Change `미든을 돌보는 이` (“one who cares for the Midden”) to `미든의 돌보는 이(Tender)` without asserting that the Tender cares for the place itself. |
| 36286 | Accepted | The established Tender role is retained. Align Cadoroc and Saturnyn with the English spellings and accepted Korean forms; preserve the report that Cadoroc fled and the question about Saturnyn's involvement. |
| 63231 | Accepted | English, Japanese, and the surrounding quest context identify Foes' Hearth as the eastern meeting place. Reuse the established `적들의 난롯가(Foes' Hearth)` form from IDs 65110 and 23441; render the location naturally as `동쪽에 있는 ...`. |
| 63232 | Accepted | The exact label now uses the established `비탄의 집(House of Sorrows)` form from D-19451. With the adjacent meeting-place name at 63231 aligned, the earlier context-bound hold is resolved. |

Five prior uncertainties are accepted and one is cleared as `not an issue`.
No finding is counted twice; prior partial Tenders corrections at 14987 and
36286 are finalized here.

## Applied Cells

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 14987 | `비탄의 집 소속 돌보는 이(Tender) 카도로크가 동료 하나를 죽이고 집을 달아났다. 사투르닌의 영향일 수도 있고, 카도로크가 사투르닌 본인일지도 모른다.` | `비탄의 집 소속 돌보는 이(Tender) 카도로크(Cadoroc)가 동료 하나를 죽이고 집을 달아났다. 사투르닌(Saturnyn)의 영향일 수도 있고, 카도로크(Cadoroc)가 사투르닌(Saturnyn) 본인일지도 모른다.` |
| 31362 | `반갑네, 필멸자여. 나는 미든을 돌보는 이(Tender)야. 해제술에 관해 내가 아는 만큼 알려 주라는 지시를 받았어.` | `반갑네, 필멸자여. 나는 미든의 돌보는 이(Tender)야. 해제술에 관해 내가 아는 만큼 알려 주라는 지시를 받았어.` |
| 36286 | `요즘 소문이 많아. 우리 돌보는 이들(Tenders)의 우두머리 카도로크가 집을 떠나 부하를 쓰러뜨리고 달아났다더군. 사터닌이 배후에 있는 걸까?` | `요즘 소문이 많아. 우리 돌보는 이들(Tenders)의 우두머리 카도로크(Cadoroc)가 집을 떠나 부하를 쓰러뜨리고 달아났다더군. 사투르닌(Saturnyn)이 배후에 있는 걸까?` |
| 63231 | `가드플로의 지배를 끝내고 싶다면 동쪽의 포즈 하스에서 내 형제들과 나를 만나. 거기서 더 얘기하지.` | `가드플로의 지배를 끝내고 싶다면 동쪽에 있는 적들의 난롯가(Foes' Hearth)에서 내 형제들과 나를 만나. 거기서 더 얘기하지.` |

ID 63232 already contains the D-19451 accepted label and was not edited in
this batch.

## Verification

- Compared the target IDs across English, Japanese source, Japanese-derived
  draft, Chinese, and active Korean; reused direct Tenders definitions at
  English IDs 13355, 42553, and 63584.
- Only the four listed Korean `Texto` cells changed.
- Pre-edit SHA-256:
  `ffbb92a4b8b4c76c2f5d0fc03909e1c195c7cc58889dc89b81117742e8986b2d`.
- Post-edit SHA-256:
  `6f1bdca9db7a821642b2a10857284da6a7d8ebe6bc7b13639b75117585022c80`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-tender-place-names-D19460/locatexts_zh_cn.koalocatext_default.csv`.
- Reversing the four exact substitutions reproduces the backup byte for
  byte. BOM, row order, CRLF endings, and pre-existing bare-LF endings are
  preserved.
- Totals after D-19460: **2,314 accepted / 25,005 not an issue /
  11,205 uncertain** (38,524). Resume at D-19461 from the deduplicated
  unresolved-source queue.
