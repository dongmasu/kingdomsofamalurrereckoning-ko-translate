# Preliminary Language Scan: `default` IDs 2150-2199

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 2150-2199.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical `default` questions and checked name consistency,
  dialogue voice, source idioms, and quest-journal wording.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 2152 | ... 유일한 승객은 서약방패병(Pledgeshield) 볼턴(Bolton)이었고 ... | Confirm `Pledgeshield` as a formal rank and retain its established Korean form consistently. | English names the title and person; Japanese uses a different mercenary-rank reading. Korean follows the English title and preserves both proper-name spellings, but the formal office remains a project-wide question. | Medium |
| 2153 | 알아. 넝마 줍는 이들, 고아들, 웬딩(The Wending)의 주민들이지. | Resolve whether `Rag-pickers` names a marginalized group/role and retain a consistent display form for `the Wending`. | This repeats the historical question. English treats the three labels as a group description; Japanese differs on `Rag-pickers`, while Korean is close to the English and keeps the place name in parentheses. | Medium |
| 2160 | 화염 연고 물약 | Clarify the source's apparent category conflict between `Salve` (ointment) and `Potions`; do not silently choose an item category. | English calls these “Salve Potions”; Japanese reads them as fire-attack medicine. Korean combines `연고` and `물약`, which sounds internally contradictory. | High |
| 2161 | 내 번영이 눈에 띄지 않을 거라 생각한 건 순진했어. | Preserve the “I knew better than to think...” stance more directly rather than implying the speaker previously believed the opposite. | English states the speaker knew their prosperity would not go unnoticed. Korean conveys that it would be noticed, but frames it as a past naive belief and shifts the speaker's stance slightly. | Medium |
| 2164 | ... 그래야 미친개(Mad Dog)가 한 방 먹일 수 있으니까. | Retain the combat idiom but verify whether `get his digs in` means landing blows or another attack action. | English uses a colloquial attack idiom; Japanese describes creating an opening for Mad Dog. Korean's `한 방 먹이다` is plausible but narrows it to one blow. | Medium |
| 2168 | 디스펠 | Confirm the official Korean UI/skill term for `Dispelling`; the current loanword may be player-unfriendly or inconsistent. | Japanese uses `解呪` (“dispel a curse”), while Korean transliterates the English game term. The intended mechanic and established project glossary should decide whether to translate it. | Medium |
| 2170 | QA 테스트 지역 | Confirm whether `QA Test Land` is an internal/test label that should remain visible as-is or a player-facing location. | This repeats the historical developer-label question. Korean translates the phrase, but the source explicitly marks a QA test area. | Medium |
| 2174 | ... 리리아(Lyria) 신전에 있는 두건... 메이어(Maire)와 함께... | Preserve the unfinished thought and avoid assigning a relationship between Maire and the cowl without adjacent dialogue. | English and Japanese both leave the relation incomplete; Korean follows that fragment and adds no unsupported explanation. This remains a context question rather than a confirmed translation defect. | Medium |
| 2182 | ... 스칼드 아틀라스(Skald Atlas)의 숨겨진 은신처가 시더핏(Cinderpit)에 있다고 ... | Confirm `Skald Atlas` as a person/title and standardize `Cinderpit`/`Crow Peak`/`Agarth` spellings with related quest text. | This repeats the historical name/location question. Korean follows the English account; Japanese omits some of the explicit ownership/hidden-lair wording. | Medium |
| 2185 | 언덕 위 선교회에 있는 저 바보들은 ... | Confirm whether `mission` is a mission station, monastery, or religious organization, and keep it distinct from generic missions. | English/Chinese say `mission`; Japanese specifies a monastery. Korean's `선교회` suggests an organization rather than a building. | Medium |
| 2186 | ... 아포타이어(Apotyre)는 이곳에 정착한 사람들의 땅이야. | Check the political/ownership claim and the referent of “people who settled it” against adjacent quest context. | This repeats the historical lore question. English and Korean assert local settler ownership; Japanese shortens this to “Apotyre belongs to its residents.” The factional context is not settled by the row. | Medium |
| 2188 | 개화(Flowering)에 대해 말한 거야? | Determine whether capitalized `Flowering` is a named event/era or ordinary blossoming. | Japanese says “Flowering Rite,” while English/Chinese use the capitalized event-like word. Korean preserves the English term but doesn't resolve whether `개화` is a formal lore name. | Medium |
| 2193 | 헥스(Hexes) 놀이를 하고 싶다면 ... | Confirm the game's card-game name and whether `Hexes` should be localized or transliterated consistently. | English capitalizes the game; Japanese transliterates it; Korean keeps both Hangul and English. The referent is clearly a game but the canonical Korean title remains open. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 2153, 2160, 2164, 2170,
  2174, 2182, 2185-2186, 2188, and 2193 against the active Korean and source
  locales. The group, item category, idiom, developer label, fragment,
  proper names, institution, political claim, historical event, and card-game
  questions remain open or provisional.
- Same-numbered historical `base` findings were kept separate from these
  dialogue and quest rows.

## Other Checks

- ID 2182 retains the old-caldera/Crow Peak setting and the instruction
  riddle; ID 2173 keeps `Fateless One` distinct from generic “fate-less.”
- The remaining inspected dialogue and quest labels preserve their main
  meaning and Japanese-aligned register; no runtime tokens or line breaks
  were changed.

## Batch Status

IDs 2150-2199 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
