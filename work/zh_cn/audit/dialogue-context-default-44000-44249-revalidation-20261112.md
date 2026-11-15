# Sequential `default` Revalidation: IDs `44000`-`44249`

- Date: 2026-11-12.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 66 existing ledger records and identified 184 new IDs to append.
- Recorded 28 current correction-candidate IDs and two evidence-limited
  holds; 220 IDs have no supported finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Previously recorded findings are restated where needed; their older
ledger rows remain unchanged.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `44002` | Name format | `Tormin` appears only as `토르민` here, while other active references pair the name as `토르민(Tormin)`. Add the English form without changing the sentence. | High |
| `44005` | Speech level | The line shifts from `보이는군` to `달했어`. The Japanese keeps the same conversational register across both clauses. Consider `놀라울 만큼 건강해 보이는군. 신체 능력도 절정에 달했군.` | High |
| `44006` | Name format | `Adept Ignas` appears as `숙련자 이그나스` without the English form, unlike other references in the same story. Pair it as `숙련자 이그나스(Adept Ignas)`. | Medium-high |
| `44008` | Name format | The standalone personal name `Rota Jansen` is rendered only as `로타 얀센`; comparable standalone names use the source spelling. Pair it as `로타 얀센(Rota Jansen)`. | High |
| `44009` | Name format | `Sergeant Odi` is rendered only as `오디 중사`. Pair the name and rank as `오디 중사(Sergeant Odi)`. | High |
| `44014` | Duplicate-text consistency / format | This is an exact English duplicate of `27284`, where the same title is already `위대한 장군(The Great General)`. Add the missing English title here; do not change the translation otherwise. | High |
| `44024` | Meaning / terminology | The item is the established `St. Eadric's Pall`, not a coffin cover. The existing quest review supports `성 이드릭(St. Eadric)의 수의` in place of `성 이드릭(St. Eadric)의 관을 덮은 천`, retaining the separate `St. Eadric's Mission` place name. | High |
| `44033` | Meaning | `Zungars` and `Darkvari` are described as enemies who are not kin; rendering them as `중가르 가문` and `다크바리 가문` adds an unsupported family-house reading. Consider `중가르(Zungars)와 다크바리(Darkvari)는 혈연으로 맺어진 사이가 아니야.` The remainder about enemies and shared blood can stay. | Medium-high |
| `44036` | Speech level / naturalness | The sentence moves from marked `가져가도 좋네` to casual `동행할 거야`. Japanese uses direct plain forms. Consider aligning the clauses in one conversational register, e.g. `감사의 표시로 내 개인 보물 중 하나를 가져가도 돼. 물론 울릭(Urlik)도 함께 갈 거야. 가는 길에 그의 창이 도움이 될지도 모르지.` | Medium-high |
| `44063` | Name format | The standalone name `Maxen` is rendered only as `맥센`, while other references pair it as `맥센(Maxen)`. Add the English form. | High |
| `44073` | Speech level | `보관하겠소` / `안전할 거요` uses marked 하오체, while Japanese is plain and matter-of-fact. Consider `기록은 내가 가져가 서고의 보물들과 함께 보관할게. 그곳이라면 안전할 거야.` | Medium-high |
| `44083` | Name format | The objective `Go to Damalroc` omits the English place name, although the same name is paired elsewhere in the active localization. Consider `다말록(Damalroc)으로 가기`. | High |
| `44085` | Terminology / objective format | The M0_SQ06 family document is consistently identified by Japanese `勅許状` and the quest review; Korean varies among `특허장`, `허가장`, and related forms. Prefer `라토퍼(Ratofer)의 칙허장 판매하기`, following the established `-하기` objective form. | High |
| `44097` | Name format | The standalone personal name `Tine Delfric` is rendered only as `타인 델프릭`, while the active quest references pair it as `타인 델프릭(Tine Delfric)`. Add the English form. | High |
| `44118` | Speech level | `무기를 가까이 두게` uses marked 하게체; Japanese is a direct plain command. Consider `무기를 항상 곁에 둬.` | Medium-high |
| `44143` | Terminology / objective format | The Sandstone Villa review found the same upgrade action alternating among `개량`, `업그레이드`, and `개조`; related journal entries use `개량`. Consider `샌드스톤 저택(Sandstone Villa) 추가 개량하기`. | High |
| `44147` | Name format | The standalone name `Shalarein Forstid` is rendered only as `샬라레인 포스티드`. Pair it as `샬라레인 포스티드(Shalarein Forstid)`. | High |
| `44149` | Meaning / relationship | English and both Japanese and Chinese say `my brother, Jakin` without establishing his age. Korean `내 동생` asserts that he is younger. Consider `내 형제 제이킨(Jakin)을 알지도 모르겠군`, retaining his arena role. | High |
| `44155` | Name format | `a Payne` refers to a named family, but Korean `페인 가문` lacks the source form. Consider `페인 가문(Payne)` without changing the grievance. | Medium-high |
| `44164` | Title format | The source is the named title `The Forging of the Mystic Hammer`; the Korean pairs only the item's name and omits the complete title form. Consider `신비한 망치의 제련(The Forging of the Mystic Hammer)` after confirming the title's established Korean wording. | Medium |
| `44167` | Terminology / format | `Sworn to War` refers to joining the Warsworn. Korean `워스원` lacks its English pairing; consider `워스원(Warsworn)이 되었어.` | Medium-high |
| `44168` | Name format | The standalone name `Alder Malloi` is rendered only as `앨더 말로이`, while the active quest references pair it as `앨더 말로이(Alder Malloi)`. Add the English form. | High |
| `44189` | Name format | `the House` refers to the House of Sorrows in this account. Pair the established name as `비탄의 집(House of Sorrows)` rather than leaving only `비탄의 집`. | High |
| `44203` | Name format | The letter's sender `Diodores` is rendered only as `디오도레스`; another active reference already uses `디오도레스(Diodores)`. Add the English form, retaining the recipient's generic `에틴(Ettin)` type. | High |
| `44214` | Name format | `Carloman` is a named brother but appears only as `카를로만`. Other active references pair the name as `카를로만(Carloman)`. Add the English form. | High |
| `44215` | Speech level | `받으시오` / `것이오` uses marked 하오체. Japanese addresses the player in plain speech; Chinese is courteous but does not establish a need for archaic Korean. Consider a natural consistent register such as `이걸 받아. 많지는 않지만, 감사의 뜻을 담아 우리가 줄 수 있는 거야.` | Medium |
| `44217` | Name format | The named location `Western Sewers Henge` is translated as `서쪽 하수도의 헨지` without its English form. Consider `서쪽 하수도의 헨지(Western Sewers Henge)`. | Medium-high |
| `44247` | Meaning / naturalness | `sequester himself from us` means to remain secluded, not simply hide. Consider `아노카토스(Anokatos)는 언제까지 우리를 피해 은둔할 작정이지? 우리에겐 그가 필요해.` | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `44223` | Meaning | English `You made it` can mean either arrival or success; Japanese `間に合った` suggests arriving in time, while Chinese `你做到了` supports accomplishment. Keep `해냈군` provisional until the scene resolves the intended sense. |
| `44238` | Duplicate consistency / context | English and Chinese match `27910`, but Japanese differs: `一体何の話だ？` here versus `何の用だ？` at `27910`. The Korean questions follow that distinction (`대체 무슨 얘기야?` / `무슨 용건이지?`), so retain both; the earlier context hold is cleared. |

