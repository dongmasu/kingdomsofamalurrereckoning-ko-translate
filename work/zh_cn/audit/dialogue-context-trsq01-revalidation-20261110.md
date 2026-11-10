# TRSQ01 / Star Camp Initiation Context Revalidation

- Date: 2026-11-10.
- Scope: all 172 `default` keys in `1621227.quest_bxml` (`TRSQ01`).
- No translation CSV or extracted resource was modified.
- English anchors meaning; Japanese guides voice/register; Chinese supports
  the comparison. All four locales were checked for every listed ID.

## Grouping Evidence

The asset contains `QUEST_ID TRSQ01`, the asset-level symbol
`NPC_DAL_VAR_GunnarFrode`, and 61 serialized `dialog_line_*` handlers. Its
keys include Gunnar's dagger sale, Crilgarin's Traveler initiation, the
Hierophant's shrine test, Ealfwig Grilricas, objectives, player choices,
labels, and journal entries. This is a multi-character/multi-scene resource:
the Gunnar symbol cannot be used to assign all rows to Gunnar. No individual
key has been mapped to a callback or playback position.

## Correction Candidates

These are read-only findings, not accepted edits. The dimensions shown also
define the per-ID ledger statuses; other reviewed dimensions remain
`not_flagged`.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `81` | meaning, format | The complete item is the glossary-registered `St. Eadric's Pall`, translated as `성 이드릭의 수의(St. Eadric's Pall)`. This row's English order is `Pall of St. Eadric`; Japanese `聖イードリックの棺` is a source error, while Chinese also calls it a coffin. The same quest describes the item as a pall/shroud at `11844`, `12141`, `41757`, and `44024`. Current `성 이드릭의 관 덮개(Pall of St. Eadric)` is inconsistent with the item identity and existing Korean name. Prefer `성 이드릭의 수의(Pall of St. Eadric)`. | High |
| `106` | speech_level | Player response `I will do as you ask`, Japanese `言われた通りにしよう`; current `부탁한 대로 하겠소` adds archaic deference not present in the aligned response. Prefer `부탁한 대로 할게.` | High |
| `1255` | naturalness | English and Japanese personify road dust rising to welcome the wanderer. Current `길에서 일어난 먼지가 나그네를 맞이하는구나` is an unnatural literal rendering of rising dust. Prefer `길 먼지가 피어올라 나그네를 맞이하는구나. 별 야영지(Star Camp)에 온 걸 환영해.` | Medium-high |
| `10539` | address, naturalness | The familiar vocative `dove` is rendered `그대여`; prior row-scoped decisions use `친구` for this address, and Japanese omits a romantic/elevated equivalent. Prefer `아, 친구, 내 가여운 마음을 아프게 하는군. 크릴가린(Crilgarin)처럼 말이야. 그래도 네가 곧 실수를 후회하게 되리라 믿어.` The wording after the vocative is preserved. | High |
| `21634` | naturalness, speech_level | English says the Travelers are each other's kin and the Hierophant summons the initiate again. Japanese uses conversational `あなた` and `必ず応えなければならないわ`. Korean mixes literary `그대` with casual `가족이고`, and unexpectedly honors the player with `그대를 찾으셔`. Prefer `이제 모든 트래블러(Travelers)가 네 식구고, 너도 그들의 식구야. 자, 대사제(Hierophant)가 다시 널 불렀어. 예언자가 부르면 응해야 해.` This is based on the row's own register, not a presumed callback. | Medium-high |
| `35937`, `44024` | meaning, naturalness | Both source rows call for the `pall`/`burial pall` of St. Eadric. The established item and aligned dialogue identify it as a burial shroud, `수의`; current `관 덮개` / `관을 덮은 천` is inconsistent with the named item. Use `성 이드릭(St. Eadric)의 수의` at `35937` and `성 이드릭(St. Eadric)의 수의` for the burial-pall phrase at `44024`, preserving the separate `St. Eadric's Mission` place label. | High |
| `55124` | naturalness | English `gain admission into the Travelers` means qualify for membership. Current `트래블러(Travelers)들에 들어갈 자격` has an awkward plural particle/compound. Prefer `이제 크릴가린(Crilgarin)에게 돌아가 성과를 보여 주고 트래블러(Travelers)에 가입할 자격을 얻어야겠다.` | High |
| `63332` | naturalness | English `We have many freedoms, and one chain` and Japanese `唯一の縛り` describe a single binding rule. Current `단 하나의 사슬도 있지` is an unnatural calque and does not make the intended obligation clear. Prefer `우리에겐 자유가 많지만, 반드시 지켜야 할 규율은 하나 있어.` | Medium-high |
| `64283` | address, naturalness | `dove` is the same familiar address rendered as `귀여운 이여`, an unsupported literal/elevated form. `The work lies before you, not with me` is also awkwardly rendered `해야 할 일은 내게가 아니라 네 앞에 있단다`. Prefer `이제 내가 해 줄 수 있는 일은 없어, 친구. 해야 할 일은 내 몫이 아니라 네가 해야 해.` | High |

