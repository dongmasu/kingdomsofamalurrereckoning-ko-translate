# Sequential `default` Revalidation: IDs `50250`-`50499`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 82 existing four-language fingerprints; all match. Added the
  other 168 IDs to the review ledger without changing existing rows.
- Recorded 13 current correction-candidate IDs and 13 evidence-limited
  holds. Four IDs have both a separable candidate and a distinct hold;
  228 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was
  changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `50284` | Speech level / naturalness | The current line shifts into `자네`, `가까이 오게`, and `-이네`, while Japanese uses a plain imperative and the sentence is otherwise conversational. Keep the line informal and consistent, for example `그래? 언더스타일(The Understyle)에 필멸자가 있다니... 이거 참 보기 드문 일이군. 가까이 와. 펠타운(Felltown)에서 이렇게 멀리 떨어진 곳에서 너 같은 이를 보는 건 드물어.` This is a row-level judgment, not a speaker assignment. | High |
| `50342` | Naturalness / item terminology | `흠 없는 미타란(Mitharan) 피해 손잡이` reads as an awkward modifier stack for `Flawless Mitharan Damaging Hilt`. Recheck the crafting-part/category structure and make the Korean item label readable without changing its tier, material, or damage-related meaning. | Medium |
| `50375` | Naturalness / terminology | `More successful Rogues` is more naturally rendered as experienced or advanced rogues than `성공한 도적`. Recast the tooltip, for example `숙련된 도적(Rogue)은 위험한 먹잇감을 뒤쫓는 사냥꾼을 자처합니다.` Also clarify the awkward `해부학적 급소를 노리는 정밀한 조준` while retaining stealth, ranged attacks, and critical-damage meaning. | Medium-high |
| `50398` | Meaning / terminology | In the `Missives of Sable` quest, this `Missives` is the same named book. Replace the inconsistent transliteration `미시브스` with the established `세이블의 서신(Missives of Sable)` or a clearly referential short `서신`; do not create a new item name. | High |
| `50407` | Name format | The map fragment quotes the proper place-name `Storm Point`, but Korean gives only `폭풍 곶`. Pair the name as `폭풍 곶(Storm Point)`; retain the separate Dvergan/Alfar language references. | High |
| `50418` | Naturalness | `도시 중심의 질서의 사원 주변` is an awkward nested modifier. Recast it as `도시 중심에 있는 질서의 사원 주변에` while preserving the claim that the group controls Crownhold and gathers at the temple. | High |
| `50426` | Speech level | The sentence begins in plain style (`감사 표시야`) and ends with the elevated imperative `뿌리 뽑아라`. Keep the register consistent, e.g. `마지막 장소에 있는 이 희귀한 선물은 신들이 보내는 감사의 표시야. 선을 위해 사용해 악을 뿌리 뽑아.` | High |
| `50429` | Name format / terminology | `The Field` is presented as the name of a card, but the Korean only says `들판 카드`; add the English card name, e.g. `들판(The Field) 카드`. The source also names the Fateweavers collectively; pair that group reference as `페이트위버(Fateweavers)` rather than the singular English form. | Medium-high |
| `50431` | Terminology / name format | Korean `펜워랙` varies from the established in-corpus `펜라크(Fennwrac)`. Use that form in the ingredient list. Keep the exact sense of `stew-grist` separate below; this correction does not decide whether it is grain or prepared food. | High |
| `50445` | Terminology | This route is consistently called a `refuse pipe` in the related Lost Squad lines. Align `쓰레기 배출관` with the established `오물 배출관`, without changing the chained gates, guards, or covert route. | High |
| `50460` | Address / naturalness | The condescending vocative `little one` is rendered `꼬마야`, which can imply that the addressee is a child. Reuse the accepted project proposal `작은 자여`: `생각을 바꾸었나, 작은 자여?` | Medium-high |
| `50475` | Meaning / terminology | `meat-birds` is an intentionally odd chicken-meat image, not a generic `고깃덩이`. Render the threat naturally as `이빨과 발톱만 있었어도 저놈들을 닭고기처럼 갈기갈기 찢어 놨을 텐데!`, consistent with the Japanese chicken reference and the related occurrences. | Medium-high |
| `50497` | Terminology / name format | In context, capitalized `the Testament` refers to the group, not a generic will or testament. Reuse the accepted proper-name form `테스타먼트(The Testament)` in `요즘은 테스타먼트(The Testament) 소식이 하나도 없네.` This does not resolve whether the group is identical to the Belen organization named differently in Japanese and Chinese. | Medium-high |

## Evidence-Limited Holds

