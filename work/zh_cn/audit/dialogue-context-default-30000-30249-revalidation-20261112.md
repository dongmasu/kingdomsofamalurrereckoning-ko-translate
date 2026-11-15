# Sequential `default` Revalidation: IDs `30000`-`30249`

- Date: 2026-11-12.
- Compared all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 58 ledger entries and added 192 IDs. Findings are proposals, not
  approved translation edits.
- No translation CSV, reference asset, or game binary was modified.

## Correction Candidates

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `30013` | Name / terminology | `Valor Arena` is rendered `용맹 투기장`; the established name elsewhere is `용맹의 투기장(Valor Arena)`. Align this reference with the named venue. | High |
| `30061` | Name / format | `Lord Callor` appears as unpaired `칼로르 경`; other references pair the title/name, though the Korean spelling also varies. Add the source pairing here and verify the local spelling against the established entries rather than applying a global replacement. | High |
| `30091` | Name / format | The letter signature `Piers` is rendered `피어스` without English. Add the local pairing, e.g. `피어스(Piers)`, without assuming it is the distinct name `Pearse` used elsewhere. | High |
| `30094` | Term / format | `Children of Dust` is rendered `먼지의 자손들`; another occurrence uses `먼지의 자식들(Children of Dust)`. Review the term consistently while preserving its distinction from `Dustlings`. | Medium-high |
| `30108` | Name / format | The objective `Speak to Cedric` omits the English name pairing. Consider `세드릭(Cedric)과 대화하기`. | High |
| `30112` | Name / format | The named location `Star Camp` is rendered `별 야영지` without English, although the active translation consistently uses `별 야영지(Star Camp)` elsewhere. Add the established pairing. | High |
| `30116` | Terminology | English `lorestone` is rendered `전승석`; the project term is `로어스톤(Lorestone)`. Align this objective with the established game term. | High |
| `30128` | Text type / naturalness | This is a first-person quest-journal entry. Korean ends with conversational `끝내야 해!`, while English and Japanese use journal narration. Recast the final clause as journal prose, e.g. `이 야만적인 행위를 당장 끝내야 한다!` | High |
| `30135` | Meaning | English says the player cleared out Gravehal Keep and made it livable; Japanese and Chinese also describe clearing/cleaning it. Korean specifies `적을 몰아내고`, adding enemies not stated in the sources. Remove that unsupported detail while preserving the restoration. | High |
| `30145` | Speech level / naturalness | Korean `받게` and `자네` use marked `하게체`, while the Japanese is a plain conversational request. Use an unmarked conversational register; do not infer a speaker. | Medium-high |
| `30160` | Title / format | `a master Sagecrafter` is rendered `마법물품 제작의 대가`; the role is distinguished from the `Sagecrafting` skill elsewhere. Consider pairing the profession as `마법물품 제작 장인(Sagecrafter)` and retain Calan Mcleod's name pairing. | Medium-high |
| `30210` | Name / format | `Herus` is the subject of the healing sentence but Korean omits its English pairing. The established name is `헤루스(Herus)`; add the pairing locally. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `30115` | Source / format | English has the unusual abbreviation `Mstr. Gortan`, while Japanese and Chinese use a standard respectful address. Korean retains the English abbreviation in parentheses. Do not silently expand it to `Mr.` or `Master` without resolving the source typo. |
| `30126` | Source / meaning | English calls the object a `seal`, Japanese calls it a ring, and Chinese agrees with English. The description says it is a square cloth, so the exact object label remains uncertain; Korean `인장` follows English and Chinese and is retained. |

## Earlier Findings Rechecked

- Retain the nine existing candidates `30028`, `30034`, `30038`, `30065`,
  `30114`, `30149`, `30153`, `30186`, and `30225`; their source fingerprints
  still match.
- `30018` now reads as a natural, informal offer to use the speaker's
  workbench; no tone correction is proposed.
- The remaining previously recorded rows in this range were rechecked against
  the current four-language sources and remain not flagged.

## Repeated Sources And Structure

- Forty-five exact-English duplicate groups touch this range (735 corpus
  rows). Korean wording matches within each group; Japanese register or
  spelling varies in some groups, including `Thief!` at IDs `30148` and
  `30158`.
- At ID `30125`, English, Chinese, and Korean order the repeated runtime
  markers as `{3}`, `{3}`, `{1}`; Japanese uses `{3}`, `{1}`, `{3}`. Marker
  counts match, and the Korean follows English and Chinese. Preserve the
  Korean order; placeholder order may vary by language.
- Embedded line-break counts match across all four languages in this range.
- No per-key speaker or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

After this range, the ledger contains 39,405 of 65,135 unique IDs, leaving
25,730. Sequential coverage reaches ID `30249`; next: `30250`-`30499`.
