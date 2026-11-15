# Five Expanded Asset Follow-up Revalidation

- Date: 2026-11-11.
- Scope: all 252 previously unrecorded `default` IDs across five assets.
- English was the semantic anchor; Japanese was the primary voice/register
  reference, with Chinese as supporting evidence.
- Twenty-five correction candidates and two evidence-limited register holds
  were recorded. No translation CSV or extracted game asset was changed.

## Grouping Evidence and Limits

The five assets have no explicit `QUEST_ID` or `NPC_` symbol. Their serialized
dialog handlers carry `SQ49`, `SQ86`, `SQ82`, `SQ112`, and `FFQ84` prefixes,
respectively. These prefixes and asset membership support conservative
quest/topic grouping only. They do not map a localization key to a speaker,
handler, branch, or playback order. Individual lines were reviewed on their
own evidence; no shared speaker or voice sequence was inferred.

All 252 rows were compared across English, Japanese, Chinese, and active
Korean. No row has a line-break, runtime-placeholder, or markup discrepancy.
Every exact-English duplicate group within these five sets already has
matching Korean text.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `2291` | Meaning / terminology | `Members Only` is rendered `회원 전용`, which reads like a club or subscription. Japanese specifies members of the religious order (`教団員のみ`); use a context-appropriate form such as `교단원 전용`. | High |
| `6593`, `8217`, `12427`, `22834`, `23790` | Terminology consistency | These lines refer to the same Ordination Tome, but Korean alternates among `책`, `고서`, and `서품서`. Use the established artifact term `서품서(Ordination Tome)` where the line identifies that specific tome, adapting grammar and the English pairing to the exact source wording. | High |
| `33581` | Naturalness | `또 만났군` sounds stiffer than English `We meet once again` and Japanese `また会ったわね`. Consider a more conversational equivalent such as `또 만났네`, without inferring the speaker's identity. | Medium-high |
| `43429` | Terminology consistency | `St. Odwig's Perpetual` is rendered `성 오드윅 영속 수도회`, while the same institution is otherwise `성 오드윅 영구 선교원`. Japanese describes the monastery and Chinese retains the perpetual mission reference. Align the Korean institution name with the established `성 오드윅 영구 선교원`, while preserving the source's shortened wording. | Medium-high |
| `56193`, `59891` | Terminology consistency | `Order of Mitharu` is translated as `미사루 수도회`, while other occurrences in this same quest use `미사루 교단`. Use one organization name consistently; `미사루 교단(Order of Mitharu)` follows the majority of the reviewed references. | Medium-high |
| `5371`, `33076` | Terminology consistency | Plagueshield `parcels` vary between `짐꾸러미`, `꾸러미`, and `묶음` in this quest. The established `꾸러미` is clear and natural; align these two outliers without changing the surrounding sentence structure. | High |
| `8947` | Objective format | `Gather the lost Plagueshield` is rendered as the imperative `모아라`, unlike the established concise `-기` form used by the neighboring quest objectives. Consider `잃어버린 역병 방호제(Plagueshield) 모으기`. | High |
| `45932` | Text style / naturalness | This quest-failure journal entry uses polite endings (`사망했습니다`, `완료할 수 없습니다`), while the same asset's comparable journal/status text is plain narrative and Japanese is plain. Consider `필수 당사자 중 한 명이 사망했다. 이 퀘스트는 더는 완료할 수 없다.` | High |
| `17936` | Naturalness | `Thanks for nothing` is translated as `도움도 안 되는군`, which sounds stiff beside Japanese `役に立たないわね`. Consider a more conversational complaint, such as `영 도움이 안 되네`. | Medium-high |
| `29219` | Naturalness | `I'm not an unreasonable person` is rendered literally as `난 비합리적인 사람이 아니야`, which sounds analytical rather than describing a person who is not being unreasonable. Consider `난 막무가내인 사람은 아니야` or an equally natural equivalent. | High |
| `38308` | Terminology / naturalness | `weaponsmith` is rendered `무기장이`, while the same asset's `The Weaponsmith` at `58198` is `무기 장인`. Use the established `무기 장인` form, with particles adjusted to the sentence. | High |
| `61894` | Meaning / naturalness | `avenge the death of ... Jory` is rendered `조리(Jory)의 죽음도 갚아 줄 수 있었다`, an awkward calque. Japanese `敵を討つ` and Chinese `报仇` support `조리(Jory)의 죽음에 복수할 수도 있었다` or a similarly natural expression. | High |
| `22579`, `26672`, `32505`, `45949`, `54539` | Name / title consistency | The story name `Lady's Children` is rendered as `여인의 아이들`, `귀부인의 아이들`, `귀부인의 자녀들`, and `귀부인의 자식들`; several occurrences also omit the English pairing. Japanese consistently identifies the Ansilla legend. Use the established Korean name `안실라 부인의 아이들` and pair each exact source form in English, for example `안실라 부인의 아이들(The Lady's Children)`. Same-asset comparators `8108`, `26015`, and `42681` already use `안실라 부인의 아이들(Lady Ansilla's Children)`. | High |
| `40002` | Meaning / naturalness | `Just wait till I show her` is rendered `내가 찾은 걸 보여 주기만 해봐`, which can sound like a challenge or threat. Japanese says `見返してやるわ` (“I'll show/prove her wrong”). Recast it as the speaker's resolve to show her sister the dolls and prove the point. | High |
| `54527` | Meaning / naturalness | `the secret hiding place for the Ansilla family gems` says the dolls concealed the gems; Korean `보석이 숨겨진 비밀 장소를 나타내는` says they represent a hiding place. Japanese and Chinese support the concealment reading. Rephrase to say the dolls were the secret place where the family gems were hidden. | High |

## Evidence-Limited Holds

| ID | Question | Reason and disposition |
| ---: | --- | --- |
| `11366`, `20657` | Conversational register | Japanese uses plain conversational forms, while Korean uses polite `-요` forms. The asset has no NPC symbol or key-to-speaker mapping, and a deliberate shift in addressee or interaction stage cannot be excluded. Keep the register question unresolved rather than normalizing either line from asset membership alone. |

## Retained Text and Repeated Lines

The remaining 225 rows were retained after source comparison. Exact-English
duplicate groups, including the repeated `I found this Plagueshield` lines
and parallel Haxhi Mountain Troll journal entries, already match in Korean.
The English, Japanese, Chinese, and Korean versions have matching line-break,
runtime-token, and markup structure throughout this batch.

## Complete ID Sets

- `1260457.quest_bxml` (`SQ49` handler prefix; 50 IDs): `109`, `2123`,
  `2291`, `3726`, `6593`, `7234`, `8217`, `9994`, `11366`, `12427`,
  `12769`, `13792`, `14525`, `17311`, `17862`, `18809`, `20446`,
  `20535`, `20657`, `21789`, `22834`, `23100`, `23790`, `26901`,
  `29011`, `29112`, `30884`, `30932`, `31115`, `31222`, `32930`,
  `33581`, `37082`, `37916`, `39689`, `40876`, `43429`, `44436`,
  `45181`, `48536`, `50175`, `51678`, `56193`, `57837`, `59416`,
  `59891`, `60837`, `63563`, `63653`, `64601`
- `1269299.quest_bxml` (`SQ86` handler prefix; 50 IDs): `131`, `2266`,
  `3057`, `3461`, `4523`, `4574`, `5371`, `7578`, `8947`, `10361`,
  `10671`, `11408`, `12025`, `12465`, `13348`, `14876`, `15449`,
  `16063`, `18131`, `18430`, `18822`, `21106`, `21467`, `25755`,
  `28211`, `31793`, `32638`, `33076`, `33724`, `34919`, `37626`,
  `39541`, `40531`, `40597`, `41687`, `42415`, `45381`, `45639`,
  `48585`, `48782`, `51388`, `52541`, `56040`, `58511`, `59232`,
  `60756`, `61859`, `63752`, `64037`, `64716`
- `1310306.quest_bxml` (`SQ82` handler prefix; 49 IDs): `71`, `414`,
  `1154`, `2567`, `2849`, `3255`, `3887`, `6179`, `7182`, `7216`,
  `9196`, `10455`, `10907`, `11162`, `14679`, `17693`, `17782`,
  `17936`, `18031`, `19114`, `20287`, `20352`, `21585`, `22549`,
  `24547`, `25262`, `26335`, `29219`, `33339`, `37451`, `38308`,
  `39363`, `40057`, `40899`, `41017`, `41534`, `48560`, `49580`,
  `50119`, `50346`, `51530`, `52912`, `53160`, `54946`, `55635`,
  `57630`, `58198`, `60211`, `60341`
- `1363142.quest_bxml` (`SQ112` handler prefix; 52 IDs): `808`, `875`,
  `1170`, `2456`, `3741`, `4155`, `4563`, `5146`, `6291`, `9974`,
  `14212`, `15767`, `17929`, `20124`, `20250`, `23224`, `23555`,
  `23963`, `24043`, `25382`, `26807`, `27865`, `29163`, `29425`,
  `31821`, `32127`, `33054`, `33180`, `37879`, `40319`, `40961`,
  `41123`, `41670`, `41939`, `45888`, `45932`, `46670`, `48622`,
  `48891`, `50671`, `51412`, `51739`, `51891`, `52898`, `54995`,
  `55314`, `59616`, `60108`, `60442`, `61894`, `64742`, `64854`
- `1652781.quest_bxml` (`FFQ84` handler prefix; 51 IDs): `143`, `3195`,
  `4644`, `4874`, `5396`, `7731`, `8267`, `13231`, `14529`, `15165`,
  `15375`, `16220`, `16496`, `18812`, `20866`, `22579`, `22729`,
  `23471`, `26015`, `26672`, `26824`, `29629`, `32505`, `33151`,
  `33282`, `35294`, `36334`, `38757`, `39368`, `40002`, `40742`,
  `42681`, `43505`, `45694`, `45880`, `45949`, `46253`, `46845`,
  `47994`, `51394`, `51697`, `54527`, `54539`, `57511`, `57917`,
  `57970`, `60491`, `61170`, `61261`, `61641`, `61887`

All 252 IDs have four-language source fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
Proposed changes remain review findings and have not been applied.
