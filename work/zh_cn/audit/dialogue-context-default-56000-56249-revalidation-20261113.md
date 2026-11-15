# Sequential `default` Revalidation: IDs `56000`-`56249`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 61 pre-existing ledger fingerprints; all match. Preserved
  those rows and appended the other 189 IDs in ascending order.
- Recorded ten new correction candidates and two new evidence-limited holds.
  Seven pre-existing candidates were rechecked and remain unchanged in the
  append-only ledger. A newly identified source-interpretation question at
  existing ID `56044` is documented here without rewriting its ledger row.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `56009` | Meaning | `Grim Onwig runs things here` says he manages affairs in this place. Korean `그 자리를 ... 차지했지` can imply that he took the Hierophant's office. Japanese says he became the leader, and Chinese says he manages affairs here. Consider `대사제(Hierophant)는 사슬에 묶여 있고, 여기 일은 그림 온위그(Grim Onwig)가 맡고 있지.` | High |
| `56010` | Korean grammar | The name `아가스 울프릭(Agarth Ulfrik)` ends in a consonant sound, so the object particle must be `을`, not `를`. Consider `아가스 울프릭(Agarth Ulfrik)을 봤어?` | High |
| `56055` | Naturalness | `left for dead` is correctly understood as being abandoned under the assumption that one is dead; Japanese and Chinese also describe being left to die. The final fragment `버려지기 전의 나처럼` is stiff after the preceding `나처럼 말이야`. Consider `그 덕에 크게 될 거야. 나처럼 말이야. 뭐, 배신당해 죽은 줄 알고 버려지기 전까진 말이지.` | Medium |
| `56061` | Meaning | `I'm not qualified` means she lacks the qualification or ability to track Peaches. Japanese explicitly says she lacks that ability, while Korean `난 그런 사람이 아니야` instead describes what kind of person she is. Consider `피치스(Peaches)의 현재 굴을 찾아내려면 노련한 추적자가 필요한데, 난 그럴 자격이 없어.` | High |
| `56102` | Meaning / naturalness | `Lords and ladies! Friends and family!` addresses two audiences. Korean adds `귀족 여러분` and then repeats `신사 숙녀 여러분`, omitting the friends-and-family address. Japanese confirms the two-part greeting. Consider `신사 숙녀 여러분! 친구와 가족 여러분! 용감한 구원자의 귀환을 환영합시다! 운명 없는 자(Fateless One)를 위해 잔을 드세요!` | High |
| `56105` | Meaning / naturalness | The vocative `Wencen` is awkwardly attached after the clause, and `either` includes Wencen as well as the Maid in the doubt about who is gone. Japanese and Chinese explicitly name both. Consider `웬센(Wencen), 이번 계절이 이례적이었다고 해서 시녀(The Maid)나 네가 사라졌다고 단정할 수는 없어. 위대한 순환(Great Cycle)은 때가 되면 우리 모두를 되돌려 놓으니까.` | High |
| `56110` | English pairing / format | The book's signature is `- 해군 준장 개릭`, which omits the English name and rank pairing used elsewhere for named people. Chinese supports the rank `Commodore`; Japanese uses the broader `提督`. Consider `- 해군 준장 개릭(Commodore Garrick)`. | Medium-high |
| `56163` | Name / title format | `펠(Fel) 숙련자(Adept Fel)` repeats Fel in both the name and the full English title. Other references use forms such as `숙련자 펠(Fel)` or `숙련자 펠(Adept Fel)`. Consider `숙련자 펠(Adept Fel)` while preserving the sentence's formal address. | High |
| `56202` | Terminology consistency | `The Giving` is the named final rite/task. The current `기빙(The Giving)` conflicts with `봉헌` at `10533`, `12109`, `52952`, and `61225`; Japanese consistently calls it `寄与の儀`. Consider `체류(Sojourn), 봉사(Service), 봉헌(The Giving)` and use the same Korean term for this rite throughout. | High |
| `56220` | Speech level / naturalness | Japanese uses plain conversational forms (`あなた`, `だよ`, `祈る`), while Korean shifts to the marked `자네`/`-군` style. Consider a conversational rendering such as `토론 실력이 대단하네! 부름받은 자(Beckoned)라 그런가 봐. 앞으로 있을 토론도 잘하길 바라지만, 너한텐 행운도 필요 없을 것 같아.` The individual speaker is not identified from the asset catalog. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `56170` | Meaning / entity | English capitalizes `the Tree`, Japanese says only `樹`, and Korean uses `나무`; Chinese identifies it as `绞架树` (Gallows Tree). The row does not establish whether this is a proper name or a generic tree, so do not expand the Korean label. | Uncertain |
| `56211` | Address / context | The entire English row is only `Sir,`; Japanese transliterates the title, but Chinese uses `先生` (“sir/teacher”). With no continuation or addressee context, Korean `경,` remains plausible but cannot be confirmed or replaced safely. | Uncertain |

