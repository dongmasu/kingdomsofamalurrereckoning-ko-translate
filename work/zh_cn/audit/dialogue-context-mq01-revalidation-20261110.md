# MQ01 / Encel's Main Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 267 `default` IDs linked to `613083.quest_bxml` (`MQ01`).
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison. Every row was checked in all four locales.
- After the user's approval, all 33 candidate IDs below were corrected in the
  active Korean CSV and rechecked against the English, Japanese, and Chinese
  rows. The unresolved reading at `15621` remains unchanged. Extracted game
  assets were not modified.

## Grouping Evidence

The asset contains `QUEST_ID MQ01`, the asset-level symbol
`NPC_MQ_GNO_Encel`, the resource label `MQ01_Wounded_Well_Gnome`, and 188
serialized `dialog_line_*` handlers. Its keys cover the attack on Allestar
Tower, the Well of Souls, Encel, Fomorous Hugues, the Tuatha, escape and
combat tutorials, objectives, journal entries, and UI labels.

The NPC symbol, handler count, and serialized order do not map individual
localization keys to speakers, callbacks, branches, or playback positions.
IDs `6718` and `55159` explicitly identify their speaker as Fomorous Hugues;
the asset symbol alone does not establish that Encel speaks every other row.
All other speaker assignments and dialogue order remain unknown.

## Correction Candidates

These source-checked corrections were approved and applied. The table retains
the evidence and proposed wording that guided the ID-specific edits.

| ID(s) | Dimension | Evidence and proposed correction | Confidence |
| --- | --- | --- | --- |
| `4087`, `11535`, `13647`, `22530`, `28988`, `30941`, `32593`, `33104`, `35719`, `35826`, `37932`, `38220`, `39162`, `40157`, `40313`, `42057`, `42268`, `42808`, `46292`, `52402`, `54012`, `56406`, `58257`, `58556` | Meaning / terminology / English pairing | These lines refer to the same named Well of Souls, but Korean alternates among `우물`, `샘`, and `영혼의 샘`; some are unpaired, and `52402` has the incomplete pairing `영혼의 샘(Well)` while `54012` has `우물(The Well)`. Other rows already use `영혼의 샘(Well of Souls)`. Align these references to that established name, adjusting particles and sentence syntax per row. | High |
| `26756`, `36145`, `40157`, `41222`, `43321` | English pairing | Korean names Encel without the English pairing in these rows, while `3053` and `62583` already use `엔셀(Encel)`. Add the pairing at each occurrence; do not infer that the lines are spoken by Encel. | High |
| `20386` | Terminology consistency | This asset uses `프레토리안 근위대(Praetorians)` at `3672`, but `프레토리안 근위병(Praetorians)` here. The project has an accepted precedent for `프레토리안 근위대(Praetorians)` at `18174`; align this occurrence to `내 프레토리안 근위대(Praetorians)가`. | Medium-high |
| `18310` | English pairing | The insult `Children of Dust` is rendered only as `먼지의 자손들아`, while the singular source term is already paired at `8492` as `먼지의 자손(Child of Dust)`. Pair the plural occurrence as `먼지의 자손들아(Children of Dust)` without changing the sentence's meaning. | High |
| `43549` | Speech level / naturalness | The Korean tutorial uses polite endings (`치명적입니다`, `만회할 수 있습니다`), while Japanese and the neighboring tutorial lines use plain speech. Consider `단검은 적의 허를 찌르면 치명적이야. 크기가 작은 건 속도로 충분히 만회할 수 있어.` | High |
| `50583` | Speech level | Japanese uses plain speech (`歩けるなら、手当は必要ないわ`), but Korean ends with polite `필요 없어요`. The English and Chinese support the current meaning; consider `걸을 수 있으면 내 도움은 필요 없어.` | Medium-high |
| `56347` | Speech level | The hesitant line is plain in Japanese (`ちょっと不安定だな...`) but polite in Korean (`불안정할 수도 있어요`). Consider `조금... 음... 불안정할 수도 있겠어...` | Medium-high |

## Hold

| ID | Dimension | Evidence and disposition |
| --- | --- | --- |
| `15621` | Meaning | English says `By the Tome`, Chinese explicitly references the Tome, and Japanese omits the phrase. Korean `맹세코` is a natural oath-like paraphrase, but the intended in-world reference is not established here. Retain pending terminology/context evidence rather than inventing a Korean name for the Tome. |

## Consistency and Format Checks

Fourteen exact-English duplicate groups occur in this asset, covering 29 rows.
Every group already has identical Korean:

| IDs | English |
| --- | --- |
| `735`, `48196` | `Come on, there's no time to waste!` |
| `5540`, `37888` | `Where is Hugues?` |
| `9205`, `54715` | `The Well of Souls remade your body and placed your spirit back into it, whole and unharmed, here in a safe place.` |
| `10238`, `46485` | `We've never seen them this far inland, not even during the invasion! I... I don't know why they are here.` |
| `11320`, `61963`, `63866` | `.` |
| `11880`, `44825` | `Oh my... You don't know? Perhaps the process damaged your memory. They are the Tuatha Deohn, the enemies of all the young races.` |
| `12969`, `38635` | `The Tuatha are coming in through the lower levels. If we hurry, we should be able to beat them to the top.` |
| `14104`, `37290` | `Take these. They'll help keep you safe long enough to get to Hugues. Now, let's get going!` |
| `16370`, `29434` | `It's just that you... you're...` |
| `21598`, `62068` | `Well of Souls` |
| `30818`, `59923` | `We must get you to Professor Hugues right away. He'll have questions for you!` |
| `41299`, `43794` | `Get moving, you brute! Tear this tower apart!` |
| `49739`, `53540` | `Attackers` |
| `56632`, `64005` | `Let's get out of here!` |

All 267 rows were checked for meaning, Korean naturalness, speech level,
names and terminology, exact-English duplicates, runtime markers, markup,
and line breaks. No embedded line breaks, runtime markers, or markup were
found. The three punctuation-only rows at `11320`, `61963`, and `63866`
match across all four locales.

The complete sorted ID set is:

`87`, `188`, `225`, `556`, `645`, `735`, `1022`, `1222`, `1537`, `2019`,
`2487`, `2537`, `3053`, `3384`, `3672`, `3846`, `4056`, `4073`, `4087`,
`4286`, `4583`, `4723`, `5540`, `5822`, `6198`, `6337`, `6487`, `6718`,
`6771`, `6778`, `6980`, `7065`, `7082`, `7203`, `7213`, `7924`, `8318`,
`8492`, `8599`, `9205`, `9265`, `9565`, `9608`, `9680`, `9986`, `10238`,
`10318`, `10672`, `10730`, `10735`, `10889`, `11075`, `11320`, `11505`,
`11535`, `11880`, `12066`, `12969`, `13642`, `13647`, `14046`, `14062`,
`14104`, `14257`, `14455`, `14575`, `14602`, `15451`, `15621`, `16324`,
`16370`, `16511`, `17282`, `17580`, `17599`, `17606`, `17931`, `17942`,
`18262`, `18310`, `18679`, `19583`, `19735`, `19831`, `20386`, `20402`,
`20429`, `20970`, `21110`, `21477`, `21598`, `22234`, `22422`, `22530`,
`23261`, `23470`, `23563`, `23693`, `24384`, `24982`, `25958`, `26176`,
`26456`, `26756`, `27434`, `27474`, `27655`, `27726`, `27773`, `27836`,
`28278`, `28417`, `28816`, `28966`, `28988`, `29036`, `29400`, `29420`,
`29434`, `29448`, `30818`, `30941`, `31066`, `31143`, `31266`, `31407`,
`31546`, `32593`, `32823`, `33104`, `33716`, `33730`, `33757`, `33869`,
`34409`, `35171`, `35209`, `35685`, `35719`, `35811`, `35813`, `35826`,
`36144`, `36145`, `36599`, `37290`, `37717`, `37888`, `37932`, `38220`,
`38431`, `38635`, `39162`, `39167`, `39333`, `39697`, `40152`, `40157`,
`40313`, `40421`, `40435`, `40519`, `40650`, `40675`, `40735`, `40870`,
`40888`, `41205`, `41222`, `41299`, `41501`, `41558`, `41788`, `42057`,
`42268`, `42462`, `42560`, `42808`, `43115`, `43321`, `43549`, `43556`,
`43642`, `43794`, `44339`, `44825`, `45229`, `45451`, `46069`, `46292`,
`46430`, `46485`, `46709`, `47974`, `48196`, `48356`, `48478`, `48507`,
`48548`, `49231`, `49448`, `49673`, `49739`, `49956`, `50403`, `50583`,
`50745`, `50803`, `51057`, `51326`, `51331`, `51428`, `52062`, `52402`,
`52675`, `52679`, `52770`, `52870`, `53461`, `53536`, `53540`, `53950`,
`53979`, `54012`, `54503`, `54715`, `54802`, `55043`, `55159`, `55690`,
`55835`, `56080`, `56259`, `56347`, `56406`, `56632`, `57862`, `57886`,
`57980`, `58257`, `58556`, `58940`, `59071`, `59128`, `59569`, `59923`,
`60134`, `60834`, `60896`, `61536`, `61963`, `62068`, `62110`, `62142`,
`62183`, `62578`, `62583`, `62855`, `62947`, `63277`, `63418`, `63866`,
`63896`, `63921`, `64005`, `64513`, `64981`.

The review ledger records all 267 IDs and their four-language fingerprints.
No individual callback, branch, or playback position was inferred.
