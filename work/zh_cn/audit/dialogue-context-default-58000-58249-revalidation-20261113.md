# Sequential `default` Revalidation: IDs `58000`-`58249`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 64 pre-existing ledger fingerprints and preserved those rows.
  Added the other 186 IDs in ascending order.
- Ten correction candidates are recorded on new ledger rows. Three further
  correction findings at existing rows (`58096`, `58147`, `58238`) and a
  context question at existing row `58067` are report-only; seven
  pre-existing candidates and the existing hold at `58073` were rechecked.
- Three evidence-limited questions remain: `58055`, `58067`, and `58155`.
  These do not authorize a translation edit.
- No translation CSV, immutable source CSV, or extracted game asset was
  changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `58015` | Name / format | The named cult `The Testament` is rendered only as `테스타먼트`. Add a source pairing, e.g. `테스타먼트(The Testament)`, without deciding here whether the preferred Korean name should instead use the longer `벨렌의 성약단`. | Medium-high |
| `58022` | Name / format | The epithet `the Spritely One` is translated as `요정 같은 자` but lacks its English identity. Pair it as `요정 같은 자(Spritely One)` while retaining the existing `Black Arick` and `Amalur` pairings. | High |
| `58042` | Name / format | The standalone name `Comoros` is rendered only as `코모로스`. Add `(Comoros)`; the isolated key does not establish whether this is a person or another named entity. | Medium |
| `58055` | Name / format | The named label `Eastern Sewers Henge` has no English pairing. Add the full source form, e.g. `동부 하수도 헨지(Eastern Sewers Henge)`; keep the structure's exact type unresolved. | Medium-high |
| `58089` | Name / format | `Westroad` is a named location and is already paired elsewhere (e.g. `4797`, `63493`), but this greeting omits the English form. Use `웨스트로드(Westroad)에 온 걸 환영해.` | High |
| `58103` | Naturalness | `아름답기는커녕 거짓말쟁이다` awkwardly fuses two separate claims, “She is no beauty. She is a liar.” Consider `아름답지도 않다. 거짓말쟁이다.` Preserve the journal's terse tone and existing paragraph breaks. | Medium-high |
| `58115` | Name / format | The named label `Petraun's Curse` is rendered without an English pairing. Add `(Petraun's Curse)` after `페트라운의 저주`. | Medium-high |
| `58149` | Name / format | `High King of Winter` is shortened in the parenthetical to `(High King)`, omitting the source's distinguishing `of Winter`. Pair the complete title as `겨울의 지고왕(High King of Winter)`. | High |
| `58150` | Name / format | The standalone name `Jordan` is rendered only as `조던`. Add `(Jordan)` without inferring identity from the isolated key. | Medium |
| `58243` | Meaning / naturalness | `Dry land` is the land beyond the barrier, not “dry soil.” Replace `마른 땅` with `육지`, e.g. `멈추지 마. 이 벽 너머에 육지가 있어.` | High |

## Rechecked Existing Ledger Findings

| ID | Dimension | Revalidated finding |
| ---: | --- | --- |
| `58030` | Naturalness | The candidate remains supported. `큰일을 해 줬어` can mean the player did something major; `큰 도움을 줬어` more directly conveys “done the people ... a great service.” |
| `58073` | Meaning / nuance | Keep the existing hold. `savage` differs in shade across English, Japanese, and Chinese, while Korean `거칠다` is broad but not clearly wrong. |
| `58090` | Terminology | The candidate remains supported: English `initiates`, Japanese `入門者`, Chinese `启蒙者`, and the established Korean `입문자` favor `입문자` over `수련자`. |
| `58135` | Meaning | The candidate remains supported. `remains` refers to the broken hammer, not a human corpse; `유해` is a mistranslation. Prefer `망치 잔해는 네가 갖고 있고, 우린 대장간 앞에 서 있어. 더 필요한 게 뭐야?` |
| `58139` | Name / format | The objective `Return to Cloudcrest` still omits the established source pairing. Prefer `클라우드크레스트(Cloudcrest)로 돌아가라.` |
| `58143` | Meaning / naturalness | The candidate remains supported. Preserve the deliberate double sense of `quarry` (pursued target and stone quarry) without implying the mine is merely “good”; e.g. `네가 쫓는 사냥감이지. 실제로도 제법 큰 채석장이야. 노움 소유라니 별나긴 해도, 의뢰인이 현상금을 걸었으니 말이야.` |
| `58177` | Terminology | The candidate remains supported. The recovered reconnaissance is a report/document; align `정찰 정보` with the established `정찰 보고서`, preserving sentence grammar. |
| `58192` | Name / format | The candidate remains supported. `Hill` is a capitalized name and is unpaired in this line; use `힐(Hill)` when addressing her. |