## Rechecked Findings and Structure

- All 66 existing ledger fingerprints in the range match the current four
  language rows. Existing candidates `44005`, `44006`, `44024`, `44085`,
  `44143`, and `44149` remain supported. Their prior ledger rows are not
  overwritten; this report records the current disposition.
- Prior `not-issue` dispositions for `44033`, `44036`, `44063`, `44168`,
  `44215`, and `44247` are reopened as current candidates after this
  four-language comparison. Their original ledger rows remain unchanged.
- The former `43891` / `44058` duplicate-register hold is cleared. English
  and Chinese match across the eight-row group, while Japanese has two
  source variants and Korean follows the same polite/casual split. The
  earlier claim that all four languages had identical source text was
  incorrect; the prior report now records this correction. Asset links still
  do not prove a specific speaker.
- The earlier tentative `44110` Thresh pairing concern is cleared: the
  current row already says `스레시(Thresh)`.
- The current `44133` UI label `장검` matches the established `base` weapon
  term; its runtime display wrapper remains intact, so no terminology change
  is proposed.
- The earlier `44238` duplicate-text hold is cleared after checking the
  Japanese rows directly: the wording differs from `27910`, and Korean follows
  the source distinction. The older ledger disposition remains as historical
  evidence; this report records the current re-review decision.
- Exact-English duplicate analysis found 60 groups touching the range,
  covering 62 range rows and 1,207 corpus rows. Korean differs in three
  groups: `44058` (eight rows; its register split matches Japanese),
  `44014` / `27284` (missing English title pairing at `44014`), and `44238` /
  `27910` (Japanese source wording differs, and Korean follows that
  distinction). No translation was unified
  solely because English repeats.
- Five rows contain embedded line breaks: `44020` (1), `44040` (2), `44077`
  (7), `44095` (4), and `44213` (1). Per-row break counts match across all
  four languages. The Korean embedded separators are CRLF and were not
  changed.
- Runtime/display wrappers at `44019`, `44133`, and `44199` were checked;
  token identity and order are retained. Asset associations do not establish
  individual speakers, addressees, or playback order; unsupported attribution
  and order remain unknown.
- Of 250 IDs, 189 have indexed asset associations and 61 do not. Of 184 new
  ledger IDs, 123 have asset associations. No asset link is treated as proof
  of a specific speaker or line order.

## Range Result

- The range has 28 current correction-candidate IDs and one current
  evidence-limited hold; 221 IDs have no supported finding. The ledger's
  older `44238` hold remains unchanged as a historical record.
- After appending 184 new IDs, the ledger covers 49,758 of 65,135 unique
  `default` IDs (76.39%), leaving 15,377. Sequential coverage reaches
  `44249`; next is `44250`-`44499`. Of the reviewed IDs, 40,145 have indexed
  asset links and 9,613 do not; links are not dialogue coverage.
- All 49,758 ledger fingerprints and generated catalogs validate; all nine
  related index tests and the line-ending-aware diff check pass. No
  translation CSV was modified in this batch.
