# Sequential `default` Revalidation: IDs `43250`-`43499`

- Date: 2026-11-12.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 59 existing ledger records and added 191 newly reviewed IDs.
- Recorded 19 current correction candidates and three evidence-limited holds;
  228 IDs have no supported finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `43263` | Naturalness | `Centered on an endless swirling black gemstone` is rendered as `검은 보석을 중심에 박아 넣은`, an awkward construction. Consider `끝없이 소용돌이치는 검은 보석을 중심에 박은 이 반지는 마법 재능을 증폭시킨다.` | Medium-high |
| `43268` | Meaning / terminology | `What notices?` refers to the delivered military notices in the `SQ122` context, not a posted announcement. The same source at `41671` has the same Korean wording. Align both to `무슨 통지서야?`; this is a terminology proposal, not a speech-level change. | High |
| `43275` | Meaning / naturalness | A guard asks whether the visitor is friend or foe. Japanese says `味方か敵か`, explicitly “ally or enemy”; `친구인가, 적인가?` can sound like personal friendship. Consider `아군인가, 적인가?` | Medium-high |
| `43317` | Objective format | `Explore the Ancient Vault` is a quest objective rendered `고대 금고(Ancient Vault) 탐험`. Use the established concise action form `고대 금고(Ancient Vault) 탐험하기`. The exact-English duplicate `60675` has the same Korean wording and should be cross-checked before any paired edit. | High |
| `43327` | Naturalness / format | The notice says to collect payment from the `Curate of Keep` after finishing the task. The current `보수는 킵의 관리관에게 받으시오` is awkward, and the role/place label is unpaired. Consider `임무를 완수한 뒤 킵의 관리관(Curate of Keep)에게서 보수를 받으시오.` | Medium-high |
| `43333` | Naturalness | `So that's what I do` repeats the idea of standing by her side, but `그래서 그걸 하고 있어` is an unnatural placeholder-like ending. Consider `그녀 곁을 지키는 것 말고는 해 줄 수 있는 게 없어. 그래서 계속 곁을 지키고 있어.` | High |
| `43340` | Name format | `Galen` is unpaired in an item description. The aligned base item `Galen's Gauntlets` uses `게일런(Galen)`, supporting `게일런(Galen)이 만든 걸작이다.` | High |
| `43364` | Objective format | `Begin the Ritual` is rendered `의식 시작`, unlike the established `-기` objective form. Consider `의식 시작하기`. The exact-English duplicate `44580` currently matches and should be cross-checked before any paired edit. | Medium-high |
| `43379` | Naturalness / register | Retain the prior candidate. The explanation of how Sydanus led the trial participants ends in written-style `이끌었다`; Japanese is conversational. Consider `시다누스(Sydanus)는 입문 시험에 참여한 이들에게 빙의해 각자를 서로 다른 장소로 이끌었지...` without inferring a speaker. | Medium |
| `43391` | Name format | The objective `Meet with Urlia` renders the named target only as `얼리아`. Add the source form: `얼리아(Urlia)를 만나기`. | High |
| `43392` | Terminology / naturalness | Retain the prior candidate. In the painting quest, artistic `paint` is rendered `페인트`, while the asset consistently uses `물감`. Consider `물감은 어떻게 구하지?` | High |
| `43404` | Meaning / terminology | `the Sorrows` is the magical force, not the `House of Sorrows`. Other entries distinguish `비탄의 힘(Sorrows)` from `비탄의 집(House of Sorrows)`; Japanese `嘆きの力` and Chinese `悲灵` support the force reading. Replace `비탄의 집으로 가는 열쇠` with a source-faithful form such as `비탄의 힘(Sorrows)에 이르는 열쇠`. | High |
| `43422` | Term / format | `Font of Ysa` is the named magical spring in Lyceum Grove, consistently called `샘(The Font)` elsewhere. The current `이사(Ysa)의 샘` omits the established English name. Add `(The Font)` to that spring reference without changing the sentence otherwise. | High |
| `43429` | Terminology consistency | Retain the prior candidate. `St. Odwig's Perpetual` is `성 오드윅 영속 수도회`, while the established institution form is `성 오드윅 영구 선교원`. Align the shortened reference with that established name. | Medium-high |
| `43460` | Naturalness | `dismal though they may be` describes the Winter Court as gloomy. `우울한 친척들이긴 하지만` can instead suggest that the cousins are depressed. Consider `우울한 이들이긴 하지만` or `다소 음울하긴 하지만`, preserving the affectionate tone. | Medium-high |
| `43461` | Name format | `Galen` is unpaired in the item description. The aligned base item `Galen's Gauntlets` establishes `게일런(Galen)`; add that pairing without changing the description. | High |
| `43472` | Name format | Retain the prior candidate. `Olaf` is named in the sentence but appears only as `올라프`. Pair it as `올라프(Olaf)` without changing the prediction about the bard. | High |
| `43481` | Objective format | Retain the prior candidate. This quest objective ends in imperative `찾아라`, unlike the established concise `-기` form. Consider changing only the objective ending to `잃어버린 갑옷 조각 찾기`. | High |
| `43485` | Naturalness / meaning | The box is figuratively `rotting` in the armory; Japanese says it is gathering dust. Korean `썩고 있지` reads literally. Consider `그 상자는 지금 아데사(Adessa) 무기고에서 먼지만 뒤집어쓰고 있지.` | High |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `43309` | Referent / name format | English `a Peregrine` is capitalized, but the line contrasts a person dated with someone in a centuries-old book. The fragment does not establish whether Peregrine is a personal name, title, or affiliation. Retain `페레그린` without assigning an unsupported identity or pairing. |
| `43319` | Idiom / voice | `Briny blowfish` appears to be an intentionally odd exclamation. Chinese preserves the literal image, while Japanese diverges. Without scene-level voice evidence, retain `짭짤한 복어라니` rather than replacing the joke with a generic oath. |
| `43359` | Meaning / source conflict | English `I'd better take word?` is awkward and may ask whether the speaker should carry a message; Japanese instead asks whether the person can be trusted, while Chinese supports the message reading. Retain `내가 소식을 전하는 게 낫겠지?` pending context. |

