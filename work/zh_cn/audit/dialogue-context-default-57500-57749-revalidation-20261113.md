# Sequential `default` Revalidation: IDs `57500`-`57749`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 64 pre-existing ledger fingerprints; all match. Preserved
  those rows and appended the other 186 IDs in ascending order.
- Fourteen new correction candidates are documented below. Six existing
  candidate/hold rows were rechecked without rewriting their append-only
  ledger records. No new evidence-limited hold was identified.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `57500` | Title / format | The source identifies `Savant Reen`; Korean `사반트 린(Reen)` pairs only the personal name. Pair the complete title and name, e.g. `사반트 린(Savant Reen)`, without resolving the rank's exact institutional meaning. | High |
| `57507` | Title / format | The journal names `Savant Aethan Engar`, but Korean `사반트 에이선 엥가르(Aethan Engar)` omits the English title. Pair the complete title/name as `사반트 에이선 엥가르(Savant Aethan Engar)`; retain the existing journal wording and layout otherwise. | High |
| `57515` | Title / format | `Chronicler, Dorian` is rendered `연대기 작가 도리안` without an English pairing. Consider `연대기 작가 도리안(Chronicler Dorian)` while leaving open whether Chronicler is a formal title or a descriptive role. | Medium-high |
| `57551` | Format / marker order | English and Japanese place the localized markers in the order workbench, potions, alchemy skill; Korean instead orders workbench, alchemy skill, potions (matching Chinese). Preserve all three markers and use a natural Korean order matching the English/Japanese sequence, e.g. `이 {*1연금술 작업대}에서는 {*1물약}을 {*1연금술} 기술로 만들 수 있습니다.` | High |
| `57582` | Meaning / name format | English says `Cynric boys`, Japanese uses a generic group reference, and Chinese says `boys`; current `신릭 가문(Cynric family) 녀석들` adds `family` and its parenthetical does not match the source. Consider a source-matched group form such as `신릭(Cynric) 쪽 녀석들`. | Medium-high |
| `57597` | Title / format | The objective names `Witch Knight Malwyn`, while Korean `마녀 기사 말윈 처치` pairs neither title nor name. Consider `마녀 기사(Witch Knight) 말윈(Malwyn) 처치`. | High |
| `57692` | Name / format | Capitalized `the Mission` is rendered `선교원` without its English form, unlike the established `선교원(The Mission)` at other IDs. Add the pairing without changing the sentence. | High |
| `57703` | Terminology / format | `The Watch` in Rathir is rendered `감시대`, while the same organization is consistently `도시 경비대(City Watch)` at IDs including `57563` and `57746`. Consider `라시르(Rathir)에서는 도시 경비대(City Watch)가 모든 걸 지켜본다.` | High |
| `57704` | Divine title / format | `the Authority's order` refers to the established divine title, rendered `권능(Authority)` elsewhere (e.g. `6908`, `35218`). The epitaph has only `권능의 질서`; add the established English pairing without changing the prayer or date. | High |
| `57706` | Organization / terminology | `Captain of the Watch` is rendered `감시대 대장`, while other references to the Rathir City Watch use `도시 경비대(City Watch)`. If this is the same organization, align the role to `도시 경비대 대장` and pair the organization's name at first mention. | Medium-high |
| `57715` | Meaning / naturalness | `Is the Rite satisfied?` is rendered literally as `의식은 만족스러웠나?`; Japanese (`儀式は成立したか`) and Chinese (`仪式完成了吗`) support asking whether the rite was completed/fulfilled. Consider a natural question such as `의식은 끝났나?` without adding a speaker or ritual detail. | High |
| `57728` | Meaning / title / format | The letter renders `offer you its allegiance and services` as `충성과 힘을 바칠`, changing `services` to `strength`; use `충성과 봉사를 바칠` or an equivalent. Pair the recipient and institution names that currently lack their source forms, including `Calwyn Dyn`, `Dokkalfar Royal Martial Academy`, and `House of Prudence`; retain the existing paired names and Korean line breaks. | High |
| `57742` | Name / format | `Font` is the named magical spring, but the Korean says only `샘`. Add the established pairing `샘(The Font)` while preserving `트렐리스(Trellis)`. | High |
| `57747` | Terminology / accepted correction | The current `올마스터(Universalist)` conflicts with accepted audit decision D-21835, which standardizes this Destiny label as `보편주의자(Universalist)` using the descriptive context at ID `3426`. Apply that accepted form in the editor pass; no CSV change was made here. | High |

