# Sequential `default` Revalidation: IDs `26250`-`26349`

- Date: 2026-11-12.
- Compared all 100 active Korean entries with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register, terminology, and format.
- Rechecked 20 existing ledger entries and added 80 unrecorded IDs. Eight new
  correction candidates and two evidence-limited holds were recorded; one
  previously unflagged record was reclassified as a candidate.
- Three existing candidates remain pending. No translation CSV, source, or
  extracted asset was changed.

## Correction Candidates

These findings are not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `26251` | Meaning / terminology | `the Sorrows` is rendered `슬픔` here, while related ID `34291` uses `비탄의 힘`. Consider `비탄의 힘에 이르는 일종의... 열쇠`, and reconcile the `Hollow of Sinsear` wording with the established `신시어(Sinsear)` location without asserting unsupported geography. | High |
| `26255` | Naturalness | `무작위 습격` reads like a technical classification rather than speech. Consider `이제는 캠프가 불시에 습격까지 받고 있어`, while retaining the uncertain Niskaru attribution. | Medium-high |
| `26256` | Format | `하늘꽃(Sky Blossom)(2)` lacks the space before the quantity used by its other ingredients. Consider `하늘꽃(Sky Blossom) (2)`; preserve all line breaks and amounts. | High |
| `26259` | Naturalness | `신들이 자네가 자신들이 고른 보상을...` repeats the subject awkwardly. Consider `신들이 고른 보상을 자네가 받을 자격이 있다고 인정한 모양이군.` The existing ledger entry was reclassified. | High |
| `26277` | Format / meaning | English and Japanese wrap the displayed `difficulty` and `options` words once. Korean repeats both outside and inside their wrappers: `난이도{*1난이도}` and `설정 메뉴{*1옵션}`. Consider `게임 {*1난이도}는 {*1옵션} 메뉴에서 변경할 수 있습니다.` Preserve both wrapper tokens and their order; exact in-game rendering is not established by the CSV alone. | High |
| `26313` | Terminology | `Neophytes` is rendered `새내기 수련생`; the project's role distinction uses `초심자(Neophyte)`. Check the role context and align without treating ordinary use of `new` as a separate rank. | Medium-high |
| `26315` | Naturalness / register | Japanese is a spoken recollection (`教えを受けてきたわ`), while Korean uses formal written endings `받았다` and `분이다`. Consider conversational wording such as `지난 며칠 동안 위대한 스승의 가르침을 받았어. 그분은 ... 꿰뚫어 보는 분이야.` | Medium-high |
| `26316` | Naturalness / register | Japanese is a first-person reflection, but Korean ends throughout in literary `-다`. Consider conversational endings while retaining the contrast between a fallen city and pain at citizens being trampled. | Medium |
| `26343` | Name / format | `Kerrinan` is `케리난` without pairing; other entries, including `2377` and `54760`, use `케리넌(Kerrinan)`. Consider that established form and preserve the polite invitation. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `26252` | Name | English spells the effect `Lupoku's Luck`, while the established deity name elsewhere is `Lopoku`. Korean uses `로포쿠(Lopoku)`. The discrepancy could be a source typo; retain pending confirmation rather than silently change the established deity. |
| `26286` | Meaning | English says `Fae giants and mortals`, Japanese lists Fae, giants, and mortals separately, and Chinese omits giants. Korean interprets `Fae giants` as one group. Hold until item-history context clarifies the intended grouping. |

## Rechecked Existing Findings

- Retain the existing `26260` speech-level candidate.
- Retain the `26261` full ballad-title pairing candidate.
- Retain the `26329` previously recorded quest-text naturalness candidate.

## Duplicate And Structural Checks

- The range touches 21 exact-English duplicate groups comprising 408 corpus
  rows. The only Korean variation is `Go home.` at `26334` / `53935`; their
  Japanese is also different (`帰って` / `帰れ`), so do not force uniformity.
- All four languages have matching embedded line-break counts in the range.
  At `26277`, each language has two `{*1...}` wrappers in the same order;
  the Korean text duplication is recorded above rather than removing tokens.
- Asset association, NPC symbols, and ID sequence do not establish a line's
  speaker or playback order.

After recording this range, the ledger contains 36,510 of 65,135 IDs
(56.05%), leaving 28,625. Sequential coverage reaches ID `26349`; the next
range is `26350`-`26499`.
