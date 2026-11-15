# Sequential `default` Revalidation: IDs `53750`-`53999`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 67 existing ledger fingerprints and preserved their rows.
  Added the other 183 IDs in ascending order.
- Recorded 17 current correction candidates, including 11 rechecked from
  existing findings and six newly identified candidates. Two existing
  evidence-limited holds were rechecked and retained. ID `53858` retains its
  earlier unresolved singular-rank terminology question and is not counted
  as one of those two holds.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Current Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `53754` | Name / epithet format | The source names `Aloff the Hunter`, but Korean pairs only `Aloff`. Pair the full epithet and name: `사냥꾼 알로프(Aloff the Hunter)`. | High |
| `53755` | Speech level / naturalness | Korean `용서해 주게` and `막을 생각은 없네` use marked `하게체`; Japanese uses plain conversational forms. Consider a consistent plain line such as `그... 정말인가? 그렇다면 무례를 용서해 줘. 성전기사단원이 약속 장소에 가는 걸 막을 생각은 없어.` This is a row-level style finding, not a speaker attribution. | Medium |
| `53784` | Objective style / terminology | `Recover the lost Handbook` is an objective, but Korean uses an imperative. The associated Motus Mining handbook also varies across entries. Consider the objective form `지점 업무 안내서 되찾기`, adapting the item term only where the same handbook is meant. | High |
| `53785` | Naturalness / terminology | `고전 술` is an unnatural rendering of the grandmother's favorite classic drink, and the established named drink is `아스커의 약주(Asker's Draught)`. Consider `할머니가 가장 좋아하던 전통주, 아스커의 약주(Asker's Draught)를 다시 내놓는 거야.` | High |
| `53793` | Meaning / structure | The instruction lists three prayer locations: St. Eadric's shrine, St. Odwig's shrine, and the area before this Mission. Make the list parallel and retain the instruction to pray at each one, without implying that the Mission is one of the saints' shrines. | Medium-high |
| `53795` | Format | This title-cased item label is translated as `양조 장인의 의복` without its source label. Consider `양조 장인의 의복(Brewmaster's Garb)` to make the named item traceable. | Medium |
| `53799` | Speech level / naturalness | `반갑소` is markedly old-fashioned beside the greeting in Japanese and Chinese. Consider a natural conversational greeting such as `워스원(Warsworn), 반가워.` No speaker is inferred from asset membership. | Medium |
| `53833` | Name / title format | Korean pairs `Ragnall` but not the complete title `Lord Ragnall the Great`. Keep the place and Fae pairings and pair the full title, e.g. `위대한 라그날 경(Lord Ragnall the Great)` in the map description. | Medium-high |
| `53840` | Terminology consistency | This is the family charter that establishes Ratofer's rank among the Alfar. Related references vary among `특허장`, `허가장`, `허가서`, `헌장`, and `인가서`; Japanese uses `勅許状`, and related Korean references use `칙허장`. Consider `칙허장` here while preserving the sentence's meaning. | High |
| `53842` | Name / title format | The full source label is `Argine, Queen of Staves`; Korean pairs only `Argine`. Pair the complete label, e.g. `지팡이의 여왕 아르진(Argine, Queen of Staves)`, consistently with its other occurrences. | High |
| `53859` | Terminology | These quest vessels contain ashes. Japanese and Chinese identify them as ash urns, and the same quest's other references vary among `유골함`, `항아리`, and `단지`. Use `유골함` here, scoped to these quest urns. | High |
| `53901` | Meaning | `After all my labors` means after working hard; Korean `온갖 일을 겪고 나니` instead describes going through many events. Consider `그동안 고생한 끝에 생활 구역에서 쉬니 참 좋군.` | High |
| `53910` | Naturalness | `왕좌를 놓고 앉아` is awkward for sitting on a makeshift throne. Consider `그는 시장의 오두막에 마련한 임시 왕좌에 앉아 있겠지? 가서 그의 통치가 본격적으로 시작되기 전에 끝내.` | High |
| `53915` | Objective style | The imperative `타리(Tari)의 반지를 되찾아라` differs from the linked quest's compact objective labels. Consider `타리(Tari)의 반지 되찾기`. | Medium-high |
| `53929` | Naturalness | `거기 있는 너!` is an awkward literal attention-getter for `You there!`. Consider `거기요! 제발 도와줘! 페이(Fae)에게 납치돼서 나갈 수가 없어!` | High |
| `53956` | Terminology / naturalness | `weaving Fate` describes the activity and relates to the established label `운명 엮기(Fateweaving)`. Korean `운명을 직조하는` obscures that relation. Consider `운명을 엮는 훈련을 받는 이들도 있어. 나는 어린 시절부터 자연스레 그 재능을 깨달았지.` | Medium-high |
| `53957` | Naturalness | The repeated question and `배달해 주겠냐고?` sound awkward in Korean. Preserve `take these ... off my hands` as handing the task over: `그럼 해 주겠어? 이 성가신 통지서들을 가져가서 대신 전해 주겠어?` | Medium |

Eleven findings (`53754`, `53784`, `53785`, `53793`, `53840`, `53842`,
`53859`, `53901`, `53915`, `53929`, and `53956`) were rechecked against their
earlier reports. The other six are new findings from this range.

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `53861` | Register / speaker | The isolated line and asset association do not establish the individual speaker or whether the Korean form is intentional. Japanese has a feminine polite form, but no per-key speaker mapping is available. Retain the current Korean pending stronger context. |
| `53922` | Meaning / terminology | Capitalized `Order` may denote a named group or an abstract principle. Japanese suggests a religious order while Chinese suggests an alliance; the asset does not resolve the conflict. Retain `질서(Order)` provisionally. |

ID `53858` remains an earlier hold about the singular personal rank `Templar`;
the evidence does not authorize replacing it with the separate plural-faction
term. It is excluded from the two newly recorded holds and is not resolved by
this pass.

## Rechecked Findings and Structure

- Forty-eight exact-English duplicate groups across the corpus touch this
  range, covering 49 target rows. Korean matches within all but the group
  `26334` / `53935` (`Go home.`). Japanese also differs (`帰って` / `帰れ`),
  supporting the distinct Korean wording; no forced harmonization is proposed.
- Two rows contain embedded line breaks: `53880` (9) and `53944` (3).
  Counts match across all four locales, for 12 breaks per locale. Korean
  embedded separators remain CRLF.
- Thirteen runtime/display markers occur in `53778`, `53885`, `53909`, and
  `53913`. Marker identities and order match across locales after allowing
  localized wrapper contents.
- Numeric values were checked by meaning rather than raw digit order. The
  source-specific ordering differences at `53862` and `53931` preserve the
  same values and units; the two-gladiator limit and second-round timing at
  `53936` are also retained.
- Of 250 IDs, 198 have indexed asset associations, represented by 202 links
  across 129 assets; 52 have no indexed asset. Of the 183 newly recorded
  IDs, 132 are linked through 134 links across 75 assets, and 51 have no
  indexed asset. Asset links do not establish per-key speakers or playback
  order.

## Range Result

- After adding 183 IDs, the ledger covers 56,902 of 65,135 unique `default`
  IDs (87.36%), leaving 8,233. Sequential coverage reaches `53999`; the next
  range is `54000`-`54249`.
- The 17 correction candidates and evidence-limited holds are review
  proposals. Existing ledger rows remain append-only and unchanged. No
  translation CSV was changed.
