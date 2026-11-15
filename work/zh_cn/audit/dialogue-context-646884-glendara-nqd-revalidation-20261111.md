# Glendara NQD Revalidation

- Date: 2026-11-11.
- Scope: all 83 `default` IDs linked to `646884.quest_bxml`.
- English was the semantic anchor; Japanese was the primary voice/register
  reference; Chinese was supporting evidence.
- Six correction candidates and two evidence-limited holds are recorded.
  No translation CSV or extracted asset was changed.
- Six exact-English duplicate groups have matching Korean translations.
  Line-break counts and detected runtime-token/markup sequences match across
  all four languages for all 83 IDs.

## Grouping Evidence and Limits

The asset contains 41 serialized `dialog_line_*` handlers with the
`Glendara_NQD` prefix, but no explicit `QUEST_ID` or `NPC_` symbol. This
supports a Glendara NQD scene/topic grouping only; it does not identify a
single quest, map localization keys to callbacks, or establish branches or
playback order.

IDs `7498` and `57373` explicitly identify Oraven through first-person
self-reference in the source text. The Japanese source corroborates that
self-reference. These two lines are assigned to Oraven; no other row is
assigned a speaker based on asset membership, handler prefix, or ID order.
The remaining per-key speaker attribution is unassigned and dialogue order
unknown.

All 83 rows were compared in English, Japanese, Chinese, and active Korean.
The six exact-English duplicate groups are `2297`/`4999` (House of Ballads),
`5730`/`7916` (Webwood), `25016`/`26902` (Oleander Sinclair),
`33586`/`35360` (Penri Kell), `37329`/`39653` (Warsworn), and
`58164`/`60580` (Yolvan). Each group already has identical Korean text.

At ID `54901`, the Chinese source says east while the English and Japanese
sources say north. The Korean correctly follows English and Japanese. No
format mismatch or unsupported duplicate divergence was found.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `10336` | Naturalness | `양잠업에 종사했어` is accurate but more formal than the surrounding conversational line. Consider `한창때는 누에를 치며 살았어` or another natural rendering that preserves the silk-farming meaning. This does not settle the wider translation of `silk farmer`. | Medium |
| `12610` | Format | The title `Two Knights and a Troll` has an English pairing, but `Keepers of the Flaming Sword` and `The Green Maiden` do not. Consider adding the source titles in parentheses to those two translated titles, preserving the existing book-title brackets. | High |
| `18704` | Naturalness | `우리 성품의 기둥` reads as a literal calque for `our pillars of character`. Recast as the virtues or qualities that form the Fae's character, while preserving the separate purpose of commemorating their people. | Medium-high |
| `19755` | Meaning / naturalness | `아가씨들을 쫓아다녔어` can suggest physically chasing them. Japanese `口説いてまわった` supports the courtship sense; consider `아가씨들을 꼬시러 다녔지` or an equally playful phrase. | High |
| `57373` | Speech level / naturalness | Oraven's self-reference is explicit, and ID `7498` is another explicit Oraven introduction in this asset. Both Japanese lines use plain conversational style, while this Korean line alone uses `-요`. Consider a plain conversational form such as `그래, 오라벤이 뭘 도와줄까?` | High |
| `62505` | Naturalness / grammar | The sentence ends with the malformed phrase `웬센과 대등한 이지`. Recast the whole ending, for example: `발라드의 집(House of Ballads)의 위대한 귀부인이며, 검술 실력도 웬센(Wencen)과 맞먹는 인물이지.` Keep the source's present-tense relationship to one beloved. | High |

## Evidence-Limited Holds

| ID | Question | Evidence and disposition |
| ---: | --- | --- |
| `495` | `before Ysa had seen one lifetime` | English and Korean support the existing “before Ysa had lived one lifetime” reading, while Japanese explicitly evokes Ysa's reincarnation. The line does not establish whether this refers to Ysa's birth, a prior life, or a named era. Retain the current wording pending stronger lore context. |
| `57550` | `only ever gave one lifetime to the telling` | English, Japanese, and Chinese phrase the relation between Dame Oleyn's lifetime and the Telling differently. The current Korean is plausible, but the asset does not resolve the intended lore meaning. Retain it rather than guessing. |

## Retained Text and Complete ID Set

The remaining 75 IDs were retained after source comparison. The term
`Dame Oleyn` is consistently rendered `올레인 경(Dame Oleyn)` at IDs `27196`,
`35383`, and `57550`; no title change was inferred from these rows alone. The
spelling and English pairing of the other reviewed names were also retained.

Complete asset-linked ID set:

`495`, `2297`, `2859`, `4999`, `5395`, `5669`, `5730`, `6513`, `6825`,
`7498`, `7916`, `10336`, `11379`, `11427`, `12610`, `13384`, `13843`,
`15357`, `16384`, `16848`, `17045`, `17084`, `17790`, `18704`, `19755`,
`19875`, `20276`, `20312`, `21176`, `21238`, `22842`, `23088`, `23689`,
`25016`, `25117`, `25159`, `25199`, `26902`, `27196`, `27720`, `28479`,
`29957`, `30122`, `30324`, `33586`, `35360`, `35420`, `35507`, `36002`,
`36428`, `37203`, `37329`, `37545`, `37967`, `39653`, `41240`, `41692`,
`42343`, `42976`, `43153`, `43558`, `44622`, `45147`, `46045`, `46064`,
`46612`, `47062`, `48785`, `51853`, `53471`, `54901`, `55420`, `56023`,
`57089`, `57130`, `57373`, `57512`, `57550`, `58164`, `59138`, `60580`,
`61951`, `62505`.

Findings remain proposals; no translation CSV changes were applied.
