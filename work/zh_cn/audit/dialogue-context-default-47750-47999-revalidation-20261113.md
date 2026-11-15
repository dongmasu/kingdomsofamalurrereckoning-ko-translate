# Sequential `default` Revalidation: IDs `47750`-`47999`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 68 previously recorded four-language fingerprints; all match.
  Added the other 182 IDs to the review ledger.
- Recorded 12 current correction candidates and two evidence-limited holds.
  The other 236 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records; this
report records the current revalidation.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `47752` | Name format | The quest journal names the `Crypt of Arkes`, but Korean has `아르케스 지하 묘실` without the English place name. Consider `아르케스(Arkes) 지하 묘실`, retaining the current Korean wording. | High |
| `47770` | Meaning | `Other than your old friend, Florian?` contrasts Florian with someone else. Korean `옛 친구 플로리안(Florian)을 말하는 거야?` omits that contrast. Consider `옛 친구 플로리안(Florian) 말고 다른 사람을 말하는 거야?` | High |
| `47771` | Meaning / effect format | The sustained cost is explicitly 25% of maximum mana. Korean `마나 25%` leaves the denominator unclear; Japanese specifies maximum mana. Consider `지속 소모: 최대 마나의 25%`. | High |
| `47793` | Name format / spelling | `Alrette` is rendered `앨렛`, while the established spelling elsewhere is `알레트(Alrette)`. Align this occurrence to `알레트(Alrette)`; retain the separate spelling `덴릿(Dennrit)`. | High |
| `47814` | Meaning | `I've heard of them, farther to the south and east` says the speaker has heard of them in that distant area. Korean `그들을 봤다는 얘긴 들었어` instead says the speaker heard that someone saw them. Consider `남쪽과 동쪽 먼 곳에 있다고 들었어`. | High |
| `47823` | Terminology / name format | `Master's Tallow` has several Korean renderings in the same quest cluster. The prior bounded review supports `장인의 동물성 지방(Master's Tallow)` for the named material and a natural short reference for the second mention. Reconcile this line with that proposal rather than retaining `마스터스 탈로우` / `탈로우`. | High |
| `47827` | Name format | `Lorestones` is the established in-game collectible, but this sentence has only `로어스톤`. Add the English pairing, `로어스톤(Lorestone)`, while preserving the distinction from `Cairns`. | High |
| `47829` | Meaning / grammar | `Two interwoven strips` describes cloth that is already woven together. Korean `서로 엮으면` changes this into a condition (“if woven together”). Consider `서로 엮인 ... 천 조각 두 개는 ... 효과를 낸다`. | High |
| `47917` | Rank / name format | The source identifies `Savant Hadrus Llewellyn`; Korean renders the rank as generic `학자` and omits the English name. The established rank is `사반트(Savant)`. Consider `사반트 하드루스 르웰린(Savant Hadrus Llewellyn)` without changing the following explanation. | High |
| `47971` | Naturalness / reference | Korean `그보다 더 용감한` can make the unnamed warrior sound male, while English does not specify gender. Japanese and Chinese use feminine references, but the Korean can avoid adding gender: `그만큼 용감한 전사는 본 적이 없어`. | Medium-high |
| `47972` | Objective format | `Defeat the Troll` is a quest objective. Korean `트롤(Troll) 처치` is a bare noun phrase; align it with the project's action-form objectives as `트롤(Troll) 처치하기`. | Medium-high |
| `47997` | Meaning / naturalness | `I still belong down here` says this is where the speaker belongs, not that they are obliged to remain. Japanese makes the “my place is here” meaning explicit. Consider `난 네가 해낸 일과 이디라(Idylla)의 축제가 기뻐. 그래도 계속 일하려면 여기가 내 자리야.` | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `47801` | Name / referent | English capitalizes `the House`; Japanese omits it, while Chinese and Korean use a family/household reading. The linked quest-asset association is not key-level evidence that this means the House of Sorrows. Retain the broad reading and do not add a specific English proper-name pairing. |
| `47958` | Name / referent | `the House` has no established referent in this row. Japanese and Chinese support a family/household reading, but do not identify a named faction or institution. Keep the current broad wording pending direct context. |

## Rechecked Findings and Structure

- The earlier candidate at `47823` remains supported; its existing ledger
  record is preserved. Other previous candidate or hold rows in the range
  were rechecked against the current four-language text, with historical
  ledger records retained.
- Three initially noted possibilities were not carried forward: `47811` is
  semantically and conversationally aligned with Japanese; `47836` already
  includes `(Pledgeshield)` in Korean; and `47903` expresses the same health
  steal chance and amount as the Japanese source.
- One exact-English duplicate group touches the range: `47845` / `47994`
  (`Quest Failed`). Korean matches in both rows.
- Nine entries contain line breaks: `47771`, `47858`, `47861`, `47877`,
  `47894`, `47903`, `47933`, `47936`, and `47986`. Their 25 breaks match
  across all four languages.
- Runtime and layout marker identities and order match across all four
  languages; no token-order discrepancy was found.
- Of 250 IDs, 202 have indexed asset associations. The index contains 205
  ID-asset links across 135 assets. Asset associations do not establish
  per-key speakers or playback order.

## Range Result

- The range has 12 current correction-candidate IDs and two evidence-limited
  holds; the other 236 IDs have no current finding.
- Of the 182 newly recorded IDs, 134 have indexed asset associations and 48
  do not. The new links cover 73 assets.
- After appending 182 new IDs, the ledger covers 52,528 of 65,135 unique
  `default` IDs (80.64%), leaving 12,607. Sequential coverage reaches
  `47999`; next is `48000`-`48249`. Of reviewed IDs, 42,115 have indexed
  asset links and 10,413 do not.
- Findings remain proposals requiring separate approval. No translation CSV
  was changed.
