# Dialogue Context Group Index and Revalidation

- Date: 2026-11-10.
- Scope: reverse-map metadata and expanded character/quest revalidation.
- The active Korean CSV contains only scoped changes documented in the linked
  reports; source CSVs and extracted game assets remain unchanged.
- English controls meaning; Japanese is the primary style/register reference;
  Chinese is supporting evidence.
- The maintainable index and per-ID review ledger are described in
  [`dialogue-context-metadata.md`](dialogue-context-metadata.md).

## Reverse-Mapping Results

The `default` row ID indexes an 8-byte key in
`src/csv/en_us/estrutura_hashes_flat.bin`. A byte-window scan of the extracted
quest, interaction, and FaceFX quest resources found:

- 51,080 of 65,135 unique `default` keys in 426 of 530 `quest_bxml` assets.
- 1,257 matched keys occur in more than one quest asset.
- No exact `default` key matches in the 517 interaction or 53 FaceFX quest
  assets scanned.
- 282 key-containing quest assets have no `NPC_` symbol. A quest-asset match
  establishes resource association, not dialogue status or speaker identity.

The following 56 assets meet a stronger discovery filter: at least one
localization key, exactly one distinct `NPC_` symbol, exactly one distinct
`QUEST_ID` value, and at least one `dialog_line_*` handler. This makes them
high-priority character/quest grouping candidates, not proof that every
matched key is spoken by that NPC. The localization keys still have not been
mapped one-to-one to dialogue callbacks.

| Asset | Quest | NPC symbol | Matched IDs | Dialog handlers |
| --- | --- | --- | ---: | ---: |
| `1164038.quest_bxml` | `FFQ35` | `NPC_DAL_LJO_MenriTogh` | 56 | 17 |
| `1272538.quest_bxml` | `SQ87` | `NPC_DET_ALM_Abblier` | 22 | 9 |
| `1297481.quest_bxml` | `SQ79` | `NPC_POE_SEE_Terenia` | 44 | 17 |
| `1310265.quest_bxml` | `SQ102` | `NPC_ALA_UNS_Aluck` | 58 | 23 |
| `1310335.quest_bxml` | `SQ93` | `NPC_YSA_SEE_Nomeron` | 55 | 24 |
| `1313479.quest_bxml` | `SQ100` | `NPC_ALA_UNS_Esha` | 97 | 55 |
| `1332203.quest_bxml` | `SQ108` | `NPC_DET_GNO_DecanusPaige` | 128 | 64 |
| `1388321.quest_bxml` | `SQ116` | `NPC_KLU_DOK_DrewnAnsilla` | 60 | 20 |
| `1388507.quest_bxml` | `SQ117` | `NPC_KLU_UNS_Malthon` | 42 | 13 |
| `1388540.quest_bxml` | `SQ118` | `NPC_KLU_DOK_ZanvilWhit` | 51 | 17 |
| `1388542.quest_bxml` | `FFQ116` | `NPC_KLU_ALM_KregerCoil` | 28 | 12 |
| `1485448.quest_bxml` | `SQ126` | `NPC_YSA_ALM_GwennaHand` | 111 | 41 |
| `1491990.quest_bxml` | `FFQ60` | `NPC_YSA_LJO_BritCodgan` | 40 | 20 |
| `1507672.quest_bxml` | `FFQ64` | `NPC_DAL_ALM_AgraivinHand` | 23 | 12 |
| `1511548.quest_bxml` | `FFQ66` | `NPC_KLU_Alm_HarrisetDonel` | 33 | 15 |
| `1511550.quest_bxml` | `FFQ67` | `NPC_POE_LJO_VulgarDonnoh` | 27 | 13 |
| `1565116.quest_bxml` | `SQ80` | `NPC_ALA_VAR_GoremKane` | 36 | 16 |
| `1573776.quest_bxml` | `FFQ71` | `NPC_MQ_UNS_Knave` | 34 | 13 |
| `1576008.quest_bxml` | `SQ140` | `NPC_DET_LJO_ColmAlba` | 76 | 25 |
| `1577269.quest_bxml` | `SQ143` | `NPC_DET_VAR_HreidAmlethoe` | 90 | 35 |
| `1583001.quest_bxml` | `SQ131` | `NPC_KLU_DOK_BronwenSenn` | 80 | 29 |
| `1610759.quest_bxml` | `SQ145` | `NPC_POE_LJO_LilaJanick` | 38 | 18 |
| `1621030.quest_bxml` | `SQ68` | `NPC_KLU_UNS_SQ68_Liordran` | 40 | 24 |
| `1621227.quest_bxml` | `TRSQ01` | `NPC_DAL_VAR_GunnarFrode` | 172 | 61 |
| `1633037.quest_bxml` | `TRSQ02` | `NPC_KLU_Ljo_MaireGanan` | 110 | 40 |
| `1637499.quest_bxml` | `SQ150` | `NPC_DET_LJO_LinaArdeen` | 61 | 22 |
| `1800351.quest_bxml` | `SASQ01` | `NPC_POE_DOK_IdrisTheonen` | 68 | 19 |
| `1800355.quest_bxml` | `SASQ02` | `NPC_POE_GNO_TelemachusRasp` | 31 | 10 |
| `1800357.quest_bxml` | `SASQ03` | `NPC_DAL_GNO_JorumQuintus` | 68 | 23 |
| `361668.quest_bxml` | `M0_SQ06` | `NPC_POE_VAR_AskelThorin` | 193 | 51 |
| `438799.quest_bxml` | `SQ01` | `NPC_SQ01_StrangePrisoner` | 71 | 28 |
| `441938.quest_bxml` | `SQ02` | `NPC_POE_ALM_KellsCafferty` | 213 | 85 |
| `457008.quest_bxml` | `TR01` | `NPC_DAL_GNO_CenturionGastet` | 119 | 50 |
| `457589.quest_bxml` | `HM01` | `NPC_DAL_SEE_Green` | 216 | 155 |
| `467727.quest_bxml` | `KV03` | `NPC_OstOrdura` | 96 | 47 |
| `467744.quest_bxml` | `TR03` | `NPC_ADE_GNO_ElorenCriet` | 104 | 35 |
| `494374.quest_bxml` | `TR06` | `NPC_DAL_Alm_GrimOnwig` | 97 | 23 |
| `495487.quest_bxml` | `FFQ03` | `NPC_DAL_VAR_MurdocHain` | 41 | 16 |
| `501659.quest_bxml` | `KV07` | `NPC_GwynAnwy` | 129 | 58 |
| `540798.quest_bxml` | `KVSQ02` | `NPC_KV10_Khamazandu` | 59 | 28 |
| `545970.quest_bxml` | `HP02` | `NPC_POE_DOK_ErionRaff` | 84 | 37 |
| `563881.quest_bxml` | `MQ05` | `NPC_DAL_SEE_Glianal` | 332 | 136 |
| `588388.quest_bxml` | `SQ54` | `NPC_DET_ALM_Beorn` | 114 | 46 |
| `589911.quest_bxml` | `MQ09` | `NPC_MQ_LJO_GeneralTilera` | 154 | 54 |
| `589924.quest_bxml` | `MQ14` | `NPC_MQ_UNS_Cydan` | 192 | 96 |
| `591256.quest_bxml` | `SQ59` | `NPC_ADE_GNO_FerideOuet` | 191 | 57 |
| `592526.quest_bxml` | `SQ53` | `NPC_DET_ALM_AetillAlgar` | 131 | 58 |
| `593901.quest_bxml` | `SQ58` | `NPC_DET_DOK_ParwenWell` | 92 | 33 |
| `597592.quest_bxml` | `SQ55` | `NPC_DET_SEE_Aergase` | 154 | 57 |
| `611596.quest_bxml` | `SQ69` | `NPC_ALA_LJO_CaptainKeloran` | 82 | 29 |
| `613083.quest_bxml` | `MQ01` | `NPC_MQ_GNO_Encel` | 267 | 188 |
| `616680.quest_bxml` | `U03` | `NPC_DAL_ALM_ThaddeusHoln` | 82 | 32 |
| `695918.quest_bxml` | `SQ15` | `NPC_DAL_STR_EnconegHoln_2` | 47 | 20 |
| `710527.quest_bxml` | `FFQ17` | `NPC_POE_ALM_ElrodEdman` | 91 | 43 |
| `747929.quest_bxml` | `FFQ26` | `NPC_DET_GNO_RuinImas` | 39 | 14 |
| `756361.quest_bxml` | `FFQ80` | `NPC_DET_VAR_BeraGrastar` | 17 | 6 |

