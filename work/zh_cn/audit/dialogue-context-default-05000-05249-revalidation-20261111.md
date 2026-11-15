# Sequential `default` Revalidation: IDs `5000`-`5249`

- Date: 2026-11-11.
- Scope: compare the active English, Japanese, Chinese, and Korean rows for
  IDs `5000`-`5249`; add only IDs without an existing review-ledger record.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- 192 new IDs were reviewed and recorded. The other 58 IDs already had ledger
  records and were left unchanged.
- Ten IDs have correction candidates. Twenty-three IDs have one or more
  evidence-limited holds; three of those also have a correction candidate.
- Meaning, Korean naturalness, register where assessable, names/terms, and
  structure were checked. UI, objective, item, book, and other non-dialogue
  text was assessed according to its type.
- No translation CSV or extracted game asset was changed. Candidates are
  proposals, not approval to edit.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `5017` | Naturalness / address | English's familiar `you old fiend` is rendered as `친애하는 옥티엔`, while Japanese and Chinese explicitly say “old friend.” The formal letter salutation loses the familiar, lightly teasing address. Consider an idiomatic form such as `오랜 친구 옥티엔` while retaining the rest of the letter's established voice and paragraphing. | Medium |
| `5027` | Naturalness | `겨울 궁정은 우리의 동맹으로서 나란히 다스렸어` is an awkward literal construction. English says the Court of Winter ruled alongside the narrator's group as allies; Japanese and Chinese support the alliance and seasonal-cycle imagery. Consider `오랜 세월 동안 겨울 궁정(Court of Winter)은 우리와 동맹을 맺고 함께 다스렸어.` | High |
| `5036` | Naturalness / register | `그 짐승은 반드시 붙잡힐 것이다` shifts into written passive prose before `죄값을 치르게 하겠다`. Japanese uses a direct vow to catch the beast; keep the determination and the Korean register consistent without inferring the individual speaker. | Medium |
| `5043` | Punctuation / naturalness | `강의 중에 ... 발견하면 정말... .` adds `정말` and leaves a space before a period after the ellipsis, unlike the unfinished threat in English and Japanese. Consider ending the sentence with `발견하면...` and remove the extra punctuation. | High |
| `5070` | Rank / naturalness | `새 대챔피언` is an awkward rendering of the full rank `Grand Champion of Valor Arena`. The glossary establishes `그랜드 챔피언(Grand Champion)` for the standalone title but explicitly excludes this longer rank; reconcile the complete rank rather than mechanically applying the standalone form. | Medium |
| `5095` | Meaning | `sweet covering that Lyria gave you` becomes `아름다운 속옷`, which specifies underwear. Japanese describes an overgarment and Chinese says clothing; neither establishes that the gift is underwear. Consider the broader `리리아가 준 아름다운 옷` or another source-faithful euphemism. | Medium-high |
| `5156` | Naturalness / register | `하지만 병사에게는 그 이상의 일이 요구된다` reads like written exposition. Japanese addresses the listener directly and warns that a soldier's work demands more. Consider a spoken equivalent such as `하지만 병사라면 그 이상을 해내야 해.` | Medium-high |
| `5195` | Naturalness | `우리 집단의 고난에 맞서게` is an awkward phrase for `the struggles of the House`; Japanese describes the group's problems and Chinese its internal strife. Consider `우리 집단이 겪는 문제에 준비도 없이 맞서게 할 수는 없어`, while leaving the precise House/faction interpretation unresolved. | Medium |
| `5237` | Meaning / terminology | Capitalized `the Missives` refers to the book identified elsewhere as `Missives of Sable`; Japanese and Chinese also read it as a book/document. The current `서신(Missives)` can read as generic or plural correspondence. Consider the established `세이블의 서신(Missives of Sable)` or an unambiguous short reference to that book. | High |
| `5245` | Meaning | `Crownhold Guardhouse` names a place/building, but `크라운홀드 경비대` names the guard unit. Japanese and Chinese describe a guard station/room. Consider a building label such as `크라운홀드 경비 초소(Crownhold Guardhouse)`. | High |

## Evidence-Limited Holds

### Format

The Korean embedded breaks use CRLF while English, Japanese, and Chinese use
LF at IDs `5017`, `5035`, `5044`, `5064`, `5095`, `5098`, `5204`, and `5206`.
Their logical break counts otherwise match. Preserve the current bytes; do not
normalize line endings without establishing how the game handles them.

