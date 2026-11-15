# `SQ19` / Sihtric Vorm and Rundamir Asset Revalidation

- Date: 2026-11-11.
- Scope: all 47 `default` IDs linked to `522390.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Nine correction candidates are recorded. No translation CSV or extracted
  game asset was changed.

## Grouping Evidence and Limits

The asset contains 47 localization keys, four quest-target handlers, and 13
serialized `dialog_line_*` handlers whose generated names carry the `SQ19`
prefix. It has no explicit `QUEST_ID` value or detected `NPC_` symbol. The
quest-target text includes “Meet Sihtric in Rundamir” and “Kill the Crudok,”
and the localized content concerns Sihtric Vorm, Rundamir, Brownies, and a
Crudok. This supports an `SQ19` / Sihtric-Vorm / Rundamir-Crudok quest-topic
group, but does not map any localization key to a particular speaker,
callback, branch, addressee, or playback position. Individual speaker
attribution and dialogue order remain unknown.

All 47 rows were compared across English, Japanese, Chinese, and active
Korean. There are no exact-English duplicate groups within this asset. No
reviewed row has a line-break, runtime-placeholder, or markup difference
between the four locales.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `19365` | Meaning / terminology | English `Fae Hollow`, Japanese `フェイ洞穴`, and Chinese `灵族洞穴` identify a cave/hollow. Korean `페이(Fae)의 은신처` instead means a Fae's hideout and omits the landform. Consider `시드(Sidhe) 남쪽 끝에 있는 페이 동굴(Fae Hollow)이야.` The Sidhe's exact nature remains unresolved; this proposal does not decide whether it is a people, region, or realm. | High |
| `27179` | Naturalness | `브라우니들이 데티어로 가는 길을 지나는 사람들` is an awkward chain of two `-을` phrases. Preserve the destination and ambush meaning with a form such as `그곳에 가서 브라우니(Brownies)들이 데티어(Detyre)로 향하는 길목에서 사람들을 습격하는 이유를 알아봐야 해.` | Medium-high |
| `40447` | Meaning / naturalness | `I've heard of something that could make them act that aggressively` says the speaker has heard of something capable of making the Brownies aggressive. Korean `원인이 뭔지 들은 적은 있어` shifts this to having heard what the cause is. Consider `저들을 저렇게 사납게 만들 만한 게 있다는 얘기는 들은 적 있어. 하지만 여기에 있을 리가 없는데...` | Medium-high |
| `43768` | Speech level | Korean `기다리고 있겠소` uses marked `-소`, while Japanese is plain conversational (`気が変わればここに来てくれ`) and Chinese is casual. Consider a row-level conversational rendering such as `마음이 바뀌면 여기서 기다릴게.` This is not an attribution of the line to Sihtric or another character. | Medium |
| `47281` | Naturalness | `You mentioned Rundamir?` is translated `룬다미르를 말하는 거야?`, which is understandable but stilted in this short conversational question. Consider `룬다미르라고 했어?`, consistent with the Japanese `ルンダミアと言っていたが？`. | Medium |
| `52702`, `60652` | Meaning / consistency | Both Japanese lines say `見つけて殺さねばならん` (“must find it and kill it”), and both concern the Crudok. Korean splits between `찾아 파괴해야 해` and `찾아서 죽여야 해`. Consider aligning both to `그걸 찾아 처치해야 해` / `찾아서 처치해야 해`, preserving each sentence's existing subject/context while using the established creature-combat sense. | High |
| `61429` | Format / terminology | `페이(Fae) 동굴(Fae Hollow)` repeats the Fae name and parenthetically labels only part of the English term. Consider `페이 동굴(Fae Hollow)`; keep the separate `시드(Sidhe)` and `룬다미르(Rundamir)` pairings. | High |
| `64916` | Meaning | `bottom of this hollow` is translated `이 골짜기 바닥`, but Japanese `この洞穴の底` and Chinese `洞穴底部` identify a cave, not a valley. Consider `이 동굴 바닥`. | High |

## Retained Text

The other 38 rows were retained after the four-language comparison. This
includes the quest objectives and status labels, the Crudok and Brownie
references whose number agrees with their English source, and short
conversational responses. Register was assessed row by row; no shared voice
was inferred from the asset-level handler prefix. No unsupported speaker
gender or dialogue order was added.

## Complete Reviewed ID Set

The exact 47-ID membership is represented by the asset links in
[`default-quest-asset-index.tsv`](default-quest-asset-index.tsv) and the
corresponding fingerprinted rows in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
