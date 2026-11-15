# Sequential `default` Revalidation: IDs `43500`-`43749`

- Date: 2026-11-12.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 72 existing ledger records and added 178 newly reviewed IDs.
- Recorded 28 current correction-candidate IDs and 11 evidence-limited
  holds; the other 211 IDs have no supported finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `43506` | Speech level / address | Retain the prior candidate. The Korean `안녕하시오 ... 그대와 ... 영광이오` uses marked 하오체, while Japanese addresses the hero in plain, warm speech. Consider `반가워, 영웅. 너와 이야기할 수 있어 영광이야.` This is a row-local proposal, not evidence that all lines in the linked asset share a speaker. | Medium-high |
| `43516` | Meaning / naturalness | Retain the prior candidate. `That is your name, isn't it?` asks whether “Spider Slayer” is the player's name; `별명` changes the joke into an actual nickname. Consider `그게 네 이름 맞지?`, aligned with exact-English duplicate `29366`. | Medium-high |
| `43519` | Speech level / naturalness | Retain the prior candidate. `반갑소, 여행자여!` sounds archaic, unlike Japanese's courteous `ごきげんよう、旅人さん！`. Consider a natural courteous greeting such as `반가워요, 여행자님!`; the asset does not establish the individual speaker. | Medium-high |
| `43520`, `64742` | Meaning / terminology / format | These objective labels are exact English duplicates and currently match in Korean. `Former Contract Holder` is rendered literally as `이전 계약 보유자`, while Japanese says `以前の担当者` and Chinese says `前一个合约持有人`. Consider `이전 계약 담당자 찾기` in both rows; retain the concise objective form. | High |
| `43525` | Name format | `Osnan Togarian` is left as `오스난 토가리안` without the source form. Add `오스난 토가리안(Osnan Togarian)`; do not alter the historical account or infer anything beyond the name. | High |
| `43536`, `63431` | Objective format | Retain the prior candidate. Both `Upgrade Gossamer End` objectives currently use the bare action noun `업그레이드`, unlike the project's concise `-하기` objective form. Consider `고서머 엔드(Gossamer End) 업그레이드하기` in both rows. | High |
| `43538` | Meaning / terminology | English `our House` is rendered as `우리 하우스`, while Japanese `一族` and Chinese `家族` support a family/lineage sense. Consider `우리 가문의 상징`; preserve the statement about what the speaker learned. | Medium-high |
| `43547` | Naturalness / consistency | The same promise-and-gift passage appears at `10708`, `41402`, and `43547` with identical Japanese wording and materially identical English/Chinese. Korean alternates between `잘 사용하도록` (`10708`) and `잘 활용해라` (`41402`, `43547`). Align the phrase across the three IDs after checking the punctuation variants; `잘 활용해라` is a natural plain imperative. | Medium-high |
| `43555` | Title / terminology consistency | `The Humbled` is the name of Straton's production, but Korean title renderings vary in related rows, including `겸손해진 자들`, `굴복한 자들`, `굴복한 자`, and the current `겸손한 자들`. Choose one title after reviewing the complete play-title family, then align this mention; do not choose solely by frequency. | Medium |
| `43571` | Speech level | Korean `고맙네 ... 해야 하네` uses marked 하게체, while Japanese and Chinese use direct conversational speech. Consider a consistent plain conversational register, e.g. `고마워, 친구. 나도 직접 찾아보고 싶지만 자리를 비워야 해. 그래도 계속 경계를 서야 해.` Asset membership does not establish a shared speaker across its keys. | Medium-high |
| `43572` | Naturalness / speech level | Retain the prior candidate. `정의를 찾는 일을 돕겠소` is both a calque-like rendering of “help you find justice” and marked 하오체, unlike Japanese's conversational offer. Consider `정의를 바로 세우도록 돕겠어.` | High |
| `43574` | Name format | `Ruskin DeWytte` is rendered `러스킨 드와이트` without the source form. Add `러스킨 드와이트(Ruskin DeWytte)` without changing the standalone name entry. | High |
| `43585` | Meaning / terminology | `the Sorrows` refers to the magical force, not the House of Sorrows. Korean `비탄의 열쇠` loses that distinction; Japanese says `嘆きの力` and Chinese refers to the force. Consider `비탄의 힘(Sorrows)에 이르는 열쇠`. Cross-check this with `43693` and the earlier force uses, including `3364` and `3831`; keep the House of Sorrows distinct. | High |
| `43591` | Name format | The sentence names the ancient `Ansilla` stronghold as well as `Seawatch`, but only `Seawatch` is paired. Add `안실라(Ansilla)` while retaining `시워치(Seawatch)` and the existing meaning. | High |
| `43606` | Speech level / naturalness | The utterance shifts from `어서 오게` to `찾아왔어`, mixing 하게체 and plain casual speech. Japanese remains plain. Consider making the full line consistently casual, e.g. `어서 와, 친구! 제대로 찾아왔어. 정말이야! 가장 근사한 모험이 펼쳐지는 곳이지. 바로... 이... 병... 안에서 말이야.` | High |
| `43609` | Name format | Retain the prior candidate. `Horace` appears only as `호레이스`; pair it as `호레이스(Horace)` without inferring who asks the question. | High |
| `43629` | Objective format | `Investigate Togh Farm` is rendered as the bare `토그 농장 조사`, unlike the established action-form objectives. Consider `토그 농장(Togh Farm) 조사하기`. | High |
| `43651` | Naturalness | `그만해. 제발, 그저... 제발.` is awkward at `그저`, which does not naturally convey the interrupted “Just ‒ please.” Consider `그만해. 제발, 부탁이야.` while retaining the repeated plea. | Medium-high |
| `43661` | Speech level / naturalness | The welcome and directions use marked 하게체 (`어서 오게`, `찾아가 보게`), while Japanese is warm, conversational, and feminine-soft. Consider a natural, consistent register such as `어서 와, 젊은이. 발라드의 집(House of Ballads) 성소에 있는 사라머(Saramer)를 찾아가 봐. 가르쳐 줄 게 많을 거야.` | Medium-high |
| `43671` | Meaning / title consistency | `all they see in this city` is awkwardly rendered as `이 도시에서 눈에 들어오는 모든 이`. Also, the established title is usually `수석 수호관` (`22900`, `22929`), while this row says `최고 수호관`. Consider a natural reference to protecting everyone in the city and align the title, including `Chief Protector`, with the chosen form. | Medium-high |
| `43675` | Meaning / pronoun | `그를` refers to the Fateless One, whose player character gender is not established by this context; Japanese and Chinese omit the pronoun. Korean can preserve the meaning without gendered inference, e.g. `진실을 일부 숨긴 건 맞지만, 운명 없는 자를 배신한 건 아니야.` | Medium |
| `43684` | Full title format | Retain the prior candidate. Across 26 source occurrences, Korean consistently pairs only `Argine`, omitting `Queen of Staves`. Pair the complete title consistently, e.g. `아르진, 지팡이의 여왕(Argine, Queen of Staves)`. Do not treat the consistent current wording as complete English-name pairing. | High |
| `43688` | Name format | Retain the prior candidate. `Julius Mavern` is rendered `줄리어스 메이번` without its English form. Add `줄리어스 메이번(Julius Mavern)`; related rows `47211` and `63161` also need the same scoped review. | High |
| `43693` | Meaning / terminology | `the Sorrows` is the magical force, but Korean says only `비탄`. Use the established force name `비탄의 힘(Sorrows)` before `알파르(Alfar) 군대에 풀어놓다`; do not conflate it with the House of Sorrows. | High |
| `43699` | Speech level / naturalness | `이리 오게 ... 있네` uses marked 하게체, while Japanese gives a direct plain command. Consider a consistent conversational summons such as `이리 와, 중요한 일이 있어!` | Medium-high |
| `43734` | Terminology / name format | The repeated `Gnomish Trireme` label (`41266`, `43734`, `55925`) is `노움 삼단 갤리선`, while the ship log at `47542` uses `노움 삼단노선`. Align the ship term and pair the full label, e.g. `노움 삼단노선(Gnomish Trireme)`, across its occurrences. | High |
| `43735` | Terminology consistency | Retain the prior candidate. In the same Gravehal construction context, `Gallery` varies among `전시관`, `미술 전시실`, `화랑`, and `갤러리`; the asset title `Gravehal Gallery` is `그레이브홀 미술관` and `Art Gallery` is `미술관`. Consider `2층 미술관 공사`. | High |
| `43737` | Speech level / naturalness | The Korean uses marked 하게체 (`좋아 ... 구나 ... 알겠지`) where Japanese uses plain direct speech, and `우리가 있는 곳은 알고 있겠지` is stiff. Consider a consistent plain form such as `좋아. 이 일을 마칠 사람은 너뿐이야, 필멸자여. 마음이 바뀌면 찾아와.` | Medium-high |

