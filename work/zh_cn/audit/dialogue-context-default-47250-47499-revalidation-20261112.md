# Sequential `default` Revalidation: IDs `47250`-`47499`

- Date: 2026-11-12.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 55 previously recorded four-language fingerprints; all match.
  Added the other 195 IDs to the review ledger.
- Fourteen current correction candidates and three evidence-limited holds
  remain; the other 233 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records; this
report records the current revalidation.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `47256` | Format / terminology | This is the named magical spring `The Font`, but the Korean says only `샘`. Other lines in the same `SQ84` topic use `샘(The Font)`. Add the established English pairing without changing the sentence. | High |
| `47266` | Objective format | `Sell Ratofer's Silverware` is a quest objective, currently `라토퍼(Ratofer)의 은식기 판매`. The current project convention generally uses `-하기` for objectives, as in the parallel `Sell Ratofer's Charter` at `44085`. Consider `라토퍼(Ratofer)의 은식기 판매하기`. | Medium-high |
| `47277` | Format | Korean places the display marker `{*1활성 능력}` before the button variable `{1}`, unlike English, Japanese, and Chinese, which place `{1}` first. Consider a natural Korean clause preserving source marker order, such as `버튼 {1}을 누르면 선택한 {*1활성 능력}을 사용할 수 있습니다.` | High |
| `47281` | Naturalness | The short question `You mentioned Rundamir?` remains stilted as `룬다미르를 말하는 거야?`. Japanese `ルンダミアと言っていたが？` supports a more conversational `룬다미르라고 했어?`. | Medium |
| `47293` | Meaning / name format | The named deity `God Under the Mountain` is already rendered `산 아래의 신(God Under the Mountain)` at `12378`; this line has `산 아래 신`. Align the term and full English pairing to that established form. | High |
| `47299` | Name format | The capitalized personal name `Darkken` appears without its English pairing as `다르켄`. Add `다르켄(Darkken)`, consistent with `1346`; this is a spelling/pairing match and does not identify this person with another Darkken. | High |
| `47324` | Naturalness / speech level | `자네와 토론하고 싶어 해` combines the marked older-style `자네` with a casual clause ending. Japanese uses a plain conversational statement. Consider `너와 토론하고 싶어 해`; the asset does not identify the speaker. | Medium |
| `47340` | Meaning / naturalness | In `they would have been razed`, Korean `그들은` ordinarily points to people, while the surrounding clause and Chinese `它们` indicate things or places that could be razed. Consider a locative reference such as `그곳들은 오래전에 초토화되고 이 요새만 옛 칸드리안(Kandrian)의 유일한 흔적으로 남았을 거야.` | Medium-high |
| `47353` | Meaning / naturalness / name format | `avenge the death of his Ariad soldiers` is awkward as `아리아드 병사들의 죽음을 복수`. Consider `아리아드(Ariad) 병사들의 원수를 갚고`, retaining the source's separate goal of eradicating the Tuatha from Shadow Pass. | High |
| `47419` | Meaning / name format | English `Weeping King's Hollow`, Japanese `嘆きの王の洞穴`, and Chinese `悲泣之王的洞穴` identify a cave, not a valley. Korean `골짜기` changes the landform. Consider `통곡하는 왕의 동굴(Weeping King's Hollow)`. | High |
| `47420` | Name format | `Nil` is the named person who gave the speaker his key, but Korean has only `닐`. Add `닐(Nil)` without inventing other identity details. | High |
| `47424` | Name format | The source's complete region phrase is `Winter Faelands`, while the Korean pairs only `Faelands`: `겨울 패란즈(Faelands)`. Consider `겨울 패란즈(Winter Faelands)`. The same English phrase appears at `8506` and `36028`; this finding is scoped to this ID, not a global edit approval. | Medium-high |
| `47426` | Naturalness | The previous candidate remains: `돈은 내셔야 해요, 흠! 하지만 어서요!` follows the English interruption too literally. Japanese smooths the line into a reminder that the goods are not free followed by an invitation. Consider `공짜는 아니지만, 편하게 둘러보세요!` without assigning a speaker. | Medium |
| `47447` | Naturalness | `the grand Ljosalfar city` becomes `위대한 료스알파르 도시`, which can characterize the people as great and lacks the Korean possessive relation. Japanese `壮大なロサルファーの街` supports `료스알파르(Ljosalfar)의 웅장한 도시`. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `47280` | Meaning | Retain the existing hold. English says `my brother, Niahm`, while Japanese specifies a younger brother. Keep the Korean relation broad rather than selecting `형` or `동생` from Japanese alone; the asset does not identify the speaker. |
| `47300` | Address / honorifics | English `my lady` is `아가씨` in Korean, `夫人` in Chinese, and only a greeting in Japanese. The addressee's age and social status are not established, so do not choose a more specific title from this row alone. |
| `47496` | Name / text type | The isolated label `The Lustful Elf` could be a proper title or a descriptive phrase. Korean `호색한 엘프` translates the words but the row does not establish whether to add title-style English pairing. |

## Rechecked Findings and Structure

- Three exact-English duplicate groups touch the range: `47252`/`47296`
  (`Quest Failed`), `47339`/`47406` (`Be careful.`), and `47389`/`47474`
  (`Greetings.`). Korean text matches within all three groups.
- Three entries contain line breaks: `47287` (1), `47304` (4), and `47390`
  (6). Each row's break count matches across all four languages. Korean
  embedded separators are CRLF.
- Runtime and layout markers occur at `47277`, `47375`, `47395`, and `47445`.
  Marker identity and order match across the four languages except at
  `47277`, where Korean puts the ability display marker before the button
  variable; this is recorded as a format candidate. Localized marker payloads
  at `47375` are preserved.
- Of 250 IDs, 195 have indexed asset links and 55 do not. The index contains
  202 ID-asset links across 124 assets; seven IDs link to multiple assets.
  Of the 195 newly recorded IDs, 140 have indexed asset links and 55 do not.
  Asset and handler associations do not establish per-key speakers or
  playback order.

## Prior-Record Reconciliation

- Existing candidates `47256`, `47281`, and `47426` remain supported by the
  current four-language rows.
- The earlier `M0_SQ06` asset review retained `47266`; this sequential pass
  records a new objective-format candidate against the current `-하기`
  convention. Its historical ledger row is unchanged.
- The earlier `SQ69` candidate at `47483` is already reflected in the current
  Korean `마법사 보초 처치`; the current pass found no new issue there. The
  historical candidate record remains unchanged.
- The current `47280` evidence hold remains unresolved. The report does not
  infer a speaker or turn from asset membership.

## Range Result

- The range has 14 correction-candidate IDs and three evidence-limited holds;
  the other 233 IDs have no current finding.
- After appending 195 new IDs, the ledger covers 52,152 of 65,135 unique
  `default` IDs (80.07%), leaving 12,983. Sequential coverage reaches
  `47499`; next is `47500`-`47749`. Of reviewed IDs, 41,843 have indexed
  asset links and 10,309 do not.
- Findings remain proposals requiring separate approval. No translation CSV
  was changed.
