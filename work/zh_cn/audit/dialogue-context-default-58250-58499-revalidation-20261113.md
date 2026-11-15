# Sequential `default` Revalidation: IDs `58250`-`58499`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 56 pre-existing ledger fingerprints and preserved those rows.
  Added the other 194 IDs in ascending order.
- Ten new-row correction candidates and nine new-row evidence-limited
  questions are recorded. Six existing candidates were rechecked; findings
  at existing IDs remain report-only, and no existing ledger row was changed.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `58270` | Meaning / naturalness | Korean says Anella spent months preparing the cave itself, which is awkward and changes the likely action. Japanese says she prepared to enter the cave. Consider `이 동굴에 침입할 준비를 하는 데 몇 달을 보냈다` while retaining the staff and Tuatha-guard relations. | High |
| `58298` | Name / format | The insult and three-break letter layout are retained, but the signature `Osun Ifwin` is rendered only as `오선 이프윈`. Pair the name as `오선 이프윈(Osun Ifwin)` without changing the insult's force or line breaks. | High |
| `58342` | Name / format | `Lykos` is a named person but appears only as `라이코스`. Add `(Lykos)` while retaining the description of the prepared rat bait. | High |
| `58362` | Name / format | The grave label names `Selan Graw`, but Korean `셀란 그로의 묘` omits the English form. Consider `셀란 그로(Selan Graw)의 묘`. | High |
| `58375` | Meaning | `Choleric` means hot-tempered, not merely impatient. Japanese `怒りっぽい` and Chinese `暴躁` support a phrase such as `화를 잘 내고 불만도 많은 사람이야`. | High |
| `58383` | Name / format | The item description identifies Archsage Alandra, but Korean `대현자 알란드라` has no source pairing. Consider `대현자 알란드라(Archsage Alandra)` while retaining the robes and favored-student meaning. | High |
| `58434` | Name / format | The English name is `Galen Gwalchmai`, but the Korean parenthetical contains only `(Gwalchmai)`. Pair the full name as `갈렌 그월흐마이(Galen Gwalchmai)` and retain the blank final figures and signatures. | High |
| `58446` | Name / format | The standalone place label `Cook Islands` is rendered only as `쿡 제도`. Add `(Cook Islands)` without inferring further setting context. | Medium-high |
| `58473` | Name / format | The capitalized venue `Gladiator Pit` appears only as `검투사 투기장`. Consider `검투사 투기장(Gladiator Pit)` if this is the named venue, rather than a generic arena description. | Medium |
| `58499` | Name / format | The signature identifies `Savant Aethan Engar`; Korean pairs the personal name but omits the rank from `(Aethan Engar)`. Consider `사반트 에이선 엥가르(Savant Aethan Engar)` while preserving the eight-break letter layout and rank-promotion note. | High |

## Rechecked Existing Findings

| ID | Current finding and disposition |
| ---: | --- |
| `58329` | The named event `Ambush of Gornak Ree` remains unpaired in the Korean narrative. The earlier pairing candidate remains supported; do not infer whether Gornak Ree is a person or place. |
| `58337` | The current `질서` reads as social order, but English `Order?` and Japanese `順番?` refer to sequence. The earlier `순서?` correction candidate remains supported. |
| `58365` | `Ratofer's charter` remains rendered `인가서`; the related document references and Japanese `勅許状` support the existing terminology-consistency candidate for `칙허장`. |
| `58374` | The player response `돈을 내겠어` still differs from parallel `I'll pay you` responses rendered `돈을 낼게`. The existing consistency candidate remains supported; preserve this row's distinct runtime token. |
| `58408` | The current `조제법은 어떻게 됐지?` already uses the proposed preferred term `조제법`. No correction to this ID is proposed; preserve the historical ledger row and record this recheck here. |
| `58414` | `life essence` remains `생명력`, unlike the established `생명 정수` wording at the cited parallel rows. The existing terminology candidate remains supported. |

## Additional Report-Only Findings at Existing IDs

These newly surfaced findings concern IDs already present in the ledger. Keep
their existing rows unchanged; these notes do not authorize translation edits.

