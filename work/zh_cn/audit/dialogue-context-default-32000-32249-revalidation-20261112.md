# Sequential `default` Revalidation: IDs `32000`-`32249`

- Date: 2026-11-12.
- Compared all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 55 existing ledger entries and added 195 IDs. Findings are
  proposals, not approved translation edits.
- Eleven new correction-candidate IDs were identified. The pre-existing
  `not-issue` entry `32241` and its exact-English duplicate `33619` were
  promoted together. Six existing candidates and three evidence-limited
  holds were retained; the other 45 existing entries remain not flagged.
- No translation CSV, reference asset, or game binary was modified.

## Correction Candidates

| ID(s) | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `32058` | Naturalness | Japanese clarifies that no fare is charged for the ship. Korean `내 배는 공짜로 타게` is awkward and reads like an incomplete command. Prefer a natural offer such as `배삯은 받지 않겠네`; retain the friends' freedom to choose the route. | Medium-high |
| `32097` | Meaning / terminology | English capitalizes `Winter`, and Japanese explicitly says Winter Fae are under attack. Korean `겨울의 맹공` leaves out the faction. Use `겨울 페이(Winter Fae)의 맹공` or equivalent. | High |
| `32128` | Naturalness / meaning | `flickering tongue` is a deliberately vivid, sexualized image; Korean `깜박이는 혀` sounds like literal blinking and is unnatural. Recast the image with a natural verb such as `날름거리다`, preserving the source's tone and metaphor rather than sanitizing it. | Medium-high |
| `32144` | Terminology / format | `+1 to Sorcery Abilities` follows the established ability-bonus pattern. Korean `+1 마법(Sorcery) 능력` does not mark the ability as the bonus target. Use `마법(Sorcery) 능력에 +1`. | High |
| `32169` | Name / format | This standalone character-name key is `Morsus`; Korean `모르수스` omits the source pairing. Add `(Morsus)`. | High |
| `32170` | Name / format | The source label is the concatenated proper name `MendellerBirt`; Korean `멘델러 버트` omits its English pairing. Add `(MendellerBirt)` while preserving the Korean spacing. | High |
| `32181` | Terminology / format | The dialogue explicitly quotes the name `Reckoning` in `Reckoning magic`. Korean quotes only `레코닝`, unlike established source-paired uses of this game term. Pair it as `레코닝(Reckoning) 마법`. | Medium-high |
| `32188` | Naturalness / register | This is a terse first-person travel-log entry. `내일 아침 다시 파도 위로 나가리라` shifts abruptly into a literary/archaic declaration. Recast the complete entry in concise log prose, e.g. `오늘 라시르(Rathir)에 정박했다. 술 한잔하고 즐겁게 보낸 뒤 따뜻한 식사를 하고, 내일 아침 다시 출항한다.` | Medium-high |
| `32212` | Name / title format | The English identifies `Castellan Shane`; Korean `셰인 성주` omits the source pairing while `Gwyn Anwy` is paired in the same entry. Add the full title/name pairing, e.g. `셰인 성주(Castellan Shane)`. | High |
| `32225` | Name / format | Capitalized `Watchers` is the named guardian group. Korean `감시자들` omits the English pairing used elsewhere for this group, including `23111`, `55061`, and `55195`. Use `감시자들(Watchers)`. | High |
| `32238` | Naturalness | `비사라네(Bisarane)가 시간을 끌고 모욕하는 것을` is syntactically awkward. Recast the complaint naturally, e.g. `비사라네(Bisarane)가 계속 시간을 끌고 모욕을 일삼는 걸 더는 참을 수 없다.` Preserve the following demand that the House be led to war. | Medium-high |
| `32241`, `33619` | Name / format | These are exact-English duplicates with identical Korean. In the linked SQ116 context, capitalized `The Seal` refers to the Ansilla royal seal, named elsewhere as `Seal of Ansilla`; both rows render it only as `인장`. Add a source pairing such as `인장(Seal)` to both. Both entries were previously `not-issue` and are promoted here. | High |

## Earlier Findings Rechecked

- Existing candidates `32020`, `32057`, `32115`, `32135`, `32146`, and
  `32217` remain supported. Their current text still shows, respectively,
  the `travesties` sense, `refuse pipe` terminology, the `Ticneri` spelling
  and `latest`/`last` distinction, missing `Olaf` pairing, arena terminology,
  and `Chaos Scholar` term/pairing issues. Their linked reports remain the
  evidence records.
- Existing holds `32063`, `32226`, and `32239` remain unresolved. The
  available sources do not establish the specific speaker/register at
  `32063` or `32239`, and disagree on the force of `Begone with you` at
  `32226`.
- The other 45 pre-existing entries remain not flagged. No speaker or
  playback order was inferred from asset membership, NPC symbols, handler
  serialization, or ID order.

## Repeated Sources And Structure

- Fifty-six exact-English duplicate groups touch this range (1,002 corpus
  rows). Only the `You?` group varies in Korean: `27293` is `너?` and `32079`
  is `너였어?`. Japanese likewise differs (`あなた？` / `君か`), so the
  ID-specific Korean distinction is retained rather than mechanically
  unified.
- Per-row embedded line-break counts match across all four languages. Six
  entries contain embedded breaks, totaling 33; Korean's 33 breaks are
  stored as CRLF and were preserved.
- Runtime placeholders and layout/markup tokens were checked. At `32156`,
  Chinese reverses `{1}` and `{2}`; Korean matches English and Japanese, so
  this is not a Korean formatting finding.

After this range, the ledger contains 40,834 of 65,135 unique IDs (62.69%),
leaving 24,301. Sequential coverage reaches ID `32249`; next:
`32250`-`32499`.