The previously reviewed Brio `SQ81` asset is a separate, multi-NPC case and
remains documented in
[`dialogue-context-regroup-and-review-20261110.md`](dialogue-context-regroup-and-review-20261110.md).

## Sixth Expanded Group: Vulgar Donnoh / `FFQ67`

`1511550.quest_bxml` contains 27 distinct localization keys, `QUEST_ID FFQ67`,
the asset-level symbol `NPC_POE_LJO_VulgarDonnoh`, a `PLAYER` symbol, item
count checks for peasant clothing, and 13 serialized `dialog_line_*`
handlers. Content separates 19 dialogue-like strings from eight journal,
objective, or UI rows. A bounded search found all seven English
`peasant clothes` occurrences in this group. Six correction findings were
recorded, with no CSV edit applied. See
[`dialogue-context-ffq67-revalidation-20261110.md`](dialogue-context-ffq67-revalidation-20261110.md).

## Seventh Expanded Group: Kreger the Devout / `FFQ116`

`1388542.quest_bxml` contains 28 distinct localization keys, `QUEST_ID
FFQ116`, the asset-level symbol `NPC_KLU_ALM_KregerCoil`, two quest-target
handlers, and 12 serialized `dialog_line_*` handlers. The quest concerns
recovering Alfar soldiers' earrings from the Midden and counting the dead.
Content separates 22 dialogue-like or player-choice strings from six
objective, item/UI, journal, or title strings. ID `47022` explicitly
self-identifies Kreger; the asset symbol does not map the other keys to him
or to individual callbacks.

All 28 rows were reviewed in English, Japanese, Chinese, and active Korean.
One objective-form correction candidate was recorded at ID `10918`; no CSV
edit was applied. Details and the full ID list are in
[`dialogue-context-ffq116-revalidation-20261110.md`](dialogue-context-ffq116-revalidation-20261110.md).

## Eighth Expanded Group: Gwenna Hand / `SQ126`

`1485448.quest_bxml` contains 111 distinct localization keys, `QUEST_ID
SQ126`, the asset-level symbol `NPC_YSA_ALM_GwennaHand`, 15 quest-target
handlers, and 41 serialized `dialog_line_*` handlers. The asset covers the
Varani plot against Ysa, coded daggers, and assassination choices involving
Ambassadors Keen and Brenner. The single NPC symbol does not establish that
every key belongs to Gwenna, and no key has been mapped to an individual
dialogue callback.

All 111 rows were reviewed against English, Japanese, Chinese, and active
Korean. Ten fully duplicated English-string groups already have identical
Korean text. The grouped pass recorded 18 consistency/translation candidates
and one unresolved location-reference case, including repeated English
sentences that had been translated differently. No Korean CSV was changed.
See [`dialogue-context-sq126-revalidation-20261110.md`](dialogue-context-sq126-revalidation-20261110.md)
for the proposals and evidence.

## Ninth Expanded Group: Menri Togh / `FFQ35`

`1164038.quest_bxml` contains 56 distinct localization keys, `QUEST_ID
FFQ35`, the asset-level symbol `NPC_DAL_LJO_MenriTogh`, and 17 serialized
`dialog_line_*` handlers. The quest concerns Menri's family farm, the spider
attacks, and Cartery Jayck's murder of the Toghs. The NPC symbol does not map
each localization key to Menri or to an individual callback.

All 56 rows were reviewed against English, Japanese, Chinese, and active
Korean. Six correction/consistency candidates and one uncertain register case
were recorded. The duplicated journal sentences at `5313` and `53623` are
proposed for alignment; the earlier source-based reading of `5313`'s
deliberately contradictory final clause remains unchanged. No Korean CSV was
changed. See
[`dialogue-context-ffq35-revalidation-20261110.md`](dialogue-context-ffq35-revalidation-20261110.md).

## Tenth Expanded Group: Terenia / `SQ79`

`1297481.quest_bxml` contains 44 distinct localization keys, `QUEST_ID
SQ79`, the asset-level symbol `NPC_POE_SEE_Terenia`, three quest-target
handlers, and 17 serialized `dialog_line_*` handlers. The quest concerns the
Cradle of Summer barrier, the Wild Fae incursion, and magical sources and
Lorestones. The NPC symbol does not map each localization key to Terenia or
to an individual callback.

All 44 rows were reviewed against English, Japanese, Chinese, and active
Korean. Five correction candidates and two uncertain findings were recorded;
no Korean CSV was changed. The unresolved `Font` reading and the phrase
`alight on the surface` remain explicitly held. See
[`dialogue-context-sq79-revalidation-20261110.md`](dialogue-context-sq79-revalidation-20261110.md).

## Eleventh Expanded Group: Aluck's Quest / `SQ102`

`1310265.quest_bxml` contains 58 distinct localization keys, `QUEST_ID
SQ102`, the asset-level symbol `NPC_ALA_UNS_Aluck`, and 23 serialized
`dialog_line_*` handlers. Its text concerns Aluck, the Ashmoor survivors,
Gask, and the Cadsymyr camp in Twilight Pass. The asset association does not
map any individual key to a speaker, callback, branch, or playback position.

All 58 rows were revalidated against English, Japanese, Chinese, and active
Korean. Eleven findings were recorded: ten correction candidates and one
sentence-level hold at `17207`, where only the separate name-spelling issue
is proposed. All four-language rows lack embedded line breaks, runtime
placeholders, and markup. No translation CSV was changed. See
[`dialogue-context-sq102-revalidation-20261110.md`](dialogue-context-sq102-revalidation-20261110.md).

## Twelfth Expanded Group: Nomeron / `SQ93`

`1310335.quest_bxml` contains 55 distinct localization keys, `QUEST_ID SQ93`,
the asset-level symbol `NPC_YSA_SEE_Nomeron`, and 24 serialized
`dialog_line_*` handlers. Its text concerns the Font's waning flow, the Water
Lock, the Sacred Pools, and the Gardens of Ysa. The key matches do not map
individual rows to Nomeron, callbacks, branches, or playback order.

All 55 rows were revalidated against English, Japanese, Chinese, and active
Korean. Seventeen correction candidates and five unresolved findings were
recorded, including term consistency for the Font and Sacred Pools, a mixed
speech-level line, and one incomplete Korean sentence ending. Prior holds on
the omen phrase, king address, Fontmaster title, and Font's yield were
preserved. IDs `32258` and `39530` were not included because their key matches
belong to other assets. No translation CSV or extracted asset was changed.
See [`dialogue-context-sq93-revalidation-20261110.md`](dialogue-context-sq93-revalidation-20261110.md)
for the full evidence and ID list.

## Thirteenth Expanded Group: Esha / `SQ100`

`1313479.quest_bxml` contains 97 distinct localization keys, `QUEST_ID
SQ100`, the asset-level symbol `NPC_ALA_UNS_Esha`, and 55 serialized
`dialog_line_*` handlers. The text concerns Esha, Bareth's research into the
murghan, the Eventide and Ashmoor survivors, Gask, and Twilight Pass.

All 97 rows were revalidated against English, Japanese, Chinese, and active
Korean. Five correction candidates and one unresolved finding were recorded;
the exact-English duplicate groups have identical Korean text. No translation
CSV was changed. Details and the full ID list are in
[`dialogue-context-sq100-revalidation-20261110.md`](dialogue-context-sq100-revalidation-20261110.md).

## Fourteenth Expanded Group: Decanus Paige / `SQ108`

`1332203.quest_bxml` contains 128 distinct localization keys, `QUEST_ID
SQ108`, the asset-level symbol `NPC_DET_GNO_DecanusPaige`, and 64 serialized
`dialog_line_*` handlers. The text concerns Orsinian Paige's plan around the
Jottun, Kobolds, and Tearscotter Mine, alongside journal entries, objectives,
labels, and player choices.

All 128 rows were revalidated against English, Japanese, Chinese, and active
Korean. Eleven correction candidates were recorded. Three exact-English
duplicate groups have identical Korean text, and all four locales are free of
embedded line breaks, runtime markers, and markup in these rows. No translation
CSV was changed. See
[`dialogue-context-sq108-revalidation-20261110.md`](dialogue-context-sq108-revalidation-20261110.md)
for the findings and full ID list.

## Fifteenth Expanded Group: Drewn Ansilla / `SQ116`

`1388321.quest_bxml` contains 60 distinct localization keys, `QUEST_ID
SQ116`, the asset-level symbol `NPC_KLU_DOK_DrewnAnsilla`, and 20 serialized
`dialog_line_*` handlers. Its text concerns Drewn's claim to the Caeled Coast,
the Seal of Ansilla and Verdant Blades, and Hillared Gastyr.

