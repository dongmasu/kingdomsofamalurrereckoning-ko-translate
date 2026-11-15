# Asset Revalidation: `523508.quest_bxml` (`SQ12` handler prefix)

- Date: 2026-11-11.
- Scope: all 80 unique `default` IDs linked to this asset; all 80 were new to
  the review ledger.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Twenty correction-candidate IDs and one evidence-limited hold are
  recorded. No translation CSV or extracted game asset was changed.

## Context Evidence and Limits

The asset has 40 `dialog_line_*` handlers whose serialized names include the
`SQ12` prefix, but it has no explicit `QUEST_ID` or `NPC_...` symbol. The
matched text supports a `Recipe for Trouble` / Nanne Hanri / Karth topic
grouping involving an alchemical formula, the Red Legion, Gorhart, and Agnur
Farhal. The handler prefix and subject matter do not map localization IDs to
individual speakers, dialogue turns, branches, or playback order. Speaker
attribution remains unassigned and dialogue order unknown.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `2915`, `3253`, `5172`, `11805`, `20779`, `24937`, `28107`, `29990`, `30149`, `31721`, `33659`, `45875`, `51043`, `58408`, `59200`, `60980` | Terminology / consistency | These references concern Nanne's same alchemical formula. Japanese repeatedly uses `調合法`, Chinese uses `配方`, while Korean varies among `제조법`, `조합법`, `조제법`, and, at `28107`, `연금술 공식`. Consider using `조제법` for the formula throughout this quest context; `30149`, `31721`, and `58408` already use it. In particular, `연금술 공식` at `28107` reads as a mathematical formula and does not fit the alchemical context. This is a scoped consistency proposal, not a corpus-wide glossary decision. | High for `28107`; medium-high for harmonization |
| `30806` | Meaning / terminology | The quest title `Recipe for Trouble` is rendered `문제를 부르는 조리법`. In this alchemy quest, Japanese `問題のレシピ` and Chinese `问题配方` support the formula/recipe sense rather than cooking. Consider `문제를 부르는 조제법` or another title that keeps the wordplay without implying ordinary cooking. | Medium-high |
| `9798` | Objective format | `Return to Nanne Hanri` is translated as the imperative `난네 한리(Nanne Hanri)에게 돌아가라`, while other objective labels in this asset use noun forms, such as `난네(Nanne)의 제자 찾기` at `31652` and `제조법이 실린 수송품 파괴` at `45875`. The project generally phrases quest objectives with `-기`; consider `난네 한리(Nanne Hanri)에게 돌아가기`. | High |
| `10618` | Speech level / register | Japanese uses plain conversational questions (`吐き気やかゆみはある？`) and a plain ending, while Korean switches to polite `-요` forms throughout. Consider keeping this line in conversational plain style, for example: `거기, 메스꺼워? 가려워? 눈구멍에서 피가 새어 나온 적은 있어? 여기저기서 그런 증상이 보여.` This is a line-level comparison only; the asset does not establish its individual speaker. | Medium-high |
| `33594` | Korean naturalness | `고어하트 동쪽의 에라시 유적인 아그누르 파르할의 고대 방들` is an awkward modifier chain. English `ancient chambers` and Japanese `古い部屋` support a more natural phrase such as `고어하트(Gorhart) 동쪽에 있는 에라시(Erathi) 유적 아그누르 파르할(Agnur Farhal)의 오래된 방들`. | Medium |

## Evidence-Limited Hold

| ID | Question | Evidence and disposition |
| ---: | --- | --- |
| `53922` | What does capitalized `Order` denote in `beings of Order`? | English capitalization may indicate a named group or principle. Japanese `教団` suggests a religious order, while Chinese `战盟` suggests a faction or alliance; Korean `질서(Order)` chooses an abstract reading. The available language evidence conflicts, and the asset does not resolve the referent. Retain the current translation pending stronger lore or in-game context. |

## Repeated Text and Structure

Two exact-English duplicate groups were found: `1093` / `14348` (`Goodbye.`)
and `3529` / `12656` (`Farewell.`). Korean translations match within both
groups. Four-language line-break, runtime-token, and markup signatures match
for all 80 IDs.

The formula references were checked as one quest-context term group rather
than unified mechanically by English wording. ID `4244` is kept out of the
harmonization proposal because Japanese uses `調合薬` there, which may refer
to the concoction rather than its method; English and Chinese alone do not
resolve that distinction. `53922` remains a separate evidence-limited hold.

## Complete ID Set

`506`, `1093`, `2915`, `2952`, `3011`, `3253`, `3529`, `4244`, `4826`,
`4834`, `5172`, `8691`, `8693`, `9798`, `10618`, `10669`, `10793`, `11805`,
`12656`, `12833`, `13096`, `13428`, `14348`, `14852`, `15049`, `15184`,
`15395`, `16162`, `18203`, `20779`, `21480`, `22156`, `24937`, `25786`,
`25891`, `26850`, `27314`, `28107`, `28902`, `29990`, `30149`, `30806`,
`31652`, `31721`, `33594`, `33659`, `34876`, `35498`, `39952`, `40177`,
`42814`, `43135`, `43307`, `44914`, `45073`, `45392`, `45422`, `45509`,
`45875`, `48646`, `50708`, `51043`, `51734`, `52489`, `52656`, `53639`,
`53922`, `54839`, `57082`, `58408`, `59178`, `59200`, `59451`, `60695`,
`60980`, `61048`, `62195`, `62665`, `63615`, and `63992`.

The complete four-language source fingerprints and per-ID dispositions are
recorded in [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
These review findings are not approval to edit the translation.
