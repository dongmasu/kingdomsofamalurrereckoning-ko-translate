# Candidate Reconciliation: IDs `44000`-`44249`

- Date: 2026-11-15.
- Rechecked the 28 candidates recorded by the sequential range report against
  English, Japanese, Chinese, the active Korean CSV, and earlier decisions.
  English anchors meaning; Japanese is the primary reference for voice and
  register; Chinese is supporting evidence.
- The range ledger currently marks 22 IDs as candidates; six additional
  findings cleared in earlier reviews were reopened by the four-language
  sequential comparison. Historical ledger rows were preserved.
- `44006` was already reconciled as a linked candidate in the `36500`-`36749`
  pass and is not counted again. The Sandstone Villa terminology at `44143`
  was checked against the established linked group.

## Candidate Decisions

| IDs | Result |
| --- | --- |
| `44002`, `44005`, `44014`, `44024`, `44033`, `44036`, `44083`, `44085`, `44149`, `44155`, `44164`, `44167`, `44189`, `44203`, `44214`, `44217` | The supported name pairings, meaning, and objective/title forms are already present in the active Korean CSV. Retained without another edit. |
| `44006` | Previously reconciled with the full `Adept Ignas` pairing; no duplicate count or edit. |
| `44008`, `44009`, `44063`, `44097`, `44147`, `44168` | Standalone names and rank/name labels already include their supported English forms. Retained. |
| `44073` | Replaced the unsupported 하오체 and clarified the archive reference: `기록은 내가 받아 서고의 보물들과 함께 보관할게. 여기라면 안전할 거야.` Japanese uses plain conversational forms throughout. |
| `44118` | Replaced the isolated 하게체 command with `무기를 가까이 둬.`, matching the direct Japanese imperative and English instruction without adding a speaker attribution. |
| `44143` | Retained `샌드스톤 저택(Sandstone Villa) 추가 개량하기`, consistent with the linked house-upgrade terminology group and objective form. |
| `44215` | Replaced the marked 하오체 with `이걸 받아. 별것 아니지만, 고맙다는 뜻을 담아 우리가 줄 수 있는 거야.` English and Japanese give a direct offer; Chinese also presents it as an offer, not archaic Korean formality. |
| `44247` | Retained `숨어 지낼`, which naturally conveys the seclusion in English and Japanese without over-specifying the reason. |

## Linked and Held Findings

- `44014` has the same English, Japanese, and Chinese title as `27284`;
  both Korean rows now read `위대한 장군(The Great General)`.
- `44143` was checked against the established Sandstone Villa group
  (`10464`, `10866`, `11536`, `49479`, `60389`), which uses `개량`; objective
  text uses `-하기`.
- The two evidence-limited questions from the sequential report remain
  separate from the 28 candidates. `44223` remains held because the sources
  differ on whether “You made it” means arrival or success. The former
  `44238` duplicate hold is cleared: Japanese differs from `27910`, and the
  Korean questions preserve that distinction.
- No speaker or dialogue order was inferred from asset associations.

## Changes and Verification

- Korean rows `44073`, `44118`, and `44215` changed using
  `tools/replace_text_preserve_eol.py`.
- Refreshed only the four-language source fingerprints for those three IDs;
  the existing review-record order and other fields were preserved.
- Candidate reconciliation is `2,981 / 4,028` (74.01%), with 1,047
  remaining. This pass reconciled 27 new unique candidates; `44006` was
  already counted in an earlier linked-candidate pass.
- Validation covers the active CSV's 65,135 ordered records, UTF-8 BOM, and
  preserved mixed line endings; the full ledger fingerprints, index/catalog
  reproducibility checks, CSV-preservation tests, dialogue-context tests,
  and CRLF-aware diff check are recorded in the accompanying manifest.
- No immutable source CSV, extracted asset, or game binary was changed.
  No commit was made.