All 60 rows were revalidated against English, Japanese, Chinese, and active
Korean. Eleven correction candidates were recorded. Three exact-English
duplicate groups have identical Korean text, and all four locales are free of
embedded line breaks, runtime markers, and markup in these rows. No translation
CSV was changed. See
[`dialogue-context-sq116-revalidation-20261110.md`](dialogue-context-sq116-revalidation-20261110.md)
for the findings and full ID list.

## Sixteenth Expanded Group: Malthon / `SQ117`

`1388507.quest_bxml` contains 42 distinct localization keys, `QUEST_ID
SQ117`, the asset-level symbol `NPC_KLU_UNS_Malthon`, and 13 serialized
`dialog_line_*` handlers. Its text concerns Malthon's request to kill the
leanashe Meathgra and the danger posed by corpses in the Midden.

All 42 rows were revalidated against English, Japanese, Chinese, and active
Korean. Six correction candidates and one unresolved reference were recorded.
No exact-English duplicate groups occur; all four locales are free of
embedded line breaks, runtime markers, and markup in these rows. No translation
CSV was changed. See
[`dialogue-context-sq117-revalidation-20261110.md`](dialogue-context-sq117-revalidation-20261110.md)
for the findings and full ID list.

## Seventeenth Expanded Group: Zanvil Whit / `SQ118`

`1388540.quest_bxml` contains 51 distinct localization keys, `QUEST_ID
SQ118`, the asset-level symbol `NPC_KLU_DOK_ZanvilWhit`, and 17 serialized
`dialog_line_*` handlers. Its text concerns recovering reconnaissance carried
by the Alfar scout Venris and following his wolf in the Midden.

All 51 rows were revalidated against English, Japanese, Chinese, and active
Korean. Ten correction candidates were recorded. No exact-English duplicate
groups occur, and all four locales are free of embedded line breaks, runtime
markers, and markup in these rows. No translation CSV was changed. See
[`dialogue-context-sq118-revalidation-20261110.md`](dialogue-context-sq118-revalidation-20261110.md)
for the findings and full ID list.

## Eighteenth Expanded Group: Brit Codgan / `FFQ60`

`1491990.quest_bxml` contains 40 distinct localization keys, `QUEST_ID
FFQ60`, the asset-level symbol `NPC_YSA_LJO_BritCodgan`, the
`QuestItem_FFQ60_HonorBrand` symbol, and 20 serialized `dialog_line_*`
handlers. The text concerns Brit Codgan's counterfeit and authentic Honor
Brands, their components, and their sale in Ysa. The NPC symbol does not map
each key to Codgan or to an individual callback.

All 40 rows were revalidated against English, Japanese, Chinese, and active
Korean. The speech-level inconsistency at `18796` remains a correction
candidate. The nested duplicate English gloss at `64046` was corrected at the
user's request to `이사의 아너 브랜드(Ysa Honor Brands) 제작` and its ledger
fingerprint was refreshed. The exact-English duplicate group at `18415`,
`21735`, `23911`, and `26924` already has matching Korean. No embedded line
breaks, runtime markers, or markup were found. ID `8192` names Brit Hagni, a
separate person, and is not attributed to the asset-level NPC. See
[`dialogue-context-ffq60-revalidation-20261110.md`](dialogue-context-ffq60-revalidation-20261110.md)
for evidence and the full ID list.

## Nineteenth Expanded Group: Harriset Donnel / `FFQ66`

`1511548.quest_bxml` contains 33 distinct localization keys, `QUEST_ID
FFQ66`, the asset-level symbol `NPC_KLU_Alm_HarrisetDonel`, and 15 serialized
`dialog_line_*` handlers. Its text concerns Harriset's request for iron
components and his trade as a tinker. The NPC symbol does not map each key to
Harriset or to an individual callback.

All 33 rows were revalidated against English, Japanese, Chinese, and active
Korean. Four correction candidates were recorded for meaning (`4671`),
objective wording (`9682`), camp-name pairing (`10985`), and naturalness
(`58868`); the reading of `custom` at `64954` remains unresolved. No exact
English duplicates, embedded line breaks, runtime markers, or markup were
found. No translation CSV was changed. See
[`dialogue-context-ffq66-revalidation-20261110.md`](dialogue-context-ffq66-revalidation-20261110.md)
for evidence and the full ID list.

## Twentieth Expanded Group: Gorem Kane / `SQ80`

`1565116.quest_bxml` contains 36 distinct localization keys, the explicit
`QUEST_ID SQ80`, the asset-level symbol `NPC_ALA_VAR_GoremKane`, and 16
serialized `dialog_line_*` handlers. The text concerns mercenaries at
Moondown and Captain Canwen's request to clear Tuatha watchtowers on Shadow
Pass. All 36 rows were revalidated against English, Japanese, Chinese, and
active Korean. One terminology-consistency candidate was recorded at
`46715`; no translation CSV was changed.

The asset's handler names and the gold variable in `29785`/`32219` carry an
`SQ94` prefix despite the explicit `QUEST_ID SQ80`. The index retains the
explicit `SQ80` value; the discrepancy is recorded without assigning keys to
callbacks or inferring that either ID is wrong. Details and the full ID list
are in
[`dialogue-context-sq80-revalidation-20261110.md`](dialogue-context-sq80-revalidation-20261110.md).

## Twenty-First Expanded Group: Knave of Pride / `FFQ71`

`1573776.quest_bxml` contains 34 distinct localization keys, `QUEST_ID
FFQ71`, the asset-level symbol `NPC_MQ_UNS_Knave`, and 13 serialized
`dialog_line_*` handlers. Its text concerns the Knave of Pride, the Bolgan
Masters, and their control of Bolgan forces at High Fulgen. All 34 rows were
revalidated against English, Japanese, Chinese, and active Korean. Four
findings were recorded: two terminology/meaning candidates, one objective
form candidate, and missing English title pairings at `30902` and `35843`.
The exact-English duplicate `Hello.` at `19751`/`43113` already matches in
Korean. No translation CSV was changed. See
[`dialogue-context-ffq71-revalidation-20261110.md`](dialogue-context-ffq71-revalidation-20261110.md)
for evidence and the full ID list.

## Twenty-Second Expanded Group: Colm and Giran Alba / `SQ140`

`1576008.quest_bxml` contains 76 keys, `QUEST_ID SQ140`, the asset-level
symbol `NPC_DET_LJO_ColmAlba`, and 25 serialized `dialog_line_*` handlers.
The quest follows Colm's attempt to save his twin Giran from Belen's
Testament. The group includes dialogue, choices, objectives, journals, and
UI/debug text; the NPC symbol does not map each key to a speaker or callback.

All 76 rows were revalidated in English, Japanese, Chinese, and active Korean.
Twenty-seven correction-candidate IDs have been applied and rechecked. The
uncertain readings at `48067` and `62309` remain unchanged; the oath nuance at
`50834` remains unresolved after applying its separate faction-name pairing.
Four exact-English duplicate groups already match in Korean. No extracted
asset was changed. See
[`dialogue-context-sq140-revalidation-20261110.md`](dialogue-context-sq140-revalidation-20261110.md).

## Twenty-Third Expanded Group: Galette Treasure / `SQ143`

`1577269.quest_bxml` contains 90 keys, `QUEST_ID SQ143`, the asset-level
symbol `NPC_DET_VAR_HreidAmlethoe`, and 35 serialized `dialog_line_*`
handlers. The quest concerns Hreid's treasure hunt, his former crew, a
combination-locked door, and Belen's Testament. Its full-name source spelling
is `Hreid Amelthoe`; the asset symbol alone does not settle its relation to
the separately recorded `Hreid Amlethoe` spelling.

All 90 rows were revalidated in four languages. Thirty-four IDs have
correction candidates, and the conflicting east/west combination at
`1410`/`52945` remains unresolved. Three exact-English duplicate groups
already match in Korean. No translation CSV or extracted asset was changed.
See [`dialogue-context-sq143-revalidation-20261110.md`](dialogue-context-sq143-revalidation-20261110.md).

## Twenty-Fourth Expanded Group: Bronwen Senn Arena / `SQ131`

`1583001.quest_bxml` contains 80 keys, `QUEST_ID SQ131`, the asset-level
symbol `NPC_KLU_DOK_BronwenSenn`, and 29 serialized `dialog_line_*` handlers.
The group covers Alfar arena challenges, the First Sword title, and Bronwen's
sister Ragna. Individual speakers and callback links remain unmapped.

