# Sequential `default` Revalidation: IDs `44500`-`44749`

- Date: 2026-11-12.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 71 existing ledger fingerprints and identified 179 new IDs
  to append. All 71 existing fingerprints match the current four-language
  rows.
- Recorded 20 current correction-candidate IDs and seven evidence-limited
  holds. `44672` and `44742` each have both a candidate and a separate hold;
  225 IDs have no supported finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records; this
report records the current revalidation.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `44517` | Speech level | Korean ends with marked 하게체 `받게`, while Japanese states the offer plainly (`代わりにこれを、感謝の印だ`). Consider `그럼 구슬은 내가 가져가지. 대신 고맙다는 뜻으로 이걸 받아.` The source does not establish an individual speaker. | Medium-high |
| `44552` | Name format | `Evenroots` is the established plant name `이븐루트(Evenroot)` elsewhere, including `base` and related `default` rows; this objective omits the English form. Consider `이븐루트(Evenroot) 돌보기`. | High |
| `44555` | Name format | `Snowmelt Spring` is a named location in the verse, but Korean has only `스노우멜트 샘`. Japanese also presents it as a named spring. Consider `스노우멜트 샘(Snowmelt Spring)`. | High |
| `44558` | Speech level / address | Japanese addresses the player directly and casually (`お前`, `やってみたいか？`), while Korean uses the more old-fashioned `자네` and `보겠나`. Consider a consistent conversational form such as `생각해 보니, 너도 이제 현장 조사에 나설 때가 된 것 같아. 한번 해 볼래?` The asset does not identify the line's speaker. | Medium-high |
| `44575` | Name format | The report header names `Roparzh Judoc`, but Korean transliterates the name without its English form. Consider `수석 굴착자 로파르즈 주독(Roparzh Judoc)의 보고서`. Preserve the existing 17 embedded line breaks. | High |
| `44585` | Address / naturalness | Rechecked the prior candidate: `그대` is an elevated, stiff address for the direct familiar `dove`, and the first clause is awkward. Consider `우리 일정이 딱 정해져 있는 건 아니라는 거 알아, 친구. 그래도 오래 기다릴수록 내 계획의 나머지를 마무리하기가 어려워져. 이제 움직여야 해.` Meaning and urgency are otherwise preserved; the asset does not establish the individual line speaker. | Medium-high |
| `44601` | Speech level / address | Japanese uses direct plain forms (`お前`, `だろう`), while Korean combines `자네` and marked 하게체 `걸세`. Consider a consistent plain register, for example `사그렐(Sagrell), 발라드의 집(House of Ballads) 사람들은 널 영원히 의심할 거야. 넌 그들의 인식을 흐리고, 바뀌어서는 안 될 것을 바꿔 버렸어.` No individual speaker is inferred from the asset link. | High |
| `44608` | Address / naturalness | The Korean `자네는 어느 쪽이지?` adds an old-fashioned form of address not present in the Japanese question (`前者か、それとも後者か？`). Consider `어느 쪽이지?` or another natural direct question after checking the full scene. The referent of capitalized `House` is not changed here. | Medium |
| `44618` | Speech level | Japanese and Chinese use courteous forms, while Korean uses marked 하오체 (`좋소`, `하오`). Consider a consistent modern polite register such as `좋습니다. 우리가 찾는 시신이 있는 곳에 가려면 미든(The Midden)을 가로질러야 합니다. 가는 길에도 어려움이 분명 있겠죠.` | High |
| `44629` | Address / speech level | Japanese uses direct `お前` and Chinese uses `你`; Korean's `자네` shifts to an older register. Consider `너 같은 사람이... 그녀와 어울릴 줄은 몰랐군.` Speaker identity remains unknown. | Medium-high |
| `44627` | Terminology / English pairing | Reopened the earlier Belen's Testament finding. The current `테스타먼트` transliterates the faction name and omits the English form; Japanese and Chinese identify the faction. For the English short form `the Testament`, consider `성약단(The Testament)` and retain the rest of the sentence. | High |
| `44632` | Terminology / consistency | The musical instrument is `Flute` in English and `フルート` in Japanese. This row calls both the player and instrument `피리`, while related Korean rows use `플루트 연주자` and `플루트`, and `base:3105` uses `아델레나(Adelena)의 피리`. Consider aligning this story's instrument references to `플루트`; resolve the related `base` item separately rather than editing it in this review pass. | High |
| `44681` | Address / register | Korean uses `자네` in a sentence that otherwise ends in conversational `-거야`; Japanese uses direct `お前` and casual phrasing. Consider `네 처지가 부럽지 않다고는 못하겠지만, 네가 없었으면 우린 해내지 못했을 거야.` The asset does not prove an individual speaker. | Medium |
| `44671` | Title / naturalness | Reopened the earlier title candidate. `도적의 수확` reads as a literal rendering of `Rogue Harvest`; Japanese `悪党狩り` frames it as hunting rogues. Consider a natural title such as `악당 사냥`. | Medium-high |
| `44672` | Name format / terminology | The line omits the English form of `chrysalae`; other occurrences also lack a settled Korean spelling (`크리살라이`, `크리살레`, `크리살라`). Add a source pairing to the selected spelling, e.g. `크리살라이(chrysalae)`, but keep the canonical Korean form unresolved pending a glossary decision. | High for missing pairing; spelling unresolved |
| `44697` | Meaning / naturalness | `old "Fanny"` is an affectionate familiar reference in context; translating `old` literally as `늙은` can sound insulting. Japanese retains the quoted nickname but omits an age description. Consider `나쁘지 않아. 여기저기 다니며 물건을 팔고 새로운 사람을 만나는 데 익숙하거든. 난 '패니' 플래너건(Fanny Flanagan)이 참 좋아.` | High |
| `44727` | Naturalness | `Until we speak again` is a farewell. `다음에 다시 이야기하지` sounds stilted in this conversational closing; Japanese uses `ではまた`. Consider `다음에 또 얘기하자.` | Medium |
| `44741` | Naturalness | `그렇다면 모두가 실패한 곳에서 자네가 성공하겠군` is understandable but follows the English spatial metaphor awkwardly. Consider `그렇다면 그동안 누구도 해내지 못한 일을 자네가 해내겠군.` | Medium |
| `44742` | Naturalness / address | `봐, 자매` is not a natural Korean singular vocative. Consider recasting the sentence, for example `봐, 틸레라와 함께 싸우는 사람이야. 전장에 온 걸 환영해, 전사.` Keep the exact kinship address unresolved below; do not infer sibling age or gender from this line. | High |
| `44730` | Name format | Reopened the earlier `Lupoku's Luck` candidate. Korean already pairs the name, but its parenthetical says `Lopoku`, unlike the English source spelling `Lupoku` and the source form used for the same deity throughout the English table. Consider `로포쿠(Lupoku)의 행운`. | High |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `44549` | Referent / terminology | English capitalizes `House`, but the line alone does not establish whether it means a noble house, a family, or a specific building. Japanese and Chinese use generic house/family wording. Retain the current referent pending context rather than guessing a faction name. |
| `44521` | Meaning | The English/Chinese and Japanese source clauses express opposite regrets. Keep the current Korean provisional; do not harmonize until the source conflict is resolved. |
| `44576` | Location direction | English/Chinese say north; Japanese says west. Keep the current English-aligned Korean direction pending location evidence. |
| `44731` | Meaning | English `his predecessor's grave mishaps` can describe serious misfortunes suffered by the predecessor or serious mistakes by that predecessor. Japanese supports misfortune; Chinese supports mistakes. Keep `큰 실책` provisional until context resolves the conflict. |
| `44672` | Terminology | The same `Chrysalae` term varies among `크리살라이`, `크리살레`, and `크리살라` across Korean rows. Japanese is consistent; Chinese varies in specificity. Pair this occurrence with its English source, but do not select a global Korean form from frequency alone. |
| `44709` | Speech level / speaker | The row uses conversational `-어` and a `-군` ending, while Japanese is plain; the earlier multi-asset review also found mixed registers among related lines without per-key speaker or stage mapping. Keep the register question unresolved rather than imposing one voice. |
| `44742` | Address | English says `sister`; Chinese specifies a younger sister, while Japanese omits the relation. Korean `자매` does not resolve a natural singular form. Retain the relationship wording for review; do not choose `언니`, `동생`, or another age/gender-specific address without evidence. |