## Rechecked Existing Findings and Question

All 61 existing rows' source fingerprints match the current four-language
tables. Their append-only records were preserved.

| ID | Current finding and disposition |
| ---: | --- |
| `56044` | English `their flowering` and Chinese describe flowering, while Japanese explicitly says `開花の儀` (the Flowering ceremony). Its SQ04 / Flowering-topic asset link does not map this key to a speaker or establish the intended reference. Retain the current literal reading pending stronger context; this question is documented here without rewriting the existing ledger row. |
| `56046` | The Ratofer family document is consistently `칙허장` in related reviewed rows; current `헌장` remains a terminology candidate. |
| `56054` | This is the Sprite's magical Well. Existing `샘` terminology elsewhere remains stronger than current `우물`; the candidate remains supported. |
| `56084` | `her den` remains a terminology candidate for `굴`; the identity of `the House` remains uncertain and is not expanded. |
| `56148` | `고된 일이었어` followed by `운이 좋군` still shifts register within one line; the candidate remains supported. |
| `56179` | `마지막 순간 몇 장면` remains awkward for remembered moments; the candidate remains supported. |
| `56193` | `Order of Mitharu` remains inconsistent as `미사루 수도회` versus the established `미사루 교단`; the candidate remains supported. |
| `56245` | `줄 열쇠가 있어` remains compressed for `I have some keys for you` / `鍵を渡したい`; `열쇠를 건네고 싶어.` remains a natural direction. |

The previously noted `56055` idiom was rechecked: `죽은 줄 알고 버려지다`
preserves `left for dead`; the remaining issue is the stiff final fragment,
not a reversed meaning.

## Repeated English and Structure

- Sixty-one exact-English duplicate groups across the corpus touch this
  range, covering 1,246 IDs. Korean matches within every group except
  `Later, then.` and `Stay strong.` Those differences are supported by
  Japanese: `後で` versus `後でな` at `27231` versus the other `Later, then.`
  rows, and `お元気で` versus `元気でな` at `59183` versus `56137`.
  Preserve the corresponding Korean register/wording differences; do not
  mechanically unify them.
- Four rows contain embedded line breaks: `56101` (1), `56110` (10),
  `56124` (3), and `56157` (3). Each language has 17 embedded line breaks
  across these rows.
- Runtime and layout marker identities and order match across the four
  languages. Localized display text inside markers differs as expected; no
  marker was removed or reordered.
- Of 250 IDs, 201 have indexed asset associations (207 ID-to-asset links
  across 133 assets), and 49 have no indexed asset. Asset associations do
  not establish per-key speakers or playback order.

## Range Result

- All 61 pre-existing ledger rows remain unchanged; 189 new IDs were
  appended in ascending order.
- The ledger covers 58,592 of 65,135 unique `default` IDs (89.95%), leaving
  6,543. Sequential coverage reaches `56249`; next is `56250`-`56499`.
- Findings require separate approval before any translation CSV edit. No
  translation CSV was changed.
