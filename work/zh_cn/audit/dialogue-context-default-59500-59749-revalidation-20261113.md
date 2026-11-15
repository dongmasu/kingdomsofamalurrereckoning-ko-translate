# Sequential `default` Revalidation: IDs `59500`-`59749`

- Date: 2026-11-13.
- Compared all 250 active Korean rows against English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 69 pre-existing ledger fingerprints and preserved those rows.
  Appended the remaining 181 IDs in ascending order.
- Fourteen new-row correction candidates and one new evidence-limited hold
  are recorded. Nine existing candidates and two existing holds were
  rechecked without rewriting their append-only ledger rows. Three findings
  at existing IDs are report-only: one prior candidate does not match its
  cited ID, one is already reflected in the current translation, and one new
  candidate concerns a row already recorded in the ledger.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `59595` | Name / format | `Keep Courtyard` is a named destination in this quest entry; Korean has only `성채 안뜰`. Consider `성채 안뜰(Keep Courtyard)`. | Medium-high |
| `59601` | Name / format | The inscription names Colad of the Alfar Army, but Korean pairs only the army and Tywili. Add `(Colad)` to `콜라드`; the English source itself spells the rank `Liuetenant`, so do not silently normalize or reproduce that typo as a Korean rank annotation. | Medium |
| `59604` | Meaning | `Emerald wing` is rendered `에메랄드 관`, which ordinarily means an emerald coffin. Japanese `棟` supports an architectural wing/building section. Consider `에메랄드 동(Emerald Wing)` or the established location form. | High |
| `59606` | Name / format | The standalone location `Balor's Crossing` is `발러의 교차로` without its English name. Pair the complete location name. | Medium |
| `59610` | Name / format | `the Isles` is a named part of the city, parallel to the already paired `Walls`; Korean leaves it as `군도`. Consider `군도(Isles)`. | Medium-high |
| `59613` | Name / format | `Lord Callor` is not paired, while `Terenia` is. Consider `콜러 경(Lord Callor)` and retain the distinct Guardians of the Cradle reference. | Medium-high |
| `59635` | Name / format | The standalone item label `Frosthammer Fragment` is only `서리망치 파편`. Pair the complete item name. | Medium |
| `59649` | Title / format | The standalone title `The Pledge to Action` is only `실천의 서약`. Pair the full title. | Medium |
| `59679` | Meaning / terminology | In a duel, `second` is the attendant/helper for a duelist, not simply a witness. Japanese `介添人` supports that role; Korean `입회인` can imply only an observer. Use a Korean term that preserves the duel-assistant role. | Medium |
| `59685` | Name / format | The source epithet is `Tirnoch the Merciful`; Korean translates `자비로운` but pairs only `(Tirnoch)`. Consider the full unit `자비로운 티르노크(Tirnoch the Merciful)`. | Medium |
| `59705` | Naturalness / terminology | `젖은기침` is an unnatural calque for `wet cough`; the medical symptom is a productive/phlegmy cough. The adjacent `갑상샘종이 자라고` is also stiff. Consider `가래 끓는 기침` and a natural rendering such as `갑상샘종이 점점 커지고 진물이 끊임없이 흐르는 병변이 생긴다.` | High |
| `59730` | Name / format | The standalone name `Rane` is transliterated as `레인` without `(Rane)`. Pair it if this is the intended character-name label. | Medium |
| `59735` | Name / format | `Faeblades of House Sorrows Found` leaves both the named house and weapon type unpaired. Consider `비탄의 집(House of Sorrows) 페이블레이드(Faeblades) 발견`. | Medium-high |
| `59746` | Meaning | The English control instruction says to hold and release the Daggers attack button. Japanese explicitly says the dagger attack button; Korean's `단검 버튼` omits the attack action. Consider `단검 공격 버튼을 길게 눌렀다 놓으면...`. | High |
| `59747` | Name / format | The standalone character label `Kim` is rendered `킴` without its English form. Consider `킴(Kim)`. | Medium |

## Rechecked Existing Findings

