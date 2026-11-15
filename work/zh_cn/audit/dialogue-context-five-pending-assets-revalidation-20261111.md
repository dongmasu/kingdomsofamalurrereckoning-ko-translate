# Five Pending Asset Revalidations

- Date: 2026-11-11.
- Scope: all 196 unique `default` IDs linked to five previously unrecorded
  assets.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Twenty IDs carry correction candidates and three remain on evidence-limited
  hold. No translation CSV was changed.

## Grouping Evidence and Limits

`425982.quest_bxml` has 20 matched IDs and nine serialized
`dialog_line_*` handlers with an `M0_SQ06_FIN` prefix, but no explicit
`QUEST_ID` or `NPC_` symbol. The prefix is an asset-level clue only.

`449611.quest_bxml` has 17 matched IDs and 17 `dialog_line_*` handlers, with
no explicit quest ID or NPC symbol. `461580.quest_bxml` has 59 matched IDs
and 17 dialogue handlers, also without an explicit quest ID or NPC symbol.
Their handlers do not map localization keys to speakers or playback order.

`484880.quest_bxml` has 57 matched IDs, an explicit `QUEST_ID SA05`, and 21
dialogue handlers, but no NPC symbol. The quest context and handler names do
not establish a speaker for any individual key.

`508141.quest_bxml` has 43 matched IDs and 12 dialogue handlers, but no
explicit quest ID or NPC symbol. Its handlers likewise do not establish
per-key speakers, branches, or playback order.

All 196 rows were compared in English, Japanese, Chinese, and active Korean.
Repeated English rows within the reviewed sets were checked by ID; matching
translations were retained rather than mechanically rewritten. No
translation CSV was changed.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `36151` | Naturalness | `낯선 이여` makes the greeting archaic compared with English `Hello again, stranger` and Japanese `また会ったね`. Keep the stranger reference if desired, but use a less stilted conversational greeting. | Medium-high |
| `41995` | Speech level | The line shifts among `지켜보고 계셔`, `어떻겠나?`, and `바라니까`. Japanese keeps a conversational register. Recast the full line in one consistent register without inferring a speaker. | High |
| `5189`, `61266` | Meaning / name consistency | These rows say `Nuala Ignus`, while the other English references in the same story use `Nuala Ignas`; Japanese consistently renders the name as `イグナス`. The story context identifies the same person. Standardize the English pairing to `Nuala Ignas` in both Korean rows. | High |
| `23957` | Naturalness / structure | English begins with `What is this...`, then asks whether she was caught making it, and ends with repeated astonishment. Korean reverses the question and reaction and omits the opening. Restore the source's progression and preserve the repeated reaction. | High |
| `33697` | Naturalness | `주술이 잘못된 사건` is awkward and unclear. Prefer a direct construction such as `주술이 실패한 일이 이번만은 아니야. 마법 자체가 변하고 있어.` | High |
| `34679`, `36563`, `44006` | Format | These rows name `Adept Ignas` but omit its English pairing, unlike other named references in the same quest. Align the displayed form, e.g. `숙련자 이그나스(Adept Ignas)`, while preserving each sentence's grammar. | Medium-high |
| `7472` | Format / terminology | The three artifact names are inconsistently paired as `Storm Stone`, `Sun`, and `Frost stones`. Use the complete, consistently capitalized item names: `폭풍석(Storm Stone)`, `태양석(Sun Stone)`, and `서리석(Frost Stone)`. | High |
| `7484`, `14746` | Format | `Savant Engar` is not paired with its English form in these rows, while the same asset includes the paired form elsewhere. Align to `사반트 엥가르(Savant Engar)`. | High |
| `23301` | Naturalness | `고집스럽게 휘지도 않지만` is awkward for the reed image. Rephrase to convey a rigid reed that resists bending but will soon break, preserving the metaphor. | Medium-high |
| `28527` | Meaning / naturalness | `That was bracing!` can mean invigorating or refreshing; `속이 다 시원하군` leans toward relief. Reconsider a short reaction closer to `상쾌하군` or another context-appropriate expression. | Medium |
| `42003` | Naturalness | `여기까지 널 이끌 수 있어 자랑스럽다` is grammatically awkward for `I am proud to have guided you this far`. Consider `널 여기까지 이끌어 올 수 있어 자랑스럽다` or an equally natural equivalent. | Medium-high |
| `59011` | Meaning / naturalness | Korean adds `상징` to the comparison among this place, lightning, Aodh, and fire. The English, Japanese, and Chinese state a direct analogy. Remove the unsupported “symbol” wording while keeping the analogy clear. | High |
| `61254` | Speech level / naturalness | `요점만 말하게` uses a stiff `하게체`, unlike the direct imperative in Japanese `要点を言ってくれ`. Consider a plain conversational command while retaining the address to the old man. | High |
| `3373`, `54432`, `61419` | Format / terminology | The parenthetical creature name appears as lowercase `banshaen`, unlike the established `Banshaen` form elsewhere in the same asset. Standardize the English pairing's capitalization. | High |
| `54432` | Meaning / terminology | `bag any banshaen` is rendered `밴션을 잡다`, which can imply capture. Adjacent lines use `처치` for the same hunt; prefer that established action if the quest objective is killing them. | Medium-high |
| `61419` | Meaning / naturalness | `파괴해야겠다` is used for finding and destroying living Banshaen. The same asset consistently renders killing or defeating these creatures as `처치`; align the final action to `처치해야겠다`. | High |

