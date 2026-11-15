# Sequential `default` Revalidation: IDs `52750`-`52999`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 59 existing ledger fingerprints; all match and those rows
  remain unchanged. Added the other 191 IDs in ascending order.
- Recorded eight current correction candidates and five evidence-limited
  holds; 237 IDs have no current finding. These groups do not overlap.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing candidates were rechecked against the current four-language
rows and their earlier context reports.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `52754` | Name consistency | The English name is `Lyra`, Japanese uses `ライラ`, and the current Korean is `리라(Lyra)`. The `SQ144` context report finds the same Lyra Vogard name rendered both `리라` and `라이라`, with Japanese supporting `라이라`. Consider `라이라(Lyra)` here; this asset does not establish who speaks the line. | High |
| `52774` | Meaning | English connects the city's `stature` to the next sentence's higher skyline, and Chinese explicitly says its height proves the claim. Korean `도시의 위용` loses that vertical-height link. Consider `우리 도시의 높이가 그 증거지` while preserving the skyline comparison. | High |
| `52797` | Terminology | `Lost Surveyor` is `실종된 측량사`, while the related Idylla sewer-inspection entries use `측량사`, `조사원`, and `조사관`. The existing asset report recommends a consistent context-appropriate role such as `조사관`; consider `실종된 조사관`. | High |
| `52812` | UI-label consistency | This `Found Brooch` label is `찾은 브로치`, while the parallel `Found Idol` and `Found Hammer` labels use `발견한 우상` and `망치 발견`. Align the three short found-item labels to one natural construction, for example `[아이템] 발견`. | Medium-high |
| `52826` | Format / terminology | `Find three Lorestones` is `로어스톤 세 개 찾기`, omitting the English pairing used for this established term elsewhere. Consider `로어스톤(Lorestone) 세 개 찾기`. | High |
| `52920` | Terminology / naturalness | The named `Notices of Duty` are rendered `임무 통지서`, while the established item wording is `복무 소집 통지서`; `Officer's Hall` is also rendered `장교 전당` rather than the established `장교 회관`. Consider `복무 소집 통지서(Notices of Duty)` and `장교 회관(Officer's Hall)`, preserving the journal's completed-delivery meaning. | High |
| `52967` | Naturalness | `수작은 좋지만` is an awkward literal rendering of the sarcastic `Nice try` before the warning not to swindle the village Warden. Consider a more idiomatic rebuke such as `속이려는 수작은 그만 부리는 게 좋아`; retain the warning and following conversational sentences. | Medium-high |
| `52998` | Naturalness | `이 망할 국경 통행 명부 말이야. 명부 내용이 맞질 않아` repeats `명부` and sounds cumbersome. Consider `이 망할 국경 통행 명부 말이야. 앞뒤가 맞질 않아`, retaining the speaker's frustration and the mismatch claim. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `52805` | Source conflict | English, Chinese, and Korean say “You may go. I will report to the Watch,” but the Japanese row is unrelated dialogue about wine and Marion. This is a cross-locale source conflict, not evidence for changing Korean; retain the Korean text pending a source-key check. |
| `52883` | Terminology / referent | `Warden` may mean a guard or a keeper/official able to heal the Fae girl. Japanese says `衛士`, Chinese says `典狱长`, and Korean says `감시관`. The row alone does not settle the role; retain the current term. |
| `52924` | Meaning / referent | The repeated English `it` and capitalized `the Sorrows` lack their antecedent here. Japanese refers to reaching the power of sorrow, while Chinese makes the first object a key and treats the Sorrows as beings. Retain both Korean references without guessing what must be delivered or reached. |
| `52945` | Meaning / source quality | The English sequence note is malformed (`Alsers; portion`, `Bertsa's portion`, and `Hreid's portion`). Korean preserves the three direction sets and their ordering, but the source punctuation and exact relation are not clean enough to justify a rewrite. The prior uncertainty remains. |
| `52955` | Terminology / place context | `hidden wing` is rendered `숨겨진 별관`; Japanese says a hidden area and Chinese uses “wing.” The row does not establish whether it is an architectural wing or a separate annex. Retain the current objective pending map or scene evidence. |

## Rechecked Findings and Structure

- Five pre-existing candidates remain supported: `52754`, `52797`, `52812`,
  `52826`, and `52920`. The two prior holds, `52945` and `52955`, remain
  unresolved. Their existing ledger rows and fingerprints were not changed.
- Fifty-nine exact-English duplicate groups across the corpus touch this
  range, each covering one target ID in the range. Korean wording matches
  within every group; no duplicate translation mismatch was found.
- One entry, `52964`, contains one embedded line break in each language. The
  Korean separator is CRLF while the three references use LF; the break
  location and two-line structure match and are preserved.
- The `{LINE_LEFT}`, display-wrapper, and `{LINE_SPACE}` sequence at `52956`
  matches across all four languages after normalizing localized wrapper text.
  ID `52900` has the same trailing backslash in all four sources and Korean;
  it is not a Korean-only corruption.
- Of 250 IDs, 208 have indexed asset associations, represented by 211 links
  across 128 assets; 42 have no indexed asset. Of the 191 new IDs, 149 have
  indexed associations (152 links across 80 assets) and 42 do not. Asset
  links do not establish per-key speaker or playback order.

## Range Result

- This range has eight current correction-candidate IDs and five
  evidence-limited holds; 237 IDs have no current finding.
- After adding 191 IDs, the ledger covers 56,178 of 65,135 unique `default`
  IDs (86.25%), leaving 8,957. Sequential coverage reaches `52999`; next is
  `53000`-`53249`.
- Findings remain proposals requiring separate approval. No translation CSV
  was changed.
