# Sequential `default` Revalidation: IDs `28500`-`28749`

- Date: 2026-11-12.
- Read all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 65 recorded IDs and added 185 new IDs. Findings are proposals,
  not approved translation edits.
- No translation CSV, reference asset, or game binary was modified.

## Correction Candidates

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `28517` | Naturalness / meaning | `performance` in this fighting context is `연기`, suggesting acting rather than the feat being praised. Consider `정말 대단한 활약이었어!`, retaining the arena, crowd, and morale references. | Medium |
| `28530` | Name / format | `Prince Eagonn` is `이곤(Eagonn) 왕자`. Consider `이곤 왕자(Prince Eagonn)` while preserving the Warsworn founding and demon-hunter claim. | High |
| `28604` | Journal register | This first-person quest log uses conversational `들끓고 있어`, `들었대`, and `합칠 수 있어`, unlike the Japanese journal's written style. Consider `들끓고 있다`, `들었다고 한다`, `힘을 합칠 수 있다`, preserving all quest facts. No speaker attribution is implied. | High |
| `28651` | Meaning / naturalness | `home to Ayten and those murderous Freemen` describes the area containing the settlement and Freemen; Korean makes Ayten into `아이텐 사람들` and uses a literal `긁히고 망가진 흙바닥`. Consider `지금은 황폐해진 땅에 아이텐(Ayten)과 살인적인 프리맨(Freemen)만 남았지`, without asserting that the town itself is uninhabited. | Medium |
| `28658` | Name / format | `Savant Eran Methneen` pairs only the person's name. Consider `사반트 에란 메스닌(Savant Eran Methneen)`; the rank is central to the response. | High |
| `28669` | Meaning | `you're lucky not to have one` and Japanese `過去を知らないのは、幸運` mean the absence is the fortunate gift. Korean `그런 선물을 못 받은 게 ... 다행` reverses that relationship. Consider `그게 없는 게 차라리 다행이라고 난 여전히 생각해. 어떤 사람들은 그런 선물을 얻으려고 살인도 할 테니까.` Avoid naming the missing thing without its prior context. | High |
| `28707` | Meaning / format | Japanese attaches the five-second duration to freezing damage; Korean can apply it to both ice and freezing damage. Consider `냉기 피해 55와 5초에 걸친 빙결 피해 15` while preserving the cost and line break. Related levels `23906`, `45656`, and `52037` warrant a separate effect-terminology review. | High |
| `28737` | Naturalness | `우리를 해방하려는 건 ... 굴레에서일지도` has an awkward predicate. Consider `텔로그루스(Telogrus)는 그런 고된 일상, 삶의 평범한 굴레에서 우리를 해방하려는 건지도 모르지.` | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `28511` | Gameplay / format | English and Chinese say press and hold; Japanese adds release. Korean follows English. Confirm actual input behavior before adding a release instruction; preserve `{1}`. |
| `28638` | Meaning | English `as convicted as some are` could concern conviction or resolute belief; Japanese and Chinese choose legal guilt. Korean follows them. Check the full political conversation before asserting either reading. |
| `28724` | Meaning / address | `Lyria` could be an invocation rather than the addressee, while Korean explicitly says `리리아에게`. Japanese omits the name and Chinese retains it. Check the surrounding conversation before changing the addressee. |
| `28066` | Name continuity | Earlier title candidate remains. The same source has `Aethan` as `에이던`, while `28554` and many other rows use `에이선 엥가르(Aethan Engar)`. Confirm the individual in context before applying a name replacement; do not assume identity from the first name alone. |

## Earlier Findings And Checks

- Retain candidates `28527`, `28568`, `28570`, `28650`, and `28676`;
  retain the existing `28541` source/context hold.
- 49 exact-English duplicate groups touch this range (996 corpus rows);
  Korean forms match within each group, though Japanese registers may differ.
- Normalized token signatures and newline counts agree across all four
  languages. Existing multiline structures and runtime tokens are retained.
- No per-key speaker or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

After this range, 38,296 of 65,135 unique IDs are recorded (58.79%),
leaving 26,839. Sequential coverage reaches `28749`; next: `28750`-`28999`.
