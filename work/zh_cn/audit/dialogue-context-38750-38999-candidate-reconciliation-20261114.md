# Candidate Reconciliation: IDs `38750`-`38999`

- Date: 2026-11-14.
- Rechecked all 27 in-range candidate IDs against English, Japanese, Chinese,
  active Korean, and linked reviews. Asset associations were not used to infer
  individual speakers or playback order.
- `38893` was already reconciled with `36982`; it is not counted twice.
  The other 26 candidates in this interval are newly reconciled.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `38761` | Corrected | Removed the repeated thought construction while retaining the concern about surviving the coming trials. |
| `38764` | Corrected | Paired the complete unit label as `니스카루 폭군(Niskaru Tyrant)`. |
| `38767` | Corrected | Added the complete label pairing `모투스 광부(Motus Miner)`. |
| `38770` | Confirmed | The previously applied `네 권리를 쟁취해라` matches English, Japanese, and Chinese. |
| `38771` | Confirmed | The previously applied `찾은 우상` matches the parallel found-item labels. |
| `38779` | Corrected | Paired the full title and name as `린더링 경(Lord Linderling)`. |
| `38799` | Corrected; hold retained | Paired `Stormbringer` and the `Hanged Men` crew using established Korean names. The Gallows End / “gallows end” wordplay remains unresolved and was not rewritten. |
| `38802` | Corrected | Recast the awkward “sound lessons” clause and aligned the casual Korean register with Japanese; no speaker identity was inferred. |
| `38803` | Corrected | Replaced literal `위에서는` with `대놓고`, supported by Chinese `明面上`; retained the trade, betrayal, and threat. |
| `38818` | Confirmed | The previously applied `먼지의 아이(Child of Dust)` matches the established epithet. |
| `38821` | Corrected | Paired the complete source title and name as `에어머 경(Lord Airmer)`. |
| `38835` | Corrected | Standardized the objective to `가스크(Gask) 처치하기`. |
| `38843` | Corrected | Added the complete title pairing `하수도의 까치들(Magpies of the Sewer)`. |
| `38850` | Corrected | Removed the redundant “avoid and flee” construction while retaining torment and certain death. |
| `38867` | Confirmed with linked correction | The existing `무슨 일이냐, 필멸자여?` is supported by Japanese and Chinese. Its three exact-English duplicates were aligned to it. |
| `38873` | Confirmed | The previously applied `그가 사라진 게 차라리 잘된 일이야` preserves the dismissive judgment. |
| `38878` | Corrected | Added English pairings for both Thera Adwoldas and Neri Conyr without changing their relationship. |
| `38891` | Confirmed | The previously applied `대장 브로건(Brogan)` pairs only the name present in the source. |
| `38893` | Previously reconciled | The two-bug label already matches exact-English duplicate `36982`. |
| `38921` | Confirmed | The previously applied race term `경유 지점` avoids the security meaning of `검문 지점`. |
| `38932` | Corrected | Distinguished source `Coln` from `Culn` as `콜른(Coln)`, consistent with `default:28112` and the FFQ17 review. |
| `38945` | Corrected | Paired the named historical event as `최초의 맹공(The First Onslaught)`. |
| `38949` | Corrected with linked correction | Paired the established facility name `장교 회관(Officer's Hall)` and aligned exact-English duplicate `36564`. |
| `38965` | Corrected | Recast the redundant armor-condition wording in consistent conversational Korean. |
| `38966` | Corrected with linked consistency edits | Standardized `Weod` to `웨오드(Weod)`, matching Japanese and the established Korean form. Related rows were checked together. |
| `38975` | Corrected with linked correction | Added `하일라란족(Hylarans)` and aligned exact-English duplicate poem `30467`, preserving all five lines and four logical line breaks. |
| `38986` | Corrected | Replaced the unsupported “Skoria family” relationship with the neutral label `스코리아 광부(Skoria Miner)`. |

## Linked Consistency Groups

- `Yes, mortal?`: IDs `6857`, `9609`, `38867`, and `41174` now all read `무슨 일이냐, 필멸자여?`. Japanese asks what is the matter, and Chinese agrees.
- `Officer's Hall`: exact-English IDs `36564` and `38949` now both read `장교 회관(Officer's Hall)`, consistent with the facility references elsewhere.
- Farrara's poem: exact-English IDs `30467` and `38975` now use identical Korean text and the same `Hylarans` pairing.
- `Weod`: IDs `7770`, `19715`, `33472`, `38966`, and `46018` were compared together. The active form is now consistently `웨오드`; missing name pairings were added at `38966` and `46018`. `19715` and `33472` were previously reconciled and are not recounted.

All 64 exact-English duplicate groups touching this range were checked.
Outside the aligned groups above, the only Korean differences are `Later.`
(`31385`, `38762`, `48513`) and `Come to Telogrus.` (`37711`, `38993`).
Japanese also distinguishes the register/style within both groups, so those
translations were not mechanically unified.

The separate hold on the gallows wordplay at `38799` remains open. Other
evidence-limited holds in the range remain unchanged; no uncertain referent,
speaker, or scene was inferred.

## Verification

- All 27 in-range candidates were dispositioned. Twenty-six are newly counted;
  `38893` was counted with `36982` in an earlier pass. Cumulative candidate
  reconciliation is 2,463 / 4,015 (61.34%), with 1,552 remaining.
- Twenty-seven Korean rows changed: 19 in-range rows and eight linked rows
  (`6857`, `9609`, `19715`, `30467`, `33472`, `36564`, `41174`, `46018`).
  Only those rows' ledger fingerprints were refreshed.
- Exact-English duplicate checks confirmed identical Korean for the three
  linked groups above. The poem's five-line structure remains intact.
- The CSV retains its 65,135 ordered IDs, UTF-8 BOM, and CRLF record endings.
  The current embedded-line-break inventory is 71,840 CRLF, 242 LF-only, and
  no bare CR.
- Full-ledger fingerprints, index/catalog reproduction, 11 CSV-preservation
  tests, nine dialogue-context tests, and the CRLF-aware diff check passed.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.