All 80 rows were revalidated in four languages. Twenty-six IDs have
correction-candidate IDs, including objective wording for nonlethal training
fights and row-local Korean register outliers; all 26 corrections were
applied and rechecked. Four exact-English duplicate pairs already match in
Korean. No extracted asset was changed.
See [`dialogue-context-sq131-revalidation-20261110.md`](dialogue-context-sq131-revalidation-20261110.md).

## Twenty-Fifth Expanded Group: Lila Janick / `SQ145`

`1610759.quest_bxml` contains 38 keys, `QUEST_ID SQ145`, the asset-level
symbol `NPC_POE_LJO_LilaJanick`, and 18 serialized `dialog_line_*` handlers.
Its subject is Lila's Sativa Fiber harvest and a spider nest, with dialogue,
choices, quest text, and objective labels mixed in the resource.

All 38 rows were revalidated in four languages. Nine IDs have correction
candidates and one reply/register case remains uncertain. Exact-English
duplicate groups already match in Korean. No Korean CSV or extracted asset
was changed. See
[`dialogue-context-sq145-revalidation-20261110.md`](dialogue-context-sq145-revalidation-20261110.md).

## Twenty-Sixth Expanded Group: Liordran-Associated War Context / `SQ68`

`1621030.quest_bxml` contains 40 keys, `QUEST_ID SQ68`, the asset-level
symbol `NPC_KLU_UNS_SQ68_Liordran`, and 24 serialized `dialog_line_*`
handlers. Both Liordran and Audra Firan appear in the rows, so the one scanned
NPC symbol is not treated as a complete speaker map.

All 40 rows were revalidated in four languages. Four IDs have correction
candidates, including a source-supported register mismatch and consistency
of the full `Greater Niskaru` type name. No Korean CSV or extracted asset was
changed. See
[`dialogue-context-sq68-revalidation-20261110.md`](dialogue-context-sq68-revalidation-20261110.md).

## Twenty-Seventh Expanded Group: Star Camp Initiation / `TRSQ01`

`1621227.quest_bxml` contains 172 keys, `QUEST_ID TRSQ01`, the asset-level
symbol `NPC_DAL_VAR_GunnarFrode`, and 61 serialized `dialog_line_*` handlers.
It combines Gunnar's Draug's Toothpicks sale, Crilgarin's Traveler initiation,
the Hierophant's shrine test, Ealfwig Grilricas, player choices, journals, and
objectives. It is explicitly treated as a multi-character resource, not 172
Gunnar lines.

All 172 rows were revalidated in English, Japanese, Chinese, and active Korean.
Ten IDs have correction candidates, including item terminology, address,
objective naturalness, and speech-level issues; two source/title readings
remain unresolved. Exact-English duplicate groups were checked and already
match in Korean. No Korean CSV or extracted asset was changed. See
[`dialogue-context-trsq01-revalidation-20261110.md`](dialogue-context-trsq01-revalidation-20261110.md).

## Twenty-Eighth Expanded Group: Moon Camp and Maire Ganan / `TRSQ02`

`1633037.quest_bxml` contains 110 keys, `QUEST_ID TRSQ02`, the asset-level
symbol `NPC_KLU_Ljo_MaireGanan`, and 40 serialized `dialog_line_*` handlers.
It covers the theft assignments at Moon Camp, Maire and Irion's relationship,
and the Wyvyrn-Gifre Great House. The resource also includes other named NPCs,
choices, journals, and objectives, so the Maire symbol is not treated as a
per-key speaker map.

All 110 rows were revalidated in English, Japanese, Chinese, and active
Korean. Nine IDs have correction candidates, including a duplicated item
gloss, a Great House/mansion distinction, and a speech-level mismatch; one
`shade` address remains unresolved. Both exact-English duplicate groups
already match in Korean. No Korean CSV or extracted asset was changed. See
[`dialogue-context-trsq02-revalidation-20261110.md`](dialogue-context-trsq02-revalidation-20261110.md).

## Twenty-Ninth Expanded Group: Lina Ardeen / `SQ150`

`1637499.quest_bxml` contains 61 keys, `QUEST_ID SQ150`, the asset-level
symbol `NPC_DET_LJO_LinaArdeen`, and 22 serialized `dialog_line_*` handlers.
The quest concerns Lina, the Travelers, Mayor Eswin, and a stolen document in
Whitestone. Dialogue, player choices, journals, objectives, and UI labels are
mixed; the asset symbol does not identify a speaker for every key or map keys
to callbacks or playback order.

All 61 rows were revalidated in English, Japanese, Chinese, and active Korean.
Four correction candidates and one unresolved English/Japanese meaning
conflict were recorded. No exact-English duplicate group occurs within this
asset. No Korean CSV or extracted asset was changed. See
[`dialogue-context-sq150-revalidation-20261110.md`](dialogue-context-sq150-revalidation-20261110.md).

## Thirtieth Expanded Group: Idris Theonen / `SASQ01`

`1800351.quest_bxml` contains 68 keys, `QUEST_ID SASQ01`, the asset-level
symbol `NPC_POE_DOK_IdrisTheonen`, and 19 serialized `dialog_line_*` handlers.
The text concerns the Omnibus Arcana study and examination at the Scholia
Arcana. Dialogue, player choices, book text, journals, objectives, and UI
labels are mixed; the asset symbol does not identify a speaker for every key
or map keys to callbacks or playback order.

All 68 rows were revalidated in English, Japanese, Chinese, and active Korean.
Eight correction candidates and one unresolved source reading were recorded.
Five exact-English duplicate groups already have identical Korean text. No
Korean CSV or extracted asset was changed. See
[`dialogue-context-sasq01-revalidation-20261110.md`](dialogue-context-sasq01-revalidation-20261110.md).

## Thirty-First Expanded Group: Telemachus Rasp / `SASQ02`

`1800355.quest_bxml` contains 31 keys, `QUEST_ID SASQ02`, the asset-level
symbol `NPC_POE_GNO_TelemachusRasp`, and ten serialized `dialog_line_*`
handlers. The quest concerns field research at Gloamthicket and a Banshaen
Priestess attacking Scholia Arcana initiates. Dialogue, player choices,
objectives, journal text, and UI labels are mixed; the asset symbol does not
identify a speaker for every key or map keys to callbacks or playback order.

All 31 rows were revalidated in English, Japanese, Chinese, and active Korean.
Six correction candidates were recorded, including a direct speech-level
mismatch and a place-type mistranslation. No exact-English duplicate group
occurs within this asset. No Korean CSV or extracted asset was changed. See
[`dialogue-context-sasq02-revalidation-20261110.md`](dialogue-context-sasq02-revalidation-20261110.md).

## Thirty-Second Expanded Group: Jorum Quintus / `SASQ03`

`1800357.quest_bxml` contains 68 keys, `QUEST_ID SASQ03`, the asset-level
symbol `NPC_DAL_GNO_JorumQuintus`, and 28 serialized `dialog_line_*` handlers.
The quest concerns three missing Scholia Arcana initiates, a gem theft, and
their fate in the Sidhe. Dialogue, player choices, objectives, journals, and
status labels are mixed; the asset symbol does not identify a speaker for
every key or map keys to callbacks or playback order.

All 68 rows were revalidated in English, Japanese, Chinese, and active Korean.
Three correction findings and two unresolved readings were recorded. The
single exact-English duplicate group already has identical Korean text. No
Korean CSV or extracted asset was changed. See
[`dialogue-context-sasq03-revalidation-20261110.md`](dialogue-context-sasq03-revalidation-20261110.md).

## Thirty-Third Expanded Group: Ratofer's Sale Quest / `M0_SQ06`

`361668.quest_bxml` contains 193 keys, `QUEST_ID M0_SQ06`, the asset-level
symbol `NPC_POE_VAR_AskelThorin`, references to `M0_NPC_LordRatofer`, and 51
serialized `dialog_line_*` handlers. The quest mixes dialogue with objectives,
journal entries, choices, and status labels. These asset-level references do
not map individual keys to speakers, callbacks, branches, or playback order.

All 193 rows were revalidated in English, Japanese, Chinese, and active Korean.
Seven correction findings and three unresolved readings were recorded.
Eleven exact-English duplicate groups already have identical Korean text.
No Korean CSV or extracted asset was changed. See
[`dialogue-context-m0-sq06-revalidation-20261110.md`](dialogue-context-m0-sq06-revalidation-20261110.md).

## Thirty-Fourth Expanded Group: Ainmhi / `SQ01`

