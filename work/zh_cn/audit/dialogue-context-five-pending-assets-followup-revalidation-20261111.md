# Five Pending Asset Revalidations: Ulla Eklund, U04, Myrinne, Teeth of Naros, and Bogstaunch

- Date: 2026-11-11.
- Scope: 165 previously unrecorded `default` IDs across five quest assets,
  plus supplemental cross-reference `31283`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Thirty-three correction candidates and seven evidence-limited register holds
  were recorded. The supplemental urn-reference check remains on hold.
- No translation CSV or extracted game asset was changed.

## Grouping Evidence and Limits

`2606301.quest_bxml` has 32 matched keys but no extracted quest ID, NPC symbol,
or `dialog_line_*` handler. Its rows include dialogue-like text, a quest
objective, names, and other text; the asset alone does not identify a speaker
or conversation.

`667426.quest_bxml` has 32 matched keys and 12 handlers with a `U04` prefix,
but no explicit quest ID or NPC symbol. `1973951.quest_bxml` explicitly
identifies `DLC2_FFQ03` and has 17 handlers with that prefix, but no NPC
symbol. `1944007.quest_bxml` has 34 keys and 11 `DLC2_SQ06`-prefixed handlers,
without an explicit quest ID or NPC symbol. `750161.quest_bxml` has 34 keys
and 14 `FFQ29`-prefixed handlers, likewise without explicit quest or NPC
symbols. Prefixes and asset membership support only conservative quest/topic
grouping; they do not map an individual key to a speaker, handler, branch, or
playback position. Speaker attribution and dialogue order remain unknown.

The reviewed rows include dialogue, objectives, quest journals, names, and
status text. Asset membership does not mean that every row is dialogue or
belongs to a single conversation.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `3641`, `6103`, `8606`, `13943`, `14353`, `14961`, `16943`, `18560`, `21321`, `31024`, `33357`, `36916`, `46083`, `51124`, `52135`, `53859`, `54630`, `59576` | Terminology | The same Teeth of Naros quest urns are rendered as `유골함`, `항아리`, and `단지`. These vessels contain ashes; Japanese consistently uses `骨壷`, and Chinese uses ash-urn terms. Use `유골함` consistently for these quest-specific urns, adapting particles and sentence grammar. This does not standardize unrelated generic pottery or urn references. | High |
| `54630` | Naturalness | `take hold of the beasts for ill` is rendered as the awkward `짐승들을 사악한 목적으로 지배`. The Japanese describes the beasts becoming vicious; the Chinese describes their being controlled to do evil. Rephrase to convey the dark magic corrupting or turning the beasts toward evil without adding a more specific effect. | Medium-high |
| `18876` | Objective form | `Collect Preordained Talismans` is `예정된 자들(Preordained)의 부적 수집`, unlike the established action-form objectives. Consider `예정된 자들(Preordained)의 부적 수집하기`. | High |
| `19022`, `34029` | Naturalness / terminology | `숙청` is used for a culling and for purging Marauders. Japanese uses `排除`, and Chinese uses removal/clearing; `숙청` sounds political and unnatural for this hostile group. Use a context-appropriate form such as `소탕` or `제거` consistently. | High |
| `26554`, `45493`, `48783`, `57652`, `59579` | Name consistency / format | English itself alternates between `Myrinne` (`26554`, `59579`) and `Myrrine` (`45493`, `48783`, `57652`); Japanese consistently uses `マーリネ`. Korean alternates between `미린느`, `미린`, and unpaired short references. Use one Korean rendering, `미린느`, and retain the exact English spelling from each corresponding source row in parentheses. | High |
| `49876` | Speech level / naturalness | `부탁이야. ... 도와줄 수 있겠나?` shifts from conversational plain speech to a stiff `-겠나` ending within one line; Japanese remains conversational. Use a consistent conversational question, such as `도와줄 수 있어?`. | High |
| `21761`, `25742`, `26070`, `55961`, `57195` | Meaning / terminology | In the Bogstaunch quest, `crew` refers to five individual new recruits/deserters, not naval crews or five squads: Japanese specifies five people, and Chinese also describes five recruits. Korean varies among `다섯 분대`, `선원단마다`, `다섯 팀`, `다섯 부대`, and `다섯 무리`. Render the count as five recruits and `each crew` as each recruit; `50828` (`신병 다섯 명`) is a useful in-group comparator. | High |
| `14337` | Objective form | `Hunt the deserters` is `탈영병 사냥`; align the objective with the established `-하기` form, e.g. `탈영병 사냥하기`. | High |

