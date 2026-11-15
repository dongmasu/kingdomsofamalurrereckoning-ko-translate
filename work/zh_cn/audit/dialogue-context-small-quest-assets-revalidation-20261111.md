# Small Quest-Asset Revalidation

- Date: 2026-11-11.
- Scope: 28 exact key-to-asset associations across four quest assets; 27
  previously unrecorded unique `default` IDs. Shared ID `60633` was already
  recorded once and linked to all 44 assets, including `2700379.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Four correction candidates and one evidence-limited hold were recorded.
  No translation CSV was changed.

## Grouping Evidence and Limits

`1340321.quest_bxml` has six serialized `conditional_quest_ffq56_*` handlers,
but no explicit `QUEST_ID`, `NPC_` symbol, or `dialog_line_*` handler. Its
seven linked keys include the `Unlock the statues` objective and Amman
statue/key material. This supports an FFQ56 quest-text grouping, not a
per-key speaker or playback order.

`1695620.quest_bxml` has two `conditional_quest_hmsq01_*` handlers and seven
linked keys concerning the Rhyderk weapon and its ballad. It has no explicit
`QUEST_ID`, `NPC_` symbol, or `dialog_line_*` handler. The handler prefix is
an asset-level quest clue only.

`1789094.quest_bxml` has five `conditional_quest_ffq45_*` handlers and seven
linked keys, including Daedinnear's container task. It has no explicit
`QUEST_ID`, `NPC_` symbol, or `dialog_line_*` handler. The asset text does not
establish which character speaks any line.

`2700379.quest_bxml` declares `QUEST_ID ao_sq_as_001` and contains six
quest-condition handlers, but no `NPC_` symbol or `dialog_line_*` handler.
Its seven linked IDs include shared `Quest Complete` ID `60633`; that ID's
existing ledger row already lists this asset among its 44 links. It was not
duplicated. No per-key speaker or playback order was inferred.

All 27 newly recorded rows were compared in English, Japanese, Chinese, and
active Korean. The repeated `Quest Complete` labels at `3694`, `10760`,
`62992`, and the already-recorded `60633` match across the four languages.
No embedded line breaks, runtime placeholders, or markup were found in the
reviewed rows.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `853` | Naturalness | `풀 상자가 다 떨어지면` can read as a noun phrase or an unfinished modifier. Clarify the subject as the supply of containers, for example `마법을 풀 보관함이 다 떨어지면 그에게 말해 더 받을 수 있다.` | High |
| `2606` | Naturalness | The title `A Delicate Secret` is rendered `은밀한 비밀`, which is understandable but redundant and shifts `delicate` toward secrecy. Reconsider `미묘한 비밀`, supported more directly by Japanese `微妙な秘密` and Chinese `微妙的秘密`. | Medium |
| `21541` | Meaning / naturalness | `위대한 페이(Fae)의 사기꾼` can mean a con artist belonging to the Fae. English `great Fae trickster`, Japanese `フェイの奇術師`, and Chinese `伟大的灵族骗术大师` describe a Fae trickster. Prefer a construction such as `위대한 페이(Fae) 장난꾸러기가 남긴 보물`. | High |
| `30153` | Name / format | This is another reference to Daedinnear, rendered `다에디니어` without an English pairing; the active name rows use `대디니어(Daedinnear)`. Align the name and pairing while retaining the sentence's meaning. | High |

## Evidence-Limited Hold

| ID | Question | Reason |
| ---: | --- | --- |
| `7348` | `섬세한 유물` | English `delicate artifacts`, Japanese `微妙な品`, and Chinese `精巧的神器` allow different readings (sensitive/valuable versus finely made). The asset does not add enough context to choose a more specific Korean adjective safely. |

The other newly reviewed rows were retained. In particular, the Rhyderk name,
blade, and ballad forms match the existing scoped terminology decisions;
`Amman` forms match the prior name/label review; and `민감한 증거` at
`48615` is a contextually sound rendering distinct from the ambiguous
`delicate artifacts` wording at `7348`.

## Complete ID Set

- `1340321.quest_bxml`: `3694`, `12821`, `21541`, `24272`, `26516`, `48168`,
  `59531`
- `1695620.quest_bxml`: `10760`, `17832`, `23506`, `32578`, `39661`, `59526`,
  `61757`
- `1789094.quest_bxml`: `853`, `13915`, `27555`, `30153`, `42418`, `62992`,
  `64300`
- `2700379.quest_bxml`: `2606`, `4416`, `7348`, `15579`, `34827`, `48615`;
  shared `60633` is already recorded.

All 27 new IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