`438799.quest_bxml` contains 71 keys, `QUEST_ID SQ01`, the asset-level symbol
`NPC_SQ01_StrangePrisoner`, and 28 serialized `dialog_line_*` handlers. The
quest concerns Ainmhi's curse and the Wandering Well. Dialogue, choices,
objectives, journals, and status labels are mixed; the asset symbol does not
identify a speaker for every key or map keys to callbacks or playback order.

All 71 rows were revalidated in English, Japanese, Chinese, and active Korean.
Ten correction findings affecting 17 IDs were recorded. The single
exact-English duplicate group already has identical Korean text. No Korean
CSV or extracted asset was changed. See
[`dialogue-context-sq01-revalidation-20261110.md`](dialogue-context-sq01-revalidation-20261110.md).

## Fifth Expanded Group: Agraivin Hand / `FFQ64`

`1507672.quest_bxml` contains 23 distinct localization keys, the `FFQ64`
identifier, a `TRSQ01` reference, the asset-level symbol
`NPC_DAL_ALM_AgraivinHand`, and 12 serialized `dialog_line_*` handlers. Its
quest text concerns prison keys and imprisoned Travelers. Content separates
16 dialogue-like rows from four journal entries and three objective/UI
labels. Six correction candidates and one non-blocking insult-consistency
note were recorded; no CSV edit was applied. See
[`dialogue-context-ffq64-revalidation-20261110.md`](dialogue-context-ffq64-revalidation-20261110.md).

## Fourth Expanded Group: Adessa Prison Letter / `SQ87`

`1272538.quest_bxml` contains 22 distinct localization keys, the `SQ87`
identifier, the asset-level symbol `NPC_DET_ALM_Abblier`, and nine
serialized `dialog_line_*` handlers. The quest text concerns delivering a
letter to Esklad Teiner and claiming a reward from Abblier. Content separates
11 dialogue-like rows from 11 journal, objective, or UI labels, but does not
map individual keys to callbacks or speakers. Four correction candidates were
recorded; no CSV edit was applied. See
[`dialogue-context-sq87-revalidation-20261110.md`](dialogue-context-sq87-revalidation-20261110.md).

## Third Expanded Group: Bera Grastar / `FFQ80`

`756361.quest_bxml` contains 17 distinct localization keys, the `FFQ80`
identifier, the asset-level symbol `NPC_DET_VAR_BeraGrastar`, and six
serialized `dialog_line_*` handlers. This strongly associates the resource
with Bera's quest, but does not map each key to a callback. The 17 rows were
reviewed in English, Japanese, Chinese, and active Korean. Content separates
ten dialogue or player-choice strings from seven quest-log, objective, or UI
strings. Four correction candidates were recorded; no CSV edit was applied.
See [`dialogue-context-ffq80-revalidation-20261110.md`](dialogue-context-ffq80-revalidation-20261110.md).

## Second Expanded Group: Grim's Rescue / `TR01`

`457008.quest_bxml` contains 119 distinct localization keys, `QUEST_ID TR01`,
the asset-level symbol `NPC_DAL_GNO_CenturionGastet`, and 50 serialized
`dialog_line_*` callbacks. It contains quest text spanning Grim's captivity,
the rescue mission, and the gnomish release bargain; the single NPC symbol
does not make every key Gastet's dialogue. Key-to-callback mapping and exact
speaker turns remain unknown.

All 119 rows were revalidated against English, Japanese, Chinese, and active
Korean. Twelve findings were recorded: ten correction candidates and two
uncertain cases. Exact duplicate English groups retain identical Korean
translations; all four-language rows are free of embedded line breaks and
markup/runtime tokens. Details and the complete ID list are in
[`dialogue-context-tr01-revalidation-20261110.md`](dialogue-context-tr01-revalidation-20261110.md).

## First Expanded Group: Grim Onwig / `TR06`

`494374.quest_bxml` contains 97 distinct localization keys, the `TR06` quest
identifier, the `NPC_DAL_Alm_GrimOnwig` symbol, and 23 `dialog_line_*`
handlers. This strongly associates the resource with the Grim Onwig quest
context. It does not prove that all 97 keys are spoken by Grim or identify
which key belongs to which handler. The handler table order is not treated as
playback order.

All 97 matched IDs are present in the active Korean, English, Japanese, and
Chinese `default` tables. The Korean rows contain no embedded line breaks,
runtime brace tokens, or markup. Five groups have exact duplicate English
source strings within this asset; each group's Korean translations are
currently identical.

### Revalidation Findings

These are read-only reviewer findings and proposed text, not permission to
edit the active translation CSV.

| IDs | Finding | Proposed Korean / disposition |
| --- | --- | --- |
| `15811` | The quest context identifies `Missives` as the named book `Missives of Sable`; Japanese `黒紋章の書` and Chinese `萨贝尔书卷` also identify a book/title. Current `쪽지(Missives)` is both a literal mistranslation and inconsistent with the established title elsewhere in the same group. | `그럼 그게 앰비언트의 거울(Glass of Ambient)이야? 잘했군. 여기에 따르면 세이블의 서신(Missives of Sable)은... 흠, 아주 흥미롭군. 그건 나중에 보기로 하지.` High-confidence correction candidate. |
| `2270`, `17289`, `28445`, `56303`, `59057` | These shortened/capitalized references point to the Glass of Ambient, which the same quest context and aligned sources identify as a magical mirror. Current forms vary among `그 유리(Glass)`, `유리`, `유리(Glass)`, `글라스(Glass)`, and `글래스`. | Use the established `거울` sense consistently: `그 거울` at `2270`; `거울로` at `17289`; `거울(Glass)` at `28445`; `거울` at `56303`; `거울은 어디서 찾을 수 있지?` at `59057`. High-confidence terminology correction candidates. |
| `2270` | In the quest context, “get rid of the Hierophant” means remove the leader from power, as made explicit in repeated lines `5285` and `28129`; current `없애려면` can imply killing her. The English `dove` is a familiar address, not a name. Prior decision D-19432 uses `친구` for this vocative. | `친구, 초조해 죽겠어. 대사제(Hierophant)를 권좌에서 끌어내리려면 네가 그 거울을 가져와야 해. 알겠어?` High-confidence correction candidate. |
| `31011` | Casual English and Japanese are at odds with the literary vocative `그대여`; the quest-group voice is informal. `plot` here is Grim's plan, not a separate mysterious plot. | `돌아왔군, 친구. 이제 계획을 마무리하고 대사제(Hierophant)에게 복수하자.` High-confidence style candidate. |
| `37631` | The informal reassurance is weakened by `그대`, and the final `나도 그런 기분을 잘 아니까` is less direct than the source's “I know the feeling all too well.” | `기다릴게, 친구. 받아들이기 힘든 이야기란 거 알아. 나도 그런 기분 잘 알아.` Medium-high confidence naturalness/style candidate. |
| `4135`, `62969` | These are exact duplicate English/Japanese/Chinese/Korean source groups. Korean uses `그대` while other Grim-context rows render the same familiar `dove` vocative as `친구`. Older D-19433 left this address unresolved because the speaker context was unknown; the `TR06` asset now supplies stronger, though not line-level, context. | `다음은 숨겨진 길로 이루어진 미로, 어둠의 미로야. 친구, 네가 직접 길을 찾아 빠져나가야 해.` Reconsider the earlier address-only disposition; retain the same Korean wording for both IDs. |
| `44585` | The current `우리가 일정에 쫓기는 건 아닌 거 알아, 그대` is stiff and the elevated address conflicts with Grim's surrounding informal speech. Meaning and urgency are otherwise preserved. | `우리한테 정해진 일정이 있는 건 아니란 거 알아, 친구. 그래도 오래 기다릴수록 내 계획을 마무리하기 더 어려워져. 이제 움직여야 해.` Medium-high confidence naturalness/style candidate. |

The remaining rows did not show a clearly supported meaning, voice, or
formatting defect in this pass. This is not a claim that their exact speaker
or sequence has been proven. No Korean polite ending (`-요`, `-습니다`) was
found abruptly mixed into this quest group; the voice findings above concern
address choice, elevated diction, and naturalness rather than a formal/polite
speech-level switch.

## Thirty-Fifth Expanded Group: Kells Cafferty / `SQ02`

`441938.quest_bxml` contains 213 distinct localization keys, `QUEST_ID
SQ02`, the asset-level symbol `NPC_POE_ALM_KellsCafferty`, and 85 serialized
`dialog_line_*` handlers. The quest concerns Kells, the Amrynthian Band, and
the Seelie Fae. These asset-level references do not map individual keys to
speakers, callbacks, branches, or playback order.