## Evidence-Limited Holds

| ID | Question | Reason and disposition |
| ---: | --- | --- |
| `32868` | `They were the only things we never found.` | English, Chinese, and Korean agree, but Japanese instead says reality was filled with other things. The current Korean follows English; retain it provisionally and do not infer the missing antecedent. |
| `48311` | `We didn't.` | The English fragment, Japanese line (`だが期待は破れた`), and Chinese line disagree in subject or meaning. Korean follows English, but the missing antecedent prevents a safe adjudication. |
| `57574` | `energies of air and light` | English says `air`, Japanese says `風` (wind), and Chinese uses `气`. Korean `공기` follows English, but the intended elemental term is not established by this asset. |

## Retained Text and Repeated Lines

Other reviewed lines were retained after source comparison. Repeated English
greetings, farewells, quest-status labels, and dialogue lines were compared
across all four languages; no Korean mismatch was found among those groups.
Where a source fragment depended on unavailable prior dialogue, no speaker,
referent, or continuation was invented.

## Complete ID Sets

- `425982.quest_bxml`: `3863`, `8152`, `13028`, `16599`, `16875`, `20036`,
  `24568`, `32868`, `34833`, `36151`, `38632`, `47488`, `48311`, `49513`,
  `49567`, `51894`, `52744`, `53312`, `55258`, `63031`
- `449611.quest_bxml`: `1375`, `2746`, `7892`, `11807`, `18619`, `19609`,
  `30527`, `33554`, `40779`, `41532`, `41995`, `47471`, `53538`, `58347`,
  `59702`, `61838`, `64045`
- `461580.quest_bxml`: `774`, `818`, `4002`, `4668`, `5189`, `6212`, `6244`,
  `9144`, `10008`, `12890`, `14374`, `14690`, `14872`, `15138`, `15481`,
  `16778`, `17220`, `17677`, `18266`, `18347`, `22170`, `22786`, `23957`,
  `24927`, `25778`, `26985`, `27045`, `27200`, `27338`, `28566`, `28716`,
  `30826`, `30828`, `33017`, `33261`, `33697`, `34270`, `34632`, `34679`,
  `36563`, `38420`, `39416`, `44006`, `45719`, `47077`, `48876`, `49990`,
  `50066`, `51215`, `51417`, `51983`, `54931`, `55864`, `56812`, `56886`,
  `57046`, `57309`, `61729`, `63898`
- `484880.quest_bxml`: `496`, `1504`, `1507`, `5551`, `7472`, `7484`, `8255`,
  `8497`, `8679`, `8857`, `9506`, `9615`, `14746`, `15109`, `16873`, `20990`,
  `21132`, `22071`, `22886`, `23301`, `24292`, `26628`, `27088`, `28077`,
  `28527`, `29161`, `29237`, `30561`, `32234`, `34050`, `34381`, `40216`,
  `40947`, `41563`, `42003`, `42124`, `43002`, `43366`, `43822`, `45194`,
  `45327`, `45820`, `46863`, `47391`, `52800`, `53395`, `54677`, `57574`,
  `58142`, `59011`, `60287`, `61028`, `61254`, `61266`, `62234`, `64378`,
  `64886`
- `508141.quest_bxml`: `3373`, `3516`, `12394`, `13643`, `14027`, `14276`,
  `16444`, `17678`, `18689`, `20177`, `22288`, `23764`, `30505`, `30553`,
  `30781`, `32263`, `32805`, `32928`, `35314`, `36173`, `37009`, `37433`,
  `39332`, `39624`, `41110`, `42433`, `44445`, `45136`, `49224`, `51737`,
  `51881`, `52210`, `54432`, `54549`, `56338`, `57143`, `58537`, `58641`,
  `58918`, `60069`, `61419`, `63684`, `64569`

All 196 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
The ledger records unresolved speaker attribution and playback order as
unknown where the asset evidence does not establish them.
