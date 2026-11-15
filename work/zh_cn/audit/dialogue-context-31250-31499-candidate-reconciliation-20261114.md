# Candidate Reconciliation: IDs `31250`-`31499`

- Date: 2026-11-14.
- Rechecked all 21 current ledger candidates against same-ID English,
  Japanese, Chinese, and active Korean.
- The supported edits in the existing batch were present. This re-review
  found two remaining Korean-naturalness issues in `31270` and `31375`, plus
  linked consistency gaps in the exact-source duplicate and Belen's Testament
  references; these were corrected below.
- The evidence-limited questions at `31283` and `31386` remain held and are
  not part of the candidate subtotal.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `31255` | Confirmed | The sentence pairs `에이머(Eimer)` and preserves the narrator's plain, reflective tone. |
| `31270` | Corrected | Kept the affectionate farewell and all paragraph breaks; replaced the unnatural sign-off `네 사람` with `애정을 담아`. |
| `31275` | Confirmed | `레무스 블러드호크(Remus Bloodhawk)` is paired in the conversational recollection. |
| `31278` | Confirmed | The target is naturally described as reaching the throne-room lever; `틱네리(Ticneri)` is standardized. |
| `31279` | Confirmed | The journal accurately identifies the gnome scientist and scholar as `에피 크루익섕크(Effie Cruikshank)`. |
| `31294` | Confirmed | `흉터가 있는 식물` reflects the scar description supported by Japanese and Chinese, not a presumed proper name. |
| `31299` | Confirmed | The historical figure and title are paired as `리아나(Lyana)` and `셈페스트레(Cempestre)`. |
| `31318` | Confirmed | The two named objects use the established forms `장엄한 종(Solemn Bell)` and `탄생의 초(Birth Candle)`. |
| `31329` | Confirmed | `드 그루트(De Groot)` is paired; the sentence preserves the five-year conflict and his death after returning home. |
| `31332` | Confirmed | `레와니(Rhewani)` is paired and the speaker's determination to save the boy remains clear. |
| `31355` | Confirmed | `기술서` correctly names an in-game skill-book item rather than a generic book about skills. |
| `31370` | Confirmed | `브라이트타워(Brightower)` and `패란즈(Faelands)` are paired; the quest-log sequence and objective remain intact. |
| `31374` | Confirmed | The ring engraving is paired as `메이지의 행운(Maisie's Luck)` and remains a natural spoken question. |
| `31375` | Corrected | Recast the awkward “readied, light” line as `전쟁의 무기는 가볍고 준비됐네`; the six-line poem and full `Gauntlets of the Faehunter` pairing are preserved. |
| `31387` | Confirmed | `죽음의 교단인 벨렌의 성약단(Belen's Testament)` accurately names the group and its role. The inconsistent linked renderings were aligned separately. |
| `31395` | Confirmed | `틱네리(Ticneri)` is standardized, and the threat to the Alfar is expressed naturally. |
| `31420` | Confirmed | `조수 웅덩이(Tidal Pools)`, `킵 안뜰(Keep Courtyard)`, and Zefwyn Lan remain distinct and correctly paired. |
| `31423` | Confirmed | `매그너스(Magnus)` is paired without changing the conditional, conversational tone. |
| `31433` | Confirmed | `성스러운 통로(Sacred Passage)` is paired in the established `-기` objective form. |
| `31466` | Confirmed | The return objective uses the complete role/name form `종자 코란(Squire Coran)`. |
| `31490` | Confirmed | `포럼(Forum)` and `리브라리움(Livrarium)` are both paired in the journal entry. |

## Linked Corrections

- `31375` and its exact-English duplicate `37047` now share the same
  six-line poem. The updated lines describe the war instruments as light and
  ready and preserve the gauntlets' grip and machinations without the prior
  awkward phrase.
- The same Belen's Testament group appears elsewhere in the active resource.
  At `46160`, English abbreviates the name as “the Testament”, while Japanese
  and Chinese identify ベイレン結社 / 贝伦神约. Replaced the inconsistent
  `벨렌의 테스타먼트(Testament)` with `벨렌의 성약단(Belen's Testament)`.
  At `47562`, added the missing full English pairing to the same established
  Korean name.
- These linked corrections do not add candidate IDs to this range's subtotal.

## Application And Verification

- Only Korean `Texto` changed at `31270`, `31375`, `37047`, `46160`, and
  `47562`; the ID-targeted line-ending-preserving editor was used.
- Only those five IDs' `source_fingerprint` values were refreshed. Other
  ledger fields, rows, and order were preserved.
- English, Japanese, and Chinese support the revised wording; duplicate poem
  line counts remain six. The holds at `31283` and `31386` remain unresolved.
- No speaker or playback order was inferred from asset membership, NPC
  symbols, handler serialization, or ID order.
- Candidate reconciliation now covers 1,846 / 4,015 IDs (45.98%); 2,169
  candidate IDs remain. The next sequential range is `31500`-`31749`.
