# Translation Edit Addendum - 2026-11-05

## Fallon quest objectives

- Compared `default` IDs `12267`, `37479`, `50513`, and `64037` across English, Japanese, Chinese, and Korean. English uses `Search for Brother Fallon` for the first pair and `Look for Brother Fallon` for the second; Chinese uses the same find-Fallon objective for all four. Japanese specifies examining Fallon's body for the first pair and looking for him for the second, but English and Chinese do not support adding "body" to the Korean objective.
- Standardized the Korean objective style to `팰런 수사(Brother Fallon) 찾기`. Updated IDs `12267` and `37479`; IDs `50513` and `64037` already used this wording.
- Verified all four ID-specific rows and used the byte-preserving replacement helper for the two changed rows.

## Reckoning Mode terminology

- Compared all 21 English `default` rows containing `Reckoning Mode` with the active Korean rows. ID `18449` was the only occurrence translated as `운명 개방 모드`; the other 20 use `레코닝 모드`.
- Replaced only the wrapped term at `default:18449` with `{*1레코닝 모드}`, following the official Korean manual's `Reckoning = 레코닝` and the established project usage.

## Curse, Warsworn, and name consistency

- Compared `default:41499` (`Lift Curses`) and `63291` with English, Japanese, and Chinese. Kept the title `저주 해제` and clarified that cleansing ends the curses' dark enchantment and grants temporary immunity. The mentioned ID `41999` is a different trade-agreement description.
- Added `Nera Red-Hand` at `30265`. The English source has one occurrence of this name.
- Searched English `Hireling` and `Hirelings`, including lowercase occurrences, across the three resource types and checked the corresponding Korean IDs. Added `고용병(Hireling)` in 19 plural-source rows: `8594`, `9489`, `13055`, `17142`, `17159`, `24571`, `25392`, `27404`, `32952`, `35075`, `36289`, `38469`, `42543`, `52911`, `52913`, `53175`, `56588`, `62236`, and `62658`. These include rows formerly rendered as `용병`, `고용 용병`, `고용인`, or `견습 용병`; nearby Warsworn and patrol context supports the rank reading. Use the singular English term for the rank, even when the sentence refers to multiple people.
- At `55151`, restored the inference `That means`: `그렇다는 건 놈들이 워스원(Warsworn)의 피를 손에 묻혔다는 거야.`
- Reviewed all English `Jedda`, `Turin`, and `Oreyn` occurrences against Korean, with Japanese and Chinese as supporting references. Added missing name glosses at their first occurrence per entry. Standardized `터린` and `튜린` to the prevailing `투린`; the quest records identify Turin Ayle and Jedda Kerning as friends. The four `Turin and Jedda` entries now match.
- The `34655` account is Marga's belief that Oreyn was transformed; the later `637` quest record explains that Oreyn staged the transformation. At `61609`, translated `I guess I can do better` as finding a better partner rather than doing better at an unspecified task.
- At `35341`, English `St. Eadric's` refers to the mission. Replaced the dangling Korean possessive with `성 이드릭(St. Eadric's)`, without inventing an omitted noun in the short label.
- At `default:29972`, cross-language references range from “building by the lake” (Japanese and Russian) to a lake complex/facility (European languages). Followed the user's preferred gloss `호수의 건물(Lake Complex)`; Chinese `湖之建筑` also points to a building associated with the lake.
- Reviewed all English `Antechamber` rows against Korean and the other locale references. Added `Antechamber` glosses to generic `전실` uses at `default:772`, `5340`, `24482`, `37359`, `37857`, `46906`, and `63788`, and `base:823` variant `11`. Corrected `대기실` to `전실(Antechamber)` at `default:27129` and `40115`. Existing compound glosses such as `Hyperian Antechamber` were retained.
- Removed the leading `‒` from Korean dialogue `default:34430`. It is present in the English source, but was omitted from Japanese; it reads awkwardly as a Korean dialogue prefix and is unnecessary to the sentence.

## Counsel, Hoplon, and elemental shrines

- Searched English `counsel` case-insensitively across all three resource types and compared the matching Korean IDs with English, Japanese, and Chinese. Standardized references to Anokatos' mysterious `Counsel` as `조언자(Counsel)`, including lowercase source occurrences, and added the gloss at the first mention in each entry. Japanese consistently uses `助言者`; the story identifies the captive as the former Primos Arkes. Other senses, including `EA Legal Counsel`, advice, and deliberation, were excluded.
- Corrected `default:4429` from plural `참모진` to the singular `조언자(Counsel)`, and fixed the particle in `default:30233`. Replaced `자문관` throughout the multiline record `63143` while keeping the English gloss at its first mention.
- Added the source spelling at `base:3983:11`: `호플론(Hoplon)`. The separate shield description `default:54871` already has `호플론(hoplon)`.
- `Air Shrine` / `Shrine of Air` and `Earth Shrine` / `Shrine of Earth` are alternative word orders for the same respective shrines, as shown by the paired references at `default:8969`. No `Air Shine` occurrence was found in the English resources; `Shine and Shadow` names unrelated artifacts. Standardized `default:7701` and `52631` from `바람의 성소` and `공기의 성소` to `대기의 성소`, with the combined English form, and retained each other entry's source wording in its gloss.
