# Candidate Reconciliation: IDs `34750`-`34999`

- Date: 2026-11-14.
- Rechecked all 21 current `overall=candidate` IDs against English,
  Japanese, Chinese, active Korean, and prior reconciliation/application
  records.
- `34765` was already reconciled with `11896` and `23465`, and `34912` was
  already reconciled with the Lady Oleyn title group. The other 19 candidates
  are newly counted.
- Five additional, independently supported corrections were applied:
  `34866`, `34884`, `34892`, `34896`, and `34936`. These do not resolve
  evidence-limited questions about the Order, Testament, Murderer's Hold, Id,
  or the meaning of `Trim`.

## Candidate Decisions

| ID(s) | Decision and evidence |
| ---: | --- |
| `34765` | Previously reconciled with `11896` and `23465`; the shared bounty-completion sentence and family-name distinction remain consistent. |
| `34817` | Confirmed `성스러운 동굴`, supported by Japanese `洞穴` for `hollow`. |
| `34821` | Confirmed the standalone names `베크레스(Vekreth)` and `아릴리아(Arylia)`. |
| `34831` | Confirmed `앨린(Allyn)` and retained the prayer and discovery sequence. |
| `34835` | Confirmed `아사(Asa)` and the request to muster more troops. |
| `34841` | Confirmed the natural threat `이제 그 배가 네 장례선이 될 거야`, preserving `레퀴엠호(The Requiem)`. |
| `34844` | Confirmed the complete letter addressee `템플러 빈서(Templar Vinthur)`. |
| `34860` | Confirmed the clear permanent stat wording `획득 골드 +5% 영구 적용`. |
| `34864` | Confirmed the name pairing `켈(Kel)`. |
| `34866` | Refined the separate naturalness issue to `너는 싸우겠다고 맹세하고 그 조직의 일원이 되는 거야! 그런 영예를 누리는 사람은 거의 없지.` The formal identity and Korean title of the capitalized Order remain unresolved. |
| `34870` | Confirmed the name pairing `리라(Lyra)`. |
| `34872` | Confirmed concise polite `네?`, matching English `Yes?` and Japanese `はい？` without inventing “what happened?” |
| `34878` | Confirmed `저수조` for `cisterns`, matching the established Idylla water-storage term. |
| `34884` | Added `the Testament` to the Korean pairing as `테스타먼트(the Testament)`. Japanese and Chinese render the group differently, so its identity remains unresolved. |
| `34885` | Confirmed the full label `학자 에어랑쿠르(Scholar Airancourt)`. |
| `34892` | Added `Murderer's Hold` as `살인자의 요새(Murderer's Hold)`. Japanese and Chinese differ on whether the location is a prison or fortification; its category remains unresolved. |
| `34895` | Confirmed `인간의 발걸음을 용납하지 않을` for the forest not tolerating human footsteps; the sentence remains plain and conversational. |
| `34896` | Added the source entity pairing in `이드(The Id) 처치!`; the row does not establish what kind of entity the Id is. |
| `34904` | Confirmed the standalone item pairing `마나 진자(Mana Pendulum)`. |
| `34912` | Previously reconciled with the Lady Oleyn title group; the complete titles and name remain paired. |
| `34916` | Confirmed the complete title and name `템플러 옥티엔(Templar Octienne)`. |
| `34925` | Confirmed `아리엘(Ariel)` in the objective and the established `본라흐(Bonnlach)` spelling. |
| `34936` | Added the capitalized source reference without choosing an institutional meaning: `조직(the Order)`. |
| `34952` | The full label `Flawless Mitharan Immunity Trim` is already paired in Korean. The exact sense of `Trim` remains held. |
| `34968` | Confirmed the complete designation `돌브 아르네의 영주(Lord of Dolve Arne)`. |
| `34977` | Confirmed `비탄의 집(House of Sorrows)` from the Japanese source and the surrounding sentence. |

## Holds And Duplicate Checks

- The uncertain interpretations at `34801`, `34866`, `34882`, `34884`,
  `34892`, `34896`, `34952`, and `34994` remain unresolved where the
  language evidence conflicts or does not establish the exact meaning.
  Independently supported naturalness or source-pairing corrections above do
  not change those holds.
- The exact-English duplicate groups with differing Korean at `34798` /
  `21640` / `42562`, and `34837` / `23033`, retain their ID-specific wording
  because Japanese also differs. No blanket unification was made.
- The 23 embedded line breaks and normalized runtime-token/markup signatures
  remain intact. Speaker attribution and playback order remain unknown.

## Verification

- Newly counted candidates: 19. Cumulative candidate reconciliation is
  2,155 / 4,015 (53.67%), with 1,860 not yet adjudicated.
- Five rows were edited in this pass. Only their `source_fingerprint` fields
  were refreshed; existing ledger statuses, evidence, row order, and bytes
  outside those fields were preserved.
- All 65,135 ledger fingerprints validate. Index and all three catalog
  reproduction checks pass.
- CSV-preservation tests: 11 passed. Dialogue-context index tests: 9 passed.
- The active CSV retains its UTF-8 BOM and 65,135 ordered records. Newline
  inventory: 71,838 CRLF, 244 LF-only, and no bare CR. CRLF-aware
  `git diff --check` passes.
- No source CSV, extracted asset, or game binary was changed. No commit was
  made.

See the four-language review at
[`34750`-`34999`](dialogue-context-default-34750-34999-revalidation-20261112.md),
the prior application batch at
[`33500`-`35999`](dialogue-context-edit-batch-20261114-33500-35999.md),
and the linked reconciliation reports for
[`34765`](dialogue-context-11750-11999-candidate-reconciliation-20261114.md)
and
[`34912`](dialogue-context-14250-14499-candidate-reconciliation-20261114.md).
