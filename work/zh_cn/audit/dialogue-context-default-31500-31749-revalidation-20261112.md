# Sequential `default` Revalidation: IDs `31500`-`31749`

- Date: 2026-11-12.
- Compared all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 71 existing ledger entries and added 179 IDs. Findings are
  proposals, not approved translation edits.
- Nine new correction candidates and two evidence-limited holds were recorded.
  Four existing candidates and one existing hold were retained.
- No translation CSV, reference asset, or game binary was modified.

## Correction Candidates

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `31502` | Name / format | English names `Lady Ahnrun` twice. Korean uses `아른룬 부인` without the English pairing, while the separate title `Lady of Gravehal` is already paired. Add `아른룬 부인(Lady Ahnrun)` at the first reference and keep the later reference consistent. | High |
| `31510` | Name / format | English identifies the memoir author as `Ganelun Hegem`; Korean gives `가넬룬 헤겜` without the English pairing. Add `(Ganelun Hegem)` without changing the description. | High |
| `31519` | Name / title / format | English calls him `Master Byrnes`; Japanese uses the respectful `バーンズさん`, but Korean `번즈 선생님` may imply a teacher and has no English pairing. Recheck the title in context and use a respectful form that does not add an unsupported occupation, with `Master Byrnes` paired. | Medium |
| `31608` | Speech level / naturalness | The Korean shifts from `걱정시켰군` to `망치지 않았어` and back to `읽어야 할 것 같군`. Japanese is conversational throughout (`心配させられたよ`, `読んでほしいな`). Smooth the whole line into one conversational register while retaining the restrained teasing and `부름받은 자(Beckoned)` reference. | Medium-high |
| `31657` | Name / format | English identifies `Effie Cruikshank`, but Korean `에피 크루익생크` is unpaired. Add `(Effie Cruikshank)` and check the spelling against the paired occurrence at `64164`, where the surname is written differently. | High |
| `31665` | Terminology / format | English calls the hired protectors `Oathblades`; Korean has `맹세의 칼날들` without the English pairing. Add the source term and align the plural phrasing with the established `맹세의 칼날(Oathblade)` rank/faction usage. | High |
| `31685` | Terminology / format | English names the `Savants` and high-ranking members of the `Scholia`. Korean pairs `스콜리아(Scholia)` but leaves `사반트들` unpaired. Add the English term on the first mention, retaining the distinction between Savants and other senior members. | High |
| `31695` | Name / format | The anecdote names `Garant`, but Korean `가란트` is unpaired. Add `가란트(Garant)` without changing the casual aside. | High |
| `31749` | Naturalness | `한잔할 때군` is stiff for English `Time for a drink.` and Japanese `よし！ 一杯飲むとするか`. Consider a natural spoken line such as `좋아, 한잔할까?` without inferring a specific speaker. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `31568` | Meaning / item format | The English item label is `Rare Sorcery Armor Surprise`; Japanese and Chinese also say “surprise,” while Korean adds `상자` (“box/chest”). The available string does not establish that the reward is a container. Keep the added noun under review until item or UI context confirms it. |
| `31667` | Meaning / name format | English capitalizes `Ossuary`, which may be a named place, while Japanese and Chinese render it as an urn/bone jar. Korean `납골당` selects a building/place reading. Do not add an English pairing or change the referent until the game context resolves the source-language conflict. |

## Earlier Findings Rechecked

- Existing candidates `31521`, `31547`, `31721`, and `31733` remain supported
  by the current four-language text and their linked review reports.
- Existing hold `31571` remains unresolved: English `consecrate themselves`,
  Japanese purification wording, and Chinese blessing wording do not settle
  the intended theological meaning.
- `31539` already uses `켈리스 센(Kellis Cen)`, consistent with the paired
  occurrences at `4071` and `7381`; no change is proposed.
- `31712` already pairs the established species term as `코볼트(Kobold)`.
  The plural English `Kobolds` does not require a different Korean species
  label; no change is proposed.
- The other 66 existing entries remain not flagged.
- No per-key speaker or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

## Repeated Sources And Structure

- Sixty-four exact-English duplicate groups touch this range (1,206 corpus
  rows). The only group with different Korean is `31562` / `55044`; Japanese
  also differs between those IDs, so the Korean distinction is retained.
- Per-row embedded line-break counts and normalized runtime/layout-token and
  markup signatures match across English, Japanese, Chinese, and Korean.
- At `31601`, text inside the five `{*1...}` display wrappers is localized
  differently across the languages; the wrapper index/count and ordering
  still match, so this is not a missing or reordered token.
- Fourteen embedded CRLF breaks in five Korean rows were preserved.

After this range, the ledger contains 40,455 of 65,135 unique IDs (62.10%),
leaving 24,680. Sequential coverage reaches ID `31749`; next:
`31750`-`31999`.
