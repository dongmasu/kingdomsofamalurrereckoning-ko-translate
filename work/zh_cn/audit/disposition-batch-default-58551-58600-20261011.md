# Disposition Batch: `default` IDs 58551-58600

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- No accepted corrections, 32 `not an issue` IDs, and 18 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not the
  Japanese-language reference.

## Accepted Corrections

No translation CSV cells were changed. The Korean follows the English-led
reading where sources differ at 58570 and 58578; unresolved terms and context
remain uncertain.

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17692 | 58553 | Safe passage and the plan to speak with Esha are clear; Glowlode Cavern and Esha spellings vary across locale phonetics. |
| D-17693 | 58555 | `Testament` is a capitalized faction/order name; Korean `베일렌 결사` differs from other Testament renderings and needs corpus-wide alignment. |
| D-17694 | 58556 | Resurrection sequence is retained; English/Japanese/Chinese say the Well/泉/井, while Korean expands this to `영혼의 샘`, whose lore status is not established in this row. |
| D-17695 | 58557 | Beer origin, namesake, inaugural Victory Games win, and current number-one rank are retained; Voss Deviant, Wolds, Erathell, and Victory Games forms remain provisional. |
| D-17696 | 58558 | Korean follows English/Japanese that the addressee is one of the same group; Chinese instead says the addressee can only rely on themself. The group and Shieldring are context-dependent. |
| D-17697 | 58559 | The concise kill objective is retained; Leanashe may be a name or creature type, and Chinese translates it descriptively. |
| D-17698 | 58560 | The Cradle fragment and speaker's claim of entitlement are retained; Japanese shifts toward self-blame while English/Chinese support the entitlement reading. |
| D-17699 | 58563 | All 59 lines and the fishing/dance bargain are retained; the poem's joke, Halter/Halt source inconsistency, and stanza punctuation need context. |
| D-17700 | 58568 | `[DO NOT USE]` is preserved as `[사용 금지]`; whether the Pierce DoT label is strictly internal or visible remains unverified. |
| D-17701 | 58575 | Protective effect and Dren's attack are retained; whether `Valor` is the named House/faction or a generic virtue/item modifier remains open. |
| D-17702 | 58576 | Recipe layout and 2/2/1 quantities are preserved; botanical/reagent names and quantity formatting vary across locales. |
| D-17703 | 58579 | Gallows End is a named place, but active Korean rows use competing literal and transliterated forms. |
| D-17704 | 58582 | Stranded traveler meaning is clear; Faelands is capitalized and its canonical Korean region form varies across the corpus. |
| D-17705 | 58585 | Standalone Savant label may be a formal rank or generic learned person; locale interpretations differ. |
| D-17706 | 58586 | Route through the dungeons to reach the tower is retained per English; Japanese and Chinese read the courtyard/dungeon route differently, and Hillared/House Gastyr terms need context. |
| D-17707 | 58596 | Four distributed items and one merchant handoff to Helmgard Keep are preserved; the antecedent/type of `them` and the merchant's exact role need adjacent context. |
| D-17708 | 58599 | The Mairu/Ethene hymn and six Korean/English line breaks are retained; Japanese and Chinese each have five breaks and compress the opening, while “golden notes” remains metaphorical. |
| D-17709 | 58600 | Literal `Artifacts and Castles` label is retained; standalone UI/category context is unavailable to establish whether `Artifacts` is a named category. |

## Not an Issue

Decision D-17710 records these 32 IDs: 58551-58552, 58554, 58561-58562,
58564-58567, 58569-58574, 58577-58578, 58580-58581, 58583-58584,
58587-58595, and 58597-58598. They preserve evident meaning,
voice/register, structure, and values. At 58554 Korean leaves the unnamed
“such things” generic; at 58570 it follows English and Chinese over the
Japanese reversal; at 58578 it preserves English/Japanese sarcasm over the
positive Chinese reading.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 58551-58600 once
  and in identical ascending order; each full default resource contains
  65,135 records.
- ID 58563 retains 58 embedded newline characters (59 lines) in all locales.
  ID 58576 retains four embedded newlines and the 2/2/1 recipe quantities.
  ID 58599 has six embedded newlines in English and Korean, versus five in
  Japanese and Chinese; Korean follows English's lineation.
- The `+5%` Elemental Resistance value at 58593 and rank/edition values at
  58557 are preserved. No runtime-marker discrepancy was found.
- Reconciled the source-keyed historical prompts for IDs 58550-58649.
  Applicable terminology, name, and context questions remain above; later
  prompts remain for their own batches.
- The UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
  pre-existing bare-LF endings are unchanged. The active CSV SHA-256 remains
  `a16f77dba0bb6c5795ce71e9c258537368aa09653b668e8cde86fd599ab98f53`.
- The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-58551/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `a16f77dba0bb6c5795ce71e9c258537368aa09653b668e8cde86fd599ab98f53`).

D-17692-D-17709 record 18 uncertain findings; D-17710 records the remaining
32 `not an issue` IDs. Direct register totals: 1,713 accepted, 12,546
`not an issue`, and 11,117 uncertain (25,376 total); next D-17711.

Resume at `default` ID 58601; 6,534 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
