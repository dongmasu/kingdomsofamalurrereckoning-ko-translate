# Asset Revalidation: `1964884.quest_bxml` (`DLC2_Idylla_NQD_Citizens` Handler-Prefix Candidate)

- Date: 2026-11-11.
- Scope: all 105 linked `default` IDs, newly recorded.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- Five correction-candidate IDs; no finding requires assigning an individual
  speaker.
- No translation CSV or extracted asset was changed. Proposed corrections
  require separate approval.

## Context Evidence and Limits

The asset contains 336 handlers prefixed `DLC2_Idylla_NQD_Citizens`, but no
explicit `QUEST_ID`, NPC symbol, or per-key handler mapping. The rows concern
Idylla citizens and topics including the Primos, debates, the Lykeios,
Straton's plays, the Silent Choir, the Beckoned, and city locations. This is a
regional citizen/topic grouping, not proof that one person or quest owns all
the lines. Individual speakers, addressees, and playback order remain unknown.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `13539` | Naturalness | `우리를 다시 은총 안으로 받아들이려 한다` is a stiff rendering of “take us back into their favor.” Consider `신들이 우리에게 다시 은총을 베풀려 한다는 뜻일 거야.` | High |
| `18529` | Meaning / naturalness | `충실한 이들` can mean loyal or reliable people, while English `the faithful` and Japanese `信仰ある者たち` mean people of faith. Consider `믿음이 있는 이들이 신들을 찬양하며 노래할 때입니다! 함께합시다!` | High |
| `20434` | Speech level / naturalness | `반갑습니다, 나그네여` mixes polite `-습니다` with a literary vocative. Consider a consistent greeting such as `나그네님, 반갑습니다.` | High |
| `53901` | Meaning | Japanese `働きづめだった` and Chinese `劳作了这么多` confirm that “after all my labors” means working hard. `온갖 일을 겪고 나니` instead says the speaker has been through many events. Consider `그동안 고생한 끝에 생활 구역에서 쉬니 참 좋군.` | High |
| `62826` | Meaning | “You have done much for our people” is rendered `우리를 위해 정말 많이 애써 줬어`, which can refer to the speaker and addressee rather than their people. Consider `우리 민족을 위해 정말 많이 애써 줬어, 부름받은 자(Beckoned). 편히 즐겨.` | Medium-high |

## Retained Decisions and Structural Checks

- No per-key speaker or dialogue-order evidence is present; register continuity
  across different citizen lines was not inferred.
- Exact-English duplicate groups and four-language line-break,
  runtime-token, and markup signatures are recorded by the validation pass
  accompanying this report.
- All linked IDs are listed below; each receives a four-language source
  fingerprint and an ID-level disposition in
  [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).

## Complete Asset ID Set

`216`, `829`, `2074`, `2329`, `4525`, `4839`, `5454`, `5664`, `5925`,
`7530`, `7789`, `10509`, `10715`, `11243`, `11273`, `11507`, `13218`,
`13539`, `14750`, `15498`, `15569`, `16167`, `17411`, `18529`, `18937`,
`19442`, `20190`, `20340`, `20434`, `21241`, `21636`, `22654`, `23260`,
`24017`, `24572`, `26276`, `26642`, `27732`, `29435`, `29645`, `31594`,
`31944`, `32257`, `32303`, `33092`, `33846`, `34207`, `34397`, `34837`,
`34861`, `35041`, `35235`, `35563`, `36099`, `36685`, `37121`, `37188`,
`37815`, `37900`, `39783`, `40042`, `40761`, `41179`, `41696`, `43025`,
`43329`, `43375`, `44247`, `44798`, `47229`, `47317`, `47788`, `47810`,
`48341`, `49719`, `49973`, `50964`, `51086`, `51244`, `51483`, `51572`,
`52650`, `53156`, `53654`, `53893`, `53901`, `54335`, `55431`, `55804`,
`56539`, `57736`, `58619`, `59117`, `59135`, `59550`, `61197`, `61474`,
`62372`, `62771`, `62826`, `63338`, `63516`, `63650`, `64487`, and
`65126`.
