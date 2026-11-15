# Asset Revalidation: `2026652.quest_bxml` (Ollie Training)

- Date: 2026-11-11.
- Scope: all 102 linked `default` IDs, newly recorded.
- English controls meaning; Japanese supplies the primary voice/register
  and layout reference; Chinese is secondary meaning evidence.
- Seven correction-candidate IDs and three evidence-limited hold IDs,
  including one ID with both a candidate and a hold.
- No translation CSV or extracted asset was changed. Candidates require
  separate approval and editing.

## Context Evidence and Limits

The asset has one NPC symbol `DLC1_NPC_GAL_VAR_OllieMadsen` and 33
`DLC1_PH07b`-prefixed handlers, but no explicit `QUEST_ID`. Its content concerns
Ollie's creature training, record results, and rewards. The NPC symbol,
handler prefix, and subject group do not map individual localization keys to
the NPC, handlers, branches, or playback order. The asset includes player
questions, choices, journal, and objective labels as well as possible NPC
speech. No per-key speaker or order is inferred.

## Correction Candidates

| ID(s) | Dimension | Evidence, finding, and proposed direction | Confidence |
| --- | --- | --- | --- |
| `13436` | Name / English pairing | English names two complete places, `Kandrian and Helmgard Keeps`. Korean `칸드리안(Kandrian) 성채` splits the first place name and differs from the confirmed `칸드리안 요새(Kandrian Keep)`; the second already pairs `헬름가드 요새(Helmgard Keep)`. Consider the complete Kandrian form while preserving the profession and both assignments. The job title is independently on hold below. | High |
| `16617`, `33194` | Naturalness / speech | Both exact English and Japanese texts describe selecting a monster and receiving a record reward. Korean ends the otherwise conversational explanation in `보상을 주마`, which sounds abruptly archaic in isolation. Consider the same `보상을 줄게` at both IDs, keeping their duplicate Korean aligned; no shared speaker is inferred. | Medium |
| `25700` | Naturalness / perspective | English `you're just in there to smash them` addresses the player. Korean `놈들을 부수러 들어온 거야` can imply the speaker is in the arena, and sounds literal. Consider `빛나는 부분이나 회전에 정신 팔리지 마. 놈들을 부수는 데만 집중해.` | Medium-high |
| `44149` | Meaning / relationship | English `my brother, Jakin`, Japanese `兄弟`, and Chinese `兄弟` do not establish which brother is older. Korean `내 동생` asserts an unsupported age order. Consider `내 형제 제이킨(Jakin)을 알지도 모르겠군` and preserve the House of Valor arena role. Existing D-21375 establishes the named brother, not birth order. | High |
| `60560` | Terminology / parallel choice | The paired choice `Large creatures` at `36853` is `대형 생물`, while `Small creatures` is `작은 생물`. Consider `소형 생물` for a directly comparable choice pair without changing their meaning. | Medium |
| `9626` | Label naturalness | English plural `Brownies` is already paired as `브라우니(Brownies)들`; the Korean plural suffix after the parenthetical is awkward on a category label. Consider `브라우니(Brownies)`, preserving the English plural and the confirmed species form. | Medium-high |

## Evidence-Limited Holds

| ID(s) | Dimension | Reason and disposition |
| --- | --- | --- |
| `13436`, `17267`, `29235` | Job-title consistency | All refer to English `master-at-arms` in Ollie's training context, but Korean uses `무기 교관`, `무기 훈련관`, and `무장 책임자`. D-21581 uses `무기 담당관` for another person; D-21075 explicitly left Ollie's job descriptions outside the person-name decision. The evidence establishes the local role but not which established Korean office label should govern it. Hold the title choice, independently of the place-name candidate at `13436`. |

## Retained Decisions and Structural Checks

- `26455` retains `바게스트(Barghest)`, the approved species form in the
  Barghest glossary even where the English category is plural.
- `62776` retains the approved plural `브라우니(Brownies)`. `60279` and
  `65034` retain the source-local singular/plural Root Golem pairings.
- Seven exact-English duplicate groups match in Korean: ten `My results?`,
  eight `Good luck.`, four `I need training.`, two each of `Not right now.`,
  `I'm interested in training.`, and `Let's train.`, and the two long
  training explanations (`16617`, `33194`).
- All 102 rows match across four languages in newline counts and extracted
  brace-token/angle-markup sequences. This is not a playback/display test.

## Complete Asset ID Set

`252`, `1386`, `2350`, `2851`, `3109`, `3152`, `4287`, `4393`, `5706`,
`6171`, `6961`, `7956`, `8728`, `8828`, `8983`, `9626`, `9700`, `9954`,
`10333`, `10748`, `10891`, `11484`, `11929`, `12351`, `13436`, `14772`,
`15478`, `16617`, `17267`, `17800`, `18795`, `19723`, `20781`, `21309`,
`21653`, `22780`, `23362`, `24489`, `25700`, `26455`, `26509`, `26654`,
`27170`, `27699`, `27911`, `28167`, `28177`, `28321`, `28889`, `29235`,
`29772`, `30372`, `30530`, `30726`, `31074`, `31864`, `32199`, `32654`,
`32908`, `33194`, `33747`, `33977`, `34048`, `34143`, `34675`, `34799`,
`36853`, `36985`, `37962`, `38808`, `39405`, `39942`, `40409`, `43266`,
`43924`, `44149`, `45448`, `46566`, `47046`, `47362`, `49061`, `49457`,
`49482`, `49546`, `50288`, `51255`, `51635`, `51907`, `54876`, `56970`,
`58392`, `58870`, `58974`, `60279`, `60560`, `60643`, `60775`, `62182`,
`62566`, `62776`, `63199`, and `65034`.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
