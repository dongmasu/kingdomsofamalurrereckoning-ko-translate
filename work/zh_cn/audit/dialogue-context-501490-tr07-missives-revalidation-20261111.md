# Asset Revalidation: `501490.quest_bxml` (`TR07` Handler-Prefix Candidate)

- Date: 2026-11-11.
- Scope: all 97 linked `default` IDs, newly recorded.
- English controls meaning; Japanese supplies the primary voice/register
  reference; Chinese supplies secondary meaning evidence.
- Thirteen correction-candidate IDs and six IDs with evidence-limited
  holds; `50398` has both a terminology candidate and an address hold.
- Translation CSVs and extracted assets were not changed. Findings are
  proposals, not approval to apply edits.

## Context Evidence and Limits

There is no explicit `QUEST_ID` or matching NPC symbol. The asset contains
38 distinct serialized `dialog_line_*` handlers with the prefix `TR07`.
Linked text concerns the Livrarium vaults, Missives of Sable, Grim,
Phasmer, and the Shroud of Omission. These establish a candidate topic
group, not per-key speakers, branches, addressees, or playback order.
Speakers remain unassigned and order remains unknown. A named speaker
mentioned in third person is not automatically the speaker of another row.

## Correction Candidates

| ID(s) | Dimension | Source evidence, finding, and proposed direction | Confidence |
| --- | --- | --- | --- |
| `31521`, `50398`, `55678`, `63864` | Meaning / terminology | English short `Missives` refers to the book named `Missives of Sable` throughout the same quest; Japanese consistently uses `黒紋章の書` or `書`. Korean breaks the referent into `밀서들`, `미시브스`, `미시브스(Missives)`, and `서한들`, although labels `43247`/`45620` are `세이블의 서신(Missives of Sable)`. Reuse `세이블의 서신(Missives of Sable)` or an unambiguous short `서신`, not a new item name. In `55678`, `그 안` should clearly mean the vault reached through the grate, not entering the book. Preserve all remaining journal detail. | High |
| `11846` | Meaning / terminology | English `the shroud` and Japanese `この幕` refer to the same item named at `59307`/`61596` as `망각의 장막(Shroud of Omission)`. Korean `수의` introduces a funeral-specific reading absent from that referent. Reuse `장막`, following the near-duplicate `52508`: `장막 밑에 물건을 놓으면 온 세상이 그 존재를 잊어버려.` The rest can follow that row's existing conversational wording. | High |
| `18433` | Naturalness | Japanese ends `よかった`; Korean `되찾았나? ... 쓸모 있었군. 기쁘다.` ends in a stiff standalone declaration. Retain the current informal level and consider `그림(Grim)의 책을 되찾았나? 그럼 망각의 장막(Shroud of Omission)이 도움이 됐군. 다행이야.` This is a row-level naturalness proposal, not an inferred speaker-wide rule. | Medium-high |
| `21986` | Naturalness | Korean `작고 조그마해 보여도` duplicates the same size description. English contrasts small gnomes with their vicious response; Chinese supports the size contrast, while Japanese uses a different insult. Consider `조심해. 노움들은 덩치는 작아도, 네 정체를 알아채면 사납게 덤빌 거야.` | High |
| `23851` | Meaning | English `the one the Hierophant can't see` is clarified by Japanese `祈祷師が唯一予測できない存在`, not simply unnoticed physical presence. Korean `알아차리지 못하는 사람` can obscure that distinction. Consider `대사제(Hierophant)가 앞날을 내다볼 수 없는 존재가 바로 너니까.` Preserve the surrounding preparation/importance explanation and do not invent a named ability. | Medium-high |
| `23959` | Naturalness | English `but who cares?` and Japanese `それはどうでもいいだろう？` dismiss the contents' importance. Korean `하지만 누가 신경 써?` is an English-shaped rhetorical question. Consider `하지만 그게 무슨 상관이야?` Keep the explanation that they want the book. | High |
| `38095` | Naturalness / meaning | English contrasts `anarchy` with `existence`; Japanese frames the latter as `生き方の問題`. Korean `난 존재라고 불러` is opaque. Consider `그림(Grim)에게서 자유를 갈망하는 모습이 보여. 어떤 이는 그걸 무정부 상태라고 부르겠지만, 난 그게 살아가는 거라고 생각해.` Preserve the contrast rather than replacing it with a new moral judgment. | Medium-high |
| `44758` | Meaning / terminology | The human's odd vocabulary includes `Gorbellies`; Japanese renders it `布袋腹` and Chinese `大肚子`. Korean transliteration `고어밸리` can look like a proper name and loses the joke about unfamiliar human insults. Consider `'배불뚝이들'이라니? 그게 대체 뭐야?` within the existing sentence about his strange expressions. This is source-supported insult wording, not a new character/place name. | High |
| `47863` | Naturalness | English `a one-way trip` and Japanese `後戻りは効かない` warn that the entry route cannot be reused. Korean `편도 여행이야` sounds like travel booking. Consider `자, 준비됐어? 한번 들어가면 되돌아 나올 수 없어. 나갈 길은 직접 찾아야 해.` Keep the escape-route warning; do not imply there is no possible exit. | High |
| `63049` | Address | English uses familiar `dove`, while Korean uses elevated `그대`. The earlier TR01 report explicitly establishes neutral `친구` for this vocative and flags the same elevated rendering at `59282`. Consider `움직여야 해, 친구.` Preserve the rest of the sentence. This reuses a documented vocative decision, not a speaker identity inferred from the asset. | High |

