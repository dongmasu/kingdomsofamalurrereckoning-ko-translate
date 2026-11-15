# Five Smallest Unrecorded Asset Revalidations: Generic Dialogue and Quest Topics

- Date: 2026-11-11.
- Scope: all 309 `default` IDs linked to five previously unrecorded assets.
- English was the semantic anchor; Japanese was the primary voice/register
  reference; Chinese was supporting evidence.
- Thirty-five IDs are recorded as correction candidates and three as
  evidence-limited speech-level holds; ID `61731` is both a meaning/term
  candidate and a speech-level hold. No translation CSV or extracted game
  asset was changed.
- No exact-English duplicate group has divergent Korean text. Line-break
  counts and detected runtime-token/markup sequences match across all four
  languages for all 309 IDs.

## Grouping Evidence and Limits

All five assets lack an explicit `QUEST_ID` and NPC symbol:

- `345823.quest_bxml` has 57 IDs and 8,712 serialized `dialog_line_*`
  handlers. Its short lines concern theft, pursuit, guards, and intruders.
  The large handler count does not map any key to a speaker or sequence.
- `1352899.quest_bxml` has 60 IDs and 25 handlers. Its text concerns the
  rescue of Julia Tam from slavers led by Connovar.
- `1568843.quest_bxml` has 63 IDs and 22 handlers. Its text concerns Belne's
  weapon-making, the Tuatha Overlords, and Witch Knight Anira.
- `1965163.quest_bxml` has 63 IDs and 30 handlers. Its text concerns the
  prison-ship wreck, Olaf Asvaldsson, Nesta Gwynedd, and the Scuttle Beach
  survivors.
- `557095.quest_bxml` has 66 IDs and 21 handlers. Its text concerns Ariel
  Perien, her missing porter Deod, and the artifact at Bonnlach.

