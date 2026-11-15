# Asset Revalidation: `1382473.quest_bxml` (`SQ114` Handler-Prefix Candidate)

- Date: 2026-11-11.
- Scope: all 103 linked `default` IDs, newly recorded.
- English controls meaning; Japanese supplies the primary voice/register
  and layout reference; Chinese is secondary meaning evidence.
- Fourteen correction-candidate IDs and four evidence-limited hold IDs.
- No translation CSV or extracted asset was changed. Candidates require
  separate approval and editing.

## Context Evidence and Limits

The asset has 38 `SQ114`-prefixed serialized dialogue handlers, but no
explicit `QUEST_ID` or NPC symbol. Its texts concern Brun's Caeled Coast
stories, House Gastyr, the Bolgan, and a letter. These clues do not map
individual keys to handlers, branches, or playback order. `22764` explicitly
identifies its first-person speaker as Brun the Bard; this does not assign
other lines to Brun. Quest journal and objective entries are assessed as
their own text type.

## Correction Candidates

| ID(s) | Dimension | Evidence, finding, and proposed direction | Confidence |
| --- | --- | --- | --- |
| `4564` | Meaning | English says the lord, his son, and squires were killed `during their morning ride`. Japanese says an early-morning attack; Korean `새벽 기습 때` omits the ride and adds surprise. Consider `아침에 말을 타고 나갔던 에란 가스티르(Erran Gastyr) 경과 그의 아들, 종자들을 죽였지.` Keep the opening's `먼저 공격` already accepted by D-1089. | High |
| `29805`, `58680`, `62230`, `55108` | Naturalness / text type | English and Japanese are quest-journal records, while Korean uses spoken endings (`해 줬어`, `처리해야 해`, `기다려야겠어`, `영영 알 수 없겠군`). Recast in journal prose without changing stages or directions. For example, `29805` may end `... 먼저 처리해야 한다`, and `58680` may end `... 기다려야겠다. 여기서 무슨 일이 있었는지 들려줄 것이다.` | High |
| `30731`, `47929`, `48961`, `50028`, `59242`, `39388` | Spelling / local English pairing | English `Gastyr` refers to the castle route, lord, family, or individual depending on the row. Korean has `개스티르`, `개스티어`, and unpaired `가스티르`. Reuse `가스티르` and add a context-appropriate `Gastyr` pairing at the unpaired reference; in `48961`, the related `46380` establishes the camp before Castle Gastyr, so `가스티르 성(Castle Gastyr)` is a local option. Do not collapse the distinct confirmed `person:erran-gastyr`, `faction:house-gastyr`, and `place:castle-gastyr` entities or invent a full-name pairing for a bare source surname. | High for spelling; medium-high for local pairing |
| `47662` | Name pairing | English and Japanese name `Wilda Brandan`, while Korean `와일다 브랜던` is unpaired. Consider `와일다 브랜던(Wilda Brandan)` in this sentence, retaining the servant's relationship and the father's refusal to acknowledge the child. This is a local annotation, not a newly approved global name. | High |
| `58329` | Event pairing | English names `the Ambush of Gornak Ree` and Japanese quotes it as a named attack. Korean `고르낙 리의 매복` lacks the complete English event name. Consider `고르낙 리의 매복(Ambush of Gornak Ree)` while retaining the narrative fragments. Do not infer whether Gornak Ree is a person or place. | Medium-high |
| `22374` | Naturalness | English and Japanese tell the player to wait beside the watchtower for Brun to arrive. Korean `브룬이 만날 때까지 기다려야겠다` is ungrammatical. Consider `이제 낡은 감시탑 옆에서 브룬(Brun)이 올 때까지 기다려야겠다.` | High |

## Evidence-Limited Holds

| ID(s) | Dimension | Reason and disposition |
| --- | --- | --- |
| `5920`, `12674`, `49500`, `60945` | Speech level | Korean uses `-구려` or formal `-오/-리다`, while Japanese is plain. The asset does not map these individual lines to a particular speaker, addressee, or stage; formal storytelling or a change in relationship may be intentional. Hold wholesale normalization despite the first-person Brun self-identification at `22764`. |

## Retained Decisions and Structural Checks

- `55206` keeps `할머니`: English `his mother's personal possessions`
  refers to the father's mother. The earlier disposition explicitly checked
  this, despite Japanese's less specific `母`.
- `53161` keeps `거목` for `giants`, because the source explicitly compares
  them to saplings and Japanese says giant trees; do not substitute a
  humanoid species.
- Three exact-English duplicate groups match in Korean:
  `8482`/`52023`, `15070`/`16489`/`52693`, and `63088`/`63568`.
- All 103 rows match across four languages in newline counts and extracted
  brace-token/angle-markup sequences. This is not a playback/display test.

## Complete Asset ID Set

`83`, `801`, `1396`, `2838`, `3466`, `3519`, `4405`, `4564`, `4606`,
`4734`, `5072`, `5460`, `5920`, `6165`, `6346`, `6741`, `7101`, `7707`,
`8358`, `8482`, `9889`, `10701`, `11930`, `12674`, `14503`, `14905`,
`15070`, `15374`, `16111`, `16489`, `17476`, `17718`, `17891`, `18656`,
`19159`, `19447`, `22374`, `22764`, `24731`, `25203`, `28922`, `29805`,
`30449`, `30731`, `31123`, `32521`, `32659`, `32905`, `33500`, `34732`,
`35358`, `35773`, `36640`, `36669`, `37344`, `37825`, `39014`, `39388`,
`39634`, `39658`, `41567`, `43732`, `44527`, `46226`, `46380`, `47662`,
`47929`, `48729`, `48961`, `49342`, `49500`, `49911`, `50028`, `50509`,
`51155`, `51629`, `52023`, `52560`, `52693`, `52755`, `52927`, `53161`,
`53440`, `54128`, `54158`, `55108`, `55206`, `56511`, `57246`, `58329`,
`58680`, `58792`, `59242`, `60117`, `60586`, `60945`, `61139`, `61768`,
`62230`, `63088`, `63150`, `63568`, and `64925`.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