The old addendum's `4386` Korean ends in `대부분은 순순히 따르지`.
Here `-지` is an affirmative colloquial assertion, not a missing `않`:
English `there are many who readily comply` and Japanese `素直に従ってる`
support the existing meaning. It is not reported as a negation error.

## Holds and Preserved Differences

| ID(s) | Dimension | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `35144` | meaning | English label `St. Eadric's Remains` conflicts with Japanese `聖イードリックの骸布` (pall/shroud); Chinese says remains. Korean `성 이드릭(St. Eadric)의 유해` follows English/Chinese, while the surrounding quest identifies the stolen object as a shroud. Because the title sources conflict, do not silently replace the label with `수의` or treat the disagreement as resolved. | Uncertain |
| `39266` | meaning | The quest title `The Guided Hands` is rendered literally as `인도하는 손길`; Japanese `導かれた手` and Chinese `良师出神偷` diverge in voice/wordplay. The initiation context establishes guidance but does not settle the title's intended pun. Retain pending stronger title evidence. | Uncertain |

The exact-English groups `895`/`18678`/`21820`/`23516`/`31740`,
`1226`/`48484`, `2268`/`5672`/`6990`/`16689`/`28223`,
`4860`/`27721`/`29041`/`30972`/`34257`,
`6264`/`11554`, `7067`/`13551`/`19575`/`34736`/`37908`,
`11844`/`25464`, `12234`/`17474`/`19922`/`47813`,
`16797`/`23511`/`24244`, `25051`/`29483`/`38216`/`49492`,
`34317`/`36616`/`38083`, `51332`/`62373`, and `62682`/`65111`
already have identical Korean text. Token-bearing payment rows preserve the
same `$TRSQ01.bribe_value$` marker and its position. No embedded line breaks,
runtime-format defects, or markup were found in the 172 four-language rows.

The established item glossary also defines `Toothpicks` as a row-scoped short
reference to `Draug's Toothpicks`; current uses at `12234`, `17474`, `19922`,
`47068`, and `47813` are not treated as generic-item translations. The
existing `Grilricas Medallion` title pairing at `51332`/`62373` is correct.
No new speaker attribution or playback-order claim is made.

## Coverage

All 172 keys were reviewed for meaning, Korean naturalness, speech level,
address, honorifics, terminology, duplicates, and structure as applicable.
Four-language fingerprints and per-ID statuses are in
`dialogue-context-review-ledger.tsv`. Callback mapping, branch flow, and
playback order remain unknown.

`81`, `106`, `189`, `681`, `895`, `902`, `918`, `1226`, `1255`, `1543`,
`1884`, `2044`, `2268`, `2632`, `3107`, `3180`, `4386`, `4860`, `5023`,
`5672`, `5764`, `6264`, `6990`, `7067`, `8109`, `8640`, `9357`, `10298`,
`10302`, `10441`, `10539`, `10678`, `11140`, `11554`, `11844`, `11866`,
`11988`, `12141`, `12234`, `13551`, `14773`, `14835`, `16689`, `16797`,
`17106`, `17474`, `17687`, `17971`, `18637`, `18678`, `19570`, `19575`,
`19706`, `19771`, `19922`, `20842`, `21634`, `21820`, `22066`, `22902`,
`23369`, `23386`, `23511`, `23516`, `23735`, `23979`, `24018`, `24212`,
`24223`, `24244`, `24308`, `24457`, `25051`, `25464`, `26534`, `27595`,
`27721`, `28223`, `28275`, `28475`, `28529`, `28756`, `29041`, `29483`,
`29517`, `29547`, `30280`, `30368`, `30937`, `30972`, `31083`, `31740`,
`32842`, `33361`, `34257`, `34317`, `34480`, `34683`, `34736`, `35144`,
`35902`, `35937`, `36298`, `36616`, `36882`, `37003`, `37908`, `38083`,
`38094`, `38216`, `38374`, `38696`, `38787`, `39137`, `39266`, `40322`,
`41022`, `41034`, `41757`, `42460`, `43174`, `43192`, `43651`, `43999`,
`44024`, `44060`, `44366`, `44579`, `45097`, `46035`, `46316`, `47068`,
`47797`, `47813`, `48422`, `48484`, `48498`, `48947`, `49146`, `49492`,
`49508`, `49972`, `50012`, `50331`, `50402`, `50642`, `50659`, `51332`,
`51688`, `51843`, `52303`, `53025`, `53048`, `53095`, `55124`, `55285`,
`56371`, `56463`, `57937`, `58615`, `58920`, `60168`, `60299`, `61553`,
`62373`, `62682`, `63332`, `63475`, `63603`, `63757`, `64283`, `65111`.
