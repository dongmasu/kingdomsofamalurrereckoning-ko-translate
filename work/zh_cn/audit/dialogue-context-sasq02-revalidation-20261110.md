# SASQ02 / Telemachus Rasp Context Revalidation

- Date: 2026-11-10.
- Scope: all 31 `default` keys in `1800355.quest_bxml` (`SASQ02`).
- No translation CSV or extracted asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID SASQ02`, the asset-level symbol
`NPC_POE_GNO_TelemachusRasp`, and ten serialized `dialog_line_*` handlers.
The quest concerns field research at Gloamthicket and a Banshaen Priestess
attacking Scholia Arcana initiates. Its keys include dialogue, player choices,
objectives, a quest title, journal text, and UI labels. The NPC symbol and
handler count do not map individual localization keys to speakers,
callbacks, branches, or playback order.

## Correction Candidates

These are read-only reviewer findings and proposed text, not permission to
edit the active translation CSV. Ledger statuses correspond to the listed
review dimensions.

| ID | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `16052` | meaning | English `Scholia Arcana initiates`, Japanese `アルカナ大学の入門者`, and Chinese `奥术学院启蒙者` all refer to initiates. Korean `수련생` is inconsistent with `입문자` at `11719`, `23855`, `58995`, and `56001`. Prefer `스콜리아 아르카나(Scholia Arcana)의 교관 텔레마코스 라스프(Telemachus Rasp)가 아카사(Acatha)의 글룸시킷(Gloamthicket)으로 가서, 던전을 방문하는 스콜리아 아르카나(Scholia Arcana) 입문자들을 공격한 밴션 여사제(Banshaen Priestess)를 처치해 달라고 했다.` | High |
| `23855` | meaning, naturalness | `hollow` is a Fae location type, not a physical depression. The same quest identifies Gloamthicket as a Fae hollow at `42351`; Japanese calls it a cave, and Chinese omits a literal depression. Current `글룸시킷의 움푹 팬 숲속` misreads the place. Prefer `글룸시킷(Gloamthicket) 동굴에 들어왔다. 텔레마코스 라스프(Telemachus Rasp)가 말한 밴션 여사제(Banshaen Priestess)를 찾아, 근처의 스콜리아 아르카나(Scholia Arcana) 입문자들을 더 공격하기 전에 처치해야 한다.` | High |
| `30922` | speech_level | English invitation and Japanese `仲間に加わってくれ` / `準備をしていたところだ` use plain speech, while Korean switches to polite endings (`오세요`, `하시죠`, `있었어요`). Keep the Korean register plain: `어서 와. 우리와 함께하자. 그냥 현장 조사를 준비하던 참이야.` The exact speaker is not established by the asset association. | Medium-high |
| `40863` | format | The place is the Rathir Chapter House. The same group uses `라시르(Rathir) 지부 회관` at `14284`; current `라시르(Rathir) 지부회관` is inconsistently spaced. Prefer `라시르(Rathir) 지부 회관의 텔레마코스(Telemachus)에게 돌아가 알려야겠다.` | High |
| `45731` | naturalness | English `flooded plains` and Japanese `氾濫原` describe Acatha's floodplain. Current `아카사 침수 평원` is a stiff compound. Prefer `아카사(Acatha)의 침수된 평원에 있어. 예전엔 머건(Murghan)만 나타났는데, 지금은 더 위험한 것들이 돌아다녀.` | Medium-high |
| `61008` | naturalness | This is the objective `Kill the Banshaen Priestess`. The Korean noun label `밴션 여사제(Banshaen Priestess) 처치` is understandable, but the project's usual objective style is an action form. Prefer `밴션 여사제(Banshaen Priestess) 처치하기`. | Medium |

## Coverage

All 31 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, and formatting. Six
correction candidates were recorded; no unresolved source conflict or exact
English-duplicate group was found. The quest title, location label, objective,
journal, and status rows are marked `not_assigned` in the ledger; the
remaining keys retain unknown speaker attribution. No embedded line breaks,
runtime tokens, or markup were found.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No Korean CSV edit was applied.
