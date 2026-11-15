# Sequential `default` Revalidation: IDs `17000`-`17249`

- Date: 2026-11-11.
- Scope: all 250 active Korean rows compared with English, Japanese, and
  Chinese for meaning, Korean naturalness, register, names/terms, and format.
- Sixty-nine existing ledger fingerprints matched; 181 previously unrecorded
  IDs were reviewed and added.
- Six new correction-candidate findings and two evidence-limited holds are
  recorded. Previously recorded findings at `17030`, `17133`, `17145`,
  `17197`, `17207`, and `17234` were rechecked and retained.
- No translation CSV, source resource, extracted game asset, or localization
  binary was changed.

## New Correction Candidates

These proposals are not authorization to edit the active Korean CSV.

| ID(s) | Dimension | Evidence and proposed direction | Confidence |
| --- | --- | --- | --- |
| `17011` | Name / format | `The Guardian` is the named card in a Fate-card description. Korean `수호자 카드` omits the English pairing used for named cards elsewhere. Consider `수호자(The Guardian) 카드`, preserving the sentence's explanatory style. | High |
| `17028` | Meaning | `must see something I do not` describes seeing what the speaker cannot see. Korean `내가 못 보는 무언가를 알고 있겠지` changes that to knowing something. Consider `네가 부름받은 자라면 내가 보지 못하는 무언가를 볼 수 있겠지.` | High |
| `17123` | Naturalness | `네가 하는 말은 아주, 아주 신중하게 생각해 봐` is awkwardly constructed. Preserve the emphatic repetition and warning with a natural form such as `무슨 말을 하는지 아주, 아주 신중히 생각해 봐.` | Medium-high |
| `17151` | Name / format | The letter salutation explicitly names `Lord Gastyr`, but Korean `고(故) 개스티어 경께` omits the source pairing. Consider `고(故) 개스티어 경(Lord Gastyr)께`. | High |
| `17189` | Name / format | English capitalizes `the House`, referring to the House of Sorrows; the linked context and established corpus term identify it as `비탄의 집(House of Sorrows)`. Add the English name to this occurrence without changing the journal's meaning. | High |
| `473`, `2163`, `17238` | Title / format | The capitalized epithet `The Great General` is rendered `위대한 장군` without its English pairing. The exact same two-sentence source occurs at `473` and `2163`, where the Korean is identical; `17238` uses the same title in dialogue. Consider consistently pairing it as `위대한 장군(The Great General)` at all three IDs. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `17036` | Meaning | English `them` and Japanese `配置しておけ` do not identify what must be laid out for inspection. Korean adds `병사들을 도열시켜`, while the following stain instruction could concern another inspected subject. The KV04 asset association does not map this key to a speaker or referent; retain the current reading pending direct context. |
| `17129` | Terminology / meaning | `warden` is rendered `경비대장` here, while related uses include `관리관` (`2033`, `5160`) and `감시관` (`4146`). Japanese uses `見張り役` here but different terms in those rows, and Chinese uses prison-specific `典狱长`. The sources do not establish whether these are one standardized office or context-specific roles; do not force a global term from this row alone. |

## Previously Recorded Findings Rechecked

- `17030`: retain the naturalness/nuance candidate for English `like to think`;
  the earlier report has the proposed cynical reading.
- `17133`: retain the candidate clarifying that the Great Chamber is her home.
- `17145`: retain the candidate replacing the passive narrative ending with a
  natural conversational statement.
- `17197`: retain the speech-level hold; the asset does not establish that it
  shares a speaker or branch with the related storytelling line.
- `17207`: retain the sentence-level uncertainty and the separate
  `Cadsymyr` spelling candidate documented in the SQ102 report.
- `17234`: retain the `green apprentice` candidate; English, Japanese, and
  Chinese support an inexperienced apprentice, for which `풋내기 제자` is
  more natural than `초록내기 제자`.

## Duplicate and Structural Checks

- All 250 IDs are present in identical order in the English, Japanese,
  Chinese, and active Korean tables.
- The only exact-English duplicate group in this range is `Quest Complete`
  (`17170`, `17178`, `17228`); all three Korean strings match.
- Logical line-break counts match across all four languages, including the
  poetic text at `17005` and `17188`; the range contains 26 embedded breaks
  in each language. Runtime/layout markers and markup match after accounting
  for the intentionally localized `{*1[...]}` label at `17130`.
- Of the 181 new IDs, 133 have indexed quest-asset links and 48 do not.
  Asset links do not establish individual speakers, addressees, or playback
  order; unsupported attributions remain unassigned/unknown.

The ledger now contains 29,769 of 65,135 IDs (45.70%), leaving 35,366
unreviewed. The next sequential range is `17250`-`17499`. Per-ID decisions
and four-language fingerprints are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
