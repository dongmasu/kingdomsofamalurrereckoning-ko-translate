# Asset Revalidation: `507502.quest_bxml` (`SA08` Handler-Prefix Candidate)

- Date: 2026-11-11.
- Scope: all 100 linked `default` IDs, newly recorded.
- English controls meaning; Japanese supplies the primary voice/register
  and layout reference; Chinese is secondary meaning evidence.
- Nineteen correction-candidate IDs and three evidence-limited hold IDs,
  including one ID with both a candidate and a hold.
- No translation CSV or extracted asset was changed. Candidates require
  separate approval and editing.

## Context Evidence and Limits

The asset has 34 `SA08`-prefixed serialized dialogue handlers, but no
explicit `QUEST_ID` or NPC symbol. Its text concerns Ciara Sydanus,
the Scholia Arcana, Caledus, Methneen, and three elemental stones.
The handler prefix and shared topic do not establish a particular ID's
speaker, handler, branch, or playback order. Self-referential statements
alone here do not explicitly name their speaker; all remain unassigned.
Journal/objective records are treated separately from spoken dialogue.

## Correction Candidates

| ID(s) | Dimension | Evidence, finding, and proposed direction | Confidence |
| --- | --- | --- | --- |
| `626` | Meaning / tense | English `she was never killed ... she was imprisoned` and Japanese `死んでいない ... 囚われている` describe Sydanus as alive and still confined. Korean `갇혀 있었어` can imply the confinement ended already. Consider `죽은 게 아니야. 라시르(Rathir)의 돌 속에 갇혀 있어.` | High |
| `784` | Naturalness | English `a prison spell forged from these very stones` and Japanese `魔法の監獄` describe magical imprisonment. `감옥 주문` is awkward; consider `바로 이 돌로 만든 감금 주문에 700년 동안 갇혀 있었으니까.` Whether to treat this as the same named term as Tenhwa's distinct imprisonment spell is held separately. | Medium-high |
| `2493` | Meaning | `one of the Scholia Arcana's most powerful assets` and Japanese `最も貴重な人材の1人` describe a powerful or valuable member. Korean `가장 중요한 인재` captures importance but drops English's power. Consider `스콜리아 아르카나(Scholia Arcana)에서 가장 강력한 인재 중 하나였어`, retaining `Savant Engar`. | Medium |
| `4085`, `10670`, `27067` | Rank / address | Each English source addresses `Savant`, a formal rank rendered `사반트(Savant)` at `626` and documented as `사반트` for Engar in D-21050. These three instead use `현자` or `현자여`, which can be mistaken for a different title. Consider `사반트(Savant)` with appropriate particles; retain each sentence's own speech style, without assuming one speaker. | High |
| `19063` | English pairing | English `Savant Methneen` and Japanese `一級魔道師メスニーン` name the same titled person. Korean `사반트 메스닌` already follows the D-19511/D-21909 spelling and title, but unlike `55986` lacks the complete English pairing. Consider `사반트 메스닌(Savant Methneen)과 대화하기`; do not revisit the approved title or spelling. | High |
| `23431` | Rank terminology | English explicitly distinguishes `many Savants` as people holding a formal rank; Japanese explains that those exceptionally gifted attain that rank. Korean `석학들이 많아` loses the title connection. Consider `우리 학회에는 사반트(Savant)가 많아. 연금술, 마법물품 제작(Sagecrafting)이나 학문에 탁월한 재능을 지닌 이들이지.` | High |
| `18134` | Artifact terminology | English `Storm and Frost Stones` and Japanese `雷嵐石 ... 霧氷石` refer to two distinct artifacts. Korean `폭풍의 돌과 서리석(Frost Stones)` mixes the established Storm Stone name and pairs only the Frost component. Use `폭풍석(Storm Stone)과 서리석(Frost Stones)` while preserving the distinct founder/statue assignments and the explicitly recorded source-local plural form. | High |
| `24729`, `27929` | Artifact terminology / English pairing | These are the Sun/Storm/Frost artifact set. `24729` leaves Sun and Storm unpaired; `27929` uses incomplete `태양석(Sun)`. Consider complete `태양석(Sun Stone)` and `폭풍석(Storm Stone)` for those items, preserving `서리석(Frost Stones)` as the source-local form explicitly retained in D-21261, and preserving all existing quest directions. | Medium-high |
| `37217` | Artifact pairing | English `Sun, Frost and Storm stone` elides `stone` in the first two names. Korean has `태양석(Sun), 서리석(Frost), 폭풍석(Storm stone)`. In this row's established artifact context, consider `태양석(Sun Stone), 서리석(Frost Stone), 폭풍석(Storm stone)`. D-21261 expressly leaves the elided Frost to a separate row-scoped supplement and preserves source-lowercase `Storm stone`; this proposal does not create a global `Frost` alias. | Medium-high |
| `42825` | English pairing | `Sedeas` is a named location alongside paired Aodh and Skycrown. Add `세데아스(Sedeas)` in this sentence; D-21362 records that Shardfall once bore this name but does not approve a global alias, which this local annotation does not assert. | High |
| `8046`, `11824`, `28568`, `38100`, `41375`, `43379` | Naturalness / speech | These source sentences explain events or give an instruction in dialogue. Korean endings such as `만들었다 ... 그것이다`, `공격해야 한다`, `비밀이다`, `예상하지 못했다`, `만들었다`, and `이끌었다` sound written or abrupt in isolation; Japanese uses plain spoken exposition. Consider conversational endings while preserving each sentence's meaning: e.g. `만들었어 ... 바로 그 문양이지` at `8046`, `공격해야 해` at `11824`, and `이끌었지...` at `43379`. Do not infer that these six share a speaker or impose a single honorific profile. | Medium |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| --- | --- | --- |
| `784` | Terminology | `prison spell` refers to Sydanus's particular prison. The user-approved distinction between `imprisonment spell` and `counter-spell` concerned Tenhwa; it supports ordinary Korean `감금 주문`, but does not prove these are one named spell or mandate identical English parentheticals. Keep the local wording proposal separate from any global spell identity. |
| `48572` | Speech level | Korean uses `-오`, Japanese plain language, and English is neutral. The handler cannot identify the speaker or relationship; formal address may be intentional. Hold register normalization. |
| `51859` | Speech level | Korean combines respectful `당신`/`대현자여` with informal `빚졌어`/`있어`. The line explicitly addresses the new Archsage, but the speaker and relationship are unknown. Record the possible mismatch; do not force one speech level without further context. |

