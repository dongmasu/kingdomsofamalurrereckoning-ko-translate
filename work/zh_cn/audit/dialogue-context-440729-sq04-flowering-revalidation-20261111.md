# Asset Revalidation: `440729.quest_bxml` (`SQ04` Handler-Prefix Candidate, The Flowering)

- Date: 2026-11-11.
- Scope: all 86 `default` IDs linked to this asset; all 86 are newly recorded.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Thirteen correction-candidate IDs and 12 evidence-limited holds are
  recorded; six IDs appear in both sets. No translation CSV or extracted
  game asset was changed.

## Context Evidence and Limits

This BXML has no explicit `QUEST_ID` or NPC symbol. Its 35 serialized
`conditional_quest_sq04_...` dialogue handlers provide only an `SQ04`
handler-prefix clue. The text concerns the Fae rite "The Flowering" and
Chrysalae seeds, which supports a topic grouping but does not prove the
official quest assignment. No localization key is mapped to an individual
handler, speaker, branch, addressee, or playback order. Speaker attribution
remains unassigned and dialogue order unknown.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `15342`, `25277`, `25777`, `34731`, `44672`, `48053` | Name / format | These rows refer to `Chrysalae` without an English pairing. Add the English name after a Korean form is selected. The form itself remains on hold below; do not use frequency alone to choose among the current spellings. | High for missing pairing; unresolved spelling |
| `47742` | Meaning / terminology | `Brunuath Hollow` is rendered `브루누아스(Brunuath) 골짜기`, while Japanese and Chinese both identify a cave (`洞穴`), and ID `19840` uses `브루누아스 동굴`. Align the place type and name; consider `브루누아스 동굴(Brunuath Hollow)`. | High |
| `7943` | Meaning / naturalness | `you could only do what Fate permits` is rendered in past tense as `운명이 허락한 것만 할 수 있었지`. Japanese expresses a general present limit. Consider `넌 운명이 허락하는 일만 할 수 있어` and retain the rest of the sentence's meaning and tone. | Medium-high |
| `24206` | Meaning | In context, `Why do you remain?` means “why are you still alive?” Japanese explicitly uses `生き残っている`; Korean `왜 아직도 남아 있는 거지?` can instead mean “why are you still here?” Consider `왜 아직 살아 있는 거지?` | High |
| `27492` | Meaning / terminology | `new-spawned sprites` is rendered `새 요정들`, losing the creature type used in the English and Japanese sources. Consider `새로운 스프라이트들이 태어나는 의식`. | High |
| `62319` | Naturalness | `I mourn it` refers to being distressed that the speaker cannot perform the rite alone; `애도하고 있어` is unnatural for this non-person referent. Japanese and Chinese express sorrow. Consider a natural form such as `그래, 슬퍼. 혼자서는 의식을 치를 수 없어서 슬픈 거야.` | Medium-high |
| `44423` | Meaning / naturalness | `marvelous` is rendered `훌륭하군`, which describes excellence more than astonishment. Japanese `奇跡的` and Chinese `妙` support wonder. Consider `아, 놀라워, 놀라워, 정말 놀라워!` | Medium-high |
| `19303` | Speech level / naturalness | One utterance moves from `준비하겠다` to `놓아라` / `보이느냐` and then `좋아`, producing a markedly archaic, shifting voice. Japanese gives a conversational instruction. Consider a consistent conversational rendering across the whole line. | Medium |

## Evidence-Limited Holds

| ID(s) | Dimension | Evidence and disposition |
| --- | --- | --- |
| `2352`, `4769`, `11245`, `15342`, `25277`, `25777`, `27677`, `34731`, `44672`, `48053` | Terminology | The same `Chrysalae` term appears as `크리살라이`, `크리살레`, and `크리살라`. Japanese consistently has `クリサリー`; English identifies the named seed/creature, while Chinese varies in how specifically it renders the term. Earlier reviews at IDs `2352`, `25777`, `34731`, and `44672` also left the canonical Korean term unresolved. Unify only after a glossary decision; the six missing English pairings above remain formatting candidates. |
| `21103`, `31386` | Meaning | `mortal maid` is ambiguous in English. Japanese uses `定命の者の娘` for both; Chinese uses `女仆` at `21103` but `少女` at `31386`. Korean `하녀` / `시녀` selects a servant meaning, but the available evidence does not settle whether that is intended or whether it means a mortal young woman. Retain as a hold rather than replacing it with `아가씨` without confirmation. ID `31386` was also unresolved in the prior naturalness adjudication. |

## Prior Decision Retained

ID `5139` distinguishes `The Flowering` from the bare `Flowering` in the
English source. The existing terminology decision intentionally preserves
that distinction as `개화 의식(The Flowering)` and `개화 의식(Flowering)`;
this revalidation found no new issue there.

## Repeated Text and Structure

Two exact-English duplicate groups cover four rows: `Quest Complete` (`6200`,
`19295`) and the sentence about the dead flowers and the player's remaining
role (`29244`, `56459`). Korean is identical within both groups. All 86 IDs
have matching four-language line-break, runtime-token, and markup signatures.

## Complete Asset ID Set

`410`, `2188`, `2352`, `3954`, `4769`, `5139`, `6200`, `6567`, `6675`,
`7943`, `9287`, `11245`, `11396`, `13978`, `14563`, `14947`, `15342`,
`16081`, `17184`, `17629`, `18466`, `19295`, `19303`, `19840`, `21090`,
`21103`, `21422`, `21455`, `21525`, `22007`, `22475`, `23848`, `23916`,
`24206`, `25277`, `25777`, `27492`, `27677`, `27921`, `28187`, `29244`,
`30327`, `30703`, `31134`, `31386`, `32645`, `33728`, `33817`, `34731`,
`36547`, `37449`, `38830`, `39272`, `40008`, `40860`, `41653`, `42056`,
`44423`, `44672`, `45029`, `45042`, `45559`, `46534`, `47326`, `47742`,
`48053`, `48307`, `50304`, `50972`, `51532`, `52104`, `53777`, `56044`,
`56113`, `56221`, `56459`, `56790`, `57813`, `59107`, `59859`, `60206`,
`61819`, `62069`, `62319`, `62899`, and `63028`.

All 86 four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
Findings are proposals, not approval to edit the translation.
