# Sequential `default` Revalidation: IDs `20000`-`20249`

- Date: 2026-11-12.
- Compared all 250 active Korean rows with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register, terminology, and format.
- Rechecked 54 existing ledger records and added 196 previously unrecorded
  IDs.
- Retained three existing correction candidates and recorded 15 new
  candidate IDs and five evidence-limited holds.
- No translation CSV, immutable source, extracted asset, or localization
  binary changed.

## Correction Candidates

These are source-grounded review proposals, not approval to edit the
translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `20022` | Name pairing | `Gem of Eternal Ice` is a named item, but Korean has only `영원의 얼음 보석`. Consider pairing the complete item name as `영원의 얼음 보석(Gem of Eternal Ice)`; retain the separate `파스머(Phasmer)` pairing. | High |
| `20041` | Name pairing | The named location `Schneggar's Cave` is rendered `슈네가르 동굴` without its English name. Consider `슈네가르 동굴(Schneggar's Cave)`. | High |
| `20052` | Name pairing | `Eamonn's Isle` is a named destination but appears as `이먼의 섬` without English pairing. Consider pairing the complete name; retain the repeated `베신(Besin)` question. | High |
| `20059` | Naturalness / journal voice | This journal entry shifts from `찾을 수 있을 것이다` to `자백을 받아낼 수 있겠지`. Consider a smoother, consistent first-person journal rendering such as `아데사(Adessa)의 리브라리움(Livrarium)에서 옥티엔(Octienne)을 찾을 수 있을 테니, 자백을 받아내 봐야겠다.` Preserve the prior meeting with Jorielle and the possibility, not certainty, of obtaining a confession. | Medium |
| `20095` | Name pairing | `Travelers Sun Camp` is a named camp; Korean pairs `트래블러(Travelers)` but leaves the complete location name unfinished as `태양 야영지`. Consider a single, non-duplicative pairing of the full camp name. | Medium-high |
| `20097` | Name pairing | The explicitly named `Artan Caid` is rendered `아르탄 케이드` without English pairing. Consider `아르탄 케이드(Artan Caid)`. | High |
| `20141` | Meaning / terminology | `Blood Doge` is translated as `피의 지도자`, while the same title is already rendered `피의 총독(Blood Doge)` at `54182`; other occurrences at `20258` and `47675` also vary. Consider aligning this occurrence with the established title. The other IDs are cross-corpus evidence and will be reviewed in their own ranges. | High |
| `20145` | Objective form | `Acquire a Border Permit` is an action objective rendered `국경 통행증 획득`. Consider the established objective form `국경 통행증 획득하기`. | High |
| `20178` | Name pairing | `Testament` refers to the named Belen's Testament cult in the surrounding corpus. Korean `테스타먼트` lacks English pairing here; consider `테스타먼트(Testament)` without expanding the shortened source name to `Belen's Testament`. | Medium-high |
| `20188` | Name pairing | The capitalized substance/name `Culminite` is rendered phonetically as `컬미나이트` without English pairing. Consider `컬미나이트(Culminite)`; retain the speaker's claim that a revelation is imminent. | Medium |
| `20204` | Naturalness | `아름다움과 기쁨과 사랑은 늘 승리하는 법인가` is understandable but stiff after the excited opening. Consider a more fluent, still lyrical question such as `참으로 아름다움과 기쁨, 사랑은 언제나 승리하는 법인가!` Preserve the lovers-lost-and-found song and rhetorical tone. | Medium |
| `20219` | Format | The English ability label is inside the localized `{*1...}` wrapper, while Korean places `(Shield Bash)` outside it: `{*1방패 강타}(Shield Bash)`. Consider keeping the complete paired label inside the wrapper, without changing the damage bonus, line break, or description. | High |
| `20233` | Name pairing | `Motus Mining` is a named company, but Korean has only `모투스 광업`. Consider `모투스 광업(Motus Mining)`. | High |
| `20244` | Terminology / name consistency | `Freehold` is a recurring named location, but this row uses `자유령` while active references include `자유 영지(Freehold)`, `자유영지(Freehold)`, and `프리홀드(Freehold)`. Align this row after resolving the corpus-wide Korean form; do not silently choose among the conflicting existing forms. | High |
| `20248` | Name pairing | The UI announcement names the item `Vennt's Stealth Potion`, but Korean only says `벤트의 은신 물약`. Consider pairing the complete item name once, e.g. `새 아이템: 벤트의 은신 물약(Vennt's Stealth Potion)`. The existing `벤트(Vennt)` spelling is supported by related entries. | High |

The existing candidates at `20094`, `20205`, and `20206` were rechecked and
retained. At `20094`, the earlier contract/ring and Hanrik-pairing proposal
still applies. At `20205`, the English, Japanese, and Chinese connect the
player's help to the end of the speaker's tragedy; the Korean clauses still
make the offered possessions sound like the means of forgetting it. At
`20206`, the current `삶의 고단함이 끝내 한계를 넘었어` remains an awkward
rendering of the strain finally taking its toll.

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `20011` | Meaning / text type | `Old Red` may be a name, nickname, or descriptive label. The isolated label and locale references do not establish its referent; retain the transliteration provisionally rather than inventing an entity. |
| `20045` | Meaning / UI context | `Assault` is rendered `暴行` in Japanese and `突袭` in Chinese, which support different senses. Korean `습격` is plausible, but the isolated label does not settle whether it names an attack, an assault, or a UI category. |
| `20053` | Speech level | Japanese uses the honorific `方` for the person being discussed, while Korean uses casual `사람이야`. The row does not identify a speaker or establish the scene; record the register discrepancy without asserting that it is a same-speaker error. |
| `20127` | Meaning / title | `Castellan` is left untranslated in Japanese and Chinese but rendered `성주` in Korean. That is plausible, but the isolated title does not establish whether the game uses it as a role, rank, or named office. |
| `20174` | Text type / meaning | `I Saw an Erathi, Once` may be a title or a sentence-like label. The available row does not establish the text type; do not add title punctuation or a book interpretation without evidence. |

## Duplicate And Structural Checks

- All four language tables contain the 250 IDs in the same order. The range
  touches 57 exact-English duplicate groups (1,071 corpus rows), and the
  Korean wording is identical within each group.
- Japanese wording varies materially for some repeated short strings.
  `Never mind.` at `20037` uses Japanese `何でもない`, which supports the
  Korean `아무것도 아니야`; other IDs use `わかった` and require their own
  review. `What now?` at `20183` uses `これからどうする？`, supporting
  `이제 어쩌지?`; other rows use `なんだ？`, a different question. Do not
  infer shared speakers or force identical Korean solely from English.
- Japanese variants of `I'm looking forward to your next match, Champion.`,
  `Who are you?`, `Hello again.`, `Fight with me.`, and the Crudok question
  were checked as source phrasing/register differences, not speaker evidence.
- Logical line-break counts and detected runtime/localized-wrapper token
  sequences match across all four languages for all 250 rows. This includes
  the five-line poem at `20090`, the ability description at `20023`, and the
  multiline effect text at `20222`. The wrapper-content placement issue at
  `20219` is separately recorded above.
- Asset associations, serialized order, and row IDs were not used to assign
  speakers or playback order.

The ledger now contains 31,980 of 65,135 IDs (49.10%), leaving 33,155.
The next sequential range is `20250`-`20499`.