These asset and handler associations support only topic-level grouping.
They do not establish individual speakers, key-to-handler links, quest
branches, or playback order. All per-key speaker attributions remain
unassigned and dialogue order remains unknown.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `9259`, `28464`, `59868` | Naturalness | The English referents are escaped or missing people, but Korean uses the inanimate `그건` for “that one.” Consider person-referential wording such as `그자는` or `그 녀석은`, adjusted to each line. | Medium-high |
| `19621` | Naturalness | `Stop, bandit!` is rendered `도적, 멈춰!`, an awkward vocative order. Consider `거기 서, 도적!` or another natural shouted command. | High |
| `58765` | Meaning / naturalness | `Curse you` is rendered `저주받을 놈`, which describes a cursed person rather than directly cursing the addressee. Consider an idiomatic curse such as `저주를 받아라!` or `빌어먹을!` according to the intended bark. | Medium |
| `2945` | Format | The objective `Rescue Julia Tam` is `줄리아 탐(Julia Tam) 구출`; align it with the established action-form objective style, e.g. `줄리아 탐(Julia Tam) 구출하기`. | High |
| `6872`, `54177` | Meaning / naturalness | The idiom `for Fate's sake` is rendered literally as `운명에 맹세코` and `운명을 봐서라도`. Japanese and Chinese treat it as an exasperated plea, not an oath or literal appeal. Consider natural exclamations such as `맙소사` or `제발`, preserving the in-world invocation only if the context supports it. | High |
| `27798` | Naturalness | `stranger` becomes the archaic vocative `낯선 이여`. Consider a more conversational address, e.g. `이방인` or `낯선 사람`. | Medium-high |
| `41813`, `59642`, `61731` | Terminology | The same rescue-quest `bandits` are rendered `산적` / `산적들` here but `도적` / `도적들` at `33489` and `56611`; Japanese consistently uses `盗賊`. Consider using `도적` consistently. | High |
| `41813`, `45943`, `49338`, `59052` | Format | These rows mention Julia without the English parenthetical used for her elsewhere in the same group. Add `(Julia)` at the name occurrence; in `41813`, preserve the existing pairing for Bardan Tam as well. | High |
| `48440` | Meaning / naturalness | `I suspect you speak a different language` is paraphrased as “you are not someone one can talk to,” losing the language joke. Consider preserving it, e.g. `네 꼴을 보니 다른 언어를 쓰는 것 같군.` | Medium-high |
| `2701`, `4422`, `4925`, `21983`, `52000`, `56416` | Terminology / English pairing | `Master Makers` is `장인` at `2701` but `명장들(Master Makers)` at `4925`; `Master Belne` varies among `벨른(Belne) 사부`, `벨른(Belne) 장인`, and `마스터 벨른(Master Belne)`. Consider one title form, such as `마스터 벨른(Master Belne)`, and one matching form for the Master Makers. | High |
| `10708`, `41402`, `43547` | Naturalness / consistency | The English punctuation varies slightly (`finally....` / `finally...`) while Japanese is the same; Korean alternates between `잘 사용하도록` and `잘 활용해라`. Review as one repeated phrase family and align the Korean wording and command tone. | Medium-high |
| `15075` | Terminology | `Child of Dust` is `먼지의 자녀` here but `먼지의 자식` at `23046`, `36218`, and `49788`. Use one established form. | High |
| `28570` | Meaning / naturalness | `If that is what mortals call my making then yes, I am` becomes `필멸자들이 내 창작물을 그렇게 부른다면, 그래`, which does not clearly answer the implied title/identity question. Recheck the full sentence against Japanese and Chinese and make the answer explicit without inventing context. | Medium |
| `42673` | Terminology | The same `shattered weapon` is usually `부서진 무기` in this asset, but becomes `산산조각 난 무기` here. Consider using the established form. | High |
| `34271` | Naturalness | `그 힘이 도움이 되면 좋겠어. 방해가 되지 말고` turns “I hope his strengths are a help and not a hindrance” into an awkward second clause. Consider `그 힘이 방해가 아니라 도움이 되면 좋겠어.` | High |
| `14278` | Format | The objective `Recover the Ancient Artifact` is the bare noun phrase `고대 유물 회수`, unlike the action-form `회수하기` used for the Ariel's Pack objective. Consider `고대 유물 회수하기`. | High |
| `30401`, `50147` | Format | These objective titles mention Ariel (and Bonnlach at `30401`) without the English name/place pairings used elsewhere in the same group. Consider `아리엘(Ariel)` and `본라흐(Bonnlach)` while preserving the current action wording. | High |
| `39095`, `43688`, `47211` | Format | Proper names are not fully paired with their English forms: `Phorian Strait` at `39095`, and `Julius Mavern` at `43688` and `47211`. Add the source names in parentheses, preserving existing pairings. | High |

The proposed proper-name and title forms are scoped review directions, not
approved glossary decisions or applied edits.

## Evidence-Limited Holds

| ID(s) | Question | Evidence and disposition |
| --- | --- | --- |
| `23486`, `48630`, `61731` | Speech level / honorifics | Japanese uses plain conversational requests while Korean uses polite `-요` endings. The asset has no NPC symbol or per-key speaker mapping, so retain these as possible register differences rather than confirmed voice errors. ID `61731` also has the bandit-term candidate above. |

## Retained Text and Structural Checks

The remaining 272 IDs were retained after comparing English, Japanese,
Chinese, and active Korean. No exact-English duplicate group within the batch
has divergent Korean text. All 309 IDs have matching line-break counts and
matching detected runtime-token/markup sequences across the four languages.

## Complete ID Sets

- `345823.quest_bxml` (8,712 handlers; 57 IDs): `2092`, `5182`, `6431`,
  `8491`, `9259`, `10299`, `15493`, `16553`, `16559`, `17418`, `17868`,
  `19621`, `20337`, `21330`, `22113`, `22753`, `24067`, `26829`, `28464`,
  `30423`, `31003`, `31617`, `32975`, `33705`, `35109`, `35404`, `36905`,
  `38519`, `40793`, `42588`, `43406`, `43566`, `44137`, `44570`, `50017`,
  `51157`, `51397`, `51788`, `52348`, `52641`, `53287`, `53336`, `53572`,
  `54326`, `54872`, `57279`, `57564`, `58428`, `58765`, `58855`, `59868`,
  `60149`, `61683`, `62232`, `63793`, `64859`, `64982`
