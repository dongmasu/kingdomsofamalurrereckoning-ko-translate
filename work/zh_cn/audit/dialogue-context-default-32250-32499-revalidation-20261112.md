# Sequential `default` Revalidation: IDs `32250`-`32499`

- Date: 2026-11-12.
- Compared all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 43 existing ledger entries and added 207 IDs. Findings are
  proposals, not approved translation edits.
- Eight new in-range correction candidates were identified. The
  pre-existing candidate at `22272` was promoted with its exact-English
  duplicate `32376`; related card-name entry `38453` was also recorded as a
  candidate. Two new evidence-limited holds were added. Three existing
  candidates and three existing holds remain supported; the other 37
  existing entries remain not flagged.
- No translation CSV, reference asset, or game binary was modified.

## Correction Candidates

| ID(s) | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `32265` | Name / format | The passage names the historical event `Night of Fire and Blood` twice. Pair the first Korean reference as `불과 피의 밤(Night of Fire and Blood)` and retain the same Korean form at the second reference. | High |
| `32298` | Objective style | `Find the First Colony` is an action objective, but Korean uses the direct command `첫 번째 정착지를 찾아라`. Use the established neutral action form, such as `첫 번째 정착지 찾기`. | High |
| `32310` | Naturalness | `특정한 조합의 방향으로 맞춰야` is awkward and obscures how the knob must be turned. Japanese describes setting it to particular directions in a specific order. Recast the instruction naturally while preserving the locked lever and the required combination. | High |
| `32327`, `38453` | Name / format | `The Valley` is the named Fate card: the explanatory text at `38453` explicitly says “this card,” and Japanese renders the name as `ザ・バレー`. Korean uses only `계곡` in both rows. Pair the card name as `계곡(The Valley)` at its first mention in each entry. | High |
| `32342` | Names / book-title format | The source names Crinneus and the quoted book `Gnomish History`; Korean pairs Nemius Perigums but leaves both `크리네우스` and `《노움의 역사》` unpaired. Consider `크리네우스(Crinneus)의 《노움의 역사(Gnomish History)》`. | High |
| `32365` | Title / name format | The source calls Sverri Kura an `Amaldor`; elsewhere `28049` explicitly distinguishes the office from the name. Korean pairs only `Sverri Kura`, leaving `아말도르` unpaired. Pair the title and name separately, e.g. `아말도르(Amaldor) 스베리 쿠라(Sverri Kura)`. | High |
| `22272`, `32376` | Card-name consistency / format | These entries have identical English (`What's this? The hex. You lose.`) and identical Korean, `이게 뭐지? 헥스야. 네가 졌어.` The named card is consistently paired as `헥스(Hex)` elsewhere, including `1866`, `15632`, and `29159`. Pair `헥스(Hex)` in both rows; `22272` was promoted from its previous `not-issue` disposition. | High |
| `32439` | Naturalness / format | The help text's `{*1이정표}` followed by `{*1기술}` currently reads `이정표는 기술에서`, which is unnatural Korean. Recast as a natural clause such as `{*1이정표}가 포함된 {*1기술}은 캐릭터에게 특정한 영구 보너스를 줍니다.` Preserve both localized markers and their order. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `32325` | Meaning / title | English `Mudhold Fasting` conflicts with Japanese `マッドホールド地下通路` (“Mudhold underground passage”) and Chinese `泥岩通道` (“mud-rock passage”). Korean transliterates the English title, but the available sources do not resolve the intended name or meaning. |
| `32447` | Meaning / context | English `The end of this awaits.` is context-poor. Japanese suggests an approaching end/doom, while Chinese says the matter is not over. The isolated line does not resolve the intended force; retain the current Korean provisionally. |

## Earlier Findings Rechecked

- Existing candidates `32283`, `32309`, and `32414` remain supported: the
  Castor name differs from the established Korean form; the contract-failure
  notice shifts into formal polite endings; and `Captain Drefan` is only
  partially paired in Korean.
- Existing holds `32380`, `32421`, and `32422` remain unresolved. The asset
  evidence does not establish a speaker for `32380`; the exact scene and
  speaker relationship for `32421` remain unknown; and `Narca affliction` at
  `32422` remains a cross-reference meaning question.
- The other 37 existing entries remain not flagged. Among the new review
  points, `32259` already pairs `Ohn's Stand`; `32302` uses the established
  `운명의 태피스트리` rendering; the organization and book title in `32324`
  are paired; `32378` pairs `House of Pride` and `Prismere`; and `32389` has
  consistent plain-style endings. No individual speaker or playback order
  was inferred from asset membership, NPC symbols, handler serialization, or
  ID order.

## Repeated Sources And Structure

- Forty-eight exact-English duplicate groups touch this range (1,030 corpus
  rows). Korean text matches within every group before the proposed
  `Hex`-pairing correction.
- Per-row embedded line-break counts match across all four languages.
  Seven entries contain embedded breaks, totaling 23 Korean line breaks;
  these were preserved.
- Runtime-marker and markup structures match across the four languages.
  At `32470`, Korean's localized marker labels follow English and Japanese
  order; Chinese alone places the final two labels in the opposite order.
  This is not a Korean format finding.

After this range, the ledger contains 41,042 of 65,135 unique IDs (63.01%),
leaving 24,093. Sequential coverage reaches ID `32499`; next:
`32500`-`32749`. The total includes the related follow-up at `38453`.
