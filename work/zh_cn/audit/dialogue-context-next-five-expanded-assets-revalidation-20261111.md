# Next Five Expanded Asset Revalidations

- Date: 2026-11-11.
- Scope: all 224 unique `default` IDs linked to five previously unrecorded
  assets.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Four correction candidates and one evidence-limited hold are recorded.
  The active Korean translation CSV was not changed.

## Grouping Evidence and Limits

`1862841.quest_bxml` has 44 matched IDs and 34 serialized dialogue handlers
with the `NQD_Orbocant` prefix. Its text includes the Orbocant lower hall and
other location/system references. It has no explicit `QUEST_ID` or NPC
symbol. The handler prefix does not map localization keys to speakers or
playback order.

`1962117.quest_bxml` has 44 matched IDs, explicit quest ID `DLC1_SQ08`, and
two NPC symbols, `DLC1_NPC_GAL_VAR_AsaArding` and
`DLC1_NPC_GAL_VAR_ThorirArding`. Its 31 serialized dialogue handlers use the
`DLC1_SQ05` prefix, which conflicts with the explicit quest ID. The asset
contains the Tari Holstig / Scion revenge story, but its keys are not mapped
to individual speakers, turns, or branches. The NPC symbols were initially
missed because the catalog extractor recognized `NPC_...` but not the
`DLC1_NPC_...` spelling. The extractor now recognizes DLC-number-prefixed
NPC symbols; a regression test covers the observed form.

`1272546.quest_bxml` has 45 matched IDs, explicit quest ID `SQ88`, three NPC
symbols (`NPC_ADE_ALM_DriadoreSele`, `NPC_ADE_VAR_ReneritVale`, and
`NPC_DET_ALM_Abblier`), and 15 dialogue handlers. The keys concern the
Adessa merchant-donation petition. This is a multi-NPC asset, not a
per-key speaker map.

`734524.quest_bxml` has 45 matched IDs and 15 serialized dialogue handlers
with the `FFQ21` prefix. Its text concerns Lanus Davril's vial research. It
has no explicit `QUEST_ID` or NPC symbol; the prefix and topic do not map
individual keys to a speaker or dialogue position.

`1386000.quest_bxml` has 46 matched IDs and 16 serialized dialogue handlers
with the `SQ115` prefix. Its text concerns Aloff and the Chernobog hunt. It
has no explicit `QUEST_ID` or NPC symbol; the prefix and topic do not map
individual keys to speakers or playback order.

All 224 rows were compared across English, Japanese, Chinese, and active
Korean. The exact-English duplicate groups within this set are
`11610`/`14262`, `33742`/`35336`, `24953`/`38031`,
`25662`/`27290`/`31044`, `27997`/`30770`, `45613`/`55326`, and
`53270`/`61029`; their Korean translations already match. None of the four
language rows in this set contains an embedded line break, runtime variable,
or markup token.

The five assets contribute 224 distinct IDs, none already in the review
ledger and none linked to another quest asset. Asset membership, quest IDs,
NPC symbols, and handler prefixes are not treated as proof of per-key speaker
or playback order.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `47426` | Naturalness | `They must still, hm! be paid for, I'm afraid. But please! Have a look for yourself.` is rendered with several literal breaks in flow (`돈은 내셔야 해요, 흠! 하지만 어서요!`). Japanese smooths this to “not free, but please take a look.” Consider a more natural single-flow line such as `공짜는 아니지만, 편하게 둘러보세요!`, preserving the vendor's invitation without assigning a speaker. | Medium |
| `13438` | Meaning / naturalness | `on my hunt for Chernobog` means during the search/hunt, while `쫓느라` can imply that killing many was merely a consequence of chasing him. Consider `체르노보그(Chernobog)를 찾는 동안 많은 이를 처치했어.` The object of `many` remains unspecified rather than inventing a creature type. | Medium |
| `24661` | Meaning / terminology | English `pedestal`, Japanese `台座`, and Chinese `基座` refer to a stand or pedestal; the Korean `제단` adds an altar. The same asset's related objective at `59675` uses `받침대`. Consider `받침대` here as well. | High |
| `52525` | Naturalness | `turn in my vials` / Japanese `薬瓶を渡したい` is rendered `약병을 제출하고 싶어요`, which is understandable but sounds bureaucratic for a spoken handover. Consider `약병을 건네고 싶어요.` The exact speaker and dialogue stage are not established, so this remains a wording candidate, not a register correction. | Medium |