## Cleared Prior Candidates

| ID | Dimension | Current disposition |
| ---: | --- | --- |
| `43548` | Meaning | The current Korean already reads `감히 깊은 잠(Deep Slumber)을 방해하려는가?`, preserving the named Slumber reference. |
| `43632` | Meaning / consistency / format | The current Korean already uses `칼로르 경(Lord Callor)`, the proposed spelling and English pairing. |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `43532` | Role / terminology | `Corporate Controller` is untranslated in Japanese; Chinese says `企业内控官`, while Korean has `기업 관리 회계사`. The exact accounting/management title is not established; retain pending clearer role context. |
| `43541` | Place name / format | Capitalized `the Quarters` may be a named district, but Japanese describes a relief area and Chinese refers to its residents without confirming a proper-name reading. Retain `쿼터` without assigning a definitive English pairing until the location sense is confirmed. |
| `43557` | Proper-name status | Retain the prior hold. Capitalized `Fae Hollows of Dalentarth` may name a category of locations rather than one unique place; do not force a singular place-name reading. |
| `43563` | Speech level / honorifics | Retain the prior hold. Korean `무엇이 필요하십니까?` is deferential while Japanese and Chinese are neutral, but asset-level evidence does not identify the speaker or addressee. |
| `43586` | Speech level | Retain the prior hold. Korean uses `-시오/-소`, while Japanese is plain; the linked asset does not establish this line's speaker or scene relationship. |
| `43614` | Meaning / text type | `Opening a Vein` may be a quest title or an action label. Japanese means searching for a vein, Chinese says opening a vein, and Korean `광맥 개척` is a plausible title phrase; do not impose the objective `-하기` form without confirming text type. |
| `43617` | Speech level / voice | Korean uses `보시오` twice, while Japanese is plain. The line is also a rhetorically elevated address to a group; without a speaker/scene mapping, it is unclear whether the register is erroneous or intentional. |
| `43621` | Referent / name format | `Zambia` is a standalone capitalized string. The row alone does not establish whether it is a person, place, or another label; retain `잠비아` without adding an unsupported identification. |
| `43738` | Name / role | `Augur` may be the leader's name or a role/title, while the next sentence separately calls him a self-proclaimed prophet. Retain the current rendering pending clearer character context. |
| `43739` | Address / meaning | `dove` is an affectionate address in English, Japanese omits it, and Chinese appears to render it literally as a peace messenger. Korean `친구` is plausible but loses the image; retain pending scene and character-voice evidence. |
| `43743` | Meaning / terminology | `The Forum` could be an institution or a public space: Japanese says `評議院`, Chinese says `广场`, and the standalone row provides no resolving context. Retain `포럼` pending corroboration. |

