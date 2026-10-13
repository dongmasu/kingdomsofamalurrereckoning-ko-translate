# Preliminary Language Scan: `default` IDs 10550-10599

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 10550-10599.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 10550 | `Votive of Water` → `물의 봉헌물` | Confirm whether this is an offering, votive object, or equipment label. | Korean is a plausible literal reading; the isolated label does not establish the item's function or category. | Medium |
| 10552 | `Cape Soalce` → `솔라스 곶`; `Gallows End` → `갤로우즈 엔드` | Check the likely source typo `Soalce` against the recurring `Cape Solace` name and keep the Gallows End form on the consistency list. | Other active rows use `솔라스 곶(Cape Solace)`, while this row follows the misspelled English form without English in parentheses. Gallows End already has several Korean forms, including `교수대 끝` at ID 10491. | High |
| 10555 | `three more parcels` → `세 몫 더` | Confirm the intended package/unit and avoid implying a portion if the source means three packages or doses. | Japanese says three boxes and Chinese says three packages; Korean `세 몫` may read as three shares/portions. | High |
| 10556 | `My work here won't keep me from it` | Keep the destination/referent open until context identifies it. | Korean conveys that the work will not prevent the speaker from going there and retains the attraction of the sky and red rocks without naming the destination. | Medium |
| 10559 | `Fae Cairns` → `페이의 케언` | Determine whether these are burial cairns, collectible stones, or a named category. | The English plural can refer to stone heaps or a proper site/object category; Japanese and Chinese do not settle the game's usage. | Medium |
| 10561 | Farrara / Sagrell / House of Ballads | Check name spellings and the two-person return instruction against recurring entries. | Korean preserves the instruction to go quickly, finish together, and meet at the northern House of Ballads; the proper-name spellings and translated faction name remain consistency questions. | Medium |
| 10565 | Conversation / Persuasion tutorial | Confirm the established Korean UI terms for the skill and interface while preserving marker order. | Korean localizes both headings and retains all control-marker classes/order. The active term is `설득`; official terminology was not searchable in this pass. | Medium |
| 10572 | `Adopt the Rite` → `의식을 받아들여라` | Confirm whether `Adopt` means accept, perform, or formally join the rite. | Japanese says perform the rite, while Korean and Chinese frame it as accepting/adopting it. | Medium |
| 10578 | Orison / Sojourn / amphora / Temple of Lyria | Align the named rite/task and location terms; preserve the quest sequence. | Korean retains completion of the first task, returning the filled amphora to Lyria's temple in Rathir, and learning the next task. The proper names and rite labels need glossary checks. | Medium |
| 10580 | `cell` / `Hollow` / `grounds` | Keep the chosen-cell, awakening-place, den, and territorial meanings distinct if context supports them. | Korean preserves the speaker's chosen confinement and claim to the place, but renders `Hollow` generically as `공동`; whether it is a named Fae location is unresolved. | Medium |
| 10589 | `confidante` / `He's downstairs` | Preserve the source's feminine-coded noun followed by masculine pronouns; do not silently resolve the source inconsistency. | Korean uses a gender-neutral “closest friend/person,” which avoids adding a gender not expressed by Korean grammar. | Medium |
| 10593 | Dverga / Faer Gorta / Gravehal / Frostbreak Omnibus | Verify lore names and source anomalies (`and fasting`, `provisory`, `Ominbus`) without silently rewriting the source. | Korean retains the seven source line breaks and the journal's sequence. `Gallows End` appears as `갤로우즈 엔드`, unlike literal forms elsewhere; the English title spelling is `Ominbus` and should be checked against the canonical work name. | High |
| 10595 | `the Sorrows` → `비탄의 집` | Confirm whether this refers to the House/faction, its members, or an emotional state. | Korean interprets the phrase as the House of Sorrows and says the speaker stands before it; the English alone leaves the referent open. | Medium |
| 10597 | `Even` → `무승부` | Confirm the UI/result context before choosing between an even number, tied result, or balanced state. | Chinese suggests a draw, Japanese says “even number,” and Korean follows the draw reading. The one-word English source is insufficient to decide. | Medium |
| 10598 | Tanra Wyvyrn-Gifre | Align the character's Korean spelling with other appearances and the project's proper-name convention. | Korean provides the Hangul form plus the English spelling; the phonetic form needs corpus-wide confirmation. | Low |

## Historical Audit Reconciliation

- Rechecked the archived questions for IDs 10550, 10552, 10555-10556,
  10559, 10561, 10563, 10565, 10572, 10578, 10580, 10589, 10593,
  10595, and 10597 against the active rows.
- Added active-corpus consistency checks for Cape Solace/Gallows End and
  the spelling of Gravehal-related terms. Existing candidates remain
  preliminary evidence only.
- No translation change is authorized.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean with
  identical keys and order.
- CSV-record line-break counts and normalized runtime-marker classes/order
  match across the four locales. ID 10593 retains all seven embedded line
  breaks; ID 10565's UI markers retain their order.
- No active CSV structure or text was changed. Active CSV hashes remain the
  checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; names and terms above remain unsettled.

## Batch Status

IDs 10550-10599 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 10600-10649.
