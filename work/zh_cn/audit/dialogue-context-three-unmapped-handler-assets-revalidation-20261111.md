# Three Unmapped Handler-Asset Revalidations: TRSQ03, U01, and SQ31

- Date: 2026-11-11.
- Scope: all 216 unique `default` IDs linked to three previously unrecorded
  quest assets (72 IDs each).
- English was the semantic anchor; Japanese was the primary voice/register
  reference; Chinese was supporting evidence.
- Fourteen correction candidates and one evidence-limited register hold were
  recorded. No translation CSV or extracted game asset was changed.
- Twelve exact-English duplicate groups (25 rows) have matching Korean
  translations. All 216 IDs have matching line-break counts and detected
  runtime-token/markup sequences across the four languages.

## Grouping Evidence and Limits

- `1646577.quest_bxml` has 23 `dialog_line_*` handlers with a `TRSQ03`
  prefix, but no explicit `QUEST_ID` or NPC symbol.
- `511220.quest_bxml` has 31 handlers with a `U01` prefix, but no explicit
  `QUEST_ID` or NPC symbol.
- `567350.quest_bxml` has 37 handlers with an `SQ31` prefix, but no explicit
  `QUEST_ID` or NPC symbol.

The prefixes and asset membership support candidate quest/topic groupings
only. They do not map localization keys to handlers, individual speakers,
branches, or playback order. Speaker attribution remains unassigned and
dialogue order remains unknown for all rows. The matched keys include
dialogue, choices, objectives, journal/status text, and labels; they are not
all lines spoken by one person.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `1354` | Meaning / naturalness | `inner sanctum` is rendered as `은신처`, which can imply a place used to hide. Japanese describes a study and Chinese a private inner room. Consider `내실` or another term for private quarters, e.g. `아버지의 방을 자기 내실로 쓰고 있어`. | Medium |
| `20205` | Meaning / sentence structure | The current syntax makes giving away all her possessions sound like the means by which she forgets the tragedy. Japanese and Chinese instead connect the player's help to the tragedy ending/being forgotten. Separate the reward from the request or acknowledgment about help, preserving the source's intent without making the clauses dangle. | Medium |
| `24716` | Meaning | Korean says the player received the Hierophant's assignment, while Japanese and Chinese refer to receiving a reward for completing the Hierophant's task. The English `has been awarded` is ambiguous. Recheck the intended reward nuance; a possible direction is `대사제의 임무를 수행해 보상은 받았겠지? 이번 일도 서둘러 끝내야 해.` | Medium |
| `22111` | Naturalness / nuance | `Landed on, really` is rendered `그 사람 위로 넘어졌죠`; Japanese says the speaker got on top of the body and Chinese says they stepped on it. Consider the more direct `정확히는 그 위에 떨어졌죠` while retaining the comic correction. | Medium-high |
| `25071` | Speech level / naturalness | A single utterance shifts from `내가 안 했어` to `노려보시는지는`, `제가`, and `아니에요`. Japanese keeps a polite first-person register throughout. Consider using `저/제가` and polite endings consistently, including the opening: `제가 안 했어요! ...` | High |
| `58749` | Terminology | The same `Minor Alchemist's Art Potion` is called `하급 연금술사의 기술 물약` at `27747`, `29218`, `42851`, and `43969`, but `하급 연금술사의 기예 물약` here. Align this occurrence with `기술`. | High |
| `18315` | Speech level | `보상은 꼭 해 주겠네` uses a marked `-겠네` register, unlike the conversational Japanese (`するわ` / `いいのよ`) and the remainder of the Korean line. Consider `보상은 꼭 해 줄게, 친구.` | Medium-high |
| `26068` | Name / format | `Hillared the Blade` is paired only as `힐러레드(Hillared)`, omitting the epithet from the English parenthetical. Preserve the Korean title and include the complete source name, e.g. `검객 힐러레드(Hillared the Blade)`. | High |
| `43572` | Speech level | `돕겠소` is marked `-소` speech, while Japanese uses an unmarked conversational volitional. Consider `정의를 바로 세우도록 돕겠어` or another plain conversational form. | High |
| `44755` | Speech level / naturalness | `왔군`, `보이는군`, and `자네` create a markedly old-fashioned register. Japanese remains conversational and feminine (`来たのね` / `どうでもいいわ`), and the Korean sentence itself ends plainly. Consider `마침내 왔네. 걸음이 좀 망설이는 것 같지만, 내가 신경 쓰는 건 그게 아니야.` | High |
| `49880` | Name / format | The epithets are only partly paired: `약탈자 라시논(Racinon)` and `붉은 눈의 라시논(Racinon)` omit `the Ravager` and `the Red-Eyed`. Include each complete English epithet in its parenthetical. | High |
| `50014`, `56355` | Address / terminology | The same English address `honored one` is rendered `고귀한 분` and `존귀하신 분`; Japanese uses `英雄` in both rows and Chinese uses `阁下`. Consider one natural Korean form for these two uses, with inflection suited to each sentence. This does not automatically standardize the distinct `honored one` at ID `26088`, whose Japanese source differs. | Medium |
| `60982` | Meaning / naturalness | `fresh from the Balor's bloodying` currently reads as a fight with Balor, while Japanese says the Hero has bloodied Balor. Consider making the Hero's action explicit, e.g. `발로르(Balor)를 피투성이로 만든 전투를 치르고 막 돌아온 모습으로`. | Medium-high |

