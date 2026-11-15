# Sequential `default` Revalidation: IDs `29000`-`29249`

- Date: 2026-11-12.
- Read all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 67 recorded IDs and added 183 new IDs. Findings are proposals,
  not approved translation edits.
- No translation CSV, reference asset, or game binary was modified.

## Correction Candidates

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `29027` | Title / format | `Neophyte` is a Scholia rank; an established rank label is `초심자(Neophyte)` (`32509`). Consider `안녕, 초심자(Neophyte)` after checking the scoped rank convention; other rows also use 수련생 and 수련자. | Medium |
| `29040` | Meaning / naturalness | `I'd wish you good luck, but it wouldn't be genuine` means the speaker would wish luck but does not mean it. Korean `빌어주고 싶지만, 진심은 아니야` is awkwardly self-contradictory. Consider `행운을 빌어주고 싶지만, 진심이 아니니 관두겠어.` | High |
| `29063` | Naturalness | The joke qualifies the promise not to slow the player down; dangling `너무 많이는` reads awkwardly. Consider `발목 잡지 않겠다고 약속할게... 너무 많이는 말이야.` Preserve the pause. | Medium |
| `29121` | Journal register | The past-tense quest log ends `좋은 생각은 아니었어`, unlike the adjacent written narrative. Consider `좋은 생각은 아니었다.` Existing row reclassified. | High |
| `29131` | Meaning | `But know that I am close` directly tells the listener to know the speaker is close to freedom; Korean omits that instruction. Consider `하지만 알아 두세요. 저는 자유에 가까워요`, preserving the threats and polite ending. | High |
| `29162` | Journal register | Quest log uses `죽여야 해`, `말이야`, and `나갈 수 없어`, while the Japanese is written objective narration. Consider `죽여야 한다`, `그들이 나를 죽이기 전에`, `나갈 수 없다`. Existing row reclassified. | High |
| `29169` | Title / format | `Savant` is unpaired in an introduction to the formal rank. Consider `사반트(Savant)입니다`, preserving the polite Korean register. | High |
| `29203` | Meaning / naturalness | `You're a disgrace` does not specify human species; `수치스러운 인간` can invent it. Consider `넌 정말 망신거리야.` | High |
| `29213` | Meaning / name | `Lupoku's rotten luck` is an exclamation about bad luck, not necessarily the god's own luck. Korean also annotates `(Lopoku)` although the source spells `Lupoku`. Consider `로포쿠(Lupoku)여, 지독히도 운이 없었지`, retaining the siege and duty. Existing spellings elsewhere require a separate scoped check. | High |
| `29220` | Meaning | `folios for poetasters` refers to books or collections for minor poets; `삼류 시인을 위한 화첩` suggests picture albums. Consider `삼류 시인을 위한 문집`, retaining the other two types. | Medium |
| `29224` | Journal register | The completion text ends in conversational `자랑이 될 거야`, unlike Japanese's written summary. Consider `마을의 자랑이 될 것이다`. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `29048` | Meaning | `Our people have too long stood apart` could mean the people have been separated from each other or isolated from others. Japanese favors isolation. Korean chooses the former; check the speaker's history before specifying a relationship. |
| `29081` | Title terminology | `Ancient of War` varies among `전쟁의 장로`, `전쟁 원로`, `전쟁의 고대자`, and `전쟁의 고대인` across `3334`, `48029`, `49569`, and `64213`. Establish the Warsworn office convention before applying one globally. |
| `29216` | Gameplay terminology | `health` is `생명력` here but `체력` is also used in game-effect labels. Confirm the scoped character-stat term before unifying; do not conflate figurative vitality with the UI statistic. |

## Earlier Findings And Checks

- Retain candidates `29034`, `29050`, `29148`, `29173`, `29204`, and
  `29219`, and the existing `29235` hold.
- 70 exact-English duplicate groups touch this range (1,318 corpus rows).
  Korean forms match within each group; Japanese style varies in some groups.
- Normalized runtime tokens agree except `29077`: Japanese orders `{2}`
  before `{1}`, whereas English, Chinese, and Korean use `{1}` before `{2}`.
  Both variables and their English roles are preserved; no token reordering
  is proposed. Line-break counts otherwise agree across the four languages.
- No per-key speaker or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

After this range, 38,654 of 65,135 unique IDs are recorded (59.34%),
leaving 26,481. Sequential coverage reaches `29249`; next: `29250`-`29499`.