## Evidence-Limited Holds

| ID(s) | Question | Evidence and disposition |
| --- | --- | --- |
| `16437` | Greeting register | English is service-oriented and Japanese is casual, while Korean uses polite `-요`. No NPC or key-to-handler mapping establishes whether this is a deliberate customer-service register. Retain pending speaker/scene evidence. |
| `13448`, `13625`, `29516`, `45477`, `49380`, `53861` | Register consistency | The asset contains polite, plain, and old-fashioned Korean forms for lines that may belong to the same quest-giver, while it has no NPC symbol or per-key handler mapping. Japanese provides some contrasting style evidence, but the keys cannot be tied to one speaker. Do not label these as confirmed voice errors or normalize them without stronger mapping. |
| `31283` (supplemental; not among the 165 asset-linked IDs) | Whether the urns are the same objects | The journal entry also describes the Trolls of the Teeth carrying ancient urns, but has no exact quest-asset link and does not say that they contain ashes. Japanese uses a generic pot term, while Chinese diverges from the English and Japanese object. Korean `항아리` follows the English/Japanese evidence; retain pending proof that these are the same ash-filled urns as the `DLC2_SQ06` quest objects. |

## Retained and Repeated Text

Five exact-English duplicate groups occur within the 165 asset-linked IDs:

- `Quest Complete`: `11925`, `61866`
- `Quest Failed`: `14085`, `36718`, `48062`
- `I have Talismans to sell.`: `17235`, `61141`
- `I have some totems for you.`: `28977`, `31156`
- `And you... you have earned your reward. Your death will be swift.`: `29286`, `56753`

The Korean translations match within all five groups. `The Light of Day` at
`25753` also matches `9630` in English, Japanese, Chinese, and Korean; its
current `한낮의 빛` was retained. The Rose Court, Onyx Tower, Dominus, and
Magister forms are consistent across `24342`, `31825`, and `45092`.
Line-break counts and runtime-token sequences match across all four languages
for the 165 asset-linked IDs.

## Complete ID Sets

- `1944007.quest_bxml` (34): `2964`, `3641`, `5970`, `6103`, `8606`,
  `13040`, `13260`, `13943`, `14085`, `14353`, `14961`, `16943`, `18560`,
  `21321`, `25593`, `31024`, `31474`, `33357`, `36003`, `36766`, `36916`,
  `37276`, `40224`, `46083`, `51124`, `52135`, `53859`, `53865`, `54097`,
  `54630`, `54826`, `59576`, `61866`, `63634`
- `1973951.quest_bxml` (33): `2514`, `4381`, `7184`, `7347`, `11715`,
  `13448`, `13625`, `19022`, `19748`, `21165`, `25854`, `26554`, `28977`,
  `29516`, `30789`, `31156`, `34029`, `34931`, `36901`, `44630`, `45477`,
  `48062`, `48783`, `49244`, `49380`, `49855`, `49876`, `50300`, `50481`,
  `53861`, `58460`, `59579`, `63037`
- `2606301.quest_bxml` (32): `3142`, `4430`, `5376`, `7713`, `8383`,
  `10819`, `14254`, `15422`, `16437`, `17235`, `18876`, `24386`, `26355`,
  `31659`, `31856`, `34674`, `36457`, `41998`, `42328`, `43636`, `45725`,
  `46266`, `46597`, `49203`, `50160`, `51150`, `54392`, `54447`, `56280`,
  `60105`, `61141`, `61976`
- `667426.quest_bxml` (32): `755`, `1788`, `5613`, `6704`, `7820`, `8402`,
  `9000`, `10334`, `13989`, `15946`, `19061`, `22207`, `23444`, `24342`,
  `25753`, `29286`, `31825`, `33165`, `34382`, `35361`, `41552`, `45092`,
  `45646`, `51581`, `52097`, `53770`, `56753`, `57018`, `59106`, `61302`,
  `62599`, `64422`
- `750161.quest_bxml` (34): `7354`, `11615`, `11925`, `13278`, `14337`,
  `15794`, `16023`, `17974`, `19936`, `21761`, `25742`, `26070`, `27410`,
  `29827`, `31100`, `35108`, `36718`, `37922`, `40965`, `41798`, `43212`,
  `50409`, `50820`, `50828`, `50938`, `51185`, `53089`, `55961`, `56996`,
  `57195`, `57477`, `57722`, `63133`, `64464`

All 165 asset-linked IDs and the supplemental ID `31283` have four-language
fingerprints in [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
Proposed changes remain review findings and have not been applied.