At ID `5204`, English, Japanese, and Korean have 12 logical breaks, while
Chinese has 11. The Korean segmentation matches the primary Japanese
reference; retain it pending evidence about the intended cross-language
layout.

At ID `5243`, English, Japanese, and Korean share the initial `{LINE_LEFT}`
and the same display-wrapper order. Chinese omits that initial marker and
orders the `{*1...}` and `{*3...}` wrappers differently. This is a
cross-language source discrepancy, not a Korean-only correction; preserve the
Korean markers.

### Meaning or Context

| ID | Reason and disposition |
| ---: | --- |
| `5010` | The quoted transformation exchange has unclear speaker boundaries. English and Chinese differ in punctuation from Japanese, and the Korean uses a conspicuously archaic `주마` / `가거라` register. Retain the current text pending stronger scene-level evidence. |
| `5017` | `simple Laz` may describe a less capable or an ordinary Laz; the references do not settle the intended nuance. Keep `단순한 라즈` provisional. |
| `5032` | `Reverie` may be a dream, meditative state, or setting-specific concept. Japanese and Chinese differ in interpretation; do not standardize the lore term from this line alone. |
| `5047` | `Hit React Resistance` appears to be a technical/internal stat label. Japanese and Chinese do not fully resolve the mechanic; preserve the explicit `[DO NOT USE]` warning and avoid inventing a player-facing meaning. |
| `5056` | English and Chinese support “you go first,” as does the Korean, but Japanese explicitly says “you die first.” Hold the implied threat until the dialogue context resolves the source discrepancy. |
| `5075` | `Pledgeshield`, `Shieldsisters`, and `Shieldbrothers` are formal Order roles. Japanese diverges on the rank and the exact Korean titles remain unsettled; keep the current terms provisional. |
| `5077` | `the Grand Bursar's` is called the city's financial heart, but the source does not establish whether it is an office, department, or named institution. Do not make the Korean `대회계원` more specific without context. |
| `5081` | `The Champions` may be a formal group, title, or work name. Capitalization and the differing Japanese rendering do not settle the referent. |
| `5152` | `Docent` may be an academic rank or role. Japanese and Chinese use different role words; retain `도슨트` provisionally rather than assigning an affiliation. |
| `5153` | English and Chinese say `You have chosen`, while Japanese says the addressee was chosen. Korean follows English; hold the agency distinction rather than overriding the English source. |
| `5160` | `Warden of Gorhart` could be a town official, guard, or jailer. Japanese and Chinese differ, so the current `관리관` remains provisional. |
| `5195` | Capitalized `House` signals an institution or faction, but the exact force of its “struggles” is not settled by Japanese and Chinese. The naturalness candidate above does not resolve the referent. |
| `5215` | `Odi Speaks (1480)` may be a book, speech, or authored record. The current broad title `오디의 이야기` is retained pending context. |
| `5241` | `The Telling` may mean a tradition, prophecy, or story-cycle. Japanese and Chinese diverge; retain `전승(The Telling)` provisionally. |
| `5247` | `Third leg` is an isolated label. Japanese reads it as a point and Chinese as a round; do not decide whether `leg` means a stage, segment, or component without UI context. |

## Prior-Record and Preliminary-Scan Checks

- The 58 existing ledger records in this interval were not rewritten or
  duplicated.
- Earlier preliminary findings were checked against the active rows rather
  than carried forward automatically. The current text already uses
  `트래블러(Travelers)` at `5074`, preserves `도망친` at `5085`, localizes
  the visible wrappers at `5089`, renders `Grinning` as `웃는` at `5094`,
  and uses `유물 수집가` at `5246`; these earlier questions were not
  re-recorded as current errors.
- The existing canonical `메일스트롬(Maelstrom)` at `5013`, `그랜드
  챔피언(Grand Champion)` as a standalone rank, and `세이블의 서신(Missives
  of Sable)` were respected. ID `5070` is the distinct longer rank and was
  not automatically folded into the standalone title.
- Unsupported speaker attribution and dialogue order remain unknown.

## Duplicate and Structural Checks

- Thirty-two exact-English duplicate groups touching the newly reviewed IDs
  were checked against the full `default` corpus (508 rows total). Korean
  text matched in every group.
- Line-break counts match across all four languages for 191 of the 192 new
  IDs. The exception is ID `5204`, where Chinese has one fewer break.
- Runtime/layout-marker signatures match except at ID `5243`, where the
  Chinese source differs as described above. The Korean signatures match
  English and Japanese.
- The eight Korean CRLF cases are byte-level differences, not additional
  logical breaks.

Four-language source fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
