# Sequential `default` Revalidation: IDs `41000`-`41249`

- Date: 2026-11-12.
- Compared all 250 active rows across English, Japanese, Chinese, and Korean.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 59 existing ledger records and added 191 newly reviewed IDs.
- Recorded 27 overall correction candidates and six evidence-limited holds.
  `41178` has both a naturalness candidate and a separate meaning hold; 217
  IDs have no supported finding.
- All 250 IDs have at least one indexed asset link. Asset membership does not
  establish a key's speaker, branch, addressee, or playback order.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `41016` | Name format | `Sprite Soldier` is a named enemy type, but Korean has no English pairing. Pair the complete type, e.g. `스프라이트 병사(Sprite Soldier)`. | Medium-high |
| `41021` | Meaning | English `wicked and undeserving` does not say that mortals deserve abandonment. Korean `버림받아 마땅해` adds that judgment. Prefer a broad rendering such as `필멸자는 사악하고 아무것도 받을 자격이 없어.` | High |
| `41040` | Title format | The standalone title `As Winter Looms` lacks English pairing. Pair the title, e.g. `겨울이 다가올 때(As Winter Looms)`. | Medium-high |
| `41051` | Full-name format | The source calls the character `Sister Ceanna`; Korean places only `Ceanna` in parentheses after the translated title. Pair the complete titled name as `세안나 수녀(Sister Ceanna)`. | High |
| `41059` | Name format | `Waterhall` is a standalone place name and is rendered `워터홀` without English. Pair it as `워터홀(Waterhall)`. | High |
| `41063` | Place-name format | The named location is `Rathir Quays`, while Korean pairs only Rathir and leaves `Quays` outside the name. Prefer `라시르 부두(Rathir Quays)`; retain the paired faction and person names. | High |
| `41073` | Meaning / naturalness | `young races` means the younger/younger-established peoples, not children. `어린 종족` suggests age. Prefer `젊은 종족` and render `a haven` naturally as `피난처` or `안식처`. | Medium-high |
| `41122` | Format | The paired label has an extra space before the parenthesis: `빙결 점멸 2 (Ice Blink 2)`. Match the project's adjacent pairing form, `빙결 점멸 2(Ice Blink 2)`. | High |
| `41132` | Name format | The merchant names Brad and Cergren are unpaired. Pair both names while retaining the source's attribution and location, e.g. `티린의 안식처(Tirin's Rest)의 상인 브래드(Brad)와 세르그렌(Cergren)이 체결한 무역 협정서.` | High |
| `41134` | Meaning / naturalness | English `Now. Be on your way.` and Japanese `さあ。行ってちょうだい` are a send-off. `지금 당장. 어서 가.` is more forceful and fragmentary. Prefer `자, 이제 가 봐.` Keep the informal level; do not infer a speaker. | Medium-high |
| `41137` | Name format | The note is explicitly `Maun's`; Korean omits English pairing. Pair the name as `마운(Maun)의 메모`. | High |
| `41147` | Place-name format | `Snowmelt pass` is a named pass in the account of Bayala Tirin. Pair the complete place name, e.g. `눈녹임 고개(Snowmelt Pass)`. | Medium-high |
| `41150` | Full-name format | The source says `Sister Ceanna`, but Korean pairs only the personal name. Pair the complete titled name as `세안나 수녀(Sister Ceanna)`. | High |
| `41153` | Naturalness | `disgraced soldier` is expressed as `불명예를 안은 병사`, an awkward collocation. Prefer `불명예를 입은 병사`; the following pestering clause is otherwise supported. | Medium-high |
| `41169` | Full-name format | The proposed sobriquets `Abner the Visionary`, `Malick the Nefarious`, and `Lord Zaltenus` lack English pairing. Pair each complete name/title without changing the speaker's joking tone. | High |
| `41178` | Naturalness / terminology | `페이(Fae) 피콘(Ficon)에 따르면` is awkward Korean, and the same quest's established plant term is `하트바인`. Prefer `피콘(Ficon)이라는 페이(Fae)에 따르면 ... 고르구아스(Gorguath) 안에 새로 자라난 하트바인`. Retain the separate hollow/cave meaning hold below. | High |
| `41180` | Full-name format | The source title is `Priestess Jacinda`; Korean pairs only Jacinda. Pair the complete titled name as `여사제 자신다(Priestess Jacinda)`. | High |
| `41184` | Meaning / terminology | English and Japanese identify Mercantile as a skill. Korean omits `skill`, leaving the unit of `1` unclear. Prefer `상술(Mercantile) 기술이 일시적으로 1 증가합니다.` | High |
| `41188` | Place-name format | `Adessa Laboratories` is a named destination but appears as `아데사 연구소` without English. Pair the full place name as `아데사 연구소(Adessa Laboratories)`. | High |
| `41193` | Meaning | Korean adds `탐색자(Seeker)` although English says only `With this Destiny`; this changes which Destiny is being described. Remove the unsupported Seeker reference and retain the “Jack of All Trades” sense, e.g. `이 운명을 택하면 ... 만능가(Jack of All Trades)가 됩니다.` | High |
| `41195` | Terminology / name format | The current `콜로세` conflicts with the established `콜로사이(Kollossae)` spelling and omits English pairing. Use the established paired race name. | High |
| `41199` | Name format | `Ram` is a character's name, not the common noun “ram”; the Korean `램` lacks English pairing. Use `램(Ram)`. | High |
| `41217` | Objective format | `Kill the Ice Troll` is already paired but ends with `처치`, unlike the established concise objective form `처치하기` (e.g. `55949`). Prefer `얼음 트롤(Ice Troll) 처치하기`. | High |
| `41219` | Full-name format | The named figure `Hoolgan the Hungry` is rendered `굶주린 훌간` without English. Pair the full name as `굶주린 훌간(Hoolgan the Hungry)`. | High |
| `41220` | Meaning / format | Japanese `普通の` and Chinese `一般的` support “ordinary/main Evenroot,” not “original Evenroot.” Replace `원래 이븐루트` with `일반 이븐루트(Evenroot)`; retain `암포라(Amphora)` and the rest of the sentence. | High |
| `41221` | Full-name format | The source names `Templar Jorielle`, but Korean pairs only `Jorielle`. Pair the complete titled name as `템플 기사 조리엘(Templar Jorielle)`. | High |
| `41226` | Meaning / naturalness | `Honor his memory` means to commemorate Ost, not his abstract honor. `그의 명예를 기려주게` is awkward and shifts the object. Prefer `그를 기려 주게, 서약방패병(Pledgeshield)여.` | High |
| `41235` | Name format | The standalone character name `Gabrielle` is not paired. Add `가브리엘(Gabrielle)`; retain the following description of her and the Erathi. | High |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `41010` | Speech level / speaker | Japanese uses plain feminine speech, while Korean is polite. The linked asset does not map this key to a speaker or interaction stage. Retain the prior hold; do not normalize the ending from asset membership alone. |
| `41012` | Meaning / context | `I insist` may be an insistent demand or a request to accept an offered item. Japanese `そこを何とか` and Chinese `请务必收下` point in different contextual directions. Keep `그러셔야 합니다` provisional until the surrounding exchange is known. |
| `41076` | Place name / meaning | `Cliffbreak Fasting` is rendered as a named `지하 통로`, while Japanese and Chinese describe a passage more generically. The key does not establish whether `Fasting` is a proper location name or a source/text issue. Do not invent a normalized name. |
| `41095` | Format / source fragment | The English, Japanese, Chinese, and Korean rows contain only the incomplete marker `{*1`. There is no recoverable payload to translate; preserve the fragment pending source clarification. |
| `41151` | Speech level / addressee | Korean is polite while Japanese is plain; Chinese is also polite. The linked asset does not identify this line's speaker or addressee. Retain the register provisionally. |
| `41178` | Meaning / location | `hollow of Gorguath` may mean the cave itself or the broader hollow/area. Japanese uses cave wording, while Chinese varies. Retain the existing meaning hold separately from the naturalness/plant-term candidate above. |