## Additional Findings on Existing Rows

These findings are documented here without rewriting the append-only ledger
rows.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `58096` | Meaning | `I will see the Tuatha burn` says the speaker will witness their destruction, not necessarily personally set them alight. Japanese likewise says the speaker will witness their end. Consider `내 마지막 숨을 바쳐서라도 투아사(Tuatha)가 불타는 모습을 보고야 말겠어.` | High |
| `58147` | Name / format | `Witch Knight Anira` is rendered `마녀 기사 아니라(Anira)`, pairing only the personal name and omitting the title from the English annotation. Pair the full name and title, e.g. `마녀 기사 아니라(Witch Knight Anira)`. | High |
| `58238` | Name / format | `the Isles` is rendered `제도(Isles)`. The established paired form is `제도(The Isles)` (e.g. `51665`, `61288`); add the definite article to match the named region. | High |

## Evidence-Limited Questions

| ID | Question | Disposition |
| ---: | --- | --- |
| `58055` | `Henge` may identify a structure or a location in the `Eastern Sewers`; the short label does not settle its exact type. | Keep the current lexical rendering provisionally; the English pairing candidate is separate from this unresolved classification. |
| `58067` | English capitalizes `the Well`, while Japanese and Chinese describe a well/spring generically and Korean uses `샘`. The earlier asset review had no-issue status, but this range pass does not establish the capitalization's significance. | Do not infer a named-site status or force a title form from capitalization alone; retain this as a report-only question. |
| `58155` | The paid reset service `Unbinding your destiny` is rendered `운명 해방`; related `Unbind Destiny` labels vary between `운명 해방` and `운명의 속박 풀기`. The canonical service name is not established. | Keep the current sentence provisional; do not globally unify the related labels from this row alone. |

## Repeated English and Structure

- Four exact-English duplicate groups touch this range, covering eight rows:
  `Crownhold` (`58014`, `58227`), `First Scaith` (`58016`, `58071`),
  `Quest Complete` (`58100`, `58151`), and `Greetings.` (`58120`, `58167`).
  Korean wording matches within every group.
- Five rows contain embedded line breaks: `58010` (3), `58072` (5),
  `58084` (1), `58103` (5), and `58156` (2). Each language contains 16
  embedded breaks total, with matching per-ID counts.
- Runtime, display, and layout marker identities and order match across all
  250 IDs. At `58131`, the localized text inside the display marker differs
  by language as expected; the marker sequence itself is preserved.
- Of 250 IDs, 196 have indexed asset associations, represented by 203
  ID-to-asset links across 127 assets; 54 have none. Of the 186 new IDs,
  132 are linked through 137 links across 72 assets, and 54 are unlinked.
  Asset associations do not establish per-key speakers or playback order.

## Range Result

- The 64 pre-existing ledger rows remain unchanged; 186 new IDs were appended
  in ascending order. Ten new-row correction candidates and three
  evidence-limited questions are recorded. Three additional correction
  findings and one rechecked context question at previously fingerprinted
  IDs remain report-only.
- The ledger covers 60,066 of 65,135 unique `default` IDs (92.22%), leaving
  5,069 unrecorded IDs. Sequential coverage reaches `58249`; next is
  `58250`-`58499`.
- All correction candidates are proposals, not approval to edit translation
  CSVs. No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `58000`-`58249`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- The four-language fingerprint check passes for all 60,066 ledger IDs.
- The generated quest-asset index and catalogs reproduce byte-for-byte;
  all nine `test_build_dialogue_context_index.py` tests pass.
- The audit-only, CRLF-aware diff check is clean. Any pre-existing
  translation-CSV whitespace findings are outside this pass and those CSVs
  were not modified.