- `1352899.quest_bxml` (25 handlers; 60 IDs): `1095`, `2945`, `4003`,
  `4448`, `5557`, `6872`, `12040`, `13383`, `13968`, `14754`, `15263`,
  `15299`, `18123`, `19278`, `19951`, `21245`, `21717`, `23374`, `23486`,
  `24734`, `27055`, `27798`, `28509`, `29113`, `29355`, `30976`, `31777`,
  `33489`, `35576`, `37547`, `37761`, `38759`, `39836`, `41813`, `42615`,
  `44332`, `45760`, `45943`, `46507`, `47860`, `48440`, `48630`, `48631`,
  `49338`, `54177`, `56611`, `56948`, `58528`, `58550`, `58606`, `58824`,
  `59052`, `59642`, `60083`, `61135`, `61449`, `61630`, `61731`, `62242`,
  `63824`
- `1568843.quest_bxml` (22 handlers; 63 IDs): `478`, `1593`, `2108`,
  `2701`, `4034`, `4422`, `4704`, `4925`, `5305`, `6685`, `6823`, `7238`,
  `7435`, `9028`, `9396`, `10708`, `12683`, `15075`, `15719`, `17096`,
  `19647`, `21983`, `22799`, `23046`, `23257`, `24587`, `24950`, `25437`,
  `26792`, `28570`, `28700`, `29005`, `29983`, `30608`, `31102`, `31240`,
  `32538`, `33172`, `33532`, `34803`, `35356`, `36218`, `37794`, `37945`,
  `39628`, `40476`, `40897`, `41402`, `42673`, `43413`, `43547`, `44749`,
  `45657`, `49624`, `49788`, `52000`, `52802`, `56416`, `58464`, `60278`,
  `62056`, `63602`, `63732`
- `1965163.quest_bxml` (30 handlers; 63 IDs): `1749`, `2891`, `4101`,
  `5385`, `5813`, `7169`, `7785`, `8224`, `10176`, `11717`, `12598`,
  `12693`, `13734`, `15059`, `15825`, `17298`, `19399`, `21936`, `22448`,
  `22545`, `23366`, `26919`, `27462`, `28217`, `28335`, `29033`, `29882`,
  `30059`, `31325`, `34271`, `34580`, `35499`, `36710`, `37074`, `37514`,
  `38861`, `39095`, `41398`, `43372`, `43421`, `43512`, `44738`, `45020`,
  `45186`, `46795`, `46839`, `49199`, `49241`, `52505`, `54085`, `55198`,
  `55675`, `55910`, `56335`, `57135`, `60681`, `61975`, `62854`, `63331`,
  `63802`, `63910`, `64091`, `65017`
- `557095.quest_bxml` (21 handlers; 66 IDs): `275`, `2693`, `2866`, `2982`,
  `3649`, `4435`, `4754`, `6620`, `6694`, `7986`, `8285`, `8880`, `9209`,
  `10996`, `12690`, `13089`, `13401`, `13982`, `14048`, `14278`, `14584`,
  `15428`, `16786`, `18426`, `19349`, `20460`, `22315`, `24674`, `24970`,
  `27587`, `27814`, `27947`, `28849`, `28853`, `28962`, `29358`, `29632`,
  `29841`, `29935`, `30401`, `30634`, `30805`, `35152`, `37956`, `37996`,
  `40060`, `40341`, `41342`, `42442`, `43128`, `43133`, `43688`, `44613`,
  `45089`, `47211`, `50147`, `51105`, `56235`, `57301`, `57542`, `58339`,
  `58852`, `62060`, `62769`, `63401`, `63937`

All 309 IDs are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv)
with four-language source fingerprints. Findings remain proposals and have
not been applied to the translation CSV.
