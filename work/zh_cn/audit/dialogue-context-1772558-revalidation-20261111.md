# Alserund / House of Valor Multi-NPC Asset / `1772558.quest_bxml`

- Date: 2026-11-11.
- Scope: all 169 `default` IDs linked to `1772558.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Findings are ID-scoped proposals or evidence-limited holds. No translation
  CSV was changed.

## Grouping Evidence and Limits

The asset has no explicit `QUEST_ID`. It contains 17 distinct `NPC_` symbols,
including Aergase, Halcyor, Maxen, Pura, Colbanus, and several unnamed Fae,
plus 116 serialized `dialog_line_*` handlers. Its keys span Alserund, the
Circle of Engard, the Narca, the House of Valor, arena business, and multiple
NPC interactions. The Aergase symbol is only one asset-level clue and does
not establish who speaks any individual key. No key is mapped to an
individual speaker, handler, branch, or playback position.

All 169 rows were compared in English, Japanese, Chinese, and active Korean.
The 22 exact-English duplicate groups have matching translations across all
four languages. No embedded line breaks, runtime placeholders, or markup
occur in these rows.

## Correction Candidates

These are proposals, not approved edits:

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `280` | Naturalness | The noun stack `용맹의 페이(Fae) 챔피언(Champion of Valor) 엔가드(Engard)` is difficult to parse. Consider recasting as `페이(Fae)인 엔가드(Engard)는 용맹의 챔피언(Champion of Valor)이었다.` | Medium |
| `6612`, `14652`, `30852`, `47572` | Terminology | `Crossing Keepers` / `Keepers of the Crossing` is rendered as `교차점의 수호자들`, while the place itself is consistently named `크로싱(The Crossing)` in this quest. Consider a single contextual form such as `크로싱의 수호자들(Crossing Keepers)`; preserve each sentence's syntax. | High |
| `11660` | Meaning / terminology | `Winter cousin` is translated as `겨울 궁정의 사촌`, confusing Winter Fae with a court. English and Chinese say cousin; Japanese says friend. Consider `겨울 페이(Winter Fae) 사촌`, while keeping the source disagreement about the relationship visible. | Medium-high |
| `42073` | Naturalness / terminology | `Fae hollows` is `페이(Fae)의 지하 공간`, whereas repeated source text in this asset uses `페이(Fae)의 광대한 지하 동굴망`; Japanese and Chinese also identify caves. Consider aligning this occurrence with the established cave rendering. | High |
| `45447` | Terminology | The capitalized returning `Champion` is rendered `용사`, while nearby references to the same role use `챔피언`. Consider using `챔피언` consistently in this context. | Medium-high |
| `61822` | Meaning / source fidelity | English says `the mortal Magnus` and Japanese also gives only Magnus, but Korean expands this to `흐로스 매그너스(Hroth Magnus)`. The added given name is not present in this ID's English or Japanese source. Consider limiting it to `필멸자 매그너스(Magnus)`. | High |

## Holds

| ID | Dimension | Evidence and disposition | Confidence |
| ---: | --- | --- | --- |
| `14300` | Meaning / terminology | English says `ampulla of the High Court`; Japanese describes a court's holy-oil vessel and then refers to a different-sounding institution. Keep `고등 궁정` provisional; do not infer a canonical court title from this line alone. | Uncertain |
| `51568` | Speech level | Korean uses `조심하게`, while Japanese has a plain imperative. The asset is multi-NPC and does not identify this speaker or conversational relationship. Hold the register judgment rather than applying a global speech-level rule. | Uncertain |

Other checked rows were retained. This includes the repeated Alserund/Fae-hollow
sentences, Circle of Engard references, and short greetings, farewells, and
arena notices. Register differences across this asset are not evidence of a
single speaker changing voice.

## Complete ID Set

All IDs below have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv):

`26`, `280`, `939`, `2208`, `3023`, `4376`, `4428`, `4505`, `4604`, `5210`,
`5411`, `5598`, `5641`, `6248`, `6455`, `6518`, `6612`, `7329`, `7340`,
`7388`, `7490`, `7628`, `8250`, `8563`, `8596`, `9208`, `9538`, `9709`,
`9841`, `10201`, `10604`, `10766`, `11093`, `11415`, `11445`, `11660`,
`11714`, `11739`, `11892`, `12002`, `12057`, `12458`, `12778`, `12866`,
`13032`, `13434`, `14300`, `14645`, `14652`, `14695`, `14936`, `15450`,
`15500`, `16325`, `17445`, `18570`, `19075`, `19213`, `19270`, `19420`,
`20102`, `20315`, `20366`, `20556`, `22391`, `23676`, `23908`, `24004`,
`24123`, `25004`, `25718`, `25770`, `25796`, `26108`, `26149`, `26365`,
`26404`, `26871`, `27001`, `27855`, `27999`, `29725`, `29986`, `30004`,
`30424`, `30502`, `30852`, `30907`, `31688`, `32011`, `32109`, `32618`,
`33096`, `33686`, `34202`, `35595`, `35690`, `36740`, `36910`, `37181`,
`37427`, `38704`, `39013`, `39089`, `39109`, `39305`, `39846`, `41869`,
`41922`, `42073`, `43812`, `43902`, `44078`, `44569`, `44735`, `45447`,
`46231`, `46400`, `46515`, `47050`, `47572`, `47661`, `47686`, `47699`,
`48114`, `48556`, `48618`, `49045`, `49394`, `49439`, `49461`, `49643`,
`49802`, `50023`, `51347`, `51568`, `51835`, `52302`, `52322`, `53012`,
`53189`, `53381`, `54986`, `55453`, `56194`, `56402`, `56784`, `56899`,
`57280`, `58782`, `58905`, `58910`, `59159`, `59207`, `59440`, `60209`,
`60512`, `60528`, `60547`, `61136`, `61392`, `61822`, `62013`, `62584`,
`62830`, `63148`, `64227`, `64319`, `64567`.
