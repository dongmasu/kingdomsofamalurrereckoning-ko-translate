# Sequential `default` Revalidation: IDs `46250`-`46499`

- Date: 2026-11-12.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 60 previously recorded four-language fingerprints; all match.
  Added the other 190 IDs to the review ledger.
- Six correction candidates remain supported: four newly identified here and
  two carried forward from earlier context reviews. Three evidence-limited
  holds remain, one of which (`46314`) is separate from its correction
  candidate. `46403`'s earlier candidate is not confirmed and is held for
  insufficient context. The other 242 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records; this
report records the current revalidation.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `46314` | Name format / consistency | The same English location `Forum` appears as `포럼` at IDs `209` and `46314`, but as `공회장` at `38728`. The location labels at IDs `5842` and `12161` use `포럼(Forum)`. Consider `포럼(Forum)` here; `38728` is outside this range. Keep the personal-rank question about `Templar` separate below. | High |
| `46332` | Name format | `Sworn Assembly` is capitalized as a named body, but Korean has only `맹세자들의 회합`. Consider `맹세자들의 회합(Sworn Assembly)`. The capitalization suggests a name, though the exact institutional referent is not established. | Medium |
| `46343` | Name / title format | The long account already pairs `바얄라 티린(Bayala Tirin)`, but later has `두레크의 도끼` for `Durek axe` and `사제 티린(Tirin)` for `Priestess Tirin`. Consider `두레크(Durek)의 도끼` and `사제 티린(Priestess Tirin)`, preserving the existing Korean title choice and all four paragraphs. | High |
| `46469` | Name / title format | The established ambassador convention pairs the English title before the name. Change the parenthetical order from `오드바르 대사(Odvar Ambassador)` to `오드바르 대사(Ambassador Odvar)`, consistent with the approved form and the full dialogue at `58790`. | High |
| `46475` | Name format | This standalone label refers to an adherent of the named `House of Mercy`; Korean `자비의 집 신봉자` omits the English faction name. Consider `자비의 집(House of Mercy) 신봉자`. | Medium-high |
| `46492` | Meaning / naturalness | `그 전의 아르케스(Arkes)도 그랬다고 생각했지` leaves the antecedent of `그랬다` unclear. English and Japanese identify the same apathy as the predecessor's sin. Consider `아노카토스 이전에는 그 죄가 아르케스(Arkes)의 죄라고 생각했어.` | High |

The two carried-forward candidates (`46314` and `46492`) were checked against
their current four-language text and remain supported. Their earlier ledger
rows and source reports were not overwritten.

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `46314` | Title terminology | The separate personal rank `Templar` remains unresolved. Prior context review found that singular personal ranks do not inherit the approved plural faction form; retain `성전기사` pending a title decision. |
| `46403` | Meaning / text type | The standalone topic `Oracles` is `預言者` in Japanese and `神谕者` in Chinese, supporting people who prophesy, as in current `예언자들`. A related spoken use of `oracles` can mean prophecies (`신탁`), but the asset association does not map that line to this topic key. Do not change the label without direct context. The earlier candidate remains in the historical ledger; this report records the current hold. |
| `46491` | Meaning / source conflict | English and Chinese describe the source as drifting through the air and alight on the surface; Japanese ends after “falling on the surface.” Korean follows English and Chinese. Keep the current reading until the intended image is established. |

## Rechecked Findings and Structure

- Sixty exact-English duplicate groups touch the range and cover 1,092 corpus
  rows. Korean is identical within every group; no translations were unified
  solely because English repeats.
- Four entries contain line breaks: `46302` (2), `46327` (1), `46334` (4),
  and `46343` (6). All four languages have matching per-row counts, and all
  13 Korean separators are CRLF.
- Runtime arguments, markup, and marker order were checked. The payload inside
  `{*1[...]}` at `46327` is localized in each language as expected; after
  normalizing that display payload, no structural signature discrepancy was
  found.
- Of 250 IDs, 205 have indexed asset associations, including 145 of the 190
  newly recorded IDs. Four IDs are linked to multiple assets. Asset links do
  not establish per-key speakers, addressees, branches, or playback order;
  unsupported attribution and order remain unknown.

## Range Result

- The range has six supported correction-candidate IDs and three
  evidence-limited holds; `46314` has both a correction candidate and a
  separate title hold. The other 242 IDs have no current finding.
- After appending 190 new IDs, the ledger covers 51,408 of 65,135 unique
  `default` IDs (78.93%), leaving 13,727. Sequential coverage reaches
  `46499`; next is `46500`-`46749`. Of reviewed IDs, 41,313 have indexed
  asset links and 10,095 do not.
- Catalog reproduction, all 51,408 ledger fingerprints, the nine related
  index tests, and the line-ending-aware diff check passed after the ledger
  update.