## Retained Decisions and Structural Checks

- D-21219 confirms `태양석(Sun Stone)`; D-21261 confirms
  `서리석(Frost Stone)` and `폭풍석(Storm Stone)` while explicitly retaining
  source-local `Frost Stones` at `27929` and `Storm stone` at `37217`.
- `19063` retains the already reviewed `사반트 메스닌` spelling and title.
  `55986` already pairs `Savant Methneen`.
- `42209` remains fragmented as in English and Japanese; no missing words
  are invented. Nine `.` entries remain unchanged as source placeholders.
- Two exact-English duplicate groups have matching Korean: the nine `.`
  placeholders and the return/prepared question (`22095`, `23705`).
- All 100 rows match across four languages in newline counts and extracted
  brace-token/angle-markup sequences. This is not a playback/display test.

## Complete Asset ID Set

`626`, `784`, `1277`, `1514`, `1699`, `2493`, `2602`, `3642`, `4085`,
`8046`, `8435`, `8823`, `8888`, `9186`, `9490`, `9781`, `10039`, `10233`,
`10454`, `10670`, `11066`, `11824`, `12483`, `12490`, `12721`, `13022`,
`14115`, `14425`, `14726`, `15606`, `17756`, `18134`, `18838`, `19063`,
`20331`, `20694`, `20855`, `22095`, `23076`, `23358`, `23431`, `23705`,
`23725`, `24176`, `24729`, `25294`, `25882`, `26196`, `27067`, `27929`,
`28568`, `29475`, `31648`, `32749`, `33254`, `33655`, `35188`, `35395`,
`35591`, `36337`, `36715`, `37217`, `37262`, `37298`, `38100`, `39154`,
`39188`, `40140`, `41375`, `42209`, `42676`, `42801`, `42825`, `43195`,
`43379`, `43554`, `45144`, `46055`, `46362`, `47034`, `47582`, `47901`,
`48572`, `48939`, `50308`, `51265`, `51859`, `52574`, `52619`, `53274`,
`55529`, `55986`, `56352`, `56577`, `58025`, `61989`, `63260`, `63543`,
`64243`, and `65119`.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