| ID | Current finding and disposition |
| ---: | --- |
| `59551` | The Ticneri name-consistency candidate remains supported: the current `티크네리` differs from the established `틱네리(Ticneri)` form. The disputed trophy material remains unspecified; do not change `일부` to flesh without stronger evidence. |
| `59562` | The objective-style candidate remains supported. This parallel `Terminate the [family] family` objective uses `처단`, unlike the established concise action form; align with the other family objectives as `[가문명] 처단하기`. |
| `59576` | Withdraw the prior urn-terminology candidate for this ID: the current English row is `Return to Berenike`, and the Korean `베레니케에게 돌아가기` contains none of the urn terminology cited by that finding. Preserve the old ledger row; record this correction as report-only. |
| `59579` | The Myrinne name candidate remains supported: English/Japanese identify Myrinne, while Korean uses unpaired `미린` rather than the proposed consistent `미린느(Myrinne)`. |
| `59600` | The candidate remains supported as a quest-failure/status string, not an NPC speech-level judgment. Replace the polite ending with the established plain journal style, e.g. `...더는 완료할 수 없다.` |
| `59641` | The meaning/naturalness candidate remains supported. Clarify that discovery of the surveillance could make the speaker's quarry suspicious, while preserving the hesitation: `네가 감시당한다는 걸 눈치채면 안 됐어. 내 표적이... 수상하게 여길 수도 있으니까.` |
| `59642` | The rescue-quest terminology candidate remains supported: the linked quest uses `도적` for `bandits`, while this row says `산적`. Align the term without changing the contemptuous tone. |
| `59710` | The `Hermit Smith` candidate remains supported. The objective `Talk to the Hermit Smith` is only `은둔자 대장장이와 대화`; pair the full role label and retain objective style. |
| `59725` | The prior spell-casting-sentry terminology candidate is already reflected in the current text: `마법사 보초` matches the proposed standard. Record the resolution here; do not rewrite the historical ledger row. |

## Additional Report-Only Finding at an Existing ID

| ID | Dimension | Finding and disposition |
| ---: | --- | --- |
| `59659` | Title / format | The standalone title `Strange Maiden` is only `기묘한 처녀`. Pair the title without inferring a specific character identity. The ID was already present in the ledger, so preserve its existing row and record this candidate only here. |

The existing holds at `59556` and `59689` remain unresolved: Japanese and
Korean differ in register, but asset association does not establish the
speaker or conversational stage. Do not normalize their register by guessing.

## Evidence-Limited Question

| ID | Question and disposition |
| ---: | --- |
| `59722` | The English and Chinese headings say `PART VI` / `第六部分`, while Japanese says `第4部`; Korean uses `제6부`, matching English and Chinese. Record the cross-language source conflict and retain the current text pending game-context evidence. |

## Repeated English and Structure

- Fifty-five exact-English duplicate groups across the corpus touch this
  range, comprising 1,070 rows; 58 IDs in this range participate.
- Korean differs within one group: `25595`, `37899`, `37948`, and `59623`.
  Japanese marks only `37899` as polite (`確認しに来てください`), and Korean
  likewise uses `보세요` there while the other three use informal endings.
  This is a supported register difference, not a consistency error.
- `59501`, `59527`, `59604`, `59611`, `59722`, and `59745` contain embedded
  line breaks. Their per-ID break counts match across all four languages
  (29, 1, 1, 11, 9, and 8 respectively).
- Runtime, display, and layout marker identities and order match across all
  four languages; localized display payloads differ as expected.
- Of 250 IDs, 201 have indexed asset associations, represented by 203 links
  across 135 assets; 49 have none. Of the 181 newly recorded IDs, 132 are
  linked through 133 links across 71 assets, and 49 are unlinked. Asset
  associations do not establish an individual speaker or playback order.

## Range Result

- All 69 pre-existing ledger rows remain unchanged; 181 new IDs are appended
  in ascending order. Fourteen new-row candidates and one new hold are
  recorded. Nine existing candidates and two holds were rechecked; three
  findings at existing IDs remain report-only.
- The ledger covers 61,178 of 65,135 unique `default` IDs (93.92%), leaving
  3,957 unrecorded. Sequential coverage reaches `59749`; next is
  `59750`-`59999`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `59500`-`59749`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- All 69 pre-existing and 181 newly recorded four-language fingerprints
  match the current sources.
- The regenerated quest-asset index and catalogs, all nine related tests, and
  the CRLF-aware audit diff check passed after the ledger/catalog update.
