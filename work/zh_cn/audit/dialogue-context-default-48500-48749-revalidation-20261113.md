# Sequential `default` Revalidation: IDs `48500`-`48749`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 77 previously recorded four-language fingerprints; all match.
  Added the other 173 IDs to the review ledger.
- Recorded ten current correction candidates and seven evidence-limited
  holds; 233 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records; this
report records the current revalidation.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `48516` | Objective format | `Kill Racinon` is rendered as the bare objective `라시논(Racinon) 처치`. Align it with the established action form: `라시논(Racinon) 처치하기`. | High |
| `48535` | Objective format | `Shoot the rat` is a bare imperative (`쥐를 쏴`). Use the established objective-label form, such as `쥐 쏘기`. | Medium-high |
| `48564` | Naturalness / referent | The source says Aery thinks the villagers are unaware of her presence. Korean `우린 자기 존재를 모른다고 생각하겠지만` leaves the subject of `자기` unclear. Consider `그녀는 우리가 자기 존재를 모른다고 생각하겠지만, 우린 분명 알고 있어.` This retains the earlier SQ77 finding. | High |
| `48621` | Name format | The standalone title `The Archsage` is rendered only as `대현자`, unlike the established paired title elsewhere. Consider `대현자(Archsage)`. | Medium-high |
| `48638` | Name format / terminology | The source names `The Font`, for which the established form is `샘(The Font)`. Add the pairing at first mention: `샘(The Font)은 ...`. | High |
| `48659` | Terminology / consistency | The list names the same materials reviewed in the Gravehal restoration group. `Beachstone` and `Emberwood` vary across rows; the earlier cross-row review supports `비치스톤(Beachstone)` and `엠버우드(Emberwood)`. Align this list with those forms; retain `돛천` for `sailcloth`. | High |
| `48675` | Terminology / name format | `Deep Gloam` is a named historical era and is already tracked as a term-pairing candidate. Consider `깊은 황혼(Deep Gloam) 시대` rather than leaving the proper term unpaired. | Medium-high |
| `48700` | Name format | The named destination/person `Gryamar` is rendered only as `그리야마르`. Add the source form: `그리야마르(Gryamar)를 찾아가.` | High |
| `48709` | Title format | `Hymn of Penitence` is a named hymn/title, rendered only as `참회의 찬가`. Consider `참회의 찬가(Hymn of Penitence)`. | Medium-high |
| `48741` | Name/title order | The source titles are `Ambassador Keen` and `Ambassador Brenner`; the English parentheticals currently reverse each title and name. Consider `킨 대사(Ambassador Keen)` and `브레너 대사(Ambassador Brenner)`, preserving the rest of the journal entry. | High |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `48512` | Speech level | Korean asks politely (`뭔가요?`) while Japanese is plain. The exact addressee and dialogue stage are unmapped; retain the earlier hold rather than normalizing register from the asset association alone. |
| `48542` | Meaning / referent | English calls the pendant a `sister` to the Mitharan standing stones, while Japanese says it may be related to them and Chinese also uses a sister metaphor. `짝` may imply a more exact pair than the evidence supports. Retain it pending clearer context. |
| `48545` | Address / speech level | Korean uses `자네` in an otherwise informal line; Japanese has a plain imperative and does not establish the speaker/addressee relationship. The asset does not map this key to an individual speaker. Defer any register change. |
| `48572` | Speech level | Korean uses `-오` and `사반트여`, while Japanese is plain and English is neutral. The handler does not identify the individual speaker or relationship; retain the earlier hold. |
| `48630` | Speech level | Korean uses polite `도와주세요!`, while Japanese is plain. The asset has no per-key speaker mapping, so retain the earlier hold rather than treating this alone as a voice error. |
| `48642` | Name / referent | English capitalizes `Vault`, but Japanese and Chinese use generic treasure-room/vault wording. The row does not establish a named location; retain `금고` without adding a proper-name pairing. |
| `48720` | Name / referent | English says `a Sacred Passage`, which can describe a type of passage, while Japanese sets the phrase off as a named expression. The row does not establish whether it is a proper name; retain `신성한 통로` without forcing a title gloss. |

## Rechecked Findings and Structure

- Four existing candidate records were rechecked and retained: `48564`,
  `48638`, `48659`, and `48675`. Three existing evidence-limited holds were
  retained: `48512`, `48572`, and `48630`. Their historical ledger rows were
  not rewritten.
- The current pass also recorded a candidate for previously reviewed IDs
  `48516` and `48741`, and a hold for `48720`. Their existing ledger rows
  remain historical records and were not rewritten.
- Two exact-English duplicate groups touch the range: `48538` / `48661`
  (`Emaire`) and `48617` / `48636` (`Farewell.`). Korean matches within both
  groups.
- No entry in the range contains an embedded line break. Runtime/display
  marker identities and order match across all four languages; localized
  marker payloads and spacing differ at `48593` and `48696`.
- Of 250 IDs, 213 have indexed asset associations, represented by 219
  ID-asset links across 135 assets; 37 have no indexed asset. Of the 173
  newly recorded IDs, 136 have indexed associations, represented by 141
  links across 76 assets. Asset links do not establish per-key speakers or
  playback order.

## Range Result

- The range has ten current correction-candidate IDs and seven
  evidence-limited holds; 233 IDs have no current finding.
- After appending 173 new IDs, the ledger covers 53,061 of 65,135 unique
  `default` IDs (81.46%), leaving 12,074. Sequential coverage reaches
  `48749`; next is `48750`-`48999`. The current ledger records 42,501 IDs
  with indexed asset links and 10,560 without.
- Findings remain proposals requiring separate approval. No translation CSV
  was changed.
- Catalog and index reproduction, all 53,061 ledger fingerprints, nine
  related tests, and the line-ending-aware diff check passed.