| ID | Dimension | Finding and disposition |
| ---: | --- | --- |
| `58252` | Meaning | English `brightest`, Japanese `利口` (clever), and Chinese plumage/appearance wording differ. Korean follows Japanese; do not force a plumage or intelligence interpretation without lore context. |
| `58409` | Name / format | `Maun` is named repeatedly but appears without English pairing. Consider `마운(Maun)` at the first mention; preserve the three-clan key distribution and destination. |
| `58462` | Meaning | English and Chinese say to throw the note in the Quarry; Japanese says to deliver it there. Korean follows English/Chinese. Keep the action unresolved. |
| `58497` | Meaning | English says the Windstones were `played`; Japanese says `used`, and Chinese says `touched`. Korean's `연주해` may over-specify a musical action; retain pending the in-game interaction context. |

The corrections previously accepted for `58313`, `58319`, `58437`, `58451`,
and `58474` are present in the current Korean text and agree with the
English/Japanese checks. ID `58259` now uses the neutral greeting `안녕하세요`;
the older archaic-greeting concern does not apply to the current text.

## Evidence-Limited Questions

| ID | Question and disposition |
| ---: | --- |
| `58267` | English `physical-based resistance` does not precisely identify the stat category. Korean says physical-damage resistance and preserves 75%; retain pending mechanic/UI context. |
| `58358` | English can mean the man or his proposal was laughed off the council; Japanese makes the proposal the subject and Chinese makes the man the subject. Korean follows Japanese; retain pending context. |
| `58403` | The poem's `high-spear` and `blood-pall and fasting` imagery is obscure and the language versions differ. Korean preserves the eight-line English/Chinese layout; do not guess the lore terms. |
| `58419` | The five-line verse's relation between the two sides, the evils they put out, and the outcomes is unclear and differs by language. Preserve the current five-line Korean rather than resolving the source ambiguity. |
| `58423` | English `is he gone?` can mean departed or dead; Japanese and Chinese explicitly ask whether Dead Kel died, while Korean asks whether he left. Hold for quest context. |
| `58429` | English `updated by notes` is malformed; Japanese and Chinese indicate organizing/updating notes. Korean's `기록을 정리한 다음` is plausible but the intended English remains uncertain. |
| `58480` | The source instructions conflict: progress is not saved, then returning to the title screen is described as an attempt to save despite progress loss. Korean preserves that conflict; do not silently repair it. |
| `58482` | Capitalized `Delve` may be a setting-specific practice; Japanese instead describes bearing sorrow, while Chinese and Korean use a delving/learning sense. Keep the current wording pending lore context. |
| `58490` | English `tragedian` can refer to a tragic playwright or actor; Japanese supports Korean `비극 작가`, while Chinese reads it as an actor. Retain the current reading provisionally. |

## Repeated English and Structure

- Fifty-eight exact-English duplicate groups touch this range across the full
  corpus, covering 1,311 rows. Korean wording matches within every group
  except `44307` / `47264` / `58360` (`Be on your way.`). Japanese also
  distinguishes `44307` (`さようなら`) from `47264` and `58360`
  (`あっちへ行け`); Korean follows that distinction.
- Six rows contain embedded line breaks: `58298` (3), `58344` (4),
  `58387` (1), `58403` (7), `58419` (4), and `58499` (8). English, Chinese,
  and Korean each contain 27 embedded breaks; Japanese contains 26 because
  `58403` has one fewer break. The other per-ID counts match.
- Runtime, display, and layout marker identities and order match across the
  range. At `58334`, English, Japanese, and Korean preserve the source's
  unclosed parenthetical; Chinese closes it. This source discrepancy is not
  silently repaired.
- Of 250 IDs, 193 have indexed asset associations, represented by 196
  ID-to-asset links across 118 assets; 57 have none. Of the 194 newly
  recorded IDs, 137 are linked through 140 links across 70 assets, and 57
  are unlinked. Asset associations do not establish per-key speakers or
  playback order.

## Range Result

- The 56 pre-existing ledger rows remain unchanged; 194 new IDs were appended
  in ascending order. Ten new-row correction candidates and nine
  evidence-limited questions are recorded. Four additional findings at
  existing IDs (`58252`, `58409`, `58462`, `58497`) remain report-only. Six
  existing candidates were rechecked; five remain supported, while the
  current text at `58408` already reflects its proposed term.
- The ledger covers 60,260 of 65,135 unique `default` IDs (92.52%), leaving
  4,875 unrecorded IDs. Sequential coverage reaches `58499`; next is
  `58500`-`58749`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `58250`-`58499`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- The four-language fingerprint check passes for all 60,260 ledger IDs.
- The generated quest-asset index and catalogs reproduce byte-for-byte;
  all nine `test_build_dialogue_context_index.py` tests pass.
- The audit-only, CRLF-aware diff check is clean. Translation CSVs were not
  modified.
