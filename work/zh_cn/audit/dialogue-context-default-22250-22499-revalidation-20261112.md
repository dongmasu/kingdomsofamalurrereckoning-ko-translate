# Sequential `default` Revalidation: IDs `22250`-`22499`

- Date: 2026-11-12.
- Compared all 250 current Korean rows against same-ID English, Japanese,
  and Chinese for meaning, naturalness, register, terminology, and format.
- Checked 66 existing ledger records and added 184 previously unrecorded
  IDs. Thirteen candidate IDs and eleven hold IDs are documented below.
- No translation CSV, immutable source, extracted asset, or binary changed.

## Correction Candidates

These findings are proposals, not approval to edit the translation CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `22270` | Naturalness / speech level | Japanese uses plain declarative speech, while Korean introduces `감사했소 ... 것이오`. Consider `우리 가문을 해방하려는 그대의 뜻에 깊이 감사했어. 그래서 이렇게 만난 거야.` Preserve the solemn gratitude; the asset does not establish an individual speaker. | Medium-high |
| `22278` | Terminology / meaning | `Longsword, Greatsword, and Hammer` use the superseded `장검, 대검, 망치`, contrary to the user's selected `롱소드, 그레이트소드, 해머`. Japanese `チャージムーブ` supports a charged move, not necessarily a rushing attack. Consider `롱소드, 그레이트소드, 해머의 차지 특수 공격을 잠금 해제합니다.` Preserve the localized markup wrapper and embedded break. | High |
| `22298` | Naturalness | Retain the existing proposal: `이 위협을 경고해야겠다` has an awkward object. Consider `브리짓(Bridgette)을 찾아 이 위협을 알려야겠다`, preserving the spy, target, and Offering details. | High |
| `22300` | Name pairing / naturalness | `Nil` is bare `닐`, and `네가 그가 가는 걸` is clumsy. Consider `늙은 닐(Nil)이 ... 뛰어 내려왔어. 그가 지나가는 걸 네가 못 봤다니 모르겠군.` Preserve the reported shout/gasp and the English downward direction; Japanese differs on the direction. | Medium-high |
| `22302` | Naturalness | `staring longingly at me` / Japanese `憧れの目で見つめて` is rendered as `날 그리운 눈으로 보며`. Consider `날 애타는 눈으로 바라보며`, retaining the insult and violent threat rather than softening them. | Medium-high |
| `22306` | Meaning / naturalness | `mana reflected from mortals` becomes `필멸자에게 반사된 마나`, reversing or obscuring the direction. Consider `비전의 장막(Arcane Veil)에 이끌린 필멸자에게서 반사되어 나온 마나`. English and Japanese both identify mortals as the source of the reflection. | High |
| `22374` | Naturalness | Retain the Brun quest finding. `브룬(Brun)이 만날 때까지` lacks a natural object/direction. Consider `이제 낡은 감시탑 옆에서 브룬(Brun)이 만나러 오기를 기다려야겠다.` Japanese explicitly says to wait for Brun to come. | High |
| `22387` | Naturalness | The dialogue's `준비를 시작했다 ... 함께 말이다` sounds like written exposition. Consider `페이(Fae)와 필멸자를 막론하고 헌신적인 이들을 조금 모아, 여름 궁정(Summer Court)의 위대한 노래들이 영원히 남을 길을 준비하기 시작했어.` Preserve the small mixed group and its purpose; do not infer a named speaker. | Medium |
| `22391` | Naturalness / speech level | The existing asset pass left `안녕하시오 ... 경이오 ... 말이오` unflagged. Reopen against Japanese plain speech and the conversational review policy. Consider `반가워. 나는 여름 제국의 할시오르(Halcyor) 경이야. 솔직히 네가 나타나서 우리 모두 놀랐어. 다른 이를 본 지... 글쎄, 여러 세대는 됐거든.` The explicit self-introduction identifies Lord Halcyor in this line only. | Medium-high |
| `22432` | Terminology / journal voice | Retain the SQ01 Leechwood candidate: replace bare `거머리나무` with established `리치우드(Leechwood)`. The journal also uses `떠돌아다닌대 ... 있다고 해 ... 찾아야 해`; consider narrative `떠돈다고 한다 ... 뜰 수 있다고 한다 ... 찾아야겠다`. Do not reinterpret the wandering well as Ainmhi wandering. | High |
| `22443` | Naturalness | Reopen `정말? 그럼 떠나라.` against Japanese `そう？ なら行くといいわ`. Consider `그래? 그럼 가 봐.` to avoid an unexplained switch from a casual question to a written imperative; retain dismissal. | Medium-high |
| `22455` | Objective form | `Destroy the Contraband` is an action objective. Consider `밀수품 파괴하기` rather than bare `밀수품 파괴`, without changing the target. | High |
| `22461` | Terminology / naturalness | Retain the TR03 proposal: `따개를 어떻게 꺼내지?` obscures the named Master's Pick. Consider `달인의 자물쇠따개(Master's Pick)를 어떻게 꺼내지?` Japanese and quest context support freeing the item, not unlocking a door. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `22264` | Meaning | Prior adjudication retained the family-directed vow, which remains valid. Separately, English `fall for this` can mean falling for a trick, but Japanese describes the Tuatha's downfall and does not establish a scheme. Do not delete the vow or decide whether `이 계략에 ... 넘어올 거야` is intended without scene evidence. |
| `22285` | Meaning | Retain the asset-level hold over `deserves a reckoning` / `응보를 받을 자격`. Japanese preserves the ambiguity, while Chinese paraphrases it as deserving respect. |
| `22313` | Meaning | Retain the previous unresolved poem ending. English `Beside this hill he crafts from sand` can attach the sand-crafting to the hill; Japanese and Chinese divide it differently. Do not silently supply an object or rearrange the eight poetic lines. |
| `22319` | Meaning / duplicate context | English `Collect the contract` also occurs at `19618` and `40915`. Korean differs between accepting and completing a contract, but Japanese explicitly distinguishes `依頼を受ける` from `依頼を終える`. The old duplicate-edit proposal `계약서 회수` is not sufficient authority to overwrite those contextual distinctions. Keep unresolved pending quest-stage evidence rather than force identical Korean. |
| `22356` | Meaning | Retain the TR07 hold on `squill-headed` rendered as `오징어 대가리`. The other references omit the insult rather than establish the intended image. |
| `22389` | Naturalness | Prior verification held the proposal to simplify `내가 걸어온 이야기의 흐름은`. Both versions are plausible; no new scene evidence resolves the stylistic disagreement or the intended technical sense of `telling`. |
| `22404` | Meaning / naturalness | Prior verification held the proposal to turn the final questions back into unfinished English fragments, because Japanese explicitly asks the visitor's business. Preserve the hesitation and keep the unresolved cross-source difference visible. |
| `22409` | Meaning | English `consuming` and Japanese `衰え` differ. Current `소비하고` follows English; do not replace it with decline/aging just to follow Japanese. |
| `22429` | Format / name status | English is only a crown description, but Korean adds `(Crown of Kandrian Kings)` as if quoting an official item title. The same-ID sources do not establish that title; verify a separate item-name key before approving removal or normalizing the title. |
| `22489` | Meaning | Retain the prior uncertainty: English says the decision is favorable, Korean introduces a comparison (`이쪽이 더 유리`), and Japanese explicitly accepts marriage. The row alone does not settle what was chosen. |
| `22497` | Format | Japanese has two embedded breaks where English, Chinese, and Korean have one. All seven numbered tokens remain in order. Record this layout difference without automatically inserting a blank line or treating tokens as missing. |

## Rechecked Decisions And Structure

- The applied meaning corrections at `22337` and `22469` remain supported:
  fascination with Niskaru's power, Creth's bravery, and the day/night
  contrast are preserved. The existing `사이온(Scion)` at `22408`,
  `스레시(Thresh)` at `22434`, and `계약서를 제출` at `22478` are retained.
- `22252` and `22476` are progress/result labels, not necessarily imperative
  objectives. Their noun forms are not automatically changed to `-하기`.
  `22259` preserves the localized leashing explanation, and `22294`
  follows the English/Chinese difficulty name rather than Japanese Easy.
- `22272` was previously retained and remains a natural card-result line.
  `22330`'s `어릴 때` is a natural age rendering of `as a girl`, supported
  by Japanese; it is not by itself evidence of the wrong speaker gender.
  `22343` is a written history, so its declarative style is intentional.
- `22382`, `22412`, `22415`, `22449`, `22462`, `22469`, `22492`, and
  `22496` were checked without inventing speaker identity, a full building
  name from an abbreviated possessive, or unestablished item classifications.
- The range touches 51 exact-English duplicate groups (1,155 corpus rows).
  Only `Collect the contract` has Korean variation, with the Japanese
  distinction documented above. Identical English alone does not authorize
  overwriting an evidenced source/context difference.
- All per-row logical break counts match except `22497`. Korean embedded
  CRLF and reference LF represent the same logical breaks. Localized markup
  contents at `22259`, `22278`, and `22412` are not missing control tokens.
- Asset/NPC/handler clues were not used to invent per-key speakers,
  branches, or playback order. Existing ledger evidence remains intact.

After recording this range, coverage is 33,646 of 65,135 IDs (51.66%),
leaving 31,489. Sequential coverage reaches ID `22499`; the next range is
`22500`-`22749`.

## Applied Corrections

On 2026-11-14, all 13 correction candidates were rechecked against the
current English, Japanese, Chinese, and Korean rows, then applied:

| ID | Applied correction |
| ---: | --- |
| `22270` | Replaced the unsupported archaic `-소/-오` endings with natural plain speech matching Japanese. |
| `22278` | Standardized the weapon names to `롱소드`, `그레이트소드`, and `해머`; rendered charged special attacks as `차지 특수 공격` and preserved the markup and line break. |
| `22298` | Replaced the unnatural `위협을 경고하다` with `위협을 알리다`. |
| `22300` | Added `닐(Nil)` and clarified that the witness missed him running past. |
| `22302` | Replaced the unnatural longing gaze and literal insult with a natural taunt, preserving the threat and casual register. |
| `22306` | Clarified that mana is reflected from mortals drawn to the Arcane Veil, rather than reflected onto them. |
| `22374` | Clarified that the journal author is waiting for Brun to come meet them. |
| `22387` | Restructured the written-sounding sentence and clarified the small group of dedicated Fae and mortals. |
| `22391` | Changed the unsupported archaic formal speech to conversational plain speech; paired the title as `할시오르 경(Lord Halcyor)`. |
| `22432` | Rechecked and smoothed the journal sentence while retaining `리치우드(Leechwood)` and the established journal register. |
| `22443` | Replaced the abrupt written imperative with a natural casual dismissal. |
| `22455` | Changed the action objective to `밀수품 파괴하기`. |
| `22461` | Restored the named item `달인의 자물쇠따개(Master's Pick)` and clarified that the speaker asks how to retrieve it. |

Only these 13 IDs' `source_fingerprint` values were updated in the
append-only review ledger. Prior holds and all unrelated ledger fields and
rows were preserved. No speaker or dialogue order was inferred.
