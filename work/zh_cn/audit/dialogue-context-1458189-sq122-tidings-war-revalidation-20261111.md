# Asset Revalidation: `1458189.quest_bxml` (`SQ122`)

- Date: 2026-11-11.
- Scope: all 97 linked `default` IDs, newly recorded in the ledger.
- English controls meaning; Japanese is the primary register/layout
  reference; Chinese supplies secondary meaning evidence.
- Fifteen correction-candidate IDs and three evidence-limited holds.
- No translation CSV or extracted asset was changed. Proposed corrections
  require the separate editor/approval step.

## Context Evidence and Limits

The asset explicitly identifies `SQ122`, contains
`NPC_RTH_DOK_AfanArduoch` and `NPC_RTH_DOK_RhiadGuth`, and has 45 distinct
serialized dialogue handlers. Its text concerns delivering military call-up
notices to four Rathir residents and finding a substitute recipient.
The symbols and handlers do not map individual keys to speakers, branches,
addressees, or playback order. Speakers remain unassigned except `30490`,
where English explicitly identifies the speaker as Ruhnir Wesnon (`a poor
Ruhnir Wesnon like me`), supported by Japanese `私、ルーニア・ウェスノン`.
The absence of his NPC symbol from this asset's two-symbol list is further
reason not to treat the symbol list as a complete speaker list.

## Correction Candidates

| ID(s) | Dimension | Evidence, finding, and proposed direction | Confidence |
| --- | --- | --- | --- |
| `2885`, `16452`, `36854`, `52920` | Meaning / terminology | English uses the named `Notices of Duty`; Japanese consistently uses `召集通知`. Korean varies between `의무 소집 통지서`, `임무 통지서`, and `복무 소집 통지서`. The working item label `base:4491:11` and five singular `default` labels (`33190`, `34744`, `37488`, `44470`, `48434`) use `복무 소집 통지서`. Reuse that wording in these journal entries; it is military call-up, not an ordinary task notice. Full English pairing can be `복무 소집 통지서(Notices of Duty)` where the named plural is explicit. Do not automatically add full item names to every generic `card` or `notice`. | High |
| `36854` | Meaning / naturalness | English `Rhiad paid a courier's wage` is the player's completed quest journal, with a deduction for Afan's death. Korean `심부름꾼에게 품삯을 줬다` can introduce an unrelated third-person courier and `벌금은 빼고 말이다` is an awkward parenthetical fragment. Consider `리아드(Rhiad)에게 복무 소집 통지서(Notices of Duty)를 배달한 보수를 받았다. 아판(Afan)이 죽어 그만큼 감액됐다.` Preserve the following summary of varied social ranks and reactions. | Medium-high |
| `10778` | Meaning | English `None of your deliveries are under this tree` rebukes the notice courier for lingering; Japanese likewise mentions `配達物`. Korean `네가 받을 물건` reverses delivery direction. Consider `아직도 여기 있어? 통지서를 받을 사람들이 이 나무 밑에 있는 건 아니잖아.` | High |
| `16301` | Meaning / navigation | Japanese explicitly says `警備隊の前には昼夜衛兵がいる`; English describes the Watch's posted guards after directing the player toward the market. Korean `경비대가 시장 앞을 밤낮으로 지키고 있어` fixes the guards' location to the market instead of the Watch entrance. Consider `터널을 나와 시장 근처까지 가. 도시 경비대(City Watch) 앞에는 밤낮으로 경비병이 서 있으니 쉽게 찾을 거야.` Do not infer a map coordinate or building layout. | Medium-high |
| `25832` | Naturalness | English `Stern in the brow` and Japanese `いかめしい眉` describe a stern appearance. Korean `엄한 눈썹` is awkward. Consider `네가 해낼 것 같군. 날카로운 눈매에 당당한 태도. 이 통지서를 배달할 사람으로 딱이야.` Keep the existing informal level. | Medium-high |
| `31012` | Meaning | English `Delivered where?` asks the destination of the proposed delivery; Japanese `どこへ配達する？` makes that prospective meaning explicit. Korean `어디로 배달됐는데?` instead asks where a completed delivery went. Consider `무슨 통지서? 어디로 배달하면 되지?` | High |
| `41134` | Meaning / naturalness | English `Now. Be on your way.` and Japanese `さあ。行ってちょうだい` are a send-off. Korean `지금 당장. 어서 가.` adds a stronger demand and a fragment. Consider `자, 이제 가 봐.` Retain informal speech rather than assigning the speaker. | Medium |
| `41671`, `42024`, `43268`, `54797` | Meaning / terminology | Generic references to the same delivered notices become `공지`, `공고`, or `공고문`, which suggest a posted announcement. Use `통지서`: `무슨 통지서야?` for the identical pair `41671`/`43268`, `이 통지서가 도움이 될까?` for `42024`, and `통지서` in the otherwise polite `54797`. Preserve the latter's hero-respect framing; terminology unification is not speech-level unification. | High |
| `59197` | Terminology / English pairing | English names `the Officer's Hall, on the Burn`. Working `base:3237:11` and `default:36564`/`38949` use `장교 회관`, while `52920` uses `장교 전당`. Align that candidate to `장교 회관(Officer's Hall)` and make this row `일이 끝나면 번(The Burn)의 장교 회관(Officer's Hall)에서 날 찾아.` The existing Burn labels at `7284`/`26473` support the named district, not a literal burn. | High |
| `59600` | Naturalness / text type | English `I can no longer complete this quest` and Japanese describe a quest-failure journal state. Korean alone uses polite `완료할 수 없습니다`. Consider `퀘스트에 필요한 인물 중 한 명 이상이 사망해 이 퀘스트를 더는 완료할 수 없다.` This is a journal/UI correction, not an NPC speech-level assertion. | High |