| ID(s) | Dimension | Evidence and disposition |
| --- | --- | --- |
| `50342` | Meaning / item category | The label is clearly a crafting hilt, but the exact function of `Damaging` as a component prefix is not established by these four rows. The readability candidate above does not authorize inventing a component subtype. |
| `50343` | Proper name / referent | `Scion's Guard` could be a guard serving a person named Scion or a named faction/title. The isolated label and locale references do not settle the parse. |
| `50362` | Meaning | English `service` can mean helpful service or religious observance; Japanese explicitly uses `礼拝` (worship). Keep the Korean charitable-service reading provisional rather than importing the Japanese-only religious detail. |
| `50387`, `50431` | Terminology / item identity | `Grist` is rendered as grain stew in Japanese, transliterated in Chinese, and as grain/stew wording in Korean. The range does not establish whether it is raw grain, a prepared stew, or a named item. The Fennwrac spelling candidate at `50431` is independent. |
| `50398` | Address / speaker | The line uses `자네`, but the linked asset does not map it to an individual speaker or dialogue stage. Do not normalize its address based on other quest lines. |
| `50417` | Speech level / speaker | `조심하게` is more marked than the plain imperative in Japanese, but the asset only identifies an NPC symbol and does not map this key to that speaker. Hold the voice decision. |
| `50428` | Meaning / text type | `Sworn to War` is an isolated fragment; the sources differ on whether it is a clause or label. Keep `전쟁에 맹세한 자` provisional rather than deciding its UI role from the wording alone. |
| `50431` | Meaning | `About bloody time` is an exasperated idiom, while `정말 오래도 걸렸군` states elapsed time more directly. The context does not establish whether the speaker is emphasizing delay or making a literal timing remark. |
| `50448` | Source formatting | English contains the malformed break `S\nhe replied`; Japanese and Chinese keep `She` intact. Korean preserves a coherent line break before the response and does not split a word. Keep the Korean layout; do not imitate the source corruption. |
| `50467` | Meaning / relationship | Japanese calls the referent `兄貴` (older brother), while English and Chinese only say `he`. Without direct relationship evidence for this key, do not add or remove the Korean kinship term based solely on one reference locale. |
| `50470` | Meaning | `Collaborators` can mean cooperating allies or collaborators with an occupying enemy; Chinese explicitly chooses the latter, while Japanese is neutral. Korean retains the broad `협력자`; do not sharpen it without context. |
| `50496`, `50497` | Proper name / lore | English and Chinese treat `Testament` as a group, Japanese identifies a Belen brotherhood, and existing Korean alternates between a Belen covenant and a will-like group name. The accepted English proper form at `50497` is a separate terminology correction; the group's Belen identity remains unresolved. |

## Rechecked Decisions and Structure

- The existing candidate at `50270` was checked against the current four
  languages. `주인은 두루마리를 되찾기 위해 후한 보상을 지급했다` conveys
  the owner's handsome payment for the scrolls' return; no current correction
  is proposed. The historical ledger row was not overwritten.
- The existing candidates at `50284`, `50398`, `50418`, `50426`, `50431`,
  `50445`, `50460`, and `50475` remain supported by the current text and the
  linked evidence. Their historical ledger entries were not overwritten.
- Fifty-seven exact-English duplicate groups touch this range across the
  corpus; Korean matches within each group. The only exact-English repeat
  wholly inside the range is `50261`/`50453` (`Quest Complete`), and both use
  `퀘스트 완료`.
- Nine entries contain embedded line breaks: `50315`, `50337`, `50357`,
  `50395`, `50406`, `50419`, `50448`, `50466`, and `50479`. The four-language
  totals are 42 English, 42 Japanese, 41 Chinese, and 42 Korean breaks. The
  difference is confined to `50448` as described above; the 12-break layout
  at `50466` matches in all four languages. Runtime/display token identities
  and order match across the range.
- Of 250 IDs, 198 have indexed asset associations, represented by 206
  ID-asset links across 132 assets; 52 IDs have no indexed asset. Eight IDs
  link to multiple assets. Of the 168 newly recorded IDs, 116 have indexed
  associations and 52 do not. Asset links do not establish per-key speakers
  or playback order.

## Range Result

- The range has 13 current correction-candidate IDs and 13 evidence-limited
  holds; four IDs have both a separable candidate and a distinct hold.
  228 IDs have no current finding.
- After appending 168 IDs, the ledger covers 54,329 of 65,135 unique
  `default` IDs (83.41%), leaving 10,806. Sequential coverage reaches
  `50499`; next is `50500`-`50749`.
- Findings remain proposals requiring separate approval. No translation
  CSV was changed.
