# Sequential `default` Revalidation: IDs `46000`-`46249`

- Date: 2026-11-12.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 78 previously recorded four-language fingerprints; all match.
  The other 172 IDs are new ledger entries.
- Recorded 20 current correction candidates and two evidence-limited holds.
  ID `46241` has both a formatting candidate and a separate meaning hold;
  229 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records; this
report records the current revalidation.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `46056` | Name format | `Mother Glasse` is a named character but appears only as `마더 글래스`. Pair the name as `마더 글래스(Mother Glasse)`. | High |
| `46068` | Name/title format | The source title is `Priestess Seranon`, while Korean pairs only the name and leaves the title outside the parentheses. Use a full source pairing such as `세라논 여사제(Priestess Seranon)`. | High |
| `46075` | Terminology | `Junk` is consistently `잡동사니` elsewhere, but this action and the exact-source counterpart at `58187` say `정크에서 제거`. Consider `잡동사니에서 제거` for both. | High |
| `46101` | UI register | This confirmation prompt is informal (`정말이야?`) despite the Japanese polite prompt `よろしいですか？` and the surrounding Korean UI style. Consider `정말입니까?`. | Medium-high |
| `46102` | Name format | The named NPC `Daedinnear` lacks English pairing. Consider `대딘니어(Daedinnear)가`. | High |
| `46132` | Meaning / naturalness | The first sentence repeats `기술` and inserts a colon not present in the sources. The Japanese says nine kinds of skills. Consider a construction such as `아홉 가지 {*1기술}을 선택할 수 있습니다.` | High |
| `46143` | Name format | The named character Hroth is unpaired. Consider `흐로스(Hroth)가`. | High |
| `46147` | Name format | `Watchers` is a capitalized group name in “We are the Watchers.” Pair the group at first mention: `감시자(Watchers)`. | Medium-high |
| `46149` | Name format | `Hill` is a person in this recollection but is unpaired. Consider `힐(Hill)을`. | High |
| `46156` | Register / naturalness | This quest-status entry uses polite endings, unlike the plain Japanese and comparable failure-log wording. Consider `아드리스 데오프리트(Adrith Deofrit)가 사망했다. 이 퀘스트는 더는 완료할 수 없다.` | High |
| `46174` | Speech level | Korean uses polite `안녕하세요/기다리고 있어요/마세요`, while Japanese is consistently casual. Consider matching the casual voice: `안녕. 명령을 기다릴게. 하지만 소리치진 마. 난 아주 여리니까.` | High |
| `46182` | Terminology / spacing | `마녀기사` conflicts with the established spaced form `마녀 기사` used for Anira elsewhere. Consider `마녀 기사 아니라(Anira) 처치하기`. | High |
| `46211` | Meaning | `complex` means a building complex here; Japanese says `建物` and Chinese says `建筑`. `유적` suggests ruins not present in the source. Consider `이 건물 단지의 보잘것없는 수호자다`. | High |
| `46213` | Name format | The title-cased location label `Strange Tunnel` is unpaired. If treated as the named location, use `기묘한 터널(Strange Tunnel)`. | Medium |
| `46215` | Name format | The recipient `Dilios` is unpaired. Consider `딜리오스(Dilios)에게`; retain the current fragment-style punctuation. | High |
| `46219` | Naturalness | `유사 봉건제 궁정` is an awkward rendering of “pseudo-feudal court system.” Consider `유사 봉건적 궁정 체제`, e.g. `불멸성이 그들의 유사 봉건적 궁정 체제에 미친 영향만으로도 책 열 권은 쓸 수 있겠어.` | Medium-high |
| `46229` | Name format / naturalness | `Ballads Sanctuary` is rendered with the unrelated full English parenthetical `House of Ballads`, making the phrase awkward. Preserve the established Korean faction name but pair the actual source label, e.g. `발라드의 집 성소(Ballads Sanctuary)`. | Medium-high |
| `46241` | Name format | The named character Minn is unpaired. Consider `민(Minn)이`; the separate wording ambiguity is held below. | High |
| `46243` | Objective format | `Defeat Sir Elswin` lacks the established action-form objective ending. Consider `엘스윈(Elswin) 경 처치하기`. | High |
| `46245` | Name format | Ohn's name is unpaired in this titled entry. Consider `온(Ohn)의 힘`. | High |

Four candidates (`46147`, `46149`, `46156`, and `46174`) concern IDs already
present in the ledger. Their prior rows were not overwritten.

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `46221` | Title format | The Korean `그리고 아무도 없었다` is the established Korean title of *And Then There Were None*. Whether this game-book title should also carry an English parenthetical is a project-wide title-format decision; retain the current text pending that decision. |
| `46241` | Meaning | “Those are the faces Minn likes to see” may refer to card faces or to a player's expression. Japanese supports the literal `顔` reading while Chinese interprets it as a result. The asset association includes multiple NPCs and does not map this key to a speaker, so retain the current Korean wording rather than infer the intended reading. |

## Rechecked Findings and Structure

- Sixty-three exact-English duplicate groups touch this range and cover 1,188
  corpus rows. Korean is identical within every group; no translations were
  unified solely because English repeats.
- Two entries contain line breaks: `46111` has five and `46138` has nine.
  All four languages have matching per-row counts; the 14 Korean separators
  are CRLF.
- Runtime arguments, display wrappers, markup, and their order were checked.
  No structural signature discrepancy was found.
- Of 250 IDs, 194 have indexed asset associations, including 116 of the 172
  newly recorded IDs. The other 56 have no indexed asset association. Asset
  links do not establish per-key speakers, addressees, branches, or playback
  order; unsupported attribution and order remain unknown.

## Range Result

- The range has 20 current correction-candidate IDs and two
  evidence-limited holds; `46241` has both dimensions. The other 229 IDs have
  no current finding.
- After appending 172 new IDs, the ledger covers 51,218 of 65,135 unique
  `default` IDs (78.63%), leaving 13,917. Sequential coverage reaches
  `46249`; next is `46250`-`46499`.
- The ledger has 41,168 asset-linked and 10,050 unlinked IDs. Catalog
  reproduction, all ledger fingerprints, the nine related index tests, and
  the line-ending-aware diff check are run after the ledger update.
