# Candidate Reconciliation: IDs `39250`-`39499`

- Date: 2026-11-14.
- Rechecked all 17 in-range candidates against English, Japanese, Chinese,
  active Korean, and relevant existing reviews. English anchored meaning;
  Japanese guided voice and register; Chinese was supporting evidence.
- No speaker identity or playback order was inferred from asset associations.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `39275` | Confirmed | `Mel Aglir` is already paired as `멜 아글리르(Mel Aglir)`. All 18 exact-source occurrences use the same Korean. |
| `39276` | Confirmed with linked duplicate | `그나루스(Gnarus)` is already paired; exact-source duplicate `53046` matches. |
| `39277` | Corrected | Standardized `Jollienne` to the established `졸리엔(Jollienne)` at `53656`; `Imas` is also paired. |
| `39388` | Confirmed | `가스티르(Gastyr)` is already paired; `Ansilla` remains a distinct name. |
| `39396` | Confirmed | The current `이 대장간에서` correctly describes dying at the forge, not behind the building. |
| `39398` | Confirmed | `육신이 있으니까` retains the playful contrast between mortals and Fae without implying body shape or weight. No speaker identity was inferred. |
| `39421` | Confirmed | `응보의 구체(Sphere of Retribution)` already pairs the complete item name. |
| `39442` | Corrected | Paired the complete item name as `비사라네의 방벽(Bisarane's Barrier)`. |
| `39444` | Confirmed | `셀레의 연금술 상점(Sele's Emporium Alchemical)` already pairs the establishment name and preserves the casual greeting. |
| `39455` | Corrected | Paired the complete book title as `이디라의 부상에 관한 기록(An Account of Idylla Rising)`. |
| `39460` | Confirmed | The ordinary phrase `하층 터널` has no unnecessary English gloss; the direction to find Nuer is intact. |
| `39461` | Confirmed | The current `이 비열한 범죄에 휘말려` avoids the stronger, unsupported scapegoat reading. |
| `39465` | Confirmed; separate hold retained | `킨 대사(Ambassador Keen)` has the established title order. The exact meaning of `Worship Circle` remains unresolved and was not guessed. |
| `39466` | Confirmed | `옥티엔(Octienne)` is paired and the critical tone remains intact. |
| `39481` | Corrected with linked duplicate | Added `이사(Ysa)` and applied the same poem text to exact-source duplicate `40183`; all four verse lines and their three embedded breaks remain intact. |
| `39482` | Confirmed | `스노멜트 고개(Snowmelt Pass)` already pairs the named location in the three-place list. |
| `39497` | Corrected | Paired the complete title as `리케이오스의 학장(Master of the Lykeios)` while retaining the plain declarative voice. |

## Linked Consistency Groups

- `Mel Aglir`: 18 rows have identical English, Japanese, and Chinese sources
  and already use identical Korean.
- `Gnarus`: IDs `39276` and `53046` have identical sources and Korean.
- `Jollienne`: ID `39277` now uses the same established spelling and English
  pairing as `53656`.
- The four-language poem at IDs `39481` and `40183` now has identical Korean,
  including the same four-line layout.

Previously recorded evidence-limited questions remain open, including the
`Worship Circle` reading at `39465`; no uncertain place, speaker, or scene was
inferred.

This pass reopens the earlier application notes that treated the `Ysa`
pairing at `39481` as optional and left `Master of the Lykeios` unpaired at
`39497`. The current source names Ysa directly and presents the full office
as a title; both are now paired. Earlier notes remain historical records.

## Verification

- All 17 in-range candidates were dispositioned and newly counted. Candidate
  reconciliation is now 2,503 / 4,015 (62.34%), with 1,512 remaining.
- Five candidate rows were corrected; six Korean rows changed after aligning
  linked poem ID `40183`. Only those six IDs' ledger fingerprints were
  refreshed.
- The active CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,840 CRLF
  sequences, 242 LF-only separators, and no bare CR. The poem's four lines
  and three embedded line breaks are identical at both IDs.
- All 65,135 ledger fingerprints validate. Index/catalog reproducibility,
  11 CSV-preservation tests, nine dialogue-context tests, and the CRLF-aware
  diff check passed.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.
