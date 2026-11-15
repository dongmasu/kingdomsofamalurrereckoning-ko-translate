# Asset Revalidation: `630966.quest_bxml` (SQ65 Handler-Prefix Candidate)

- Date: 2026-11-11.
- Scope: all 87 `default` IDs linked to this asset; all 87 are newly recorded.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Eighteen correction-candidate IDs and one evidence-limited hold are
  recorded. No translation CSV or extracted game asset was changed.

## Context Evidence and Limits

The BXML has no explicit `QUEST_ID` or NPC symbol. Its 41 serialized
`conditional_quest_sq65_...` dialogue handlers provide an `SQ65` handler-prefix
clue only. Its strings include the objectives “Find the Fateweaver,” “Protect
Ordo,” and “Reach the great chamber,” plus dialogue about Maura Chalin, Ordo,
and Weconai. These support a topic grouping, not a confirmed quest assignment
or key-to-handler mapping. Speaker attribution and playback order therefore
remain unassigned/unknown except for the two lines that explicitly identify
the first-person speaker: ID `25627` (“I am called Ordo”) and ID `25732` (“I am
Maura”).

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `2079` | Terminology | The established form is `머건(Murghan)`, but this line adds `족` (`머건(Murghan)족`). Use the established creature name without implying a separate “Murghan tribe”; `머건(Murghan)들이 막아설 테지만` is one natural option. | High |
| `3140` | Naturalness | `네가 이행하러 온 계약` is stiff. Consider `네가 이행하러 온 약속에 관해 이야기할 때가 됐군` while retaining the sense of an agreement the player came to fulfill. | Medium-high |
| `4177` | Naturalness | `이 실이 당신에게로 데려온 거였군요` personifies the thread awkwardly. The Japanese and Chinese also make the thread the agent that led the speaker to the player; consider a natural form such as `이 시간의 실이 결국 당신에게로 날 이끌었군요`. | Medium-high |
| `9587` | Objective format | This is a quest objective. Neighboring objectives use `-기` forms (`찾기`, `지키기`); align it as `대전당에 도달하기` rather than the imperative `대전당에 도달하라`. | High |
| `17133` | Naturalness | `자기 집에 감금된 채 대전당에 있어` makes the relation between her home and the great chamber unclear. Consider `투아사(Tuatha)에게 자기 집인 대전당에 갇혀 있어` and retain the following discovery sentence. | Medium-high |
| `25342` | Meaning / terminology | `대회랑` suggests a corridor, while the source says a great chamber and Japanese says `大広間`. Align with the asset's majority form `대전당`; consider `모라 찰린(Maura Chalin)이 갇힌 곳은 유적 지하 깊숙한 대전당이다. 무장해라.` | High |
| `25627` | Naturalness | `오르도(Ordo)라고 불린다` is detached and stilted for the explicit first-person self-introduction “I am called Ordo.” Consider `오르도(Ordo)라고 해`. The line itself supports speaker attribution to Ordo; it does not establish dialogue order. | Medium-high |
| `29962` | Naturalness / speech level | The polite conversational ending `어서 오세요` is followed by the archaic vocative `새로운 벗이여`. Keep the greeting consistently conversational, for example `새로운 친구도 어서 오세요`. No broader speaker voice is inferred. | Medium |
| `44334` | Naturalness | `생존자가 세상에서 하나 줄었다` uses an unnatural counter. Consider `이제 세상에 남은 이븐타이드(Eventide) 씨족의 생존자는 한 명 줄었어`. | High |
| `45287` | Speech level / naturalness | `고맙네, 나그네여` shifts to `걱정하기 시작했어` within one utterance. Consider keeping the whole line in plain conversational style, such as `고마워, 나그네. 아무도 오지 않을까 봐 걱정되기 시작했어. 장막 너머로 끌려갈 때까지 이 벽만 바라보게 될까 봐 말이야.` | Medium-high |
| `49969`, `50058`, `54941` | Terminology | These refer to the same `great chamber` but render it as `대전` or `대회랑`; align them with the established in-asset form `대전당`. ID `2079` and ID `9587` already use that form. | High |
| `51455` | Naturalness | `안타깝네요. 당신 말이에요` is a literal, choppy rendering of the pointed aside “for you I mean.” Consider a more natural aside, such as `안타깝네요. 물론 당신 말이에요`, while preserving the speaker's sarcasm. | Medium |
| `53330` | Meaning | `we're through the locked door` is rendered as if the group merely passed through it, while Japanese and Chinese explicitly say the locked door was opened. Consider `잠긴 문을 열었으니`. | High |
| `56148` | Speech level / naturalness | The line shifts from `고된 일이었어` to `운이 좋군`. Consider a consistent plain register, such as `정말 고된 일이었어. 그래도 살아남았으니 운이 좋다고 해야겠지.` | Medium-high |
| `58414` | Terminology | English `life essence` is rendered `생명력`, unlike IDs `3998` and `15324`, which use `생명 정수` for the same source term. Align this occurrence to `생명 정수`. | High |
| `63576` | Title / format | `Tuatha Curse` is rendered `투아사(Tuatha) 저주`, leaving the title relation unidiomatic and the English title incomplete. Consider `투아사의 저주(Tuatha Curse)`, consistent with Japanese `ツアサの呪い`. | High |

## Evidence-Limited Hold

| ID | Dimension | Evidence and disposition |
| --- | --- | --- |
| `38437` | Meaning / tone | “I shall tend to you in a moment” can be benign or threatening in English; Japanese says the speaker will grant a short reprieve, while Chinese reads as “deal with you.” The current `돌봐 드리겠습니다` sounds benevolent. The sources do not settle the intended threat, so hold for scene evidence rather than selecting a meaning. |

## Repeated Text and Structure

Two exact-English duplicate groups cover four rows: `Ordo` (`482`, `16303`)
and `Weconai` (`53078`, `55538`). Korean is identical within each group.
The near-duplicate objectives “Let's go” (`32193`) and “Let us go” (`32798`)
also share the same Korean text. All 87 IDs have matching four-language
line-break, runtime-token, and markup signatures.

## Complete Asset ID Set

`482`, `1742`, `2028`, `2079`, `3140`, `3442`, `3998`, `4177`, `4553`,
`6160`, `9161`, `9587`, `10195`, `10301`, `10896`, `11838`, `11877`,
`12123`, `12485`, `13074`, `13742`, `14047`, `15324`, `15748`, `16303`,
`17133`, `18913`, `18924`, `20328`, `20395`, `22129`, `22401`, `23368`,
`24293`, `24573`, `24642`, `25342`, `25627`, `25732`, `26890`, `29668`,
`29962`, `32098`, `32193`, `32798`, `36954`, `37235`, `38315`, `38437`,
`38730`, `38838`, `39468`, `42708`, `43084`, `44334`, `45287`, `46706`,
`46812`, `47422`, `48289`, `48456`, `48492`, `49969`, `50058`, `50660`,
`51455`, `51784`, `51896`, `52270`, `53078`, `53330`, `54488`, `54513`,
`54941`, `55109`, `55293`, `55538`, `55737`, `56148`, `58414`, `58875`,
`59083`, `59581`, `60128`, `60645`, `61928`, and `63576`.

All 87 four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
Findings are proposals, not approval to edit the translation.
