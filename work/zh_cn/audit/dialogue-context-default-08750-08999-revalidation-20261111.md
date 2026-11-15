# Sequential `default` Revalidation: IDs `8750`-`8999`

- Date: 2026-11-11.
- Scope: the current Korean text against English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- The 60 existing ledger records have current fingerprints and were retained.
  All 190 previously unrecorded IDs were compared and recorded.
- Seventeen new IDs have correction candidates. Ten have evidence-limited
  findings; `8969` and `8992` occur in both categories.
- No translation CSV, immutable source, or extracted game asset was changed.
- Only `8845` and `8970` directly identify their speakers in their text.
  Other speakers and all dialogue playback order remain unassigned.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `8755` | Name pairing | The location label `Hunter's Pit` is unpaired `사냥꾼의 구덩이`. Consider `사냥꾼의 구덩이(Hunter's Pit)`, preserving the current Korean rather than inferring a new site function from Japanese `アジト`. | High |
| `8788` | Meaning / naturalness | `You should have better sense. Better sense than me, at the very least.` becomes `나보다야 분별력이 있어야지. 적어도 나보다는 말이야.` This prematurely introduces the comparison and then repeats it. Japanese first asks for better judgment and then compares with the speaker. Consider `좀 더 분별 있게 굴어야지. 적어도 나보다는 말이야.` | High |
| `8795` | Name pairing | `Ragnall's Heroon` is unpaired `라그날의 영웅 사당`. Pair the displayed name, e.g. `라그날의 영웅 사당(Ragnall's Heroon)`. Keep the shrine/monument/tomb interpretation question separate; pairing does not resolve it. | High |
| `8814` | Naturalness / text type / pairing | The direct explanation of who conceived the Library uses written-sounding `구상한 것은 ... 이었다`, `주문을 걸었다`. Japanese is a plain spoken explanation. Consider `도서관을 구상한 건 이사 경(Lord Ysa)이 아니라 백색의 할람(Hallam the White)이야. 그가 케언(Cairn)을 만들고 그것을 지키는 주문을 걸었지.` The confirmed `item:fae-cairn` glossary specifies `(Cairn)` for contextually linked short forms, not the current `(Cairns)`. Retain the creation/protection distinction and do not infer the speaker from asset membership. | Medium |
| `8817` | Naturalness / register within row | `대사제 ... 가려내라 하셨다. 자, 시작할까?` shifts from a written report ending to a conversational invitation. Japanese is consistently conversational (`見ているの`, `始めましょうか`). Consider `대사제(Hierophant)께서 ... 가려내라고 하셨어. 자, 시작할까?`, retaining respect for the Hierophant without automatically making the listener's register polite. | High |
| `8831` | Naturalness | `You are hidden from detection for 6 seconds` becomes `6초 동안 적의 감지에 들키지 않습니다`. Consider `6초 동안 적에게 감지되지 않습니다`. Preserve physical damage 19, stun 5 seconds, hidden 6 seconds, Mana 55, and the three-line layout. | High |
| `8848` | Terminology / meaning / pairing | Capitalized `The Weave` is only `직조`. Review with `8662`, `8191`, and the related fate-weaving passages; a form such as `운명의 직조(Weave)` makes the concept clearer. Do not decide the corpus-wide term from this prophecy alone, or remove its solemn delivery. | Medium |
| `8855` | Name consistency / pairing | The journal uses unpaired `마턴 스트랜드` / `마턴`. Standalone labels `38419` and `45561`, and dialogue `52686`, use `마튼 스트랜드(Marten Strand)`; related journal `36407` has yet another form, `마틴`. Consider `마튼 스트랜드(Marten Strand)` and `마튼(Marten)` here, reviewing the related journal together if edits are approved. The companions' death/release meaning is already preserved. | High |
| `8864` | Meaning / mechanics wording | English explicitly says the extended Freezing effects slow enemies; Japanese says `スロウ状態`. Korean `적의 발을 더 오래 묶습니다` can suggest immobilization rather than slowing. Consider `적을 더 오래 느려지게 합니다`, retaining the duration extension and Ice Barrage damage bonus. No gameplay measurement is claimed. | Medium |
| `8877` | Meaning / UI | `Warsworn Hireling Board` is `워스원(Warsworn) 고용병(Hireling) 모집 게시판`, adding recruitment. Japanese specifically identifies a requests board (`依頼一覧`), not recruitment. Consider `워스원(Warsworn) 고용병(Hireling) 의뢰 게시판`; do not convert the faction or rank names in isolation. | High |
| `8886` | Meaning / naturalness | The active ability pulls an enemy toward the player and may have the opposite effect on large enemies. Korean's `역효과가 날 수 있습니다` is vague. Japanese explicitly says the player is pulled instead. Consider `거대한 적에게 사용하면 오히려 자신이 끌려갈 수 있습니다`, preserving English's possibility rather than making it unconditional. | High |
| `8904` | Name pairing | `Glynis` is unpaired `글리니스라는`. Consider `글리니스(Glynis)라는`; keep the old healer/apprenticeship and childhood sequence intact. This does not independently establish the speaker's identity. | High |
| `8928` | Title pairing | `High King of Winter` becomes `겨울의 지고왕(High King)`, omitting `of Winter` from the paired title. Consider `겨울의 지고왕(High King of Winter)`. | High |
| `8969` | Name pairing | `Henge` is unpaired `헨지의 마법`, while `2609` and `11859` use `헨지(Henge)`. Pair it here without changing the shrine sequence or the English-supported statement that its magic was undone. The Japanese contradiction is recorded separately below. | High |
| `8978` | Name pairing | `Agni` is unpaired `아그니`. Consider `아그니(Agni)` and retain the possibility of waiving the speaker's bar tab. `20752` and `24775` have the complete name `에이드리언 아그니(Adrian Agni)`; this row supplies only the surname, so do not expand it automatically. | High |
| `8992` | Naturalness | `아주 단순한 방식으로 꽤 영리한 사람이야` is a stiff rendering of `He's kind of brilliant in a very simple way`. A conversational direction is `단순해 보여도 나름대로 영리한 사람이야`, but this is not approved: Japanese's `つまらないところで良く知恵が回る` has a different evaluative nuance. Resolve the meaning hold before choosing final wording. | Medium |
| `8997` | Naturalness / name pairing | The history names `Plaguetimes` and `The Burning`, but Korean omits their English pairings. Consider `역병의 시기(Plaguetimes)` and `대화재(The Burning)` where those labels occur, and pair the later unpaired `오르보칸트(Orbocant)`. `평의회의 구성원과 ... 제외한 모두에게 평의회를 비밀로 했다` is also stiff. Recast naturally without deciding from this row alone whether secrecy concerns the institution, membership, or both. Preserve all three paragraphs and the 600-year interval. | Medium |