## Evidence-Limited Hold

| ID | Question | Evidence and disposition |
| ---: | --- | --- |
| `7550` | Speech level | English asks `Please hurry`, Japanese uses a plain request, Chinese and Korean use polite wording. The asset has no NPC symbol or per-key speaker mapping, so the Korean `서둘러 주세요` is retained rather than labelled a voice error. |

## Retained Text and Repeated Sources

The 12 exact-English duplicate groups cover 25 rows across these assets. Each
group's Korean translations already match; no frequency-based harmonization
was applied. Other rows were retained after meaning, Japanese register,
Chinese support, and Korean naturalness checks. No speaker gender, per-key
handler, branch, or playback order was inferred.

## Complete ID Sets

- `1646577.quest_bxml` (72 IDs): `36`, `73`, `2112`, `2281`, `2775`,
  `4536`, `7941`, `11800`, `12695`, `12823`, `13169`, `13324`, `14294`,
  `14308`, `15943`, `18226`, `18349`, `18574`, `18615`, `22035`, `23288`,
  `24267`, `24716`, `24884`, `24905`, `25997`, `26227`, `26248`, `27323`,
  `27750`, `27862`, `31237`, `31638`, `32970`, `34722`, `36019`, `37686`,
  `38845`, `39324`, `39831`, `40023`, `40267`, `40851`, `41573`, `41918`,
  `41997`, `43076`, `43618`, `43877`, `44553`, `44755`, `45632`, `46179`,
  `47225`, `48628`, `49717`, `49962`, `52364`, `53760`, `54331`, `55927`,
  `56869`, `57026`, `57943`, `58405`, `58409`, `59481`, `60210`, `61322`,
  `63172`, `64745`, `64888`
- `511220.quest_bxml` (72 IDs): `914`, `932`, `1202`, `1422`, `2872`,
  `4272`, `4467`, `4491`, `7345`, `7550`, `8239`, `8446`, `9038`, `9368`,
  `9591`, `10570`, `10688`, `12239`, `17683`, `17739`, `18337`, `20463`,
  `20695`, `22111`, `22703`, `23677`, `23992`, `24136`, `25071`, `25453`,
  `26372`, `27502`, `27637`, `27747`, `28693`, `29218`, `30345`, `30513`,
  `30791`, `31345`, `31479`, `31857`, `32824`, `34591`, `35208`, `35812`,
  `36196`, `36336`, `39837`, `40050`, `41416`, `41719`, `41858`, `42851`,
  `43969`, `44716`, `45261`, `49093`, `50040`, `50068`, `50597`, `50906`,
  `51623`, `52499`, `54281`, `56756`, `57396`, `58749`, `58863`, `61560`,
  `63506`, `64526`
- `567350.quest_bxml` (72 IDs): `1119`, `1354`, `1736`, `3292`, `4949`,
  `5592`, `5950`, `9462`, `9752`, `11569`, `12920`, `13630`, `14924`,
  `16240`, `16471`, `16510`, `18315`, `18792`, `18825`, `18846`, `19849`,
  `20205`, `20688`, `20763`, `22878`, `23180`, `26068`, `30769`, `32665`,
  `32723`, `32835`, `33436`, `34230`, `35131`, `35613`, `36194`, `36966`,
  `37531`, `37810`, `38484`, `39862`, `43572`, `44237`, `44483`, `45914`,
  `46798`, `48516`, `49094`, `49417`, `49880`, `49884`, `49895`, `50014`,
  `51575`, `53215`, `53946`, `54193`, `54307`, `55027`, `55097`, `56355`,
  `58054`, `58525`, `58586`, `58873`, `59603`, `59785`, `59794`, `60982`,
  `62816`, `63505`, `64605`

All 216 IDs are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv)
with current four-language fingerprints. Findings remain review proposals;
no translation CSV changes were made.
