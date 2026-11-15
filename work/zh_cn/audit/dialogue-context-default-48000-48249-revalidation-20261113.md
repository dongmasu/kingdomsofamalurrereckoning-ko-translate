# Sequential `default` Revalidation: IDs `48000`-`48249`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 59 previously recorded four-language fingerprints; all match.
  Added the other 191 IDs to the review ledger.
- Recorded 14 current correction candidates and six evidence-limited holds.
  ID `48053` appears in both groups; 231 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records; this
report records the current revalidation.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `48011` | Name format | The title `Morsus Cani Imperius` is rendered phonetically but lacks the English pairing. Consider `모르수스 카니 임페리우스(Morsus Cani Imperius)` without changing the elevated proclamation. | High |
| `48033` | Name / objective format | `Kill Ambassador Keen` is a quest objective. The current `킨 대사(Keen Ambassador) 처치` reverses the established English title/name order and omits the usual action ending. Consider `킨 대사(Ambassador Keen) 처치하기`. | High |
| `48053` | Name format | The row asks about the named `Chrysalae` seeds but has no English pairing. Add the English name after a canonical Korean spelling is decided; do not choose among the existing spellings from frequency alone. | High for missing pairing; spelling unresolved |
| `48080` | Naturalness | `Sent up a beacon` means sending a signal. Japanese and Chinese also say that a signal was sent; Korean `신호를 올렸어` is an unnatural literal phrasing. Consider `지원군이 올 때까지 적을 막으면서 신호를 보냈어. 그 공로로 훈장을 받았지.` | Medium-high |
| `48139` | Naturalness / meaning | In the star-guidance metaphor, `that beacon` is a guiding signal, not a literal lighthouse. Japanese uses `合図`; Korean `등대` is overly literal. Consider `그래, 맞아. 이곳에서 벗어나도록 이끌어 줄 별을 찾아 평생 하늘을 뒤져 왔어. 바로 그 빛, 내가 찾던 신호야.` | Medium-high |
| `48140` | Naturalness | `이게 페이(Fae)의 종말인가... 아니면 아닌가?` is an awkward calque of the rhetorical `or is it?`. Japanese repeats the question rather than forming a double negative. Consider `이게 페이(Fae)의 종말인가... 정말 그런가?` | Medium-high |
| `48168` | Objective format | `Unlock the statues` is currently the bare noun phrase `조각상 잠금 해제`. Align with the project's action-form objectives: `조각상 잠금 해제하기`. | Medium-high |
| `48183` | Meaning | `fell games` means cruel or deadly games, not “fallen/corrupt games.” Korean `타락한 놀이` misses that sense. Consider `필멸자여, 네 잔혹한 유희에 어울릴 생각은 없다. 떠나지 않으면 벌을 받으리라.` | High |
| `48201` | Name / number consistency | `those Preordained scoundrels` is rendered with singular `예정된 자(Preordained)` before a plural group. Other rows use the collective `예정된 자들`. Consider `밖에서 예정된 자들(Preordained)이라는 악당들이 어슬렁거리며 내 땅을 파헤치고 작물을 뽑아 가는 걸 못 봤어?` | Medium-high |
| `48218` | Name format | The first sentence names the `Holdfast` but Korean gives only `홀드패스트`. Add the English pairing at first mention, e.g. `홀드패스트(Holdfast)의 거대한 문`. Keep `폴른 홀(Fallen Hall)` unchanged. | High |
| `48224` | Naturalness / meaning | `a new breed of creature, a fascinating amalgam that should be explored` is rendered as a repetitive “new type of creature / fascinating amalgamated species.” Consider `투아사(Tuatha)는 그 자체로 새롭게 등장한 종이야. 연구할 가치가 있는 흥미로운 혼종이지.` | Medium-high |
| `48239` | Name consistency / format | The English name is `Lykos`, and ID `58342` renders the same name as `라이코스`. This return objective has `리코스` and omits the English pairing. Align to `라이코스(Lykos)에게 돌아가기`. | High |
| `48244` | Name format | `sprites` is rendered as `스프라이트` without English pairing, while the same creature name is paired at ID `7906` (`스프라이트(Sprite)`). Consider `바게스트(Barghest)와 스프라이트(Sprite)가 아직 남아 있어.` | High |
| `48246` | Meaning | `pick a fight for them` means start/provoke a fight on someone else's behalf, not simply fight in their place. Consider `그리고 자네... 누가 남 대신 싸움을 시작해 달라고 해도 거절하게.` | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `48015` | Meaning / naturalness | English `tripping about my web` is ambiguous; Chinese supports a web-related pun while Japanese asks whether the web interests someone. Keep the current plausible reading rather than selecting a specific pun without scene or audio evidence. |
| `48029` | Terminology | `Ancient of War` has conflicting Korean renderings elsewhere, and Japanese `大将軍` differs from Chinese `战争长者`. No canonical title decision is established here. Retain `전쟁 원로` provisionally; do not normalize this occurrence or the broader term set. |
| `48053` | Terminology | `Chrysalae` has multiple Korean spellings in the related asset review; Japanese confirms the name but does not settle its Korean form. Keep the current spelling pending a glossary decision. The separate missing-English-pairing candidate remains. |
| `48067` | Meaning / context | The opening `Have I...?` is elliptical, and prior linked context suggests a possible reply to a player choice but does not prove the reply edge. Retain the current text instead of guessing what the speaker means. |
| `48184` | Address | `my lovely` is rendered `자기야`; Chinese supports an endearment, but Japanese omits it and the speaker/addressee relationship is not established. Keep provisionally without inferring a romantic relationship. |
| `48231` | Name / text type | `The Messenger` may be a named title or a generic role. Japanese and Chinese use generic “messenger” forms and do not resolve the distinction. Retain `전령` without adding an English proper-name pairing pending direct context. |