The terminology cross-checks above are read-only references. Supplemental
labels are not counted as newly reviewed IDs in this batch, and their
existing ledger records, if any, are not overwritten.

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| --- | --- | --- |
| `13300` | Meaning / source conflict | English literally says `she didn't not knock for me`, while Japanese `私にはノックしなかった` and Chinese `并不是来找我的` give the opposite polarity. Korean follows the English double negative (`내 문을 두드리지 않은 건 아니야`). This may be an English source typo, but do not silently delete the extra negative. A possible resolution is `운명이 문을 두드렸지만... 내 문은 아니었어.` Hold pending approval of the source-conflict interpretation. |
| `15850` | Speech level | Korean `되죠?` is polite; Japanese is plain. This is a possible isolated player-choice register difference, but the key's scene/addressee is unmapped. Do not infer that every player response in the asset must have the same address level. |
| `40794` | Address | Korean uses `자네`, while other apparent recruitment lines use `너` or polite `당신`. Hero/legend alternatives occur in the sources, and the asset does not establish scene-stage continuity. Hold address normalization instead of flattening those alternatives. |

## Retained Differences and Structure

- `215` explicitly concerns recruitment after the war; `40082` concerns the
  Klurikon advance. Their source conditions differ, so the war-status
  wording is retained rather than harmonized.
- `25665`, `30741`, `51563`, `54797`, and `61969` are not automatically
  downgraded to informal speech. Several source alternatives explicitly
  praise a hero/legend, and `54797` uses Japanese `くださる`. Their Korean
  politeness alone is not proof of an error.
- `46216`: English `quartermaster` and Chinese `军需官` support Korean
  `보급관`. Do not replace it with the Japanese helmsman reading.
- `44159`: Japanese explicitly mentions death at the front; Korean's
  `죽겠지` has that support, although the English is less explicit.
- Five exact-English duplicate groups cover 12 rows: `City Watch`
  (`4365`, `6260`), `What do you want me to do?` (`28266`, `29973`),
  `Quest Complete` (`35286`, `55531`), `What notices?` (`41671`,
  `43268`), and `This is for you.` (`53449`, `55113`, `58179`,
  `60579`). Korean matches within all groups. Matching duplicate wording
  does not remove the terminology candidate for `What notices?`.
- All 97 rows match across four languages in newline counts and extracted
  brace-token/angle-markup sequences. This is not display/playback testing.

## Complete Asset ID Set

`84`, `215`, `822`, `1188`, `1867`, `2885`, `3233`, `4365`, `4557`,
`6025`, `6260`, `6335`, `8700`, `9613`, `10406`, `10778`, `12841`,
`12853`, `13300`, `13610`, `14345`, `14632`, `15010`, `15850`, `16301`,
`16452`, `16971`, `17195`, `18597`, `19793`, `21755`, `22716`, `25127`,
`25236`, `25665`, `25832`, `26104`, `27085`, `27897`, `28266`, `28635`,
`28794`, `29228`, `29973`, `30047`, `30140`, `30490`, `30501`, `30741`,
`31012`, `32714`, `33709`, `34588`, `34802`, `35286`, `35949`, `36465`,
`36854`, `37358`, `37871`, `40082`, `40390`, `40794`, `41134`, `41671`,
`42024`, `42509`, `43268`, `44159`, `44534`, `45269`, `46216`, `46756`,
`46934`, `47456`, `51563`, `51668`, `52920`, `53449`, `53957`, `54797`,
`55113`, `55531`, `55849`, `56986`, `57017`, `58179`, `59197`, `59600`,
`59999`, `60579`, `60581`, `60890`, `61969`, `63122`, `64401`, and
`65076`.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