## Evidence-Limited Holds

| ID(s) | Dimension | Reason and disposition |
| --- | --- | --- |
| `22356` | Meaning | English's unusual `squill-headed` insult becomes `오징어 대가리`; Japanese and Chinese omit an equivalent image. These sources do not establish the Korean squid image. Hold rather than silently replacing it with a guessed metaphor; the anxiety/staring meaning is otherwise retained. |
| `33445` | Meaning / tense | English `a piece that I was to steal` and Chinese describe an intended theft, while Japanese `私が盗んだもの` describes a completed theft. Current Korean follows the intended-theft reading. Hold any tense change until the source conflict is explicitly resolved. |
| `35053`, `45536`, `50398` | Address / speech level | Korean uses `자네` or `가 보게` where many other responses use `너` or informal endings. These English rows do not contain the familiar `dove` vocative; that established terminology decision cannot resolve their ordinary second-person register. The asset does not map these keys to individual speakers or stages. Hold normalization rather than assuming the three lines belong to one speaker. |
| `48512` | Speech level | Korean `뭔가요?` is polite while Japanese is plain. Its precise addressee/stage is unmapped. Hold register conversion rather than making every player question informal solely because it shares an asset. |

## Duplicate and Structural Checks

Five exact-English duplicate groups cover 11 rows: `Phasmer Humm`
(`34607`, `36399`, `40098`), `Livrarium` (`37471`, `39536`),
`Missives of Sable` (`43247`, `45620`), the Crilgarin origin sentence
(`46010`, `48213`), and `Shroud of Omission` (`59307`, `61596`).
Korean matches within all five groups; rows are not merged.

`11846`/`52508` differ only by an English comma and Japanese spelling
variation in the same explanation. That near-duplicate comparison supports
the scoped shroud terminology candidate; it does not establish speaker
identity or a global identical-English normalization rule.

All 97 rows match across four languages in newline counts and extracted
brace-token/angle-markup sequences. This is not game-display validation.

## Complete Asset ID Set

`156`, `736`, `4084`, `4662`, `6456`, `6934`, `6996`, `7840`, `8283`,
`10140`, `10341`, `11218`, `11846`, `12926`, `15456`, `15683`, `18019`,
`18425`, `18433`, `18785`, `19173`, `19485`, `21725`, `21940`, `21986`,
`22356`, `22368`, `22832`, `22890`, `23851`, `23959`, `24371`, `25160`,
`25295`, `26242`, `28432`, `29441`, `30668`, `31521`, `33066`, `33445`,
`34607`, `35053`, `35486`, `35578`, `36399`, `36448`, `37471`, `38095`,
`38158`, `38654`, `39536`, `40098`, `42215`, `43036`, `43247`, `44733`,
`44758`, `45536`, `45620`, `45665`, `45903`, `45984`, `46010`, `46730`,
`47863`, `48213`, `48512`, `49104`, `50398`, `50551`, `51114`, `51775`,
`52508`, `53552`, `54004`, `54204`, `54657`, `54868`, `55066`, `55414`,
`55678`, `55978`, `59307`, `61006`, `61596`, `61663`, `61961`, `62211`,
`63049`, `63499`, `63587`, `63600`, `63864`, `64129`, `64433`, and
`64535`.

All four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
