# Sequential `default` Revalidation: IDs `28000`-`28249`

- Date: 2026-11-12.
- Read all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 64 recorded IDs and added 186 new IDs. Findings are proposals,
  not approved translation edits.
- No translation CSV, reference asset, or game binary was modified.

## Correction Candidates

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `28048` | Meaning / naturalness | `unlocking ... attacks` is rendered `공격을 해제합니다`, which can mean disabling the attack. Consider `강력한 새 공격을 잠금 해제합니다`. | High |
| `28055`, `28144` | Place terminology | `Keep Library` is `킵(Keep) 도서관` / `킵 도서관`; the same location appears as `요새 도서관` in `654`, `40247`, `26615`, `30123`, and `48692`. Consider the established contextual form, not a global Keep replacement. | High |
| `28057` | Name / format | `Deda` is unpaired. Consider `데다(Deda)는`, retaining the advice about Catrin and Nanne Hanri. | High |
| `28066` | Title terminology | `Savant` is `학자(Savant)` here; the rank has established `사반트(Savant)`. Consider the rank form without assuming a speaker. `Aethan` is `에이던` here, while the separately established Aethan Engar is `에이선`; confirm the individual's identity before aligning that name. | High |
| `28070` | Meaning | `captured Jottun enchanted armor` is spoils, as Japanese `戦利品` clarifies. `붙잡은 요툰의 ... 갑옷` implies the Jottun was captured. Consider `노획한 요툰(Jottun)의 마법 갑옷`. | High |
| `28097` | Meaning | `together we were brought to Esharra` does not say Taibreah brought the player. Korean assigns her that action. Consider `우리는 함께 비탄의 힘(Sorrows)이 깃든 에샤라(Esharra)로 인도되었다`. Preserve the revelation and subsequent instruction. | High |
| `28120` | Meaning | `enhance your Blink ability with poison` adds poison to Blink; `독성 점멸 능력이 강화됩니다` suggests an already poisonous ability is merely strengthened. Consider `점멸 능력에 독 효과가 더해집니다`, preserving the mana effect. | High |
| `28135` | Name / format | `Emerald Lady` is unpaired. Consider `에메랄드 여인(Emerald Lady)` without changing the sentence previously reviewed with the user. | High |
| `28151` | Name / format | `Maire, Queen of Cups` pairs only the name in Korean. Consider `컵의 여왕 메어(Maire, Queen of Cups)`, consistent with the proposal for `27984`. | High |
| `28172` | Meaning / naturalness | The follower is `a mortal version of their paragon`; `필멸자 버전` is a jarring modernism in lore. Consider `그들이 숭배하는 이상을 필멸자의 모습으로 구현한 존재`. English `she inspired great works of passion` means she inspired works, not necessarily created them herself: consider `그녀는 열정이 깃든 위대한 작품들에 영감을 주었다`. Preserve the five paragraphs. | High |
| `28178` | Faction terminology | English `the Testament` and Japanese `ベイレン結社` identify the faction; Korean `성약(Testament)` is less specific than the established `벨렌의 성약단(Belen's Testament)`. Check the established faction form in this context, not every use of testament. | Medium |
| `28236` | Name / format | This source label is singular `Sativa Fiber`; its annotation says `(Sativa Fibers)`. Consider `(Sativa Fiber)`. Source `62172` is plural and should remain independently checked. | High |
| `28248` | Name / format | `General Masterson` is unpaired. Consider `마스터슨 장군(General Masterson)의 무덤`. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `28141` | Meaning / context | English says Trav pushed through `it, along with Camp Moondown`; Korean can imply that the camp accompanied him, while Japanese suggests he disregarded the camp. Check the surrounding scene before selecting the precise relation. |
| `28156` | Speech level | Japanese is plain and Korean polite. `Your Grace` and the request for help may justify politeness; speaker and conversation stage are not established by this row. |
| `28174` | Name / terminology | `Darkken Estate` is `다큰 영지`; other Darkken occurrences use `다르켄`, `다켄`, and `다크켄`. Establish the family/place convention before changing it; do not assume distinct people with the same surname are identical. |
| `28240` | Terminology | `Health Steal` appears as both `생명력 흡수` and `체력 흡수` across labels. Check the scoped in-game effect terminology before deciding whether to unify; do not conflate this with figurative vitality. |

## Earlier Findings And Checks

- Retain existing candidates `28032` (awkward stranger greeting), `28093`
  (magic circle), `28107` (alchemical formula), and `28142` (Praetorian
  terminology and naturalness); retain the register hold for `28110`.
- 63 exact-English duplicate groups touch this range (1,186 corpus rows).
  `Be good.` has two Korean forms; Japanese differentiates good behavior
  from avoiding trouble, so do not automatically unify them.
- Normalized runtime token signatures agree across all four languages.
  Japanese alone breaks `28222` into two lines; English, Chinese, and Korean
  do not. Record the source-layout difference instead of forcing a break.
- No per-key speaker or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

After this range, 37,923 of 65,135 unique IDs are recorded (58.22%),
leaving 27,212. Sequential coverage reaches `28249`; next: `28250`-`28499`.
