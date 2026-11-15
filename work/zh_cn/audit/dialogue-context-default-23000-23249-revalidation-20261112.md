# Sequential `default` Revalidation: IDs `23000`-`23249`

- Date: 2026-11-12.
- Compared all 250 active Korean entries with same-ID English, Japanese, and
  Chinese, including existing findings, terminology decisions, and layout.
- Rechecked 67 existing ledger records and added 183 previously unrecorded
  IDs. Ten new candidate IDs and five evidence-limited holds were recorded;
  four existing candidates were retained.
- No translation CSV, immutable source, extracted asset, or localization
  binary changed.

## Correction Candidates

These are review findings, not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `23013` | Format / name pairing | `요정-페이(Fae) 전쟁(Elf-Fae War)` repeats the Fae pairing inside the paired full event title. Consider `요정-페이 전쟁(Elf-Fae War)`, retaining the distinction between Elf and Fae. | Medium-high |
| `23026` | Objective form | `Talk to the Vox Victorium` is rendered as `복스 빅토리움(Vox Victorium)과 대화`. Compare the parallel objective `Talk to Lyenna` at `23125`; consider the consistent action form `복스 빅토리움(Vox Victorium)과 대화하기`. | High |
| `23066` | Format / terminology | In the localized wrapper, `힘` and `재주` are unpaired while only `마법` includes `(Sorcery)`. Consider pairing all three established attributes as `힘(Might)`, `재주(Finesse)`, and `마법(Sorcery)`; preserve each wrapper and the requirement meaning. | High |
| `23074` | Objective form | `Escape Akara-Tor` is rendered as the bare noun `아카라-토르(Akara-Tor) 탈출`. Consider `아카라-토르(Akara-Tor)에서 탈출하기`, preserving the named destination and action. | High |
| `23078` | Speech level | Japanese uses casual/plain endings (`見たでしょう`, `儀式ね`), while Korean shifts to polite `-습니다/-죠`. Consider plain conversational endings if this row is spoken dialogue; no individual speaker is inferred from asset association. | Medium |
| `23089` | Naturalness / meaning | English says `rent the bed`; Japanese says `部屋を借りたい` (“rent a room”). Korean's literal `침대를 빌릴게` is awkward for this inn choice. Consider `방을 빌릴게`, retaining the gold-cost token exactly. | Medium-high |
| `23151` | Naturalness | `여섯 위대한 신` is an awkward modifier order for `six great deities`; Japanese supports the count as six deities. Consider `위대한 여섯 신(수호신)` while retaining the following reference to the Six Patrons. | High |
| `23185` | Format / title pairing | Korean's 78 logical line breaks match English and Japanese; Chinese has 77. Preserve the Korean layout. The embedded headings `두렉의 도끼` and `새벽 찬가` omit their English titles; consider `두렉의 도끼(The Durek Axe)` and `새벽 찬가(Hymn to Dawn)` without changing stanza breaks. | High |
| `23213` | Naturalness | `나도 이제 여기서 나가고 싶을지 몰라` is an awkward rendering of `I might want to leave`. Consider `아카라(Akara)도 떠났으니 나도 이제 떠나고 싶을지 몰라`, preserving the tentative intent and the question about ship space. | Medium |
| `23237` | Terminology / name pairing | `Kollassae` is rendered `콜로세` without pairing, while the project's established Korean form is `콜로사이`. Consider `콜로사이(Kollassae)` here, preserving this source's exact spelling in the pairing; verify the source's `Kollassae` spelling separately from the established `Kollossae` form. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `23000` | Meaning | English `was lost on a raid` can mean killed or missing. Japanese says he died, Chinese says he went missing, and Korean follows the latter. Do not resolve his fate from this row alone. |
| `23042` | Meaning | The source phrase `his gods sought him to be a monster` and the referent of `them` are unclear. Japanese and Chinese differ in nuance; retain the current interpretation provisionally rather than assert what the gods did. |
| `23137` | Meaning / title | `Faehunter's Assemblage` could be a collection/set or an assembly; Japanese describes clothing, while Chinese also suggests a gathering. Korean `집결지` may be too location-specific, but the row alone does not establish the intended item or title. |
| `23197` | Meaning | English says `Frost Soldier`, while Japanese adds `Bitter` (`ビター・フロスト兵`); Chinese agrees with the shorter English form. Retain `서리 병사` without adding the Japanese-only modifier pending context. |
| `23200` | Meaning / number | English `Travelers` is plural, Japanese transliterates the plural, Chinese uses a generic singular/plural-neutral term, and Korean `트래블러(Travelers)` is morphologically singular. The row does not establish whether this is a group name or a generic label. |

## Rechecked Findings And Structure

- Existing candidates at `23116`, `23156`, `23164`, and `23199` remain open.
  Their prior reports and proposed directions are retained; this pass does not
  authorize edits.
- The range touches 55 exact-English duplicate groups (1,365 corpus rows).
  Korean matches within all but two groups. At `23033`, the Korean casual /
  honorific difference matches Japanese `神々は優しいのよ` /
  `神々は我々に優しい`; at `23169`, `오?` matches Japanese `おお？`.
  These are source-supported differences, not errors to harmonize mechanically.
- All four languages have matching per-row logical line-break counts except
  `23185`, where Chinese has one fewer break; Korean matches English and
  Japanese. Runtime/control-token sequences match throughout the range.
- `23009` retains the established person-name form `베럿 애스커(Baret Asker)`;
  the separate family/drink form `아스커` is not applied to this personal name.
- Asset links, NPC symbols, handler counts, row adjacency, and numeric ID
  sequence were not treated as proof of an individual speaker or playback
  order.

After recording this range, the ledger contains 34,202 of 65,135 IDs
(52.51%), leaving 30,933. Sequential coverage reaches ID `23249`; the next
range is `23250`-`23499`.
