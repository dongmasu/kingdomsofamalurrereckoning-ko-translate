# Sequential `default` Revalidation: IDs `2250`-`2499`

- Date: 2026-11-11.
- Scope: compare English, Japanese, Chinese, and active Korean for IDs
  `2250`-`2499`; add only IDs without a current ledger record.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- 178 new IDs were reviewed and recorded. The other 72 IDs in this interval
  already had ledger records and were left unchanged.
- Six correction candidates and four evidence-limited holds were identified.
  Candidates are proposals, not approved edits.
- The review checked meaning, Korean naturalness, speech/register where
  applicable, names and terms, and text structure. Dialogue register was not
  attributed to an individual speaker without direct evidence. UI, objective,
  item, book, and other non-dialogue text was assessed according to its type.
- No translation CSV or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `2272` | Format / title | The English book title is `The Words of Solen Reimgar as Chronicled by Parthalan`; Korean translates the full title but pairs only the two personal names. Consider pairing the complete English title while retaining the name-level pairings. | High |
| `2303` | Terminology / place name | `Warden's Bridge` is rendered `감시자의 다리` here, while related references use `워든스 브리지`, `워든 다리`, and `워든의 다리` (including IDs `9230`, `11951`, `19738`, `40536`, `51266`, `52913`, `61566`, and `64889`). Review the place-name form as a group; this report does not choose a canonical Korean form. | High |
| `2345` | Format / title | `Irion, King of Cups` is rendered `컵의 왕 이리온(Irion)`, omitting the English title from the parenthetical. The same English source appears at 20 IDs, and all 20 currently have identical Korean text. If approved, review and apply the title-pairing decision to the complete duplicate group, not only this ID. | High |
| `2365` | Format / place name | The named location `Windmill Island` is rendered `풍차섬` without the English name. Consider `풍차섬(Windmill Island)`. | High |
| `2372` | Format / verse layout | English, Japanese, and Chinese each have five lines; Korean has six, with an extra break between `거미줄과 독의 여왕인 그녀는` and `스스로를 위도우(The Widow)라 부르네`. Review against the source stanza layout and preserve its five-line structure. | High |
| `2429` | Meaning / format | English says `As Freya in the Mountains`; Chinese also expresses “like/as,” while Korean `산속의 프레야(Freya)` omits that comparison. Preserve the `as/like` relation and verify whether the full phrase should be paired as a title or quoted expression. | Medium |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `2275` | Meaning / terminology | `The House` is capitalized in English, transliterated in Japanese, and rendered as `家族` in Chinese. Korean `그 가문(The House)` may be plausible, but the available row and asset association do not establish whether it means a family, political house, or named organization. Do not normalize the referent without more context. |
| `2308` | Address / terminology | English addresses someone as `Dove`; Japanese omits the address, Chinese uses `和平使者`, and Korean uses `도브(Dove)`. It may be a name, title, or form of address; retain the current rendering pending direct dialogue context. |
| `2349` | Speech level / honorifics | Korean uses `-로군` / `-걸세`, while Japanese and Chinese do not establish an equivalent Korean register. The asset contains several NPC symbols and does not map this key to a speaker; retain the voice question without inferring a speaker. |
| `2467` | Speech level / honorifics | Korean `오늘은 어떠신가?` differs in register from the casual Japanese `調子はどう？`; the linked asset contains multiple NPCs and does not identify the speaker for this key. Hold rather than normalize by guess. |

## Duplicate and Structural Checks

- Forty-two exact-English duplicate groups touching the range were checked
  across the full `default` corpus. All groups have identical Korean text.
- Runtime-token shapes matched across English, Japanese, Chinese, and Korean
  for all 178 newly recorded IDs. Localized text inside display markers and
  language-specific argument order were not treated as structural errors.
- Line-break counts matched for all new IDs except `2372`, documented above.
- The 72 pre-existing ledger records in this interval were not rewritten or
  duplicated. Asset links are evidence about containing files only; no
  per-key speaker or dialogue order was inferred.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