## Rechecked Findings

- All 59 existing ledger fingerprints in the range match the current
  four-language rows. Prior candidates `43268`, `43379`, `43392`, `43429`,
  `43472`, and `43481` remain candidates. The prior `43289` reagent wording
  candidate is cleared because the active Korean already uses the proposed
  `재료`; its append-only ledger record is unchanged.
- Fifty-one exact-English duplicate groups touch the range, covering 490
  corpus rows. Korean matches within every group. The three objective/notice
  groups called out above remain consistent in their current translations;
  no rows were unified based only on English identity.
- Seven rows contain embedded line breaks, totaling 18 breaks in each
  language. All four languages have matching per-row break counts.
- Runtime-variable and markup identities and order match across the four
  languages. Localized display-label payloads differ as expected inside the
  wrappers at `43314` and `43469`; no wrapper or ordering discrepancy was
  found.
- Of 250 IDs, 198 have indexed asset associations, including 139 of the 191
  newly recorded IDs. Asset membership does not establish an individual
  speaker, branch, addressee, or playback order. Unsupported attribution and
  order remain unknown.

## Range Result

- The range has 19 current correction-candidate IDs and three
  evidence-limited holds; the other 228 IDs have no supported finding.
- After appending the 191 new IDs, the ledger covers 49,216 of 65,135 unique
  `default` IDs (75.56%), leaving 15,919. Reviewed IDs with indexed asset
  links total 39,770; 9,446 have no indexed asset link. Sequential coverage
  reaches `43499`; next is `43500`-`43749`.
- Catalog reproducibility, all 49,216 ledger fingerprints, nine related
  index tests, and the line-ending-aware diff check passed. Translation CSVs
  remain unchanged.
