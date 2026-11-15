# Sequential `default` Revalidation: IDs `43750`-`43999`

- Date: 2026-11-12.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 70 existing ledger records and added 180 newly reviewed IDs.
- Recorded 19 current correction-candidate IDs and five evidence-limited
  holds; 226 IDs have no supported finding after the subsequent duplicate
  source recheck below.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `43760` | Name format | `Lyra` is named in the question but appears only as `라이라`. Pair it as `라이라(Lyra)` without changing the question. | High |
| `43768` | Speech level / naturalness | `마음이 바뀌면 여기서 기다리고 있겠소` uses marked 하오체 and adds a waiting claim. Japanese says to come here if one's mind changes. Consider `마음이 바뀌면 여기로 와.` | Medium-high |
| `43773` | Name format | The standalone name `Sibun` is rendered only as `시분`; the related item `Heart of Sibun` confirms the proper-name reading. Pair it as `시분(Sibun)`. | High |
| `43791` | Speech level / title format | `어서 오게, 사반트여` uses marked 하게체 and leaves the formal title `Savant` unpaired. Consider a natural greeting such as `반가워, 사반트(Savant). 무엇을 도와줄까?` | Medium-high |
| `43795` | Title format | `Defender of Valor` is a named title in the item description but appears only as `용맹의 수호자`. Pair the title as `용맹의 수호자(Defender of Valor)`; retain the sentence's meaning. | High |
| `43799` | Speech level / address | `잘 지내게, 낯선 이여` is marked, old-fashioned 하게체, unlike Japanese's conversational farewell. Consider `잘 지내, 낯선 이.` | Medium-high |
| `43811` | Speech level | The welcome uses marked 하오체 (`환영하오`, `되오`), while Japanese uses direct, unmarked speech. Consider a natural, consistent register without archaic endings. | Medium-high |
| `43838` | Meaning / tense | `If you can convince Hillared` is a future possibility, but `설득해 ... 받았다면` changes it to a completed past condition. Consider `힐러레드(Hillared)를 설득해 열쇠를 받을 수 있다면...` | High |
| `43849` | Meaning / naturalness | `휘말렸군` adds a negative sense of being entangled, absent from English and Japanese. Consider `참 흥미로운 상황을 겪고 있군.` | Medium-high |
| `43873` | Speech level | `안녕하시오` is marked 하오체; Japanese `どうも` and Chinese `你好啊` are casual greetings. Consider `안녕.` | High |
| `43875` | Title format | Hallam's formal role `Storyteller` is rendered only as `이야기꾼`. Pair it as `이야기꾼(Storyteller)` while retaining the statement about his knowledge of the ballads. | Medium-high |
| `43894` | Address / speech level | `나그네여` is archaic and sits awkwardly beside deferential `감사합니다`; Japanese and Chinese use a straightforward courteous thank-you. Consider a natural form such as `정말 감사합니다, 나그네님.` | Medium |
| `43919` | Terminology / naturalness | The rarity label `Infrequent` is rendered `비흔한`, which is unnatural and inconsistent with `비일반` at ID `14967`. Align the label with the established form while preserving `{*4...}` and `{*3...}` wrapper order. | High |
| `43926` | Terminology / name format | Here `the Sorrows` is the magical force previously rendered `비탄의 힘(Sorrows)`, but the row says only `비탄`. Use the established force name in `비탄의 힘(Sorrows)에 이르는 법`. | High |
| `43941` | Speech level / naturalness | `고맙네 ... 받게` uses marked 하게체, whereas Japanese is conversational. Consider `도와줘서 고마워, 부름받은 자. 수고비로 이 돈을 받아.` | Medium-high |
| `43954` | Speech level | `도움이 필요하시오?` uses marked 하오체; Japanese asks directly and plainly. Consider `젊은이, 전승(The Telling)에 도움이 필요해?` | Medium-high |
| `43966` | Meaning / naturalness | English `strange` and Japanese `謎の` describe an unusual or mysterious Almain; `수상한` can instead imply suspicious conduct. Consider `정체를 알 수 없는 알마인(Almain)`. | Medium |
| `43974` | Naturalness | `논리를 가져와` is a literal calque of “Bring your logic” and sounds unnatural in Korean. Japanese frames it as presenting an argument and answering in kind. Consider `논리를 펼쳐 봐. 내 논리로 맞서 줄 테니!` | High |
| `43984` | Creature-name format | The creature type `Fire Sprites` appears only as `불의 스프라이트`. Pair the type as `불의 스프라이트(Fire Sprite)` without changing the warning. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `43757` | Referent | `the pit` is variously understood as an arena, waiting area, or another restricted location across the language references. Retain `투기장` pending scene-level confirmation. |
| `43798` | Meaning | `business` may mean a commercial transaction or an ongoing assignment; Japanese supports a transaction while Chinese supports task progress. Retain `거래` pending context. |
| `43827` | Name / referent | `That Bloody` is capitalized, but the row does not establish whether Bloody is a creature, person, or descriptive label. Retain `블러디` without assigning an identity. |
| `43957` | Referent | `Wulf ... is already gone` can mean dead or departed. Japanese is similarly non-specific, while Chinese explicitly says he is dead. Retain `이미 떠났어` rather than infer death. |
| `43991` | Meaning / verse | `our seer's seen her last` is ambiguous in this rhyming line: the seer may have died or seen her final vision. The Japanese and Chinese differ in interpretation. Retain the current line pending context. |