All 213 rows were revalidated against English, Japanese, Chinese, and active
Korean. Six correction findings affecting ten IDs were recorded. The nine
exact-English duplicate groups (20 rows) have identical text in all four
locales. Both runtime markers are preserved in their corresponding rows;
there are no embedded line breaks or markup. No Korean CSV was changed. See
[`dialogue-context-sq02-revalidation-20261110.md`](dialogue-context-sq02-revalidation-20261110.md)
for the findings and complete evidence.

## Thirty-Sixth Expanded Group: House of Ballads Contest / `HM01`

`457589.quest_bxml` contains 216 distinct localization keys, `QUEST_ID
HM01`, the asset-level symbol `NPC_DAL_SEE_Green`, and 155 serialized
`dialog_line_*` handlers. The keys cover the House of Ballads, the contest
for Sir Sagrell's seat, and the Grave Thresh. The symbol and handler count do
not map individual keys to Green, other speakers, callbacks, branches, or
playback order.

All 216 rows were revalidated against English, Japanese, Chinese, and active
Korean. Fifteen correction findings affecting 18 IDs and three unresolved
source/context holds were recorded. The six exact-English duplicate groups
(14 rows) already have identical Korean text, although Japanese or Chinese
wording differs in some groups. No Korean CSV was changed. See
[`dialogue-context-hm01-revalidation-20261110.md`](dialogue-context-hm01-revalidation-20261110.md)
for the findings and complete evidence.

## Thirty-Seventh Expanded Group: Ost Ordura / `KV03`

`467727.quest_bxml` contains 96 distinct localization keys, `QUEST_ID KV03`,
the asset-level symbol `NPC_OstOrdura`, a `PLAYER` symbol, and 47 serialized
`dialog_line_*` handlers. Its text covers Ost's patrol, Brigand Hall Caverns,
the Niskaru and Heart of Sibun, the Fahrlangi, and Warsworn ranks and history.
The asset does not map localization keys to individual speakers, callbacks,
branches, or playback order.

All 96 rows were revalidated against English, Japanese, Chinese, and active
Korean. Six correction findings were recorded; one exact-English duplicate
group (two rows) already matches across all four locales. No Korean CSV was
changed. See
[`dialogue-context-kv03-revalidation-20261110.md`](dialogue-context-kv03-revalidation-20261110.md)
for the proposals and complete evidence.

## Thirty-Eighth Expanded Group: Gwyn Anwy / `KV07`

`501659.quest_bxml` contains 129 distinct localization keys, `QUEST_ID KV07`,
the asset-level symbol `NPC_GwynAnwy`, quest-state names including
`found_mother` and `gwyn_ran`, and 58 serialized `dialog_line_*` handlers.
The text covers Gwyn's search for her mother, the Mystic Hammer, the Hall of
the Firstsworn, the Sacred Passage, and Besin. The asset does not map
localization keys to individual speakers, callbacks, branches, or playback
order.

All 129 rows were revalidated against English, Japanese, Chinese, and active
Korean. Eight correction findings affecting 11 IDs were recorded. Four
exact-English duplicate groups already have identical text in all four
locales. No Korean CSV was changed. See
[`dialogue-context-kv07-revalidation-20261110.md`](dialogue-context-kv07-revalidation-20261110.md)
for the proposals and complete evidence.

## Thirty-Ninth Expanded Group: Khamazandu's Gift / `KVSQ02`

`540798.quest_bxml` contains 59 distinct localization keys, `QUEST_ID
KVSQ02`, the asset-level symbol `NPC_KV10_Khamazandu`, and 28 serialized
`dialog_line_*` handlers. Its text covers Khamazandu's offer, the killing of
Gwyn Anwy and other Warsworn leaders, Besin's helm, and the Heart of Sibun.
The asset does not map localization keys to individual speakers, callbacks,
branches, or playback order.

All 59 rows were revalidated against English, Japanese, Chinese, and active
Korean. Eight correction findings affecting 15 unique IDs were recorded,
including a repeated English sentence whose Korean rendering varied across
seven journal entries. There are no fully identical English-row groups. No
Korean CSV was changed. See
[`dialogue-context-kvsq02-revalidation-20261110.md`](dialogue-context-kvsq02-revalidation-20261110.md)
for the proposals and complete evidence.

## Fortieth Expanded Group: Erion Raff / `HP02`

`545970.quest_bxml` contains 84 distinct localization keys, `QUEST_ID HP02`,
the asset-level symbol `NPC_POE_DOK_ErionRaff`, five quest-target handlers,
and 37 serialized `dialog_line_*` handlers. Its text covers the three Fae
staffs, their recovery and reforging, the Deep Slumber, and exchanges with
several characters. The asset-level NPC symbol and handler count do not map
localization keys to speakers, callbacks, branches, or playback order.

All 84 rows were revalidated against English, Japanese, Chinese, and active
Korean. Twelve correction findings affecting 14 IDs and one unresolved
meaning case were recorded. Four exact-English duplicate groups already
match across all four locales. No Korean CSV was changed. See
[`dialogue-context-hp02-revalidation-20261110.md`](dialogue-context-hp02-revalidation-20261110.md)
for the findings and complete evidence.

## Forty-First Expanded Group: Ruin Imas / `FFQ26`

`747929.quest_bxml` contains 39 distinct localization keys, `QUEST_ID FFQ26`,
the asset-level symbol `NPC_DET_GNO_RuinImas`, and 14 serialized
`dialog_line_*` handlers. Its text concerns Ruin Imas, the mysterious
Culminite ore, and the prospects for Apotyre. The NPC symbol and handler
count do not map localization keys to speakers, callbacks, branches, or
playback order.

All 39 rows were revalidated against English, Japanese, Chinese, and active
Korean. Four correction findings affecting five IDs were recorded. Three
exact-English duplicate groups already match across all four locales. No
Korean CSV was changed. See
[`dialogue-context-ffq26-revalidation-20261110.md`](dialogue-context-ffq26-revalidation-20261110.md)
for the evidence and proposed corrections.

## Forty-Second Expanded Group: Murdoc Hain / `FFQ03`

`495487.quest_bxml` contains 41 distinct localization keys, `QUEST_ID FFQ03`,
the asset-level symbol `NPC_DAL_VAR_MurdocHain`, two quest-target handlers,
and 16 serialized `dialog_line_*` handlers. Its text concerns Murdoc Hain's
fire potions, the reagents Tindertwig and Scarwood Bark, and the village
militia's boggart problem. The NPC symbol and handler count do not map
localization keys to speakers, callbacks, branches, or playback order.

All 41 rows were revalidated against English, Japanese, Chinese, and active
Korean. Three correction findings affecting 10 IDs and two unresolved
readings were recorded. Three exact-English duplicate groups already match
across all four locales. No Korean CSV was changed. See
[`dialogue-context-ffq03-revalidation-20261110.md`](dialogue-context-ffq03-revalidation-20261110.md)
for the evidence and proposed corrections.

## Forty-Third Expanded Group: Enconeg Holn / `SQ15`

`695918.quest_bxml` contains 47 distinct localization keys, `QUEST_ID SQ15`,
the asset-level symbol `NPC_DAL_STR_EnconegHoln_2`, and 20 serialized
`dialog_line_*` handlers. Its text covers Ettinmere, Enconeg Holn's family,
Imelda's grave charm, and the ettin threat. The NPC symbol and handler count
do not map localization keys to speakers, callbacks, branches, or playback
order.

All 47 rows were revalidated against English, Japanese, Chinese, and active
Korean. Two correction findings affecting two IDs and one unresolved
kinship reading affecting two IDs were recorded. Both exact-English duplicate
groups already match across all four locales. No Korean CSV was changed. See
[`dialogue-context-sq15-revalidation-20261110.md`](dialogue-context-sq15-revalidation-20261110.md)
for the evidence and proposed corrections.

## Forty-Fourth Expanded Group: Captain Keloran / `SQ69`

`611596.quest_bxml` contains 82 distinct localization keys, `QUEST_ID SQ69`,
the asset-level symbol `NPC_ALA_LJO_CaptainKeloran`, seven quest-target
handlers, and 29 serialized `dialog_line_*` handlers. Its text covers the
assault on Shadow Pass, the Ariad reinforcements, and Desiderus Trav's
campaign against the Tuatha. The NPC symbol and handler count do not map
localization keys to speakers, callbacks, branches, or playback order.

All 82 rows were revalidated against English, Japanese, Chinese, and active
Korean. Five correction findings affecting nine IDs were recorded. All nine
exact-English duplicate groups already match across all four locales. No
Korean CSV was changed. See
[`dialogue-context-sq69-revalidation-20261110.md`](dialogue-context-sq69-revalidation-20261110.md)
for the evidence and proposed corrections.