## Rechecked Findings

- All 72 existing ledger fingerprints in the range match the current
  four-language rows. Existing candidates `43506`, `43516`, `43519`, `43536`,
  `43547`, `43572`, `43609`, `43684`, `43688`, and `43735` remain current.
  Prior candidates `43548` and `43632` are cleared because the active Korean
  already contains their proposed wording (`깊은 잠(Deep Slumber)` and
  `칼로르 경(Lord Callor)`, respectively). Five prior `not-issue` rows
  (`43571`, `43629`, `43651`, `43699`, `43737`) are reopened as current
  candidates; `43614` and `43739` are reopened as evidence-limited holds.
  Existing holds `43557`, `43563`, and `43586` remain unresolved. Existing
  ledger rows stay byte- and order-preserved; this batch report records the
  latest dispositions for reopened rows.
- Forty-eight exact-English duplicate groups touch the range, covering 52
  range rows and 1,066 corpus rows. Korean matches within every exact group.
  The phrase-family finding at `43547` is separately identified because
  punctuation differences keep `10708`, `41402`, and `43547` out of one exact
  English group.
- Two rows contain embedded line breaks (`43626`, `43689`), with eight breaks
  in each language. Per-row line-break counts match across all four languages.
- Runtime-variable, wrapper, and layout-marker identities were checked.
  Korean preserves the English marker order at `43611`, `43657`, `43658`,
  `43691`, and `43727`. Japanese reorders the parameters at `43657`; Korean
  follows English and Chinese. Localized display payloads differ inside
  wrappers as expected.
- Of 250 IDs, 197 have indexed asset associations, including 125 of the 178
  newly recorded IDs. Asset links do not establish an individual speaker,
  branch, addressee, or playback order; unsupported attribution and order
  remain unknown.

## Range Result

- The range has 28 current correction-candidate IDs and 11 evidence-limited
  holds; the other 211 IDs have no supported finding.
- After appending 178 new IDs, the ledger covers 49,394 of 65,135 unique
  `default` IDs (75.83%), leaving 15,741. Reviewed IDs with indexed asset
  links total 39,895; 9,499 have no indexed asset link. Sequential coverage
  reaches `43749`; next is `43750`-`43999`.
- Catalog reproducibility, all 49,394 ledger fingerprints, nine related
  index tests, and the line-ending-aware diff check passed. Translation CSVs
  remain unchanged.
