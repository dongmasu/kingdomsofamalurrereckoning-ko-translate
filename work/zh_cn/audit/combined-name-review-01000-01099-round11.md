# Combined `base` + `affix` Review: Round 11

- Review date: 2026-10-09
- Scope: `base` IDs 1000-1099 (100 rows) and all 60 target variants under
  `affix` IDs 100-109.
- Compared English meaning, Japanese source forms, active Korean, Chinese
  supporting evidence, and existing first-pass audit reports.
- Japanese was used especially for affix slot and variant structure; English
  remains the meaning authority. Findings are preliminary; no translation
  CSV was edited.
- Matching ID ranges are review batches only. They do not establish actual
  runtime base/affix pairings or rendered complete names.

## `affix` IDs 100-109

Each ID has six target variants. The active Korean wording is identical among
the six variants for each ID.

| ID | English | Japanese | Current Korean | Combined-name follow-up |
| ---: | --- | --- | --- | --- |
| 100 | `Despoiler's` | `ディスポイラーズ` | `약탈자의` | Possessive fragment; test the relation in its post-base slot and determine whether `Despoiler` is a named role/title or a generic agent. |
| 101 | `Favors's` | `Favors's` | `호의의` | The English source has a possessive spelling anomaly and the sense of `Favor` is unsettled. Keep the source issue open; check whether the Korean relation reads as an item property rather than a dangling genitive. |
| 102 | `Received` | `受け取った` | `받은` | Past-participle modifier; verify the implied recipient/object from the complete phrase and keep the concise item/UI register. |
| 103 | `Destroy` | `壊す:` | `파괴하기:` | Colon-marked action/UI fragment, not a conventional item modifier. Preserve its command function and check the following target text. |
| 104 | `Frame` | `火をつける:` | `액자에 넣기:` | Strong meaning conflict: English and several European references indicate framing/implicating someone, while Korean chooses a picture-frame sense and Japanese says “set fire.” Re-evaluate against English and the complete UI prompt; do not carry the isolated Japanese reading into the Korean item-name rule. |
| 105 | `Pick Up` | `入手する:` | `줍기:` | Action/UI fragment. Confirm whether the game action means pick up/obtain and preserve a consistent command style with neighboring action fragments. |
| 106 | `Cotton` | `コットン` | `면` | Check that the material noun works as a compact preposed modifier, distinct from a standalone fabric name. |
| 107 | `Blow up` | `爆破する:` | `폭파하기:` | Colon-marked action/UI fragment; preserve the action sense and verify its target/context as a whole instruction. |
| 108 | `of the Embers` | `オブ ジ エンバース` | `잿불의` | Japanese marks a postposed `of` relation. Check the Korean name order and whether Embers is a named effect/group, rather than leaving a bare genitive after the base. |
| 109 | `Bolstering` | `ボルスタリング` | `강화하는` | Meaning is plausible, but the verb-relative form may sound sentence-like in an item name. Confirm the effect and choose a concise modifier form consistent with nearby quality/effect names. |

The existing first-pass concerns at IDs 101, 104, and 109 remain open. All 60
variants were checked and retained.

## `base` IDs 1000-1099

Carried-forward findings are not counted as new first-pass discoveries. Whole
name style includes proper-name traceability, Korean modifier order, and the
distinction between equipment names and UI/book/description strings.

