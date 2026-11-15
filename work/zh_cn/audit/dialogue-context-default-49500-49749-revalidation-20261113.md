# Sequential `default` Revalidation: IDs `49500`-`49749`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 77 previously recorded four-language fingerprints; all match.
  Added the other 173 IDs to the review ledger.
- Recorded 12 current correction-candidate IDs and 13 evidence-limited
  holds; 225 IDs have no current finding. Findings are proposals, not
  approval to edit translation CSVs.
- No translation CSV, immutable source CSV, or extracted game asset was
  changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `49510` | Name/title format | The Korean book entry gives the author and translated title but omits the English forms of both `Hadrus Llewellyn` and `Sedeas, the Crystal Weir`; its title order also obscures the source title. Consider `하드루스 르웰린(Hadrus Llewellyn)의 『세데아스, 수정 방벽(Sedeas, the Crystal Weir)』`. | High |
| `49530` | Named-item format | The father's greatsword is correctly rendered as a greatsword and the Gladiator Pit as `검투사 투기장`, but its named title appears only as `신사의 호의`. Add `Gentleman's Favor` to the title for traceability. | High |
| `49540` | Name/title format | `Green the Healer` is a character name with a role, but Korean gives only `치유사 그린`. Pair the complete source name/title, e.g. `치유사 그린(Green the Healer)`. | High |
| `49565` | Rank format | `Savants` is the established formal Scholia Arcana rank `사반트`, but this occurrence omits the English label. Pair it as `사반트들(Savants)` without changing the rank meaning. | High |
| `49608` | Naturalness | All five localized wrappers are retained and Korean follows English wrapper order, but `선별된 능력이 ... 어울립니다` is an awkward rendering of preselected abilities suited to the chosen Destiny. Rephrase the sentence while preserving all five wrapper identities and their current order. | Medium-high |
| `49616` | Proper-name format | The requested items and locations are present, and `Hierophant` is correctly `대사제`; however, the Wyvyrn-Gifre family name lacks its English form. Pair it as `와이번-기프르(Wyvyrn-Gifre) 가문` while retaining the ring and location relationships. | High |
| `49631` | Proper-name format | The armor recipient and patroness are identifiable, and the bailiff/reeve roles are represented, but `Haeste Aedring` and `Lady Gudwulf` have no English pairings. Add the complete names/titles, e.g. `해스테 에이드링(Haeste Aedring)` and `구드울프 여사(Lady Gudwulf)`. | High |
| `49652` | Meaning | The current `그들에게 검을 겨눈다면` says to aim a blade at the prisoners, reversing the likely protective exception in this threat. English and the other locale readings support the listener raising a blade to defend them; restore wording such as `네가 감히 검을 들어 그들을 지키려 든다면 모를까`. This also matches the previously accepted source-based correction, which the current cell no longer contains. | High |
| `49692` | Name/title format | `Witchknight Anira` is rendered `마녀 기사 아니라(Anira)`: the English title is omitted, and the spaced Korean sequence can read as the conjunction `아니라`. Recheck the established Korean name form and pair the complete title/name consistently across its other occurrences. | High |
| `49702` | Terminology / name format | The same entity is consistently rendered elsewhere as `흐느끼는 눈(Crying Eyes)`, while this row uses unpaired `크라잉 아이즈`. Use the established form and retain the arrival/explanation meaning supported by Japanese. | High |
| `49718` | Naturalness / effect format | The 120 Poison Damage and five-second duration are preserved, but the Korean tooltip is an unfinished fragment (`...추가`) and reads awkwardly. Consider `연막탄(Smoke Bomb)에 5초 동안 독 피해 120을 추가합니다.` | High |
| `49731` | Terminology / naturalness | `Solemn Bell` is already established in this corpus as `장엄한 종(Solemn Bell)`, not `엄숙의 종`; Japanese and Chinese also support a meeting/auditorium sense for `assembly hall`, whereas `회당` can imply a synagogue. Use the established bell name and consider `옛 집회장` for the location description. | High |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `49547` | Title | `High Faemage` is intelligibly rendered as `페이 대마법사`, but the exact formal title is not established by the row; retain the question rather than inventing a rank equivalent. |
| `49569` | Title | `Ancient of War` is paired with `전쟁의 고대자`; English, Japanese, and Chinese do not settle the canonical Korean title. |
| `49575` | Meaning / pronoun | English shifts from collective `We` to singular `my knowledge`, and Japanese also shifts between collective and singular forms. Korean's singular giver is plausible, but the source-number contrast remains unresolved. |
| `49577` | Rank/title | `Primos` is paired and the riddle knowledge is conveyed, but whether it is a personal name, rank, or office remains unclear. |
| `49640` | Lore term | Capitalized `Deep Slumber` may name a rite or state; Japanese explicitly calls it a ritual, while English and Chinese do not fully settle that reading. |
| `49648` | Speech level | The Korean uses `물어보게`, which sounds markedly old-fashioned compared with the Japanese casual request. The linked asset contains multiple NPCs and does not map this key to a speaker; do not attribute a voice or choose a register without stronger evidence. |
| `49651` | Meaning / lore context | The exact relation between the “fortunate,” the spire with the temple, and those cast into darkness is not resolved by the isolated sentence. |
| `49679` | Title / punctuation | `Find the "Prophet," Augur` does not establish whether Augur is a name/title, an apposition, or part of a larger expression. |
| `49696` | Meaning | English ends with the incomplete phrase `ready to give`; Japanese suggests devotion, but the object is absent. Korean's `내 모든 걸 바칠` supplies an interpretation that cannot be confirmed from this row alone. |
| `49697` | Proper name | `Gloamthicket` is consistently paired with a Korean transliteration, but its canonical Korean place-name form and intended compound meaning remain unsettled. |
| `49708` | Meaning / source conflict | English omits the predicate after `Phasmer does`; Korean and Chinese infer a curse, while Japanese contrasts the addressee and Phasmer. Keep the predicate unresolved. |
| `49738` | Lore terms | The wall, key, door, and four votives are retained, but `the Sorrows` and `votives` may refer to setting-specific entities or objects. Do not normalize `슬픔의 집` or `봉헌물` without resolving those references. |
| `49743` | Rank/title | `Neophyte` is rendered as `수련자`, but its formal-rank status and canonical Korean form remain unresolved. |

## Rechecked Findings and Structure

- The 77 pre-existing ledger fingerprints match the current four-language
  sources. Their existing ledger records were not overwritten.
- Current candidate/hold totals are defined by this revalidation report.
  Existing ledger status fields remain historical and unchanged, so counting
  the range's old `overall` values will not reproduce these current totals.
- The exact-English duplicate group `49639`/`49724` (`Cape Solace`) has the
  same Korean translation in both rows and uses the established
  `케이프 솔라스(Cape Solace)` form.
- Two entries contain embedded line breaks: `49709` and `49745`, each with
  three breaks. Counts match across all four languages. Korean embedded
  separators remain CRLF.
- ID `49608` contains five `{*1...}` wrappers. Korean wrapper order matches
  English; Japanese and Chinese place the game title before the abilities
  label. This locale-specific order difference does not justify reordering
  the Korean markers.
- Of 250 IDs, 194 have indexed asset associations, represented by 197
  ID-asset links across 138 assets; 56 IDs have no indexed asset. Of the 173
  newly recorded IDs, 117 have indexed associations, represented by 119
  links across 72 assets; 56 have no indexed asset. Asset links do not
  establish per-key speakers or playback order.
- Prior questions about `Sagecrafter/Sagecraft`, Mitharan equipment,
  Scholia Arcana/Adept, Hierophant, Praetorian, Circlet, and Cape Solace
  were checked against current translations and accepted terminology
  records. At `49583`, the House of Sorrows/Saturnyn forms also match the
  accepted forms; the distinct `the Sorrows` referent at `49738` remains
  held. Only the unresolved or presently mismatched items above remain
  findings.

## Range Result

- The range has 12 current correction-candidate IDs and 13
  evidence-limited holds; 225 IDs have no current finding.
- After appending 173 new IDs, the ledger covers 53,797 of 65,135 unique
  `default` IDs (82.59%), leaving 11,338. Sequential coverage reaches
  `49749`; next is `49750`-`49999`.
- Findings remain proposals requiring separate approval. No translation
  CSV was changed.
