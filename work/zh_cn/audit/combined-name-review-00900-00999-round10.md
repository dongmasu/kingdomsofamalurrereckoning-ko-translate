# Combined `base` + `affix` Review: Round 10

- Review date: 2026-10-09
- Scope: `base` IDs 900-999 (100 rows) and all 60 target variants under
  `affix` IDs 90-99.
- Compared English meaning, Japanese source forms, active Korean, Chinese
  supporting evidence, and the existing first-pass audit reports.
- Japanese source forms were used closely for affix slot and variant
  structure; English remains the semantic authority.
- Read-only; no translation CSV was edited. Findings remain preliminary.
- The matching ID ranges are review batches, not verified runtime pairings.
  No item-specific base/affix combination or rendered game name was confirmed.

## `affix` IDs 90-99

Each ID has six target variants, and the Korean wording is identical across
those variants. Japanese uses `オブ` for the postposed `of` forms below,
supporting a suffix-slot reading; it does not establish which particular
`base` row is paired with an affix at runtime.

| ID | English | Japanese | Current Korean | Combined-name follow-up |
| ---: | --- | --- | --- | --- |
| 90 | `of Twilight` | `オブ トワイライト` | `황혼의` | Postposed genitive; check the full Korean item-name construction rather than attaching a bare `의` phrase after a noun. |
| 91 | `Burn` | `燃やす:` | `태우기:` | Action/UI fragment, not an ordinary item modifier. Preserve the colon and check the following prompt text as one instruction. |
| 92 | `of Diminishing` | `オブ ディミニッシング` | `감소의` | Postposed genitive; clarify what diminishes and express the effect as a coherent Korean name, not a stranded genitive. |
| 93 | `Widowmaker's` | `ウィドウメーカーズ` | `위도우메이커의` | Possessive/title fragment. Confirm whether `Widowmaker` is a named weapon, effect, or agent, and keep the complete item name in a consistent register. |
| 94 | `of Slaughter` | `オブ スローター` | `학살의` | Postposed genitive; check whether Slaughter is a named effect/title and avoid approving the isolated genitive as a complete item-name form. |
| 95 | `Unseal` | `封印を解く:` | `봉인 해제:` | Action/UI fragment. Keep it separate from the item-name composition class and verify the command with its target/context. |
| 96 | `Sign to` | `署名する:` | `서명하기:` | Existing first-pass concern remains: the recipient/relation expressed by `to` is not visible in the Korean fragment. Check the complete UI instruction. |
| 97 | `Magus'` | `メイガス` | `마구스의` | English marks possession, while Japanese is a bare transliteration and Chinese means an astrologer/diviner. Verify whether `Magus` is a named role/title or a common role, then make the Korean relation and terminology consistent across the whole name. |
| 98 | `Place Codex On` | `書を置く:` | `법전을 놓기:` | Existing first-pass concern remains: the `on` relation is not explicit in Korean. Preserve the command-fragment class and verify its complete target/location wording. |
| 99 | `of Ascendance` | `オブ アセンダンス` | `승천의` | Postposed genitive. Earlier evidence disagrees on ascension, supremacy, and lineage; keep the sense open and avoid committing to a religious reading from the isolated fragment. |

The 60 variants were all checked; their multiplicity and Korean sameness across
variants are unchanged.

## `base` IDs 900-999

Previously logged questions are marked as carried forward, not new findings.
The whole-name pass also checks whether parenthetical English and title-like
wording remain readable when a base is modified; it does not require English
parentheses on every item.