## Rechecked Findings and Structure

- Existing ledger fingerprints for all 71 IDs in this range match current
  English, Japanese, Chinese, and Korean. The former `44517` keep disposition
  is reopened as a speech-level candidate. The earlier tentative concerns at
  `44548`, `44572`, and `44584` are cleared: `받게 될 거야` at `44548` is a
  prospective construction, not 하게체; `관통 손잡이` at `44572` matches the
  established `base` crafting-component term; and `중가르 가문(Zungars)` at
  `44584` is supported by the game's mining-family context and established
  usage elsewhere.
- A cross-range exact-English group for `Where can I find them?` contains
  IDs `15997`, `23436`, `44607`, and `60830`. English, Japanese, and Chinese
  are identical; Korean differs only at `23436` (`어디서 찾으면 돼?` versus
  `그들을 어디서 찾을 수 있지?`). With no source-language or text-type
  distinction supporting that variation, consider aligning `23436` to the
  matching wording. This is a cross-range proposal and does not change the
  current range's candidate count or overwrite its older ledger row.
- The other exact-English/Korean variation touching the range is
  `Keep going.` (`44710`, `46798`). Japanese distinguishes plain
  `進もう` from polite `進みましょう`, and Korean follows with `계속 가자`
  versus `계속 가죠`; retain both.
- There are 59 exact-English duplicate groups touching the range, covering
  814 corpus rows. The two groups with different Korean wording have
  language-source distinctions described above; no translation was unified
  solely by English text.
- Four rows contain embedded line breaks: `44510` (4), `44575` (17),
  `44583` (1), and `44656` (6). All four languages have matching break counts
  and paragraph-separator patterns. The 28 embedded Korean separators are
  CRLF and remain unchanged.
- Runtime/control-marker identity and order match after allowing localized
  display text inside wrappers at `44583` and `44593`; `{LINE_LEFT}` remains
  in the same position. No marker or layout change is proposed.
- Of 250 IDs, 199 have indexed asset associations, including 129 of the 179
  newly recorded IDs. Asset links do not establish a specific speaker,
  addressee, branch, or playback order; unsupported attribution and order
  remain unknown.

## Range Result

- The range has 20 current correction-candidate IDs and seven
  evidence-limited holds; `44672` and `44742` each have both a candidate and
  a separate hold, while 225 IDs have no supported finding. The separate
  cross-range proposal concerns `23436`.
- After appending 179 new IDs, the ledger covers 50,111 of 65,135 unique
  `default` IDs (76.93%), leaving 15,024. Sequential coverage reaches
  `44749`; next is `44750`-`44999`. Of reviewed IDs, 40,403 have indexed
  asset links and 9,708 do not; links are not dialogue coverage.
- The updated index and catalogs, all 50,111 ledger fingerprints, all nine
  related index tests, and the line-ending-aware diff check passed on
  November 12. No translation CSV was modified.
