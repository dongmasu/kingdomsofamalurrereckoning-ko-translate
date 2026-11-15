# Sequential `default` Revalidation: IDs `28250`-`28499`

- Date: 2026-11-12.
- Read all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 62 recorded IDs and added 188 new IDs. Findings are proposals,
  not approved translation edits.
- No translation CSV, reference asset, or game binary was modified.

## Correction Candidates

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `28276` | Name / format | `Sergeant Odi` is split as `오디(Odi) 중사`. Consider `오디 중사(Sergeant Odi)` in the existing sentence. Related `39072` and `44009` also omit the full English title and need separate review. | High |
| `28301` | Name / consistency | The same letter calls the Manoise scholars `마노이즈` twice but names Carloman and Louis `마누아즈`. Their name labels `6158` and `1786` and self-introduction `12571` use `마누아즈`. Consider that form for both collective mentions, preserving the letter's five-item layout and polite voice. | High |
| `28307` | Naturalness | `indignant creatures` is literally `분개한 생명체들`, an awkward description here. Consider `위압적이고 성난 생명체들이지`, preserving the claim that the Kollossae drove most away. | Medium |
| `28310` | Place name / format | `Gravehal Keep` is `그레이벌 요새`, versus the established `그레이브홀 요새(Gravehal Keep)` in base `42` and numerous default entries. Align the name while retaining the sister-keep relationship and permanent +3% ranged damage. | High |
| `28389` | Meaning | `our forces to the east, in Klurikon` places the forces east of the speaker, in Klurikon; `클루리콘 동부의 우리 군대` asserts they were in eastern Klurikon. Consider `동쪽 클루리콘(Klurikon)에 있는 우리 군대`, retaining the retreat ten years ago. | High |
| `28406` | Naturalness | The speaker hesitantly calls the freed person `that... that danger` before saying `he` cursed her. Korean `그 위험을 풀어 준` sounds like releasing an abstract risk. Consider `그... 그 위험한 자를 풀어 준 게 당신이었군요`, retaining the stammer and subsequent curse. | Medium |
| `28427` | Naturalness | `rebukes my people's every step` is an extended metaphor for hostile land; `걸음마다 꾸짖고 있지` reads unnaturally. Consider `우리가 내딛는 걸음마다 시련을 안겨 주지`, retaining the crucible/new destiny metaphor. | Medium |
| `28491` | Name / format | `Marie's Remains` is `마리의 유해`, without the English name. Consider `마리(Marie)의 유해`; `12152` also pairs Marie. Do not assume the separately named Violet Marie is necessarily the same person. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `28270` | Meaning / context | `You're welcome.` can be a response to thanks or a welcome. Japanese `あら、どうも` also permits an appreciative response, but Korean `천만에` chooses the response to thanks. Three other identical English rows have Japanese greetings or thanks; the context is needed before unifying or changing any of them. |
| `28313`, `28320`, `28322` | Speech level | Japanese uses respectively polite or casual service phrasing while Korean selects a different level. Service situation, actual speaker, and dialogue stage are not established, so do not infer a register error from the Japanese alone. |
| `28326` | Meaning / context | `you're getting it` can mean receiving something despite objection or coming to understand it; Japanese and Chinese take different readings. Korean selects understanding. Obtain the preceding exchange before rewriting it. |
| `28425` | Meaning / context | `The seer watches over us, but it beats the Daughters of Lyria` is ambiguous: the comparator and the seer/Hierophant relationship are unclear. Korean's `보살펴 주지만 ... 보다는 낫지` leaves the comparison disjointed. Do not assign a referent without the surrounding conversation. |

## Earlier Findings And Checks

- Retain candidates `28305` (gallery terminology), `28356` (naturalness),
  `28399` (journal naturalness), `28409` (journal register), `28445` (Glass
  as mirror), and `28464` (ambiguous referent); retain the `28454` hold.
- 68 exact-English duplicate groups touch this range (1,185 corpus rows).
  Their Korean forms match, but identical `You're welcome.` has differing
  Japanese interpretations; see the `28270` hold.
- Normalized runtime token signatures match. Japanese `28460` has one
  newline while English, Chinese, and Korean have two; preserve the existing
  three-part Korean layout rather than forcing Japanese line breaks.
- Base `60` and `3150` confirm `Longsword` is `장검`, matching `28460`.
  The previously approved Litany form `연도문` is retained at `28370`.
- No per-key speaker or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

After this range, 38,111 of 65,135 unique IDs are recorded (58.51%),
leaving 27,024. Sequential coverage reaches `28499`; next: `28500`-`28749`.