## Rechecked Findings

- Follow-up on November 12 compared all eight rows in the exact-English
  `I'll be back tomorrow.` group (`21693`, `36866`, `39132`, `43891`,
  `44058`, `54310`, `56999`, `57344`). Japanese has two source forms:
  `明日戻ってきます` at `21693`, `36866`, `44058`, and `56999`, and
  `明日戻ってくる` at `39132`, `43891`, `54310`, and `57344`. Korean's
  polite/casual split matches those Japanese variants exactly; English and
  Chinese are identical across the group. The earlier claim that all four
  source languages matched was incorrect. Clear the former `43891` hold and
  retain the ID-specific Korean forms; no speaker mapping is inferred from
  the two linked assets.
- All 70 existing ledger fingerprints in this range match the current
  four-language rows. Existing candidates `43760`, `43768`, and `43894`
  remain candidates. The previous hold at `43846` is cleared: the Korean
  sentence is natural, and the references do not establish a register error.
  The previous candidate at `43918` is cleared: `성전사는 두고 보라지.
  맹세하건대` conveys the source's defiant “The Templar will see. I swear
  it.” Previously unflagged `43798` is reopened as a meaning hold, and
  `43799` and `43838` are reopened as candidates after the four-language
  comparison. Existing ledger rows remain byte- and order-preserved; these
  latest dispositions are recorded here rather than overwriting prior rows.
- The source typo `Aster Inheritence` at `43887` is corroborated as
  `Aster Inheritance` by the same item's other entries (`51990`, `61845`);
  the current Korean pairing follows that supported title and is retained.
- There are 249 exact-English duplicate groups touching the range, covering
  250 range rows and 1,222 corpus rows. Korean differs within the eight-row
  group noted above, in agreement with the Japanese source variants; no
  translation was unified solely because its English source repeats.
- Two rows contain embedded line breaks (`43871`, `43931`), totaling nine
  breaks. All four languages preserve the same paragraph-break counts and
  placement. The Korean embedded separators are CRLF; they were left
  byte-for-byte unchanged.
- Runtime/control-marker structure and order match. Localized display
  payloads differ inside wrappers at `43850` and `43919` as expected; the
  rarity wording at `43919` is recorded separately above.
- Of 250 IDs, 198 have indexed asset associations, including 128 of the 180
  newly recorded IDs. Asset links do not establish an individual speaker,
  branch, addressee, or playback order; unsupported attribution and order
  remain unknown.

## Range Result

- The range has 19 current correction-candidate IDs and five
  evidence-limited holds; the other 226 IDs have no supported finding.
- After appending 180 new IDs, the ledger covers 49,574 of 65,135 unique
  `default` IDs (76.11%), leaving 15,561. Sequential coverage reaches
  `43999`; next is `44000`-`44249`. Reviewed IDs with indexed asset links
  total 40,022; 9,552 have no indexed asset link.
- Catalog reproducibility, all 49,574 ledger fingerprints, nine related
  index tests, and the line-ending-aware diff check passed. Translation
  CSVs remain unchanged.