## Rechecked Findings and Structure

- Existing candidate or hold records in this range were checked against the
  current four-language rows. The prior candidate at `48130` was not carried
  forward: English `Strike quickly` supports the current `빨리 공격해`, and
  the Japanese paraphrase does not disprove that reading. Other historical
  ledger rows remain unchanged.
- One exact-English duplicate group touches the range: `48062` / `48126`
  (`Quest Failed`). Korean matches in both rows.
- Nine entries contain line breaks: `48020`, `48042`, `48071`, `48100`,
  `48104`, `48108`, `48133`, `48185`, and `48223`. Counts match across all
  four languages except `48223`, where English and Korean each have eight
  breaks and Japanese and Chinese each have seven. Korean matches English;
  English and Korean have 23 breaks in total, while Japanese and Chinese
  have 22. Preserve the current layout.
- Runtime/layout markers were checked by marker identity and position,
  ignoring localized marker payloads. At `48022`, Japanese omits two
  `LINE_CENTER` markers present in English, Chinese, and Korean. At `48208`,
  Korean marker order matches English (`LINE_CENTER`, display marker, button
  variable); Japanese and Chinese place the variable before the display
  marker. No Korean marker-order candidate was found.
- Of 250 IDs, 193 have indexed asset associations, represented by 198
  ID-asset links across 125 assets; 57 IDs have no indexed asset. Of the 191
  newly recorded IDs, 134 have associations, represented by 139 links across
  72 assets. These links do not establish per-key speakers or playback order.

## Range Result

- The range has 14 current correction-candidate IDs and six evidence-limited
  holds, with `48053` in both groups; 231 IDs have no current finding.
- After appending 191 new IDs, the ledger covers 52,719 of 65,135 unique
  `default` IDs (80.94%), leaving 12,416. Sequential coverage reaches
  `48249`; next is `48250`-`48499`. Of reviewed IDs, 42,249 have indexed
  asset links and 10,470 do not.
- Findings remain proposals requiring separate approval. No translation CSV
  was changed.