| ID | English | Current Korean | Combined-name follow-up |
| ---: | --- | --- | --- |
| 1002 | `Chaos Kite Shield` | `혼돈의 연 방패` | Carry forward the `Kite Shield` shape-term issue at ID 440. `연 방패` can suggest a toy kite; choose a shield-shape term consistently if confirmed. |
| 1005 | `Aron Excavations Office` | `아론(Aron) 발굴 사무소` | Confirm whether Aron is a named person/company and keep parenthetical English placement consistent across the full institutional name. |
| 1014 | `Master Alchemist's Art` | `장인급 연금술사의 기술` | Distinguish `Master` as a crafting tier from the possessive relation to an alchemist; keep the rank and item-title relation clear together. |
| 1018 | `Gem of Shelter` | `은신처의 보석` | Check whether Shelter is a named effect or a refuge; compare the semantic choice, not just the Korean genitive, with `Gem of Haven` at ID 815. |
| 1022 | `Greater Merchant's Command` | `상급 상인의 지휘` | Carried forward: English/Japanese/Chinese differ on command, order, and sales pitch. `지휘` may imply military command; retain the uncertainty until effect/item context resolves it. |
| 1023 | `Greater Freezing Sentinel` | `상급 빙결 감시자` | Confirm whether Sentinel is an equipment/effect name or a person/guardian; the current noun sequence can read as a frozen watchman rather than one coherent item title. |
| 1027 | `Gallows Bloom` | `교수대의 꽃` | Carry forward the source spelling distinction from `Gallow's Bloom` at ID 504. Keep the Korean form consistent without silently normalizing the English key. |
| 1033 | `The Salon Magisterium Key` | `살롱 마지스테리움(Salon Magisterium)의 열쇠` | Preserve the named institution, but check whether the English parenthetical interrupts the compact key-name construction; apply the same whole-name policy used at ID 956. |
| 1035 | `House of Pride` | `긍지의 가문` | Align `House` as a faction/institution with the project's other `House of ...` names; do not alternate building, family, and organization senses without context. |
| 1044 | `Invoice from Sigra Thorin` | `시그라 소린(Sigra Thorin)의 송장` | English says invoice, Japanese bill, and Chinese receipt. `송장` can mean a shipping label; resolve the document type and relation before fixing the title. |
| 1046 | `"Timos" Discourse` | `“티모스(Timos)” 논고` | Check whether this is a book/title, a discourse by Timos, or a named topic. Keep quotation marks, name parentheses, and noun order readable as one title. |
| 1049 | `Warrior Unique Sets` | `전사 고유 세트` | Determine whether this is a player-facing equipment category or an internal collection label; do not force a title-style English parenthetical without evidence. |
| 1052 | `Master Chaos Cataclysm Recipe` | `장인급 혼돈 대격변 제조법` | Carry forward the rank mismatch: English says `Master`, while Japanese/Chinese indicate a high-tier recipe. Confirm the crafting tier and align `Master` terminology with other base names. |
| 1055 | `Boots of Justice` | `정의의 장화` | Check whether Justice is a named effect/title and ensure the Korean `의` relation remains a complete equipment name when modified. |
| 1056 | `Jail Cell` | `감옥` | The Korean loses the specific cell/compartment category present in English, Japanese, and Chinese. Retain the distinction between a prison and an individual cell. |
| 1059 | `Contract Board` | `계약 게시판` | Check whether this is a UI object/category label or a named board; use the same concise register as other in-world interface objects. |
| 1060 | `The Manor Underbelly` | `저택 밑바닥` | Carry forward the question whether Underbelly is a named section or figurative “underside”; the literal Korean can sound physically low rather than a location name. |
| 1062 | `Dirge's Dancing Shoes` | `디르지(Dirge)의 춤추는 신발` | Compare with `the Dirge's Bedroll` at ID 936. Determine whether Dirge is one proper name and whether the English-parenthesis policy and item-name tone are consistent across both. |
| 1066 | `Master Frost Ward String` | `장인급 서리 워드 활시위` | Keep `Ward = 워드` consistent with the project glossary; confirm whether `Frost Ward` is a named effect and whether the modifier chain reads clearly before the component noun. |
| 1071 | `The Mantis' Legs` | `사마귀 다리` | Check whether this denotes creature parts or a named armor/item. The Korean compound is concise but may lose the source's title/possessive identity. |
| 1077 | `Small Interior` | `소형 실내 공간` | Existing audit notes this may be an internal asset/category label; confirm player-facing context before imposing item-title styling. |
| 1079 | Full item description | Full Korean sentence | This is a description, not a composable item-name row. Review sentence tone and meaning separately; do not count it as a base title with an attached affix. |
| 1083 | `Imminent Cap` | `임박한 모자` | The literal adjective reads as an approaching hat. Confirm whether Imminent is a named quality/effect and use the same compact modifier register as comparable equipment names. |
| 1089 | `Skill Book (Stealth)` | `기술서(은신)` | Keep the skill label's established Korean term and check the parenthetical as part of one readable book title; this is not evidence that every base needs English in parentheses. |
| 1092 | `Dirgesinger Gloves` | `디르지싱어(Dirgesinger)의 장갑` | Align the Dirgesinger name and parenthetical choice with IDs 936 and 1062; avoid treating related named equipment as unrelated literal phrases. |
| 1094 | `Gem of Cultivation` | `육성의 보석` | Check whether Cultivation means growth, training, or a named game effect. The present generic genitive may not preserve a specific item-property identity. |
| 1099 | `The New Assistant` | `새로운 조수` | Determine whether this is a named title/role or a generic description; retain the same title treatment used for other named books and equipment. |

Other rows received a whole-name reading. This resource includes notices,
letters, locations, and descriptions as well as equipment, so the combined-name
test does not apply mechanically to every row.

## Status and Resume

This round revisited 100 previously scanned `base` rows and 60 previously
scanned `affix` variants under the combined-name lens. Cumulative follow-up
coverage is 1,100/4,844 `base` rows and 640/3,451 `affix` variants
(1,740/8,295 combined rows/variants). The original first-pass coverage is
unchanged. Resume with `base` IDs 1100-1199 and `affix` IDs 110-119.

Loot/item-set assets inspected so far are opaque binaries; no human-readable
pairing table or rendered complete name has been confirmed. Notes here concern
source meaning, likely slot, and Korean style, not verified runtime pairings.