## Evidence-Limited Findings

| ID | Dimension | Reason |
| ---: | --- | --- |
| `8785` | Register | Korean has `생각하나`, `주신다네`, `말이지`; Japanese is plain, and the religious context can support some elevation. Without a linked speaker or stage, do not prescribe one character's register from this row. |
| `8804` | Register | Japanese pleads in plain speech (`殺さないでくれ`, `知らん`); Korean pleads politely (`죽이지 마세요`, `모릅니다`). Fear can justify a register change, and the NPC symbol does not establish a line-level voice. Hold rather than force a change from one comparison. |
| `8832` | Address / rank | English `Ancient Delfric`, Japanese `大将軍デルフリック`, and Chinese's elder-like address differ. Korean's respectful `델프릭 ... 장군님` is plausible but does not settle the canonical Ancient rank; retain the respectful letter and its signature. |
| `8845` | Register | The line explicitly introduces Jubal Caledus. Japanese's self-introduction is plain (`失敬`, `している`), while Korean is polite (`오셨죠`, `대현자입니다`). The speaker is known from the text, but comparison with his other verified turns/stage is still needed before changing his voice. The asset's Jane Morkan symbol is not the speaker of this self-introduction. |
| `8846` | Meaning / terminology | The terse component label `Master Mitharan Clarity Grip` does not establish modifier scope or a canonical Clarity component name. Carry forward the earlier hold instead of guessing from its words. |
| `8912` | Meaning / terminology | The general missing-supplies joke is preserved. Japanese reads `twining` as twine and Chinese as rope; the exact named item remains unclear. `dagger pommels` also merits component-name alignment, but no corresponding base pommel label was found in the inspected source base table. |
| `8969` | Source conflict | English and Chinese say the Henge's magic was undone; Japanese says `まだ解けていなかった` (not yet undone). Current Korean follows English. Keep this source conflict recorded rather than reversing the event merely to match Japanese. |
| `8970` | Register | The text explicitly identifies Simeon Crowe. Japanese's offer is casual (`ご用かな`, `あげよう`), while Korean uses `도와드리죠`, `됐습니다`. Hold the register decision until comparison with verified turns; do not attribute him to the unrelated NPCs listed in the asset. |
| `8986` | Meaning / narrative | The broken promise, request for payment, and unmarried/widow contrast remain, but the precise promise and counterfactual relationship are not established. Carry forward the earlier uncertainty without inventing what happened to Ratofer. |
| `8992` | Meaning / source nuance | English's simple kind of brilliance and Japanese's cleverness about trivial things do not give an identical evaluation. Chinese is broad. Resolve the scene's intended compliment/irony before finalizing the naturalness proposal. |

## Duplicate and Structural Checks

- Fifty-nine exact-English duplicate groups touch this range, totaling 1,249
  rows across the corpus. Their current Korean translations all match.
- Logical line-break counts and runtime/layout-token identities match across
  the four languages for all 190 new IDs. No unmatched braces were found.
- At `8991`, Japanese and Korean put the second slot wrapper before the
  second ability wrapper; English puts them in the opposite textual order.
  All five localized wrappers, `{LINE_SPACE}`, and `{1}` remain present.
  This is supported grammatical reordering, not a missing token.
- Twelve new Korean strings contain 33 existing CRLF embedded breaks:
  `8761` (4), `8831` (2), `8832` (3), `8852` (2), `8859` (5),
  `8864` (1), `8886` (1), `8930` (4), `8966` (4), `8969` (2),
  `8996` (1), and `8997` (4). They were preserved.
- `8761` retains the corrected conditional rather than reversing it.
  `8859`, `8933`, and `8949` retain their earlier accepted semantic fixes.
- `8917` uses the user-selected `셉터`; the obsolete uncertainty about its
  Korean weapon-class spelling does not justify changing it now.
- `8786` (`Compliance QA Testers`), `8980` (`StringBox`), and `8924` (`.`)
  were not automatically translated or removed as presumed player-facing text.
- Of the 190 new IDs, 136 have indexed asset links and 54 do not.

Four-language fingerprints and per-ID findings are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
