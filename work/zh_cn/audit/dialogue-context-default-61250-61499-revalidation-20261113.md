# Sequential `default` Revalidation: IDs `61250`-`61499`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 71 pre-existing ledger fingerprints and preserved those rows.
  Appended the remaining 179 IDs in ascending order.
- Seven new correction candidates and one evidence-limited hold are
  recorded. Six existing candidates and one existing hold were rechecked
  without rewriting their append-only rows.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `61287` | Meaning / naturalness | In a wartime return-home context, `boys and girls` means young people rather than children. Japanese says `若者たち`; Chinese also refers to the younger generation. Consider `이 빌어먹을 전쟁이 어서 끝났으면 좋겠어. 우리 젊은이들이 집으로 돌아오길 기다리고 있어.` | Medium-high |
| `61394` | Format | The display label `Chaos Weapons` is styled inside `{*1...}`, but its English pairing is outside the marker as `{*1혼돈 무기}(Chaos Weapons)`. Keep the complete localized label and pairing together inside the display marker: `{*1혼돈 무기(Chaos Weapons)}`. Other marker identities and ordering match. | High |
| `61424` | Meaning | English `I knew him from...` and Japanese/Chinese leave the source of the acquaintance unfinished. Korean `예전부터 알던 사이지만` adds that they have known each other for a long time. Preserve the hesitation without specifying duration, e.g. `그의 이름은 엘빈 메로크(Elbin Meroch)야. 그와는 어디서 알게 됐냐면… 아니, 그건 중요하지 않아.` | Medium-high |
| `61447` | Naturalness | `이번 사업을 실패하게 두지 않겠어` makes `venture` sound specifically like a business and is awkward in this vow. Japanese frames it as doing this for Adessa; Chinese says this undertaking/adventure must not fail. Consider `그래도 아데사(Adessa)의 돔에 맹세코, 이번 일을 실패하게 두지 않겠어.` | Medium |
| `61463` | Meaning | `family friends` means friends of or close to the family, not `가족과 친한 친구들` (“family and close friends”). Japanese says `家族ぐるみの友人`; Chinese says relatives and friends. Consider `라시르(Rathir)에 있는 가족의 친구들을 만나러 가던 길이었는데… 그러다 이런 일이 벌어졌어.` | High |
| `61478` | Naturalness | `tighten armor` is rendered literally as `갑옷을 조이는 일`, which is unnatural in this equipment-maintenance context; Japanese uses `防具を鍛える`. Consider `드디어 검을 갈고 갑옷을 손보는 일 말고도 할 일이 생겼어.` | Medium-high |
| `61489` | Naturalness | `전승에서 좋은 활약을 하게` is stiff and reads like an instruction rather than the well-wishing in English and Japanese. Consider `이번 전승(The Telling)도 잘되길 바라.` | Medium-high |

## Rechecked Existing Findings

These IDs already have append-only ledger rows; the rows and dispositions
remain unchanged.

| ID | Current finding and disposition |
| ---: | --- |
| `61254` | `요점만 말하게` remains marked 하게체 against Japanese's direct conversational imperative; retain the existing speech-level candidate. |
| `61266` | The same story's name is `Nuala Ignas` in other English references and consistently `イグナス` in Japanese; retain the existing name-consistency candidate. |
| `61325` | In the military context, `my brothers` means fellow soldiers; the same asset uses `전우` for fallen comrades. Retain the existing terminology/naturalness candidate. |
| `61393` | English and Chinese ask why the addressee cannot do it, while Japanese asks why they do not do it themselves. Context does not resolve inability versus unwillingness; retain the existing hold. |
| `61419` | The living Banshaen are to be killed/defeated, not destroyed as objects; the lowercase English pairing is also inconsistent. Retain the existing candidate. |
| `61429` | `페이(Fae) 동굴(Fae Hollow)` repeats the species name and pairs only part of the complete English location term; retain the existing format candidate. |
| `61479` | This is a completed first-person journal record, not conversational reported speech. Retain the existing text-type candidate. |

## Evidence-Limited Hold

| ID | Dimension | Question and disposition |
| ---: | --- | --- |
| `61467` | Meaning | English `sent to the wall` and Japanese `ウォールへ送られた` indicate “sent to the Wall,” while Chinese says the prisoners were sent to prison. Korean follows the English/Japanese `성벽`. Without the setting-specific referent, do not change it to a prison or another destination. |

## Repeated English and Structure

- Fifty-five exact-English duplicate groups touch this range, comprising 57
  range IDs and 694 corpus rows. Korean wording matches within every group
  except `Die, mortal!` (`54719`, `61482`). Their Japanese lines also differ
  in register (`死になさい！` / `死ね！`), and the Korean polite/rough
  distinction follows that evidence; retain both.
- Three rows contain seven embedded line breaks in each language:
  `61257`, `61379`, and `61394`. Per-row counts and blank-paragraph
  structure match across English, Japanese, Chinese, and Korean.
- Runtime/display/layout marker identities and order match across all rows.
  At `61394`, the issue is specifically that the English pairing falls
  outside the localized display marker, not a marker-order discrepancy.
- Of 250 IDs, 202 have indexed asset associations (205 links across 127
  assets), and 48 have none. Of the 179 new IDs, 131 are linked (134 links
  across 72 assets), and 48 are unlinked. Asset associations do not establish
  an individual speaker or playback order.

## Range Result

- All 71 pre-existing ledger rows remain unchanged; 179 new IDs are appended
  in ascending order. Seven correction candidates and one new hold are
  recorded. Six existing candidates and one existing hold were rechecked.
- The ledger covers 62,499 of 65,135 unique `default` IDs (95.95%), leaving
  2,636 unrecorded. Sequential coverage reaches `61499`; next is
  `61500`-`61749`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `61250`-`61499`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- All 62,499 ledger fingerprints validate, including the 71 rechecked and
  179 newly appended rows.
- The regenerated quest-asset index and catalogs reproduce exactly; related
  tests and the CRLF-aware audit diff check pass.
