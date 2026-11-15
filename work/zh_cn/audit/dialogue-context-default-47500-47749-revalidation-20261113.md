# Sequential `default` Revalidation: IDs `47500`-`47749`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 56 previously recorded four-language fingerprints; all match.
  Added the other 194 IDs to the review ledger.
- Thirteen current correction candidates and two evidence-limited holds
  remain; the other 235 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records; this
report records the current revalidation.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `47565` | Meaning / objective wording | The source says defeating Sir Elswin will enable the narrator to cross the gorge and enter the Maid's village. Korean `물리쳐야 ... 들어갈 수 있다` turns that enabling condition into an obligation. Consider `엘스윈(Elswin) 경을 물리치면 ... 들어갈 수 있다`. | High |
| `47614` | Name format | The standalone character label `Fomorous Hugues` is only `포모러스 휴그`, while other references consistently use `포모러스 휴그(Fomorous Hugues)`. Add the established English pairing. | High |
| `47651` | Name format | The line names the districts `the Quays`, `the Burn`, and `the Upper City`; Korean renders these as `퀘이`, `번`, and `상층 도시` without English pairings. Add source labels without changing the sentence's grouping. | Medium-high |
| `47658` | Meaning / effect format | Japanese specifies a sustained cost of 15% of maximum mana. Korean `마나 15%` does not identify the denominator. Consider `지속 소모: 최대 마나의 15%`. | High |
| `47675` | Meaning / title | `Blood Doge` is rendered `혈통공작`, which reads as a lineage duke and does not preserve the source title. Re-translate the title from `Blood Doge`; do not settle its final Korean form in this review. | High |
| `47696` | Name format | The standalone `Tuatha Deohn!` is rendered `투아사 데온` without English. The same name is paired at `10978`; add `투아사 데온(Tuatha Deohn)`. | High |
| `47712` | Naturalness / meaning | English says `your power is immense`; Korean `그 힘은` is an awkward, unpossessed reference after addressing `그대`. Japanese also describes the addressee as possessing the power. Consider `그대의 힘은 실로 막강하니`. | High |
| `47729` | Meaning | `still weak from battle` means the assassin remains weakened by the fight. Korean `전투의 상처에서 회복하기 전에` adds an injury and changes the condition to recovery. Consider `전투로 약해진 동안` or equivalent. | High |
| `47734` | Terminology / meaning | In this Fatesworn context, capitalized `The Sorrows` is the established magical force, consistently rendered `비탄의 힘(Sorrows)` elsewhere. Korean `슬픔이 말한다` loses that referent; align the term while preserving the sentence. | Medium-high |
| `47741` | Name format | `The Freehold` is a named location, rendered literally as `자유 영지` without its English label. Add `(Freehold)` while retaining the chosen Korean rendering. | Medium |
| `47742` | Name format | The complete place name is `Brunuath Hollow`; Korean pairs only `Brunuath` and leaves `골짜기` outside the name. Consider pairing the full location as `브루누아스 골짜기(Brunuath Hollow)`. | Medium-high |
| `47745` | Name format | `Cemble's` is a named merchant or establishment in this offer, but Korean `셈블` has no English pairing. Add `셈블(Cemble)` without changing the invitation. | High |
| `47749` | Name format | The journal entry names Grunberg and Bolton, but neither Korean rendering includes the English name. Add `그룬버그(Grunberg)` and `볼턴(Bolton)`. | High |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `47508` | Meaning / text type | English and Chinese say `Collections`, while Japanese says `献金` (donations); Korean `수집품` follows the collection reading. Without the UI context, do not decide between collections and contributions. Its existing ledger row is preserved. |
| `47542` | Meaning | For the Alfar warship, English says the crew were `on leave from Mel Senshir`, Japanese says they escaped from Mel Senshir, and Chinese says they sailed from there. Korean says they spent leave there. The source accounts conflict; retain the row pending contextual evidence. |

## Rechecked Findings and Structure

- Existing findings at `47729` and `47742` were rechecked and remain current;
  their historical ledger rows are unchanged. Other previously recorded rows
  in this range were also retained unless the current source supported a new
  finding.
- Three exact-English duplicate groups touch the range: `47509`/`47610`
  (`Healing`), `47531`/`47700` (`Rathir`), and `47558`/`47611`/`47657`
  (`Quest Complete`). Korean matches within all three groups.
- Six entries contain line breaks: `47542`, `47579`, `47658`, `47705`,
  `47707`, and `47721`. Their 44 breaks match across all four languages.
- Runtime or layout markers occur at `47515`, `47617`, `47633`, `47669`, and
  `47731`. Their marker identities and order match across all four languages.
- Of 250 IDs, 194 have indexed asset associations and 56 do not. The index
  contains 200 ID-asset links across 118 assets. Of the 194 newly recorded
  IDs, 138 have indexed asset associations and 56 do not; those new links
  cover 77 assets. Asset associations do not establish per-key speakers or
  playback order.

## Range Result

- The range has 13 correction-candidate IDs and two evidence-limited holds;
  the other 235 IDs have no current finding.
- After appending 194 new IDs, the ledger covers 52,346 of 65,135 unique
  `default` IDs (80.37%), leaving 12,789. Sequential coverage reaches
  `47749`; next is `47750`-`47999`. Of reviewed IDs, 41,981 have indexed
  asset links and 10,365 do not.
- Findings remain proposals requiring separate approval. No translation CSV
  was changed.
