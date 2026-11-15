# Candidate Reconciliation: IDs `34500`-`34749`

- Date: 2026-11-14.
- Rechecked all 22 current `overall=candidate` IDs in the range against their
  English, Japanese, Chinese, and active Korean rows, plus the sequential
  review and prior application manifests.
- Twenty-one candidates are supported by the current Korean after this
  review. ID `34567` needed a further register correction; the other
  previously applied wording was confirmed. No linked candidate outside the
  range was newly counted.

## Candidate Decisions

| ID(s) | Decision and evidence |
| ---: | --- |
| `34512` | Confirmed `깐깐하니까` for Hartwen being particular about leading the procession; English and Chinese support this trait while Japanese says the role suits her. |
| `34518` | Confirmed the full title and name, `대여사제 바얄라 티린(High Priestess Bayala Tirin)`. |
| `34544` | Confirmed `여름 페이(Summer Fae)` for the named group; Japanese explicitly identifies Summer Fae. |
| `34559`, `34561` | Confirmed the full standalone labels `고요한 발걸음(The Silent Step)` and `복수의 갑옷(Armor of Vengeance)`. |
| `34560` | Confirmed the complete `백색의 닐(White Nil)` and `여사제(Priestess)` references without changing the guard's informal voice. |
| `34567` | Refined the repeated welcome to `어서 오세요. 어서 오세요.` English and Japanese both repeat the invitation; the former Korean mixed a polite invitation with a bare `어서!`. Although `어서` alone is not a speech-level ending, the full utterance was inconsistent. This supersedes the prior retained disposition. |
| `34570` | Confirmed the current comparison: the group is not as bad as some think, but worse than the addressee imagines. English and Chinese support it; no further edit is needed. |
| `34579` | Confirmed the source annotation `대기(Air)` for the capitalized element in Arkes' saying. |
| `34594` | Confirmed the current `정찰 보고서` and complete name/place pairings; the earlier terminology proposal was already present. |
| `34647` | Confirmed the full personal names and title pairings `벤갈(Vengal)`, `타비(Tavvy)`, and `레이디 타비(Lady Tavvy)`. |
| `34655` | Confirmed `스프라이트(Sprites)` for the plural creature reference and the sentence's names and narrative meaning. |
| `34661` | Confirmed `불꽃 회랑(Aisle of Flame)`; the quest-context review supports the existing `앰비언트의 거울(Glass of Ambient)`. |
| `34663` | Confirmed `네 쪽 사람` rather than `네 동족`; “one of your own” does not establish shared species. |
| `34678`, `34692` | Confirmed the complete labels `대장 에리아드 탈리보르(Captain Eriad Talibor)` and `크로스 양(Ms. Crosse)`. |
| `34682` | Confirmed the full ability label `골렘의 힘(Golem's Power)`. |
| `34709` | Confirmed the paired gameplay terms `혼돈 균열(Chaos Rifts)` and `차원문(Portals)`. |
| `34713` | Confirmed `먼지의 아이(Child of Dust)` as the complete named designation. |
| `34727` | Confirmed the respectful greeting and full title pairing `대현자(Archsage)님`. |
| `34732` | Confirmed that the last Erran Gastyr is the descendant of the first; the current Korean clearly preserves both tales and their relation. |
| `34733` | Confirmed the complete label `혼돈의 노예 I(Chaos Thrall I)`, preserving the Roman numeral. |

## Repeated Sources And Attribution

- The sequential report found 61 exact-English duplicate groups touching this
  range; none had differing Korean wording. Their language-specific
  distinctions were retained where Japanese or context supported them.
- No individual speaker or playback order was inferred from asset membership,
  handlers, NPC symbols, or ID order.

## Verification

- All 22 current range candidates were adjudicated and newly counted. The
  cumulative candidate reconciliation is 2,136 / 4,015 (53.20%), with 1,879
  not yet adjudicated.
- Only `default:34567` was further edited in this pass. Its ledger
  `source_fingerprint` alone was refreshed; existing review evidence and
  append-only row structure were preserved.
- All 65,135 ledger fingerprints validate. Index and all three catalog
  reproduction checks pass.
- CSV-preservation tests: 11 passed. Dialogue-context index tests: 9 passed.
- The active CSV retains its UTF-8 BOM and 65,135 ordered records. Newline
  inventory: 71,838 CRLF, 244 LF-only, and no bare CR. CRLF-aware
  `git diff --check` passes.
- No source CSV, extracted asset, or game binary was changed. No commit was
  made.

See the four-language review at
[`34500`-`34749`](dialogue-context-default-34500-34749-revalidation-20261112.md)
and the prior application batch at
[`33500`-`35999`](dialogue-context-edit-batch-20261114-33500-35999.md).
