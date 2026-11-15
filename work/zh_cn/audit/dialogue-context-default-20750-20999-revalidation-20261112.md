# Sequential `default` Revalidation: IDs `20750`-`20999`

- Date: 2026-11-12.
- Compared all 250 active Korean rows with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register, terminology, and format.
- Rechecked 60 existing ledger records and added 190 previously unrecorded
  IDs. Six existing correction candidates and the existing hold at `20874`
  were retained; two previously unflagged records were reclassified as
  correction candidates.
- Recorded 11 new correction candidates and three evidence-limited holds.
- No translation CSV, immutable source, extracted asset, or localization
  binary changed.

## Correction Candidates

These findings are proposals for separate review, not approval to edit the
translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `20766` | Terminology | `Neophyte` is the Scholia Arcana rank/title; Korean `신참 수련자` is generic and lacks the source term. The glossary uses `초심자(Neophyte)` for this rank. Consider `초심자(Neophyte)` here. | High |
| `20768` | Naturalness / register | `괴물들의 아가리 속` is markedly coarse, while English `maws` is vivid but not necessarily vulgar and Japanese omits that register. Consider `우리를 사냥하는 괴물들의 입속에`; retain the explanation that the glands must be obtained by killing a spider. | Medium |
| `20794` | Terminology / item label | `Master Mitharan Clarity Bindings` is rendered `장인의 미타란 명료함 결속구`. `장인의` reads as possession or craftsmanship rather than an item-grade modifier. Consider `장인급 미타란(Mitharan) 명료함 결속구`, while retaining the named set and slot. The English source spells `Clairty`; Japanese and context support `Clarity`. | Medium |
| `20865` | Meaning / naturalness | `everything I've done` is translated `내가 저지른 모든 일`, which presumes wrongdoing that the English does not state. Consider `내가 한 모든 일` and retain the repeated, regretful cadence. | Medium-high |
| `20866` | Address / title | `Lady Ansilla` is rendered `안실라 부인(Lady Ansilla)`. The user specifically requested pairing `Lady` in the Korean `여사` form; consider `안실라 여사(Lady Ansilla)` so `부인` is not read as marital status. | Medium |
| `20880` | Terminology | This repeats `I want to sell you a kerchief.` at `3099`; both currently say `스카프 하나 팔게`. The same SQ06 item is called `손수건` in its other quest, sale, and status references. Consider `손수건 하나 팔게`; Japanese's `スカーフ` is retained as a source-language difference. | Medium-high |
| `20888` | Terminology / consistency | The long journal entry translates `lichen` as `지의류` earlier but calls it `이끼` in the final sentence. Use `지의류` consistently, preserving all three paragraphs and line breaks. | High |
| `20891` | Meaning | `The strong seldom do` means that strong people rarely like hearing criticism. Korean `강자들은 대개 듣기 싫어하지` changes `seldom` (“rarely”) to `대개` (“usually”). Consider `강자들은 그런 말을 좀처럼 듣기 좋아하지 않지.` | High |
| `20931` | Terminology / consistency | The existing candidate remains open: the row uses `캔드리안 근위대` and splits the name as `인드레(Indre) 캔드리안`, unlike the same quest's `칸드리안 경비대(Kandrian Guard)`. Align with `인드레 칸드리안(Indre Kandrian)` and `칸드리안 경비대(Kandrian Guard)`. | High |
| `20939` | Meaning | `Varani hand` means Varani handwriting/script. Korean `바라니(Varani)의 편지` can instead read as a letter belonging to a Varani person. Consider `거친 바라니(Varani) 필체로 쓴 편지`, consistent with Japanese `ヴラニの文字` and Chinese `瓦拉尼字迹`. | High |
| `20949` | Naturalness | The existing candidate remains open: `나중에 보지` can sound ominous or haughty for `I shall see you later`; Japanese `また会おう` is a friendly plain-style farewell. Consider `나중에 보자.` | Medium-high |
| `20964` | Terminology / consistency | Capitalized `the Well` refers to the Well of Souls; Korean consistently renders that entity as `영혼의 샘(Well of Souls)` elsewhere, but this line says only `샘`. Consider `영혼의 샘(Well of Souls)을 제어하는 동안`. | High |
| `20978` | Naturalness | `6초 동안 적의 감지에 들키지 않습니다` is awkward because the character is “caught by detection.” Consider `6초 동안 적에게 발각되지 않습니다`, preserving the duration and preceding smoke-bomb effects. | High |
| `20987` | Meaning | `or you'll die` becomes `안 그러면 죽여 버리겠어`, explicitly assigning the killing action to the speaker. Japanese and Chinese threaten that the addressee will die without naming the agent. Consider `안 그러면 죽을 줄 알아.` | Medium |
| `20992` | Meaning / poetic form | In this third-person verse, `The Pure, and Lady of the Light` is rendered as the vocative `순결한 자, 빛의 여인이여`, although the following lines continue describing Oleyn as “She.” Consider the descriptive `순결한 자, 빛의 여인`; preserve the verse layout. | Medium-high |
| `20998` | Name / title pairing | `The Maid of Windemere` is paired only as `(Maid of Windemere)`, unlike the established `시녀(The Maid)` form. Consider `윈더미어의 시녀(The Maid of Windemere)` to retain the full source title. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `20858` | Meaning / proper-name status | Capitalized `the Burn` is rendered `번(Burn)`. Japanese describes `焼け跡港` and Chinese `灼烧之地`; the row does not establish whether this is an event, place, or proper name, so do not guess a replacement. |
| `20874` | Speech level / honorifics | Existing hold retained: Japanese is casual while Korean uses polite `-요`; the linked asset does not identify the speaker or interaction stage. |
| `20937` | Meaning / terminology | Capitalized `the Sorrows` is rendered `비탄의 힘`. Japanese explicitly says `嘆きの力`, while Chinese uses `悲灵`; as at `20502`, the sources do not establish whether this is a named force or a generic concept. |
| `20989` | Meaning / title | `the Fair` in `Sir Farrara the Fair` can mean handsome or just/fair; Chinese supports “handsome,” while Japanese supports a justice/fairness reading. Preserve `공정한` provisionally rather than choosing an unsupported epithet. |

## Rechecked Existing Findings

- `20779` remains a terminology candidate: in the Nanne Hanri formula context,
  `조제법` is better supported than `제조법`.
- `20787` remains a format candidate: change `탈라레인(Tala-Rane)를` to
  `탈라레인(Tala-Rane)을`.
- `20813` remains a register candidate: `용서하게` / `잊는군` shifts to
  `포로일 뿐이야` / `그렇지` within one utterance; Japanese is consistently
  conversational.
- `20880`, `20931`, and `20949` remain candidates as described above.
- `20866` and `20964` were reclassified from `not-issue` to `candidate` after
  the four-language review.

## Duplicate And Structural Checks

- All four language tables contain the 250 IDs in the same order. The range
  touches 53 exact-English duplicate groups (962 corpus rows); Korean wording
  is identical within each group. Japanese variations in greetings, names,
  and short reactions were not used to infer speakers or force Korean
  differences.
- Logical line-break counts and detected runtime/localized-wrapper token
  sequences match across all four languages for all 250 rows. The long
  journal entry at `20888`, the three-paragraph poem at `20906`, the help
  text at `20956`, and the verse at `20992` retain their source-aligned
  structure and markers.
- Asset associations and serialized order were not used to assign speakers or
  playback order.

The ledger now contains 32,532 of 65,135 IDs, leaving 32,603. The next
sequential range is `21000`-`21249`.
