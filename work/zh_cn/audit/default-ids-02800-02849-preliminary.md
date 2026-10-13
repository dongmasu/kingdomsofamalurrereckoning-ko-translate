# Preliminary Language Scan: `default` IDs 2800-2849

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 2800-2849.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled source-keyed historical questions and checked names, idioms,
  ability values, UI labels, and property references.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 2800 | 메라운(Meraun)의 저주 | Confirm the canonical Korean pronunciation of `Meraun` against related lore/quest entries. | English/Japanese/Chinese identify the same name but differ in transliteration. Korean's `메라운` is plausible and preserves the English spelling. This repeats the historical question. | Medium |
| 2804 | 윌 도널(Will Donall) | Correct the parenthetical spelling to the English source `Wil Donall` (one `l`); check the repeated occurrence at ID 5990 for the same traceability typo. | English spells the name `Wil Donall`; Japanese and Chinese support the Korean pronunciation but do not determine Latin spelling. The active Korean's `Will Donall` adds an `l`. | High |
| 2805, 2807 | `피해 저항 +12%` / `마나 30%`; `피해량이 8초 동안 25% 감소` / `마나 20` | Retain the displayed values and two-line layouts. Confirm only whether the game's `Sustained Cost` convention means a continuous drain or a percentage of maximum Mana. | English/Japanese/Chinese values and Korean values match. Japanese explicitly says maximum Mana at ID 2805, but English does not; do not add “maximum” without confirming the UI convention. This repeats the historical question. | Medium |
| 2808 | 내 동료들을 고통에서 해방시켜 줬어? | Confirm whether `put my mates out of their misery` means killing them as an act of mercy in this quest context; preserve the euphemism if so. | English idiom can imply ending suffering by killing. Japanese and Chinese also say “free from suffering,” so the exact action is not settled by the isolated string. Korean preserves the euphemistic surface. | Medium |
| 2810 | 손에서 놓을 수 없는 책 | Keep the idiomatic “page-turner” meaning; confirm whether this is a named book/title or a generic description. | English idiom, Japanese, and Chinese all describe a compelling book. Korean is natural and captures the idiom. This repeats the historical question. | Medium |
| 2814 | 낮추기 | Confirm the UI function before choosing between an action (`낮추기`) and a state/category label (`낮음`/`하위`). | The isolated English `Lower` and Chinese `较低` allow a category/state reading; Japanese transliterates the label. This repeats the historical question. | Medium |
| 2815 | 갤로스 엔드(Gallows End) ... | Align this place-name spelling with the established corpus form; do not normalize globally in this preliminary pass. | The row correctly identifies Gallows End as a named region, but other active rows use several forms (`갤로스`, `갤로우스`, `갈로스`, and literal renderings). This repeats the historical question and corpus-wide name scan. | Medium |
| 2820 | 회계원(Bursar)의 징수원들이 왔다 | Confirm whether `Bursar` is the named office/title (and align it with `Grand Bursar`) or should be translated as an accounting office; improve the Korean compound after that decision. | English identifies the Bursar's collectors. Japanese uses an accounting office, while Chinese transliterates the name. Korean's `회계원 ... 징수원` is understandable but potentially redundant. This repeats the historical question. | Medium |
| 2823 | ... 혼돈 지대도 견뎠다고. | Confirm whether `Chaos field` is a named magical area or a generic field/zone of Chaos; retain that the speaker endured it to find the addressee. | The references agree on enduring/traversing a Chaos area but do not settle whether it is a proper location. Korean's `혼돈 지대` is plausible. This repeats the historical question. | Medium |
| 2824 | 오다 셀프레드(Oda Celfred) ... 돌처럼 강인하지. | Verify the canonical name spelling and the referent of “she”; retain the speaker's admiration of her toughness. | English names Oda and uses `she`; Japanese/Chinese transliterations differ. Korean omits the pronoun naturally, so no gender or relationship change is indicated. This repeats the historical question. | Medium |
| 2828 | 코건 요새(Corgan Hold) | Confirm whether `Corgan Hold` is a named fort/place and standardize the Korean spelling; avoid assuming `Hold` is only a generic fortress. | English and Japanese treat it as a proper location, while Chinese parses the elements differently. The current Korean is plausible but unresolved. This repeats the historical question. | Medium |
| 2830 | 수잔러스(Susanrus)의 꽃잎 | Confirm the name's canonical spelling and whether this is an item, quest, or text title. | The locales provide different transliterations, and the isolated label does not identify the petals' referent. This repeats the historical question. | Medium |
| 2831 | 벤트리니오(Ventrinio)를 어떻게 찾지? | Consider whether `어떻게 찾아가지?` or `어떻게 만나지?` better conveys “How can I reach Ventrinio?” after quest context is known. | English asks how to reach the person; Japanese says how to meet him, while Chinese asks how to arrive at Ventrinio. Korean `찾지` is understandable but can mean search for/locate rather than travel to. | Medium |
| 2834 | ... 페어 고르타(Faer Gorta)의 체력과 총 피해가 10% 증가 ... | Verify the canonical Korean creature name and whether `총 피해` is the established stat label for `Total Damage`; preserve +10% and 60 Mana. | English/Japanese/Chinese agree on +10% Health and damage and a 60-Mana cost. The active values/layout match. This repeats the historical question. | Medium |
| 2835 | 그월흐마이(Gwalchmai) | Keep this name consistent with its other occurrence at ID 2576 and verify the unusual pronunciation; preserve the speaker's stubborn bargaining tone. | All three references identify Gwalchmai, but transliteration is uncertain. Korean keeps the English spelling for traceability. This repeats the historical question. | Medium |
| 2840 | ... 북쪽에서 머물다 간 여사제 티린(Tirin)이 축복한 세 샘 ... | Clarify the chronology of Tirin's northern sojourn and the blessing of the three springs; retain that water from each spring goes into the amphora. | English's “on her sojourn from the north” is compressed. Japanese/Chinese also differ on how the journey relates to the springs. Korean can be read as Tirin having stayed in the north before leaving. This repeats the historical question. | Medium |
| 2842 | ... 저택에 관해 새로 보고할 내용은 없습니다. | Confirm whether `the Villa` refers to the named Sandstone Villa from ID 2822; if it does, use a consistent named-property form rather than a generic “villa.” | English capitalizes `Villa`, and Japanese explicitly says Sandstone Villa. Korean uses generic `저택`; the likely connection to ID 2822 needs quest context. | Medium |
| 2845 | `+` | Confirm whether English `ADD` is the keyboard keypad-add key or an add action; preserve the plus glyph if it is the displayed key. | Japanese and Chinese show `+`, while English labels `ADD`. Korean follows the two displayed-key references. This repeats the historical question. | Medium |
| 2846 | ... 대현자 칼레두스(Caledus)의 무심함 ... | Confirm whether `tempered indifference` means composure/detachment or apathy; retain that the effect prevents hesitation before foes or challenges. | English, Japanese, and Chinese all use an indifference/coldness concept. Korean follows the literal sense, but `무심함` may sound like lack of care rather than trained composure. This repeats the historical question. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 2800, 2805, 2807, 2810,
  2814-2815, 2820, 2823-2824, 2828, 2830, 2834-2835, 2840, 2845, and 2846
  against the active Korean and source locales.
- Same-numbered `base` questions (including item-name entries) were kept
  separate from this `default` range. No historical disposition was treated
  as approval.

## Other Checks

- IDs 2805, 2807, and 2834 retain their percentages, durations, and Mana
  values. The English/Japanese/Chinese/Korean line counts match for these
  stat descriptions.
- The remaining inspected rows had no additional high-confidence meaning
  shift. Proper-name bilingual marking remains a corpus-wide policy issue.

## Batch Status

IDs 2800-2849 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
