# Candidate Reconciliation: IDs `59500`-`59749`

- Date: 2026-11-15.
- Rechecked all 15 new correction candidates against the active Korean text
  and the English, Japanese, and Chinese sources.
- All 15 were reconciled: seven already had supported wording in the active
  CSV, and eight were corrected.
- Rechecked nine older candidate findings. Seven were already resolved in
  the current text, two were corrected, and the old `59576` urn finding was
  withdrawn because it is attached to the wrong localization ID.
- The sequential report's summary says 14 new candidates, but its candidate
  table and the ledger contain 15. The separate source-conflict hold at
  `59722` is not a correction candidate.

## New Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `59595` | Corrected | Added the complete destination label `Keep Courtyard` as `성채 안뜰(Keep Courtyard)`; retained the Cillian objective and sentence structure. |
| `59601` | Already resolved | `콜라드(Colad)` is already paired, and the Alfar Army and Tywili references remain intact. The source's misspelled rank was not silently normalized. |
| `59604` | Corrected | Added `(Emerald Wing)` to the existing, readable `에메랄드 구역`; retained the full paragraph and its embedded CRLF. |
| `59606` | Corrected | Added the complete place-name pairing `발러의 교차로(Balor's Crossing)`. |
| `59610` | Already resolved | Both named city areas are paired: `장벽(Walls)` and `군도(The Isles)`. |
| `59613` | Already resolved | The active row uses the established `칼로르 경(Lord Callor)` and `테레니아(Terenia)` pairings. |
| `59635` | Already resolved | The standalone item is already paired as `서리망치 파편(Frosthammer Fragment)`. |
| `59649` | Corrected | Added the full standalone-title pairing `실천의 서약(The Pledge to Action)`. |
| `59679` | Already resolved | `결투 보조인` conveys the duelist's attendant/helper role in the English duel context and Japanese `介添人`; it does not reduce the role to an observer. |
| `59685` | Corrected | Expanded the parenthetical to the full source title: `자비로운 티르노크(Tirnoch the Merciful)`. |
| `59705` | Corrected | Recast the stiff goiter/lesion clause as `그다음 갑상샘종이 커지고 진물이 끊임없이 흐르는 병변이 생긴다.` The existing natural `가래 끓는 기침` wording was retained. |
| `59730` | Corrected | Added the source spelling to the standalone name: `레인(Rane)`. Japanese and Chinese also retain `Rane`. |
| `59735` | Corrected | Added the missing weapon-type pairing: `페이블레이드(Faeblades)`, retaining the established `비탄의 집(House of Sorrows)`. |
| `59746` | Already resolved | `단검 공격 버튼` explicitly preserves the attack-button action, and the hold/release sequence and five-hit maximum remain present. |
| `59747` | Already resolved | The standalone character label is already `킴(Kim)`. |

## Earlier Findings Rechecked

| ID | Disposition |
| ---: | --- |
| `59551` | The current `틱네리(Ticneri)` matches the established name. The object to carve remains unspecified; no material was inferred. |
| `59562` | The objective already uses the established action form `다크바리 가문(Darkvari family) 처단하기`. |
| `59576` | Withdrawn as a misattributed finding. Its English source is `Return to Berenike`, and its Korean `베레니케에게 돌아가기` contains no urn terminology. The append-only historical ledger entry was preserved. |
| `59579` | `미린느(Myrinne)` is already paired and retains the death/task meaning. |
| `59600` | The quest-status line already uses plain style: `...더는 완료할 수 없다.` |
| `59641` | Corrected the causal relationship and naturalness while preserving the hesitation: `네가 감시당한다는 걸 눈치채면 안 됐어. 내 표적이... 의심을 품을 수도 있으니까.` |
| `59642` | Changed `산적` to `도적`, matching the same rescue-quest bandit terminology at related rows and Japanese `盗賊`; retained the speaker's contemptuous tone. |
| `59710` | The objective already uses `은둔 대장장이(Hermit Smith)` and the established `-하기` form. |
| `59725` | `마법사 보초` already expresses the spell-casting sentries; the Shadow Pass destination and safe-passage objective remain intact. |

## Report-Only Finding

`59659` was already in the ledger as `not-issue`, but the sequential report
also identified a missing title pairing. Added `기묘한 처녀(Strange Maiden)`
without assigning a specific character identity.

## Preserved Holds

- `59556` and `59689`: English/Japanese register differs from Korean, but the
  speaker and conversational stage are not established. No voice change was
  inferred from asset association.
- `59722`: English and Chinese say `PART VI` / `第六部分`, while Japanese
  says `第4部`. Korean `제6부` matches English and Chinese; retained pending
  stronger game-context evidence.

No speaker or playback order was inferred from asset association.

## Applied Changes

- `59595`, `59604`, `59606`, `59649`, `59685`, `59730`, and `59735`: added
  missing complete English name/title pairings.
- `59641`: clarified that discovery of the surveillance could make the
  speaker's target suspicious.
- `59642`: aligned the bandit term with the related quest terminology.
- `59659`: added the standalone title pairing as a report-only follow-up.
- `59705`: made the disease progression clause more natural and explicit.

Only the 11 changed IDs' `source_fingerprint` fields were refreshed. No source
CSV or extracted game asset was changed; no commit was made.

## Result and Verification

- All 15 new candidates were reconciled: eight corrected, seven already
  reflected in the active text.
- Candidate reconciliation is `3,352 / 4,026` (`83.26%`), with `674`
  remaining. The withdrawn `59576` finding and report-only `59659` finding
  were not counted again.
- The review ledger validates all 65,135 IDs. Index/catalog reproducibility
  checks and 20 preservation/context-index tests passed.
- The `default` CSV retains 65,135 ordered IDs and its UTF-8 BOM. Line
  endings remain `71,839` CRLF, `242` LF-only, and `0` bare CR; the
  embedded CRLF in `59604` is preserved.
- The CRLF-aware diff check passed.