| ID | English | Current Korean | Combined-name follow-up |
| ---: | --- | --- | --- |
| 900 | `The Mermain's Scales` | `인어의 비늘` | Check whether `Mermain` is a source spelling/name or a typo for `merman`; the Korean chooses a generic mermaid sense and loses traceability to a possible named creature. |
| 904 | `Rathir Catacombs` | `라시르(Rathir) 지하 묘지` | Carried-forward corpus issue: normalize `Rathir` against ID 965 and `default` ID 125. The parenthetical policy should be decided for the full location name, not only this row. |
| 909 | `Two Knights and a Troll, Part V` | `두 기사와 트롤, 제5부` | Treat as a likely book/series title. Check title punctuation and naming style against other named books; do not let an attached modifier turn it into ordinary descriptive prose. |
| 911 | `Sorrow` | `비애` | Confirm whether the capitalized singular is a named item/effect or an ordinary emotion; the latter may not preserve a title identity in a generated name. |
| 926 | `Omnibus Arcana` | `아르카나 개론서` | Recheck whether this is a named volume/collection or a generic introductory book. The current explanatory wording may shift the proper-title tone. |
| 928 | `Crowngold Old` | `크라운골드 고대품` | The English word order and Korean category noun do not yet read as one clear item title. Resolve whether `Old` denotes age/condition or is part of a named material/item designation. |
| 936 | `the Dirge's Bedroll` | `디르지(Dirge)의 침낭` | Determine whether `Dirge` is a proper name or “dirge” as a common noun. If it is a name, decide whether the embedded English parenthetical is consistent with comparable named equipment. |
| 937 | `Shield of Ambient` | `주변의 방패` | Carried-forward source conflict: English capitalizes `Ambient`, Japanese suggests “view,” and Chinese suggests “all-around.” The effect/name sense remains unresolved; do not treat the literal Korean as settled. |
| 949 | `Helius' Aim` | `헬리우스(Helius)의 조준` | Verify whether `Aim` names an effect/property or Helius's act/skill of aiming. The current genitive-plus-action noun can read like a sentence fragment rather than a concise item title. |
| 954 | `Captain Loot` | `대장의 전리품` | English/Japanese leave open whether this is a named character/title or a captain's loot. Resolve the relation before choosing a possessive or descriptive item-name tone. |
| 956 | `Scholia Arcana Main Hall` | `아르카나 학회(Scholia Arcana) 대강당` | The embedded English name interrupts the Korean institution-and-location phrase. Keep the organization identity traceable while deciding one readable whole-name parenthetical policy. |
| 963 | `The Adventure VI` | `모험 VI` | Check whether this is a numbered work/title; Korean currently reads as a generic noun plus numeral. Apply the project's title treatment consistently rather than translating the English article mechanically. |
| 965 | `Scholia Arcana Rathir Chapter` | `라시르 아르카나 학회 지부` | Carried-forward `Rathir` spelling issue from ID 904. Also align the named institution's treatment with ID 956; the current Korean omits the English name here. |
| 973 | `Seasons Sanctuary` | `계절의 성소` | Carried-forward relation question: Japanese explicitly links the sanctuary to the House of Seasons, while English/Chinese abbreviate it. Preserve the faction relation if confirmed. |
| 983 | `Fate's Edge` | `운명의 칼날` | Verify whether `Edge` is a named weapon title or an ordinary blade descriptor. The Korean item category is plausible but may flatten a distinctive proper name. |
| 989 | `Greaves of Bolgans' Bane` | `볼건 파멸자의 정강이받이` | Carried-forward possessive ambiguity: the current sequence can mean greaves belonging to a Bolgan destroyer, not greaves associated with being the Bolgans' bane. Keep the relation open pending item context. |
| 991 | `Harbinger's Cowl` | `선구자의 두건` | Confirm whether `Harbinger` is a named role/effect or a generic forerunner. If it is a title, align this equipment name with the corpus-wide title and English-parenthetical policy. |
| 995 | `Porthole Buckler` | `현창 소형 방패` | The literal technical term plus category noun sounds like a specification rather than a unified item name. Check whether `Porthole` describes the shield's shape/design or is a proper-name modifier. |
| 999 | `Flawless Magnifying Grip` | `흠 없는 확대 손잡이` | Recheck `Magnifying` and the crafted-part terminology against other `Magnifying Grip/Handle` rows; keep the quality-plus-component name concise and consistent. |

Other rows in this range received a whole-name reading. This base resource also
contains books, notices, locations, and action-like labels, so not every row
should be forced into an equipment-plus-affix construction.

## Status and Resume

This round revisited 100 already-scanned `base` rows and 60 already-scanned
`affix` variants under the combined-name lens. Cumulative follow-up coverage
is 1,000/4,844 `base` rows and 580/3,451 `affix` variants
(1,580/8,295 combined rows/variants). The original 73,430/73,430 first-pass
coverage is unchanged. Resume with `base` IDs 1000-1099 and `affix` IDs
100-109.

The inspected loot/item-set assets are opaque binaries, and no human-readable
item-specific pairing table was identified. Attachment comments therefore
describe source-slot and Korean grammar questions, not verified in-game
combinations.
