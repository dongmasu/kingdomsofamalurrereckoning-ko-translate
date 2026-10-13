# Preliminary Language Scan: `default` IDs 32151-32200

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 32151-32200 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  variables, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 32156 | `{1}을(를) {2}(으)로 교체` | Preserve the semantic argument mapping and record the Chinese-only placeholder reorder. | English and Japanese say to replace `{1}` with `{2}`; Korean retains that sequence and reads naturally. Chinese reverses the order (`{2}` then `{1}`) to fit its wording. Placeholder identities are present in all locales. | High |
| 32161 | `성 오드윅의 성유물 보관소` for `St. Odwig's Reliquary` | Determine whether the title names a reliquary container or a place/repository; align `reliquary` with related corpus terms. | English says `Reliquary`; Japanese uses a relic repository and Chinese a relic container. Korean chooses a storage place. Existing Korean uses both `성유물함` and `성유물 보관소`, so the object/location distinction and term consistency remain open. | Medium |
| 32163 | `쓸모없는 이 같으니` for `good for nothing louse` | Check whether the insult's force and the familiar address are sufficiently retained. | English uses an insulting address, Japanese a worthless-person insult, and Chinese an annoying-person insult. Korean conveys contempt but may lose the parasite metaphor and the opening exclamation's warmth toward the friend. | Low |
| 32170 | `MendellerBirt` / `멘델러 버트` | Verify whether the fused English spelling is a source formatting error and standardize the personal name only with independent evidence. | English presents the name without a space; Japanese and Chinese also have unspaced forms, while Korean separates two transliterated parts. The intended name boundary is not established by this isolated row. | Low |
| 32171 | Two staff-damage stat lines | Preserve the two-line layout, `+12` physical damage, and `+25%` damage; standardize the Korean weapon/stat labels. | All four locales preserve the two separate values and line break. Korean retains both values and distinguishes physical damage from total damage with staves. | High |
| 32172 | `{*6{1}}` | Preserve the nested runtime marker exactly. | English, Japanese, Chinese, and Korean have the same outer marker and nested `{1}` placeholder in the same order. | High |
| 32181 | `운명 마법` / `레코닝 마법` | Confirm whether “Fate Magic” and “Reckoning magic” are formal system names and align the treatment of `Reckoning`. | English contrasts a unique form of Fate Magic with the quoted name “Reckoning” magic. Korean preserves both concepts and transliterates the latter; Japanese translates it as “judgment” and Chinese as “punishment.” The established active Korean generally uses `레코닝` for the game mode/title, while Fate Magic remains a separate open term. | Medium |
| 32182 | `선교원의 수정` for `the mission's crystals` | Confirm whether Mission is the named religious institution or a task/objective, and preserve the speaker's possessive/transaction meaning. | English, Japanese, and Chinese connect the crystals to a “mission,” with Japanese reading it as a monastery and Chinese as a preaching institution. Korean uses the established provisional `선교원`, but the isolated row does not identify which institution or mission is meant. | Medium |
| 32187 | `대사제 궁정의 날개` for `the wings of the Hierophant's Court` | Verify the architectural sense of “wings” and choose a natural Korean term for a court wing/section. | English says the key opens the wings of the Hierophant's Court, identified by the speaker as her sanctum. Japanese reads this as a building wing and Chinese as side chambers. Korean calques “wings” as `날개`; the architectural meaning is plausible but the Korean expression needs context. | Medium |
| 32196 | `라이케이오스와 극장` / `세칸드라와 프리모스 직위` | Preserve the unfinished source fragment and confirm whether Lykeios/Theater and the office of Primos are named institutions/offices. | English ends with an em dash after the statement about attendance and public support. Korean retains the unfinished thought with an ellipsis. Japanese expands the office wording; Chinese reads Primos as a leader. Korean's `프리모스 직위` follows the office interpretation, but the title hierarchy remains unresolved. | Medium |
| 32198 | `시종` for `servant` | Confirm whether `servant` means attendant, subordinate, or a magically obedient servant; do not import the stronger “slave” reading without context. | English says the Gnome crafted a servant who would do his bidding. Korean uses `시종`, while Chinese explicitly uses “slave”; Japanese uses “faithful servant.” Korean follows the English/Japanese level of force. | Medium |

Rows 32151-32155, 32157-32162, 32164-32169, 32173-32180, 32183-32186,
32188-32195, 32197, 32199, and 32200 generally retain the English meaning
on this first reading. Proper-name spelling, stat labels, and character
register remain candidates for the integrated pass; no separate
high-confidence wording correction was identified.

## Historical Audit Reconciliation

- The source-keyed historical log for IDs 32100-32199 flags St. Odwig's
  Reliquary, Fate Magic and “Reckoning” magic, Mission at ID 32182, the
  Hierophant's Court wings, Lykeios/Theater and the office of Primos at
  ID 32196, and the relevant neighboring lore terms. These were checked
  against the four locale rows; context-dependent questions remain open.
- The English/Japanese/Korean placeholder order at ID 32156 matches. Only
  Chinese reverses `{1}` and `{2}`; no argument was silently reordered in
  the Korean draft.
- The historical question log's ambiguity around `Mission` is longstanding:
  related entries use Korean forms including `선교원`, `선교회`, and
  `선교소`. ID 32182 should not be used to canonize one form without
  identifying the referent.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  32151-32200 once and in identical order.
- Embedded line-break counts match throughout the range, including one
  break between the two stat lines at ID 32171.
- Runtime placeholder identities are preserved. ID 32156 has a
  Chinese-only sequence difference (`{2}`, `{1}` versus `{1}`, `{2}` in
  English, Japanese, and Korean); nested marker structure at ID 32172
  matches in all four locales.
- No other structural exception was detected in this batch.
- No CSV text or source file was edited.

## Batch Status

IDs 32151-32200 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 32201.