## Rechecked Existing Findings

| ID(s) | Current finding and disposition |
| --- | --- |
| `57501` | The capitalized `Pit` remains `구덩이`; the earlier proposal for a clearer Arena waiting-area term remains open because the asset does not establish the exact in-game location distinction. |
| `57517` | `앨러드` remains unpaired and differs from the established `알라드(Alard)` form in the linked quest review. The earlier name-consistency proposal remains supported. |
| `57550` | English, Japanese, and Chinese express the relation between Dame Oleyn's lifetime and the Telling differently. The current Korean is plausible; retain the evidence-limited hold rather than infer the lore meaning. |
| `57574` | The energy-pattern description remains understandable, but the linked asset does not clarify the exact `pattern` referent. Retain the existing hold. |
| `57650` | `내 변호를 해 줬어?` can sound like legal representation for `Did you make a case for me?`; Japanese supports explaining the speaker's position and Chinese supports pleading on their behalf. The earlier naturalness/meaning proposal remains supported, but the exact wording depends on context. |
| `57745` | The exact label `Irion, King of Cups` remains only partly paired as `컵의 왕 이리온(Irion)`. The existing proposal `컵의 왕(King of Cups) 이리온(Irion)` remains supported across its 20 identical-English rows; no duplicate row was changed. |

## Repeated English and Structure

- Forty-six exact-English duplicate groups across the corpus touch this range,
  covering 1,057 rows. Korean wording matches within every group.
- Six rows contain embedded line breaks: `57507`, `57585`, `57608`, `57626`,
  `57662`, and `57728`. English, Chinese, and Korean contain 30 embedded
  breaks each; Japanese contains 32. The only per-ID count difference is
  `57728`, where Japanese has two additional breaks; Korean matches English
  and Chinese.
- Marker identities and order match except at `57551`, where Korean's
  localized display markers differ in order from English and Japanese, and
  `57708`, where Japanese alone has one additional `{LINE_SPACE}` marker.
  Korean at `57708` matches English and Chinese; preserve that layout.
- Of 250 IDs, 204 have indexed asset associations, represented by 210
  ID-to-asset links across 140 assets; 46 have none. Of 186 newly recorded
  IDs, 140 are linked through 146 links across 85 assets, and 46 are
  unlinked. Asset associations do not establish per-key speakers or playback
  order.

## Range Result

- All 64 pre-existing ledger rows remain unchanged; 186 new IDs were appended
  in ascending order.
- The ledger covers 59,690 of 65,135 unique `default` IDs (91.64%), leaving
  5,445 unrecorded IDs. Sequential coverage reaches `57749`; next is
  `57750`-`57999`.
- The fourteen candidates are proposals, not approval for a broad edit.
  Rechecked findings at existing IDs remain documented without rewriting
  their append-only ledger rows. No translation CSV was changed.

## Verification

- Regenerated the quest-asset index and both catalogs; all three reproduce
  byte-for-byte with `build_dialogue_context_index.py --check`.
- The full review-ledger fingerprint/status check passes for all 59,690 IDs.
- All nine `test_build_dialogue_context_index.py` tests pass. The audit-file
  diff check is clean.
- A repository-wide `git diff --check` still reports trailing whitespace on
  pre-existing changed localization CSV lines. Those translation CSVs were
  outside this pass and were not modified.