## Forty-Fifth Expanded Group: Coilsbain Cavern / `U03`

`616680.quest_bxml` contains 82 distinct localization keys, the asset-level
symbol `NPC_DAL_ALM_ThaddeusHoln`, 19 serialized U03 quest-target handlers,
and 32 serialized U03 `dialog_line_*` handlers. The index extracts
`QUEST_ID ACTOR`; U03 is supported by the serialized handler and identifier
prefixes, so the two values are recorded separately rather than conflated.
The asset-level NPC symbol and handlers do not map individual keys to
speakers, callbacks, branches, or playback order.

All 82 rows were revalidated against English, Japanese, Chinese, and active
Korean. Seven correction findings affecting seven IDs and four unresolved
register questions were recorded. All three exact-English duplicate groups
already match across all four locales. No Korean CSV was changed. See
[`dialogue-context-u03-revalidation-20261110.md`](dialogue-context-u03-revalidation-20261110.md)
for the evidence and proposed corrections.

## Forty-Sixth Expanded Group: Elrod Edman / `FFQ17`

`710527.quest_bxml` contains 91 distinct localization keys, `QUEST_ID FFQ17`,
the asset-level symbol `NPC_POE_ALM_ElrodEdman`, six quest-target handlers,
and 43 serialized `dialog_line_*` handlers. Its text concerns suspected
Tuatha spies among the refugees and the fates of Anred, Froma, and Nag. The
NPC symbol and handler count do not map individual keys to speakers,
callbacks, branches, or playback order.

All 91 rows were revalidated against English, Japanese, Chinese, and active
Korean. Six correction findings affecting seven IDs and four unresolved
source/context questions were recorded. All four exact-English duplicate
groups already match across all four locales. No Korean CSV was changed. See
[`dialogue-context-ffq17-revalidation-20261110.md`](dialogue-context-ffq17-revalidation-20261110.md)
for the evidence and proposed corrections.

## Forty-Seventh Expanded Group: Master's Pick Quest / `TR03`

`467744.quest_bxml` contains 104 distinct localization keys, `QUEST_ID TR03`,
the asset-level symbol `NPC_ADE_GNO_ElorenCriet`, six quest-target handlers,
and 35 serialized `dialog_line_*` handlers. The content concerns the
Master's Pick, Eloren Criet, Argine, Grim Onwig, and the Hierophant, alongside
dialogue, journal, objective, and UI text. The asset-level NPC symbol and
handler count do not map individual keys to speakers, callbacks, branches,
or playback order.

All 104 rows were revalidated against English, Japanese, Chinese, and active
Korean. Eight correction candidates and three unresolved questions were
recorded; the two exact-English duplicate groups already match across all
four locales. No Korean CSV was changed. See
[`dialogue-context-tr03-revalidation-20261110.md`](dialogue-context-tr03-revalidation-20261110.md)
for the evidence and proposed corrections.

## Forty-Eighth Expanded Group: Glianal / `MQ05`

`563881.quest_bxml` contains 332 distinct localization keys, `QUEST_ID MQ05`,
the asset-level symbol `NPC_DAL_SEE_Glianal`, and 136 serialized
`dialog_line_*` handlers. The keys span the Codex of Destiny, Glianal,
Nyralim, Ysa, Gnarsh, the Tuatha, and related dialogue, choices, objectives,
journal, and UI text. The NPC symbol and handler count do not map individual
keys to speakers, callbacks, branches, or playback order.

All 332 rows were revalidated against English, Japanese, Chinese, and active
Korean. Seven correction findings affecting twelve IDs and two unresolved
register questions were recorded. All 41 exact-English duplicate groups (106
rows) already have matching Korean translations. No embedded line breaks,
runtime markers, or markup were found. All 12 correction-candidate IDs were
approved, applied, and rechecked; register holds at `60868` and `61926`
remain. No extracted game asset was changed. See
[`dialogue-context-mq05-revalidation-20261110.md`](dialogue-context-mq05-revalidation-20261110.md)
for the evidence and proposed corrections.

## Forty-Ninth Expanded Group: Family Rivalry / `SQ54`

`588388.quest_bxml` contains 114 distinct localization keys, `QUEST_ID SQ54`,
the asset-level symbol `NPC_DET_ALM_Beorn`, and 46 serialized
`dialog_line_*` handlers. The keys cover Steg Darkvari, Hrindi Zungar, the
rival mining families, Beorn, and the Whitestone cage, alongside dialogue,
quest, journal, objective, and UI text. The NPC symbol and handler count do
not map individual keys to speakers, callbacks, branches, or playback order.

All 114 rows were revalidated against English, Japanese, Chinese, and active
Korean. Ten correction findings affecting 23 IDs and one unresolved meaning
question were recorded. All six exact-English duplicate groups (12 rows)
already have matching Korean translations. The `$SQ54.bribe_value$` token is
preserved in both gold-offer rows; no embedded line breaks or other markup
were found. The 22 in-asset candidate IDs and supplemental cross-asset ID
`26210` were approved, applied, and rechecked; the meaning question at
`14051` remains on hold. See
[`dialogue-context-sq54-revalidation-20261110.md`](dialogue-context-sq54-revalidation-20261110.md)
for the evidence and proposed corrections.

## Fiftieth Expanded Group: General Tilera / `MQ09`

`589911.quest_bxml` contains 154 distinct localization keys, `QUEST_ID MQ09`,
the asset-level symbol `NPC_MQ_LJO_GeneralTilera`, 14 quest-target handlers,
and 54 serialized `dialog_line_*` handlers. The text covers General Tilera,
Alyn Shir, the Piercing Light, Urul-Tusk, the Windstones, and related
dialogue, quest updates, objectives, choices, and labels. The asset-level NPC
and handlers do not map each key to a speaker, callback, branch, or playback
position.

All 154 rows were revalidated against English, Japanese, Chinese, and active
Korean. Fourteen correction findings affecting 15 IDs and two unresolved
address/register questions were recorded. Three exact-English duplicate
groups already have matching Korean; two similar gate questions were kept
distinct because their English differs (`this gate` / `the gate`). No
embedded line breaks, runtime markers, or markup were found, and no Korean
game asset was changed. The 15 correction-candidate IDs were approved,
applied, and rechecked; address/register holds at `32239` and `32716` remain.
See
[`dialogue-context-mq09-revalidation-20261110.md`](dialogue-context-mq09-revalidation-20261110.md)
for the evidence and full ID list.

## Fifty-First Expanded Group: Dannestar Island / `MQ14`

`589924.quest_bxml` contains 192 distinct localization keys, `QUEST_ID MQ14`,
the asset-level symbol `NPC_MQ_UNS_Cydan`, seven quest-target handlers, and
96 serialized `dialog_line_*` handlers. The text covers the House of
Sorrows' shadow path, Dannestar Tower, the Well of Souls, Ventrinio, Cydan,
Hugues, Alyn Shir, the Laz, and related dialogue, choices, quest updates,
objectives, and labels. The asset-level NPC and handlers do not map each key
to a speaker, callback, branch, or playback position.

All 192 rows were revalidated against English, Japanese, Chinese, and active
Korean. Eleven correction findings affecting 17 IDs and three unresolved
register/address rows were recorded. The exact-English repeated Ventrinio
question and `Shadow Walk` title groups already match; punctuation-only rows
also match. No embedded line breaks, runtime markers, or markup were found,
and no extracted game asset was changed. All 17 correction-candidate IDs
were approved, applied, and rechecked; holds at `29557`, `30364`, and `32421`
remain unresolved. See
[`dialogue-context-mq14-revalidation-20261110.md`](dialogue-context-mq14-revalidation-20261110.md)
for the evidence and full ID list.

## Fifty-Second Expanded Group: Feride Ouet / `SQ59`

`591256.quest_bxml` contains 191 distinct localization keys, `QUEST_ID SQ59`,
the asset-level symbol `NPC_ADE_GNO_FerideOuet`, and 57 serialized
`dialog_line_*` handlers. The content concerns Feride's research, the
Sandstone Villa and Allestar, letters and observers, and the Hospitalis
Quarters, alongside dialogue, player choices, quest updates, objectives,
titles, and UI text. The asset-level NPC and handlers do not map each key to a
speaker, callback, branch, or playback position.

