# Candidate Reconciliation: IDs `9000`-`9249`

- Date: 2026-11-14.
- Scope: all 16 current `overall=candidate` IDs in the range, compared against
  the active English, Japanese, Chinese, and Korean rows and their linked
  context reviews.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- Three Korean rows were revised. Thirteen candidates were retained because
  the current text already reflects a supported correction or the proposed
  change was not justified by the source evidence.
- Asset links support quest or topic grouping only; no unsupported speaker or
  playback-order attribution was made.

## Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `9016` | Retained | `알럭(Aluck)` is already paired in the current quest-journal entry; the earlier finding no longer describes the active text. |
| `9035` | Retained | `{*1[패시브]}` matches English `Passive` and Japanese `パッシブ`; the same Korean label is used at `8864` and `65015`. The earlier suggestion to use `지속 효과` is not supported as a required correction. |
| `9056` | Retained | The active wording `푼돈 때문에 옛 친구조차 네 배를 가를 정도니까` naturally preserves the petty-payment threat and the gutting image. |
| `9072` | Retained | The earlier revision `마침내 무덤에서 꺼내졌구나` preserves English's exhumation image without the previous awkward doubled passive. The distinct source-language nuance is not expanded further. |
| `9091` | Retained | `에피 크루익섕크(Effie Cruikshank)` now uses the established spelling and pairing; the former research role and need to stop her remain clear. |
| `9118` | Retained | `종자 코란(Squire Coran)` is fully paired in the active text, correcting the abbreviated prior form. |
| `9124` | Retained | `고드릭 페인 경(Lord Godric Payne)` pairs both the name and title while preserving the sharp warning. |
| `9132` | Retained | `갈라포 평원 전투(Battle of Galafor Plain)` is paired, and the family's losses and the son's uncertain condition remain source-faithful. |
| `9152` | Corrected | Changed `같았다` to `같았어` so the whole line follows the conversational plain style supported by Japanese, without changing its historical contrast. |
| `9158` | Corrected | Replaced the stiff `추적해 놓고 ... 믿기 어렵군` construction with `나를 여기까지 찾아왔으니, 만나려는 이유가 있었겠지?`, preserving the implication and conversational level. |
| `9175` | Retained | The slider label is already the natural `눈썹 진하기`. |
| `9190` | Retained | `라이라(Lyra)` uses the Japanese-supported spelling and supplies the missing English pairing. |
| `9193` | Retained | The earlier revision already uses consistent conversational endings while preserving the solemn reflection on death. |
| `9211` | Retained | `델프릭 성주(Castellan Delfric)` is fully paired, and the direct instruction retains the source's address to a soldier. |
| `9227` | Retained | `리아네시 촉수(Leanashe Tentacle)` follows the established species spelling and complete source label. |
| `9249` | Corrected | Recast the repeated `줄` construction as `솔직히 내가 도와 달라고 했을 때 누가 응해 줄 거라곤 생각 못 했어`, preserving the surprise and resignation. |

## Changes and Verification

- Only IDs `9152`, `9158`, and `9249` were newly changed, using the
  byte-preserving ID-scoped editor.
- Only those three IDs' `source_fingerprint` fields were refreshed in the
  append-only review ledger. Existing classifications and ordering were
  preserved.
- This range adds 16 reconciled candidates to the previous cumulative total
  of 503: 519 / 4,015 (12.93%), with 3,496 remaining.
- The 65,135-row Korean CSV retains its UTF-8 BOM, ID order, and existing
  mixed line-ending inventory. No source CSV or extracted game asset was
  changed. No commit was made.