## Evidence-Limited Hold

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `22285` | Meaning | English `deserves a reckoning` and Japanese `報いを受けるにふさわしい` support a reckoning or retribution reading, while Chinese says the warrior deserves admiration. Keep the Korean `응보` wording provisional; the cross-language evidence does not settle the intended nuance. |

## Complete Newly Reviewed ID Sets

- `1862841.quest_bxml` (44 IDs): `1156`, `2192`, `2477`, `3112`, `3738`,
  `5175`, `6814`, `7699`, `10005`, `10269`, `11610`, `13958`, `14262`,
  `14281`, `15067`, `17758`, `26254`, `26445`, `29232`, `30393`, `33349`,
  `33742`, `35336`, `35516`, `37472`, `41611`, `43986`, `46287`, `46558`,
  `47426`, `48115`, `50296`, `51664`, `53225`, `53238`, `54920`, `56868`,
  `57420`, `58136`, `58897`, `59146`, `59378`, `60629`, `60663`.
- `1962117.quest_bxml` (44 IDs): `1567`, `1966`, `3382`, `3951`, `6886`,
  `7175`, `7867`, `10505`, `14765`, `15541`, `16398`, `19343`, `21285`,
  `22378`, `22831`, `23807`, `25183`, `25363`, `27227`, `29321`, `29787`,
  `30120`, `31190`, `31729`, `36726`, `37134`, `38021`, `38051`, `41717`,
  `44192`, `45666`, `49877`, `50324`, `50366`, `50620`, `51319`, `52167`,
  `53821`, `55228`, `58784`, `58887`, `62158`, `62522`, `64531`.
- `1272546.quest_bxml` (`SQ88`, 45 IDs): `2161`, `6923`, `16230`, `21793`,
  `24953`, `25662`, `27290`, `27997`, `28207`, `28580`, `30770`, `31044`,
  `31485`, `34426`, `34514`, `35354`, `35393`, `36657`, `38031`, `40601`,
  `42125`, `42262`, `43936`, `45211`, `45613`, `45655`, `45735`, `46904`,
  `49098`, `49121`, `49874`, `50410`, `53182`, `53270`, `53757`, `55008`,
  `55326`, `56602`, `59355`, `59491`, `61029`, `61831`, `62027`, `62554`,
  `63318`.
- `734524.quest_bxml` (`FFQ21` handler-prefix clue, 45 IDs): `991`, `1191`,
  `2057`, `3472`, `4391`, `5498`, `6945`, `8104`, `8193`, `9387`, `10950`,
  `11176`, `12315`, `13103`, `14437`, `16068`, `18866`, `20084`, `22241`,
  `23945`, `27394`, `27826`, `30188`, `30564`, `34612`, `35904`, `36260`,
  `37070`, `38288`, `39382`, `39751`, `42363`, `45271`, `47025`, `48257`,
  `51466`, `52525`, `53397`, `54522`, `55169`, `55905`, `56944`, `60604`,
  `60737`, `61666`.
- `1386000.quest_bxml` (`SQ115` handler-prefix clue, 46 IDs): `4163`, `8215`,
  `8627`, `9134`, `9732`, `11389`, `13196`, `13438`, `13454`, `14646`,
  `16385`, `16570`, `22285`, `22923`, `24059`, `24173`, `24360`, `24661`,
  `26326`, `26706`, `26861`, `27058`, `27510`, `28890`, `30256`, `34198`,
  `34367`, `41446`, `44051`, `47136`, `47566`, `47874`, `50687`, `51671`,
  `53553`, `55019`, `55379`, `56431`, `56466`, `56582`, `56734`, `58144`,
  `59025`, `59675`, `61705`, `63850`.

All 224 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
