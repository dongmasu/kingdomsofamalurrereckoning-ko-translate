# Sequential `default` Revalidation: IDs `2500`-`2749`

- Date: 2026-11-11.
- Scope: compare English, Japanese, Chinese, and active Korean for IDs
  `2500`-`2749`; add only IDs without a current ledger record.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- 195 new IDs were reviewed and recorded. The other 55 IDs in this interval
  already had ledger records and were left unchanged.
- Thirteen correction candidates and five evidence-limited holds were
  identified. Candidates are proposals, not approved edits.
- The review checked meaning, Korean naturalness, speech/register where
  applicable, names and terms, and text structure. No speaker or dialogue
  order was inferred from an asset association alone. UI, objective, item,
  book, and other non-dialogue text was assessed according to its type.
- No translation CSV or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `2504` | Format / title | The standalone title `Escape from the Catacombs` is translated as `지하 묘지에서 탈출` without its English title. Check whether this quest/title follows the paired-title convention and, if so, add the complete source title. | Medium |
| `2512` | Format / title | The named book/document `Smuggler's Notes` is translated as `밀수업자의 쪽지` without the English title. Consider pairing the complete title. | High |
| `2558` | Format / name | The long note ends with the signature `-Maun`, rendered `-마운` without the source name. Consider `-마운(Maun)` while preserving the existing paragraph breaks. | High |
| `2561` | Format / place names | `The Quays and the Burn` is rendered `부두와 번(The Burn)`, pairing `The Burn` but not `The Quays`. Japanese quotes both names and Chinese transliterates both; confirm whether `The Quays` is a named district and pair both sides consistently if so. | Medium |
| `2611` | Naturalness / terminology | `그 피해 유형에 저항을 가집니다` is awkward Korean for `that enemy is resistant`. Consider `그 적은 해당 피해 유형에 저항력이 있습니다` or another natural form consistent with the game's resistance terminology. | High |
| `2639` | Naturalness / verse style | The English is a four-part rhyming verse (`heard/assured`, `coup/rue`), but Korean renders it as prose and loses the rhyme and compact poetic cadence. Rework as a short verse while preserving the seer's assured reign and the Hierophant's threat to make Grim regret the coup. | High |
| `2647` | Terminology / place name | `Champion's Manor` varies across six references: `챔피언의 장원` (`1498`, `14938`), `챔피언의 저택` (`2647`, `10181`, `37666`), and `챔피언 저택` (`12473`). Standardize the place name as a group and verify English pairing. | High |
| `2665` | Format / name | `Wulf` is rendered `울프` without an English pairing, while the source names the character directly. Consider `울프(Wulf)`; the full title `Brother Wulf` is separately paired at ID `2592`. | High |
| `2682` | Naturalness | `명장 대장장이` is redundant/awkward for `master blacksmith`. Consider a more natural form such as `명장급 대장장이`, retaining the source's level of skill. | Medium |
| `2688` | Format / entity label | The standalone entity label `Gnomish Sentry` is rendered `노움 보초` without English. Confirm it is a creature/unit label and, if so, pair the full label. | Medium |
| `2703` | Format / entity label | The standalone creature label `Ice Wolf` is rendered `얼음 늑대` without English. Confirm it is a named creature type and, if so, pair the full label. | Medium |
| `2716` | Terminology / format | `Century Plants` is rendered `백년초` without English. The same term occurs at IDs `1793`, `2304`, `2386`, `29528`, `32025`, `35000`, `42925`, `61507`, and `63622`; only some occurrences currently pair the English name. Recheck the full set and apply the pairing consistently where the plant is named. | High |
| `2723` | Format / title | The standalone card/title `Mage of Cups` is translated as `컵의 마법사` without English. Consider pairing the complete title, consistent with related named card labels. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `2507` | Speech level / honorifics | Japanese uses polite endings, while Korean is plain. The linked asset contains multiple quests and NPCs and does not map this key to a speaker; retain the voice question without inferring an identity. |
| `2532` | Speech level / honorifics | Korean uses a polite question ending (`싸우죠?`) while Japanese is plain. The asset-level NPC clue does not establish the speaker or addressee for this key; hold rather than normalize by guess. |
| `2565` | Meaning / speech act | English says `Testify!`, Japanese says `見るがいい！` (“Behold!”), and Chinese says `死吧！` (“Die!”). The linked MQ14 asset contains several NPCs and does not identify this line's speaker or scene; hold the intended battle/dialogue exclamation. |
| `2657` | Speech level / honorifics | Korean `네? 누구세요?` is polite, while Japanese `はい？ あんたは誰だ？` is casual/direct. The key is linked to multiple assets without a per-key speaker mapping; retain as unresolved. |
| `2678` | Speech level / honorifics | Korean uses a haughty plain form (`있네`, `많지`); Japanese is feminine/casual and Chinese neutral. The linked asset has no NPC identifier or per-key speaker mapping; do not assign a voice from the asset alone. |

## Duplicate and Structural Checks

- Forty-one exact-English duplicate groups touching the range were checked
  across the full `default` corpus. Every group has identical Korean text.
- Runtime-token shapes matched across English, Japanese, Chinese, and Korean
  for all 195 newly recorded IDs. Localized text inside display markers and
  language-specific argument order were not treated as structural errors.
- ID `2629` has five paragraphs in English, Chinese, and Korean, but four in
  Japanese. The Korean layout follows English and Chinese; this source
  difference is documented rather than treated as a Korean formatting error.
- The 55 pre-existing ledger records in this interval were not rewritten or
  duplicated. Asset links are evidence about containing files only; no
  per-key speaker or dialogue order was inferred.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