## Rechecked Findings

- Fifty-nine existing ledger fingerprints match the current four-language
  rows. Existing candidates at `41134`, `41178`, `41217`, and `41220` were
  rechecked and retained; `41220` now explicitly uses `일반` rather than
  `원래` in the proposed direction. Existing speech-level hold `41010` remains.
- Fifty-nine exact-English duplicate groups (1,182 corpus rows) touch this
  range. Korean text matches within every group; no unsupported cross-ID
  normalization is proposed.
- Five multiline rows contain 17 embedded Korean line breaks. Every row has
  matching line-break counts across the four languages. After normalizing
  translated marker payloads, the runtime/control-marker order also matches;
  localized marker contents are intentionally different.
- All 250 IDs have indexed asset associations. These are grouping clues only;
  no per-key speaker, branch, or dialogue order was inferred.

## Range Result

- Rechecked 59 existing records and added 191 new records. The range has 27
  overall candidate IDs and six evidence-limited holds; `41178` has both a
  candidate and a separate hold. The other 217 IDs have no supported finding.
- The ledger covers 47,536 of 65,135 unique `default` IDs (72.98%), leaving
  17,599. Reviewed IDs with indexed asset links total 38,633; 8,903 have no
  indexed asset link. Sequential coverage reaches `41249`; next is
  `41250`-`41499`.
- Four-language fingerprints, generated catalogs, nine related index tests,
  and scoped diff checks must pass before this batch is considered recorded.
  Translation CSVs remain unchanged.
