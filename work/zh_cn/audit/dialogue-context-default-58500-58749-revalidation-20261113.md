# Sequential `default` Revalidation: IDs `58500`-`58749`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 53 pre-existing ledger fingerprints and preserved those rows.
  Added the other 197 IDs in ascending order.
- Seven new-row correction candidates and three evidence-limited questions
  are recorded. Six existing candidates and three existing holds were
  rechecked without rewriting their ledger rows. Two findings at existing
  IDs remain report-only.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `58508` | Name / format | English names `Witchknight Anira`, but Korean pairs only `아니라(Anira)` and leaves `마녀 기사` unpaired. Pair the complete title and name as `마녀 기사 아니라(Witchknight Anira)` without changing the surrounding label. | High |
| `58515` | Meaning / naturalness | `the red` is deliberately opaque in English and Japanese (`赤き名`), while Chinese reads it as the Red Gang. Korean `붉은 이름을 위해서라면 모두 똑같았어` is literal and awkward. Rephrase naturally while preserving the ambiguity; do not identify a faction or add an unstated action without context. | Medium |
| `58576` | Format | The three reagent lines inconsistently space the amount: `하늘꽃(Sky Blossom)(2)` lacks the space used in `일 페탈(Eel Petal) (2)` and `혈근초(Bloodroot) (1)`. Use `하늘꽃(Sky Blossom) (2)` and preserve the four-break list layout. | High |
| `58643` | Naturalness / name format | `뼈의 마을인 본 타운(Bone Town)` translates the place name and then repeats it in English, making the sentence redundant. Retain the reason for the name and use the paired place name once, e.g. `본 타운(Bone Town)이라고 불러.` | High |
| `58692` | Format | The English plant description and Chinese both end with a period, but Korean `거미줄 근처에서 자라는 식물` has none. Add the terminal punctuation if this description follows the project's sentence-punctuation convention. | Medium |
| `58712` | Name / format | `Damalroc` is rendered only as `다말록`; add its English pairing, e.g. `다말록(Damalroc)`. Keep the existing `엘더스트(The Eldest)` pairing and imperative tone. | High |
| `58719` | Meaning / naturalness | `믿을 만한 무언가` can mean a trustworthy object, while the English and Japanese describe something the speaker can believe in. Consider `내가 믿고 의지할 수 있는 무언가` without changing the rhetorical question. | Medium-high |

## Rechecked Existing Findings

| ID | Current finding and disposition |
| ---: | --- |
| `58639` | The existing register candidate remains supported: English is a direct expression of thanks, while Korean uses archaic `감사하오`. Preserve the prior ledger disposition. |
| `58640` | The existing terminology candidate remains supported: `Child of Dust` is rendered `먼지의 자식`, while the same phrase is `먼지의 자손` at `7715` and `38818`. Keep it distinct from `Dustling`; preserve the candidate row. |
| `58680` | The existing text-type candidate remains supported: English and Japanese read as quest-journal text, while Korean uses spoken endings (`기다려야겠어`, `이야기해 줄 거야`). Recast as journal prose if approved; do not rewrite the existing row. |
| `58687` | The existing name-consistency candidate remains supported: Korean varies `고틀리프` / `고트리프` for `Gautliffe` and omits the English pairing here. The military mapping for `Private` remains separately unresolved; do not infer `일병` versus `이병`. |
| `58717` | The existing speech-level candidate remains supported: one line shifts from formal `신들이여 감사합니다` to conversational `진이 빠졌어요` / `아니었죠`, while Japanese uses plain style throughout. Preserve the line-level finding without attributing it to a specific speaker. |
| `58749` | The existing terminology candidate remains supported: the same `Minor Alchemist's Art Potion` is `하급 연금술사의 기술 물약` at `27747`, `29218`, `42851`, and `43969`, but this row uses `하급 연금술사의 기예 물약`. |

## Additional Report-Only Findings at Existing IDs

These newly surfaced findings concern IDs already present in the ledger. Keep
their existing rows unchanged; these notes do not authorize translation edits.

| ID | Dimension | Finding and disposition |
| ---: | --- | --- |
| `58632` | Name / format | The item `Rose` is capitalized in English but appears only as `장미` in Korean, unlike the paired names in the same sentence. Consider `장미(Rose)` if this is the named item; leave the existing ledger row unchanged. |
| `58670` | Name / format | `Sacred Passage` is rendered `성스러운 통로` without the English form. Consider `성스러운 통로(Sacred Passage)` if this is the named location; leave the existing ledger row unchanged. |

## Evidence-Limited Questions

| ID | Question and disposition |
| ---: | --- |
| `58599` | English and Korean have six embedded line breaks, while Japanese and Chinese have five. The verse boundaries differ around the first stanza; preserve the current Korean layout until the intended poem structure is established. |
| `58667` | English `Votive of Stone`, Japanese `stone ornament`, and Chinese `stone votive` point to different object readings. Hold `돌 봉헌물` pending the item/lore context. |
| `58685` | English `Alfar Ally` can be a person or affiliation; Japanese reads `Alfar soldier`, while Chinese says `elf ally`. Hold the exact role and Korean wording rather than guessing. |

The existing holds at `58570`, `58603`, and `58743` were rechecked and remain
unchanged: the translations differ across the language references or depend
on dialogue context not established by the available asset association.

## Repeated English and Structure

- Sixty-seven exact-English duplicate groups across the full corpus touch this
  range, covering 1,354 rows. Korean wording differs only in the group
  containing `22820`, `27084`, `32613`, `54185`, and `58537`; the Japanese
  wording at `32613` also differs, supporting the Korean distinction.
- Nine rows contain embedded line breaks: `58507` (1), `58514` (1),
  `58563` (58), `58576` (4), `58599` (6), `58630` (3), `58644` (1),
  `58664` (5), and `58716` (4). Totals are 83/82/82/83 breaks across
  English/Japanese/Chinese/Korean; the only per-ID count difference is
  `58599`, where Japanese and Chinese each have one fewer break.
- At `58669`, Japanese places the localized `{*1...}` marker before `{1}`,
  while English, Chinese, and Korean place `{1}` first. All markers are
  present; Korean's marker sequence matches English and Chinese. Preserve
  language-specific ordering rather than treating the Japanese order as a
  Korean defect.
- Of 250 IDs, 176 have indexed asset associations, represented by 183
  ID-to-asset links across 116 assets; 74 have none. Of the 197 newly
  recorded IDs, 123 are linked through 129 links across 72 assets, and 74
  are unlinked. Asset associations do not establish per-key speakers or
  playback order.

## Range Result

- All 53 pre-existing ledger rows remain unchanged; 197 new IDs were appended
  in ascending order. Seven new-row correction candidates and three
  evidence-limited questions are recorded. Findings at existing IDs
  `58632` and `58670` remain report-only.
- The ledger covers 60,457 of 65,135 unique `default` IDs (92.82%), leaving
  4,678 unrecorded IDs. Sequential coverage reaches `58749`; next is
  `58750`-`58999`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `58500`-`58749`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- The four-language fingerprint check passes for all 60,457 ledger IDs.
- The generated quest-asset index and catalogs reproduce byte-for-byte; all
  nine `test_build_dialogue_context_index.py` tests pass.
- The audit-only, CRLF-aware diff check is clean. Translation CSVs were not
  modified.
