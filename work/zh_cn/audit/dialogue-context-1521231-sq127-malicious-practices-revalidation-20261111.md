# Asset Revalidation: `1521231.quest_bxml` (`SQ127` Handler-Prefix Candidate)

- Date: 2026-11-11.
- Scope: all 89 `default` IDs linked to this asset; all 89 are newly recorded.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Seven correction-candidate IDs and three evidence-limited hold IDs are
  recorded. No translation CSV or extracted game asset was changed.

## Context Evidence and Limits

The BXML has no explicit `QUEST_ID` or NPC symbol. Its 37 serialized
`dialog_line_*` handlers use the `SQ127` prefix, which is a quest clue rather
than a confirmed quest assignment or per-key dialogue mapping. The linked
strings concern Corialia Scathe, Matrim Hawkins, the Mel Senshir hospital and
Broken Tower, and include the text `Malicious Practices` at ID `54743`.
These support a topic grouping only. The asset does not map individual
localization IDs to a speaker, handler, branch, addressee, or playback order;
speaker attribution and dialogue order remain unassigned/unknown.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `1905` | Meaning / naturalness | The final clause `데려가지만 마` is malformed and obscures “just don't take me beneath the tower.” Consider `그래, 맞아! 까마귀들을 쫓아내. 날 탑 아래로만 데려가지 마!` | High |
| `12001` | Naturalness | `널 기절할 때까지 두들겨 패야겠군` has an awkward result construction. Japanese confirms the physical act of beating someone unconscious; consider `널 두들겨 패서 기절시켜야겠군.` | Medium-high |
| `21795` | Meaning / word choice | English `my work` and Japanese `私の研究` refer to research, not an artwork. Replace `제 작품` with `제 연구`, retaining the sarcastic, elevated tone. | High |
| `27915` | Naturalness | `죽음이 기다리고 있어… 알잖아. 나를, 너를 기다리지` is choppy and leaves the parallel objects detached. Consider `죽음은 기다리고 있어… 알잖아. 나와 너를 기다리고 있지.` | Medium-high |
| `35465` | Meaning / naturalness | `a book we've barely begun to crack` means the subject is only beginning to uncover mortal physiology. `미지의 책과 같아` adds “unknown” and weakens the “crack/uncover” image. Consider `필멸자 종족의 생리는 이제 겨우 그 비밀을 파헤치기 시작한 책과 같아!` | Medium-high |
| `52181` | Naturalness | `네 주위에서 보여` leaves the visible thing unclear and sounds incomplete. Japanese likewise describes something surrounding the addressee; consider `네 주위를 둘러싼 게 보여.` | Medium-high |
| `55536` | Naturalness | `연회를 위한 또 다른 시체다` is a stiff calque of `another body for the feast`. Consider `연회에 올릴 시체가 하나 더 늘었군!`, retaining the speaker's macabre image. | Medium |

## Evidence-Limited Holds

| ID(s) | Dimension | Evidence and disposition |
| --- | --- | --- |
| `6059`, `22660` | Meaning | English uses `dark crusade`, while Japanese reads it as a dark reform and Chinese as dark experimentation. Earlier records also leave this unresolved. Keep the current English-led Korean wording provisional; do not settle the intended sense from this asset alone. |
| `19437` | Meaning / literary style | The compressed verse uses `hags`; Japanese reads this as old women, while Chinese reads it as witches. The Korean `마녀` may fit the fantasy sense, but the imagery and rhythm were already left for literary review. Preserve the current text pending stronger contextual evidence. |

## Repeated Text and Structure

Two exact-English duplicate groups cover four rows: `Quest Complete`
(`1162`, `22451`) and `Yes?` (`18805`, `31937`). Korean is identical within
each group. All 89 IDs have matching four-language line-break, runtime-token,
and markup signatures.

## Complete Asset ID Set

`6`, `1162`, `1905`, `2137`, `3149`, `4344`, `4357`, `6059`, `6325`,
`6534`, `7487`, `7539`, `9125`, `9155`, `9958`, `10326`, `10883`, `11334`,
`12001`, `12514`, `13131`, `14173`, `14381`, `15566`, `16420`, `17549`,
`18805`, `19437`, `19841`, `19892`, `21795`, `22112`, `22221`, `22451`,
`22610`, `22660`, `22813`, `23104`, `23193`, `23554`, `25234`, `25723`,
`27887`, `27915`, `28520`, `28931`, `29994`, `30314`, `30705`, `31937`,
`32372`, `32672`, `33023`, `33293`, `33729`, `34212`, `35465`, `35650`,
`35966`, `36042`, `37614`, `37806`, `37837`, `38043`, `39879`, `40138`,
`40407`, `41304`, `42768`, `43694`, `44568`, `45736`, `46005`, `47209`,
`48714`, `49998`, `51376`, `51655`, `52181`, `53354`, `54743`, `54758`,
`55514`, `55536`, `56733`, `57775`, `59214`, `61098`, and `63726`.

All 89 four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
Findings are proposals, not approval to edit the translation.
