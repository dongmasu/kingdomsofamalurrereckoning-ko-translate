# Sequential `default` Revalidation: IDs `55500`-`55749`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 66 pre-existing ledger fingerprints; all match. Preserved
  those rows and appended the other 184 IDs in ascending order.
- Recorded two new correction candidates and three new evidence-limited
  holds. A current candidate at existing ID `55717` and a source question at
  existing ID `55514` are documented here without rewriting their ledger
  rows.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `55520` | Meaning / completeness | The active Korean row contains only `달탄 이임스(Daltan Eames)`, omitting the three-sentence quest record present in English and the full Japanese and Chinese entries. Restore the account of serving as Walen's second in the duel, Walen's plan to avoid service in Klurikon, and returning to Jeibir for the reward. Japanese `介添人` supports a supporting role in the duel; Chinese instead describes the speaker as taking Walen's place, so follow the English and Japanese on that detail. A possible direction is `워렌(Walen)이 달탄 이임스(Daltan Eames)와 결투할 때 그의 결투 조력자로 나섰다. 워렌은 클루리콘(Klurikon)에서 복무하지 않으려고 결투를 치밀한 계획으로 꾸몄다. 보상을 받으러 제이버(Jeibir)에게 돌아가야겠다.` | High |
| `55636` | Naturalness / format | `the Fae Amman the Clever` is rendered `페이(Fae) 영리한 아만(Amman the Clever)`, an awkward modifier chain. Japanese identifies Amman as a wise Fae and Chinese as a wise spirit-person; retain the named epithet and clarify the relationship, e.g. `페이(Fae)인 영리한 아만(Amman the Clever)`. | High |
| `55717` | Meaning / naturalness | `from this vantage point` could be read literally in isolation, but Japanese `現時点では` means “at this point/in the present,” and Chinese likewise says this is all the speaker knows. Korean `이 위치에서 내가 아는 건` therefore misreads the phrase as a physical location. Consider `지금 내가 아는 건 그게 전부야.` This is a new current assessment; the existing append-only ledger row is unchanged. | High |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `55514` | Meaning / source conflict | English begins with the fragment `I am.`, Japanese says `私は恐れる` (“I am afraid”), and Chinese says `我是` (“I am”). The preceding question or predicate is unavailable, so Korean `그래` may be a response but cannot be confirmed as equivalent. Retain pending stronger context; the existing ledger row remains unchanged. |
| `55525` | Meaning / fragment | `For one Boggart mask.` is an incomplete price/trade fragment. Japanese also gives only “one mask,” while Chinese makes it a sale-price phrase. Korean `보가트 가면(Boggart Mask) 1개에` may depend on text outside this row. Do not reconstruct the missing syntax. |
| `55566` | Meaning / entity | `the Ouranos` is followed by plural `they`; Chinese explicitly says `乌拉诺斯一族` (the Ouranos people/clan), while Japanese only transliterates the name. Korean likewise leaves the entity type implicit. Do not add `족` or another classification without stronger evidence. |
| `55619` | Meaning / label | `Spine Bender` is transliterated in Japanese and described literally in Chinese. The isolated row does not establish whether it is a person/creature title, object, or action label; retain `척추 꺾기(Spine Bender)` pending context. |

## Rechecked Existing Findings

- `55536`: The macabre line still ends with the stiff phrase `연회를 위한 또 다른 시체다`; the prior source-based naturalness proposal remains supported.
- `55542`: The title `Warden of Gorhart` still has competing institutional readings across English, Japanese, and Chinese. Preserve the existing meaning hold.
- `55575`: Korean uses polite endings where Japanese is plain, but the asset does not map the key to a speaker or dialogue stage. Preserve the existing register hold.
- `55662`: The active line already matches the earlier proposed wording `돈은 내가 낼게. ($HP02.bribe_value$ 골드)`. The paired row `32610` remains a separate consistency question; preserve this row's existing ledger record.
- `55678`: The short title `Missives` still lacks the established `세이블의 서신(Missives of Sable)` reference; the location of `그 안` can also be clearer. The existing candidate remains supported.
- `55720`: Korean pairs only the personal name in `Argine, Queen of Staves`; the source title remains unpaired. Preserve the existing format candidate.
- `55729`: The earlier bounded proposal remains supported: use the established `장인의 동물성 지방(Master's Tallow)` and avoid the nested `허바르(Hurvar)의 문지방(Hurvar's Doorsill)` annotation. Preserve the existing candidate.
- `55735`: Singular `Templar` remains unresolved as a personal rank/title; preserve the existing terminology hold.

## Rechecked Voice Questions

The older voice candidate at `55663` quoted `내 눈으로 보건대`, but that phrase is not in the current Korean row; it now begins `이럴 수가`. The current exclamation is natural, and the elevated description is compatible with the source's grand characterization. No speaker is inferred from the linked asset, and no correction is proposed.

At `55717`, the earlier voice triage dropped the candidate because `vantage point` might refer to a physical location. The aligned Japanese resolves that ambiguity toward the present/current point, so the literal Korean location reading is recorded above as a meaning/naturalness candidate. The old ledger row remains byte-preserved.

The preliminary question at `55558` was rechecked. `세상에!` is a natural Korean exclamation for `My gods!`; Japanese also uses a general expression of amazement, while Chinese preserves the explicit gods reference. No change is proposed.

## Source Notes and Structure

- Sixty-six exact-English duplicate groups across the corpus touch this range,
  covering 1,250 rows. Korean wording matches within every group.
- Four rows contain embedded line breaks: `55566` (6), `55594` (11 English /
  5 Japanese / 16 Chinese / 11 Korean), `55602` (1), and `55746` (8). Totals
  are 26 English, 20 Japanese, 31 Chinese, and 26 Korean breaks. At `55594`,
  Korean follows English; the differing source lineation is retained.
- Runtime/display marker identities and order match across all four
  languages, including the localized payloads at `55594`.
- Of 250 IDs, 191 have indexed asset associations, represented by 193 links
  across 129 assets; 59 have no indexed asset. Of the 184 newly recorded IDs,
  125 are linked through 127 links across 80 assets, and 59 are unlinked.
  Asset associations do not establish per-key speakers or playback order.

## Range Result

- The two new candidates and three new holds are on newly appended rows. The
  current candidate at existing ID `55717` and hold at existing ID `55514`
  are documented here only; their prior ledger rows remain unchanged. All 66
  pre-existing rows were preserved.
- After adding 184 IDs, the ledger covers 58,221 of 65,135 unique `default`
  IDs (89.39%), leaving 6,914. Sequential coverage reaches `55749`; next is
  `55750`-`55999`.
- Findings require separate approval before any translation CSV edit. No
  translation CSV was changed.