All 191 rows were revalidated against English, Japanese, Chinese, and active
Korean. Eight correction findings affecting 11 unique IDs and five unresolved
readings were recorded. Ten exact-English duplicate groups already have
matching Korean, and all four locales are free of embedded line breaks,
runtime markers, and markup in these rows. All 11 correction-candidate IDs
were approved, applied, and rechecked; the five unresolved readings remain on
hold. No extracted game asset was changed. See
[`dialogue-context-sq59-revalidation-20261110.md`](dialogue-context-sq59-revalidation-20261110.md)
for the evidence and full ID list.

## Fifty-Third Expanded Group: Aetill Algar / `SQ53`

`592526.quest_bxml` contains 131 distinct localization keys, `QUEST_ID SQ53`,
the asset-level symbol `NPC_DET_ALM_AetillAlgar`, and 58 serialized
`dialog_line_*` handlers. Its text concerns the Skoria mine and tyrenium
dispute, Aetill Algar, Adath Skoria, Whitestone, and Apotyre, alongside
dialogue, choices, quest updates, objectives, journal text, and UI labels.
The NPC symbol and handlers do not map individual keys to speakers, callbacks,
branches, or playback position.

All 131 rows were revalidated against English, Japanese, Chinese, and active
Korean. Six correction candidates and two unresolved readings were recorded.
All 11 exact-English duplicate groups already have identical Korean, and the
`$SQ53.bribe_value$` token is preserved in both offer rows. No embedded line
breaks, other runtime markers, or markup were found. All six correction
candidates were approved, applied, and rechecked; holds at `6405` and `27562`
remain unresolved. No extracted game asset was changed. See
[`dialogue-context-sq53-revalidation-20261110.md`](dialogue-context-sq53-revalidation-20261110.md)
for the findings and full ID list.

## Fifty-Fourth Expanded Group: Parwen Well / `SQ58`

`593901.quest_bxml` contains 92 distinct localization keys, `QUEST_ID SQ58`,
the asset-level symbol `NPC_DET_DOK_ParwenWell`, and 33 serialized
`dialog_line_*` handlers. The text concerns Courdan's missing letter, Parwen
Well's courier role, Scholar Airancourt's orders, and the Domus Politica.
The asset-level NPC and handler data do not map individual keys to speakers,
callbacks, branches, or playback positions.

All 92 rows were revalidated against English, Japanese, Chinese, and active
Korean. Seven correction findings were recorded, including inconsistent
`Isles` wording, incomplete English pairings, and two naturalness refinements.
The two exact-English duplicate groups already have matching Korean, and the
`$SQ58.parwen_bribe$` marker is preserved at both occurrences. No embedded
line breaks were found. All seven correction-candidate IDs were approved,
applied, and rechecked; no extracted game asset was changed. See
[`dialogue-context-sq58-revalidation-20261110.md`](dialogue-context-sq58-revalidation-20261110.md)
for the evidence and full ID list.

## Fifty-Fifth Expanded Group: Aergase's Quest / `SQ55`

`597592.quest_bxml` contains 154 localization keys, `QUEST_ID SQ55`, the
asset-level symbol `NPC_DET_SEE_Aergase`, and 57 serialized
`dialog_line_*` handlers. Its text concerns the Narca curse, the Crossing,
Caer Elatha, the Keepers, Pura, Maxen, Halcyor, and Florion, alongside
objectives, journal text, and UI labels. The asset symbol and handler count
do not map individual keys to speakers, callbacks, branches, or playback
positions. ID `63854` explicitly identifies Maxen; other speaker assignments
and dialogue order remain unknown.

All 154 rows were revalidated against English, Japanese, Chinese, and active
Korean. Fifteen corrections were applied to the Korean working CSV. Three
meaning or naturalness findings remain unresolved. The ten exact-English
duplicate groups have matching Korean, and no embedded line breaks, runtime
markers, or markup were found. See
[`dialogue-context-sq55-revalidation-20261110.md`](dialogue-context-sq55-revalidation-20261110.md)
for the evidence and full ID list.

## Fifty-Sixth Expanded Group: Wounded Well Gnome / `MQ01`

`613083.quest_bxml` contains 267 localization keys, `QUEST_ID MQ01`, the
asset-level symbol `NPC_MQ_GNO_Encel`, and 188 serialized
`dialog_line_*` handlers. Its content covers the attack on Allestar Tower,
the Well of Souls, Encel, Fomorous Hugues, the Tuatha, combat tutorials,
objectives, journal entries, and UI labels. The asset-level NPC and handler
data do not map individual keys to speakers or playback positions. IDs `6718`
and `55159` explicitly identify Fomorous Hugues; other speaker assignments
remain unknown.

All 267 rows were revalidated against English, Japanese, Chinese, and active
Korean. Thirty-three correction candidates were recorded for Well of Souls
terminology and pairing, missing Encel and `Children of Dust` pairings,
Praetorian terminology, and three speech-level mismatches. One source-nuance
hold remains at `15621`. Fourteen exact-English duplicate groups already have
matching Korean, and no embedded line breaks, runtime markers, or markup
were found. No Korean CSV was changed. See
[`dialogue-context-mq01-revalidation-20261110.md`](dialogue-context-mq01-revalidation-20261110.md)
for the evidence and full ID list.

## Progress and Limits

- Reverse-map coverage: 51,080 / 65,135 unique IDs (78.4%) have at least one
  quest-asset association. This is not translation-review completion.
- Machine-readable reverse map: 52,381 ID/asset associations across the same
  51,080 IDs and 426 assets; 1,257 IDs map to multiple assets. The index can be
  regenerated and checked with `build_dialogue_context_index.py`.
- Priority grouping index: 56 strict NPC/quest/handler candidates identified.
- Context revalidation: 56 / 56 priority assets reviewed (100%), covering
  5,208 unique IDs in
  `TR06`, `TR01`, `TRSQ01`, `TRSQ02`, `SQ150`, `SASQ01`, `SASQ02`, `SASQ03`, `M0_SQ06`, `SQ01`, `SQ02`, `HM01`, `KV03`, `KV07`, `KVSQ02`, `FFQ80`, `SQ87`, `FFQ64`, `FFQ67`,
  `FFQ116`, `SQ126`, `FFQ35`, `SQ79`, `SQ102`, `SQ93`, `SQ100`, `SQ108`, and
  `SQ116`, `SQ117`, `SQ118`, `FFQ60`, `FFQ66`, `SQ80`, `FFQ71`, `SQ140`,
  `SQ143`, `SQ131`, `SQ145`, `SQ68`, `HP02`, `FFQ26`, `FFQ03`, `SQ15`,
  `SQ69`, `U03`, `FFQ17`, `TR03`, `MQ05`, `SQ54`, `MQ09`, `MQ14`, `SQ59`,
  `SQ53`, `SQ58`, `SQ55`, and `MQ01`.
  The unique-ID count is independently checked against the ledger and its
  four-language fingerprints:
  `dialogue-context-review-ledger.tsv`.
- The exact mapping from localization key to `dialog_line_*`, speaker turn,
  branch, and playback order remains unresolved. Do not infer order from row
  IDs, CSV order, key occurrence order, or callback table serialization.
- Most proposed translation edits remain pending the separate editor step.
  In the current working CSV, four Brio corrections and three SQ93 Font
  pairings were rechecked and recorded as applied; the SQ93 ledger now has
  14 correction candidates and five unresolved findings.
- The review ledger's 17 changed four-language fingerprints were refreshed
  only after rechecking those rows. All 56 priority assets now have review
  reports and ledger coverage. After user approval, all 26 SQ131, 27 SQ140,
  33 MQ01, and 34 SQ143 correction candidates were applied and rechecked;
  unresolved findings at SQ140 `48067`/`62309` and MQ01 `15621`, and the
  SQ143 source conflict at `1410`/`52945`, remain.
- The 22 SQ54 correction-candidate IDs and supplemental name-pairing ID
  `26210` were also applied and rechecked; SQ54 `14051` remains unresolved.
- All 15 MQ09 correction-candidate IDs were applied and rechecked; the
  address/register holds at `32239` and `32716` remain unresolved.
- CSV preservation and source-fingerprint validation passed after the SQ54
  and MQ09 batches; the original mixed line-ending counts remain unchanged.
- All 17 MQ14 correction-candidate IDs were applied and rechecked; its three
  address/register holds remain unchanged.
- All 11 SQ59 correction-candidate IDs were applied and rechecked; its five
  unresolved readings remain on hold.
- All six SQ53 correction-candidate IDs were applied and rechecked; its two
  unresolved readings remain on hold.
- All seven SQ58 correction-candidate IDs were applied and rechecked.
- All 12 MQ05 correction-candidate IDs were applied and rechecked; its two
  register holds remain unresolved.
