# `DLC2_MQ06` / Secandra Revalidation

- Date: 2026-11-11.
- Scope: all 196 `default` IDs linked to `1962959.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Fifteen correction candidates and four evidence-limited holds are recorded.
  The active Korean translation CSV was not changed.

## Grouping Evidence and Limits

The asset has explicit quest ID `DLC2_MQ06`, the asset-level NPC symbol
`DLC2_NPC_TON_KOL_Secandra`, 68 serialized `dialog_line_*` handlers, and 196
distinct localization keys. The asset covers the aftermath of the Hyperian
and Air/Earth Shrine events, Anokatos, Arkes, Secandra, and the Kollossae.
These clues support a quest-level review group but do not map individual keys
to Secandra, another speaker, a callback, branch, addressee, or playback
order. Per-key speaker attribution remains unassigned and playback order
unknown. The keys include dialogue, quest text, labels, and punctuation-only
entries; asset association does not prove that every row is spoken dialogue.

All 196 rows were compared across English, Japanese, Chinese, and active
Korean. There are ten exact-English duplicate groups covering 30 rows. Korean
is identical within every group, and Japanese and Chinese are also identical
within those same groups; no forced alignment was needed. No reviewed row has
an embedded line break, runtime placeholder, or markup token.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `10020` | Naturalness / format | The list of people addressed is split into several vocatives (`그대들이여`, `...모두여`), making the sentence difficult to parse. Recast the address list and the statement that they freed the people as one coherent elevated utterance; retain the solemn divine voice and the final call to Secandra. | Medium |
| `10566` | Format / naturalness | `때... 가... 왔... 다....` inserts spaces inside Korean words and syllable blocks. Preserve the source's halting delivery with pauses between meaningful units, not within a word; normalize the trailing ellipsis without removing the stutter. | High |
| `22733` | Meaning | `신성한 힘이 깃든 물질` adds both an embedded power and a definite material reading to `some divine element`. Reconsider a less specific rendering such as `신성한 요소` or an equally supported expression. | Medium |
| `22865` | Meaning / naturalness | `this place is thin, and cold` is rendered `이곳은 경계가 얇고 차가워`. Japanese explicitly describes thin air, while Chinese describes a narrow place; in this Air Shrine context, `공기가 희박하고 차가워` is the better-supported natural reading. | Medium-high |
| `26008` | Meaning / naturalness | `I was Beckoned to this nature ... as you were to yours` is rendered causally as `내 본성 때문에 ... 너도 네 본성 때문에`. The source does not clearly say that either person's nature caused the calling. Recast without adding that causal relation; retain the parallel between the speaker's and player's respective natures or roles. | Medium |
| `27113` | Naturalness / meaning | `아노카토스가 도시에 대한 파괴를 끝냈을지도 모른다` is awkward and obscures `may have succeeded in destroying the city`. Prefer a direct construction such as `아노카토스가 이미 도시를 파괴했을지도 모른다고 걱정한다`. | High |
| `27616` | Naturalness / meaning | `Ethene granted me some understanding of her work` becomes `자신의 작업에 대해 조금 알려 주었어`, an unnatural calque in this divine-plan context. Japanese supports `意図`; consider `에테네가 자신의 뜻을 조금 알려 주었어` or equivalent. | Medium-high |
| `34244` | Naturalness / syntax | `대기의 성소에 일어날 일이 그거였던 것 같아` is hard to parse and repeats `일`. Recast the fragment as the event that was meant to happen to the Air Shrine, then preserve the following thought that Arkes's words are beginning to make sense. | High |
| `36232` | Naturalness / number | `These were called the Shrines of Earth and Air` is rendered `이곳은 ... 성소들` with a singular demonstrative and plural noun. Name the two places clearly, e.g. `대지의 성소와 대기의 성소라고 불렸어`. | Medium |
| `38023` | Naturalness | `여신 에테네의 접촉을 받았으며` is an unnatural calque for being contacted by a goddess. Recast naturally (for example, that Ethene contacted or communicated with him) without changing the source's claim; Japanese says he made a pact, but English and Chinese support contact, so do not import the Japanese-only pact detail. | Medium-high |
| `40149` | Meaning | `If we are crushed before we can escape` is rendered `탈출하기도 전에 우리가 무너지면`, which says that the group collapses rather than is crushed. Use wording that preserves the danger of being crushed by the collapsing structure, without adding an unsupported outcome. | High |
| `41994` | Meaning / naturalness | The question refers to the two divinely touched sites, but `그들이 신의 손길을 받은 건가?` reads as though `they` were people. Prefer `신들의 손길이 닿은 곳이라고?` or equivalent. | High |
| `4315` | Naturalness / speech level | The line shifts from conversational `아니야` and `마찬가지지` to stiff `이제야 알겠군`. Japanese remains conversational. Use one natural register throughout, for example ending with `이제야 알겠어`. | Medium-high |
| `5439` | Naturalness / speech level | `마침내 끝났군` shifts abruptly to `운명이 바뀌었어` in the same utterance. Keep the two clauses in one conversational register and preserve the idea that Anokatos's fate has changed. | Medium |
| `63517` | Naturalness / terminology | `the city on high` is translated literally as `높은 곳의 도시`, while Japanese uses `空の街` and Chinese describes the city above. Prefer a natural phrase such as `하늘 위의 도시`. | High |

## Evidence-Limited Holds

| ID(s) | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `22779` | Speech level / honorifics | The line uses `-소/-오/-시오`, while Japanese is comparatively plain. The asset does not establish who speaks this key or the scene's register; retain pending stronger speaker or scene evidence rather than imposing a voice from the asset-level NPC symbol. |
| `31571` | Meaning | `consecrate themselves` is rendered `스스로를 봉헌`, but Japanese suggests purification and Chinese suggests receiving a blessing. The intended theological sense is not settled by these sources; do not choose a replacement by guess. |
| `37858` | Meaning / naturalness | In `My head... can you feel it?`, the referent of `it` is unclear. Korean `내 머리가... 느껴지나?` sounds unnatural, but the available row alone does not establish whether the speaker means a sensation in their head or the surrounding magic. Hold for line-level context. |
| `4555` | Speech level | `고맙네` sits between otherwise plain conversational clauses. It may be a register inconsistency, but the key has no per-speaker or scene-stage mapping; retain pending context rather than asserting a character-voice error. |

## Complete Reviewed ID Set

`114`, `169`, `260`, `2986`, `3222`, `3965`, `4315`, `4555`, `4600`,
`5076`, `5439`, `5663`, `6722`, `6955`, `7092`, `7192`, `7256`, `7499`,
`7802`, `8012`, `8185`, `8204`, `8329`, `8343`, `8689`, `9108`, `9253`,
`9300`, `9596`, `10020`, `10087`, `10151`, `10185`, `10296`, `10566`,
`11089`, `11612`, `11641`, `12165`, `12275`, `12304`, `13272`, `14090`,
`14927`, `16937`, `17040`, `17292`, `18318`, `19082`, `19115`, `19230`,
`19266`, `19641`, `20231`, `20447`, `20454`, `20542`, `20941`, `21741`,
`21945`, `22198`, `22450`, `22714`, `22733`, `22779`, `22820`, `22865`,
`23154`, `23183`, `23416`, `23874`, `23962`, `24008`, `24535`, `25239`,
`25703`, `25711`, `26008`, `26067`, `26142`, `26601`, `26759`, `26969`,
`27113`, `27616`, `28113`, `28119`, `28660`, `28803`, `29256`, `29323`,
`29798`, `30966`, `31010`, `31465`, `31491`, `31571`, `31900`, `32499`,
`32523`, `32982`, `33117`, `33743`, `34148`, `34244`, `34579`, `34979`,
`35313`, `35717`, `36232`, `36582`, `37039`, `37410`, `37789`, `37858`,
`38023`, `38205`, `38551`, `38755`, `39288`, `39609`, `39938`, `40149`,
`40244`, `40644`, `40738`, `40877`, `41197`, `41566`, `41703`, `41776`,
`41861`, `41994`, `42080`, `42128`, `42486`, `43014`, `43173`, `43500`,
`44261`, `45142`, `46927`, `48502`, `48540`, `48679`, `49004`, `49774`,
`49997`, `50516`, `50648`, `51240`, `51410`, `51709`, `51970`, `52069`,
`52272`, `52631`, `53001`, `53205`, `53292`, `53401`, `53733`, `54842`,
`55033`, `55342`, `55505`, `55706`, `56173`, `56176`, `56607`, `56903`,
`56939`, `57216`, `57288`, `57440`, `58354`, `58492`, `59266`, `59519`,
`60390`, `60929`, `61163`, `61752`, `62066`, `62094`, `62863`, `62964`,
`63218`, `63473`, `63517`, `63751`, `63794`, `63828`, `63829`, `64156`,
`65009`.

All 196 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
