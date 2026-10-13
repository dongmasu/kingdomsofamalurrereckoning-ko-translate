# Disposition Batch: `default` IDs 56051-56100

- Date: 2026-10-11. Compared all 50 active IDs with English, Japanese,
  Chinese, the preliminary scan, source-keyed historical notes, prior
  terminology decisions, lineation, runtime markers, and numeric values.
  These working dispositions are not independent final linguistic approval.
- Three accepted corrections, 40 `not an issue` IDs, and seven uncertain IDs.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56051 | `사령부의 명령으로 우리는 클루리콘(Klurikon)에 잠복해 있었어. 몇 달 동안 그곳에서 쥐와 시체에서 노획한 보급품으로 버텼지.` | `사령부의 명령으로 우리는 클루리콘(Klurikon)에 주둔했어. 몇 달 동안 그곳에서 쥐와 시체에서 노획한 보급품으로 버텼지.` | English describes the command placing the unit in Klurikon; Japanese `駐留` and Chinese `驻扎` explicitly mean stationing there. `잠복` adds concealment/infiltration not supported by the references. |
| 56095 | `전쟁에서 정말 이긴 걸까? 동생을 다시 볼 수만 있다면 뭐든 내놓을 텐데.` | `전쟁에서 정말 이긴 걸까? 형제를 다시 볼 수만 있다면 뭐든 내놓을 텐데.` | English says `brother` without relative age. `동생` invents younger age; `형제` preserves the male sibling reference without choosing age. |
| 56096 | `왜, 거의 인간이나 다름없군.` | `아니, 거의 인간이나 다름없군.` | In `Why, they're practically human`, `Why` is an exclamatory discourse marker, not a request for a reason. Japanese and Chinese also render an interjection rather than a question. |

## Uncertain Findings

| ID | Decision | Rationale |
| ---: | --- | --- |
| 56060 | Uncertain | The sentence preserves the strengthening limit, but the canonical tier meant by `pristine` is not established. |
| 56067 | Uncertain | The ring's “profound peace” may describe calm, pacification, or a combat effect; game context is needed. |
| 56068 | Uncertain | The quest relation is retained, but the canonical forms/roles of Hallam the White and the Maid remain unsettled across the locale references. |
| 56083 | Uncertain | Korean adds `집` to `the Sorrows`; the English does not say House, and the references do not settle whether this is the House of Sorrows or another place/faction. |
| 56084 | Uncertain | The capitalized `House` may be a named faction or location, but its antecedent is implicit; `그 집` leaves that ambiguity unresolved. |
| 56099 | Uncertain | `Savant` is retained phonetically, while Japanese and Chinese suggest different rank/title meanings; the project's canonical term is not established. |
| 56100 | Uncertain | English is the primary spelling, but the canonical Korean rendering of Azo Raemund is not confirmed by the differing phonetic references. |

## Not an Issue

The other 40 IDs preserve the evident English meaning and relevant structure.
This includes the command-independent labels and short dialogue, the crafting
and recipe instructions, the sibling-neutral material at 56061, the
Erathi/Wyvyrn-Gifre statements, the Nareens family reading supported by
Chinese, and the Rathir departure question. Provisional name spellings alone
are not treated as confirmed translation errors.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 56051-56100 once
  in identical ascending order; each default CSV contains 65,135 records.
- Keys and order match across all four files. The UTF-8 BOM, record count,
  delimiter, and line-ending mix are preserved. The batch's line breaks,
  runtime markers, and numeric values match; in particular, markers and
  order at IDs 56074 and 56094 remain intact.
- Rechecked the source-keyed historical range `56050-56149`, including the
  Klurikon deployment, item component and Shard quality, ring effect,
  Hallam/Maid, crafting tutorial, Sorrows/Midden, Nareens, recipe UI,
  brother reference, “practically human,” and Savant Engar. Historical
  questions are prompts, not approvals.
- The preliminary scan dates from 2026-10-09 and its full-file CSV hash
  predates later accepted corrections outside this ID range. The active rows
  were re-read for this disposition against the current pre-edit CSV.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-resume-56051-verified/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `c6ba5ed3d9e55a1ec7f209382408cd8496b29a7a4614794389bf8f95a2eb7c9d`).
- Post-edit active CSV SHA-256:
  `e55637753c1659eb334d2712913c14bfc9c4a6e1fc20563106f27eab670e0609`.
  Only the three accepted `Texto` cells above changed. UTF-8 BOM, 65,135
  records, key order, 72,045 CRLF endings, and 39 pre-existing bare-LF
  endings are preserved.

Decisions D-16923 through D-16932 record the three accepted corrections and
seven uncertain findings; D-16933 records the remaining 40 `not an issue`
IDs. Direct register totals: 1,637 accepted, 11,278 `not an issue`, and
10,446 uncertain (23,361 total); next D-16934.

Resume at `default` ID 56101; 9,034 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-56101-56150-preliminary.md`](default-ids-56101-56150-preliminary.md).
