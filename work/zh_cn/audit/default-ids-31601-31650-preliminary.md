# Preliminary Language Scan: `default` IDs 31601-31650

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 31601-31650 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 31601 | English payloads retained inside `{*1...}` wrappers | Localize the marker contents in Korean if these wrappers display translated strings; preserve every `{*1}` wrapper and its order. | The five payloads are the time limit, Odarath, Dalentarth, pause, and conversation. Japanese and Chinese translate the displayed contents, but Korean currently leaves all five in English. Wrapper count and order match across locales; the locale-specific payloads differ by design. | High |
| 31602 | `자신들을 ... 저항군이자 반란군이라고 여기지` | Correct the apparent English source typo `They seem themselves` as the likely intended `They see themselves`; Korean already conveys that intended sense. | The rest of the sentence calls Chaos worshippers resistance fighters against predestination. Korean renders the self-description naturally instead of reproducing the apparent source error. | High |
| 31610 | `옛날... 음` | Preserve the speaker's restart, but leave what `old` modifies unresolved until the location context is known. | English says “at the old ‒ well, on the north end of the height,” an unfinished correction. Korean retains a hesitation but does not identify the omitted noun. | Medium |
| 31621 | `발차기와 갈고리치기, 내려치기` | Confirm the exact combat move meant by `hook` and use the canonical Hammer ability terminology. | English lists a kick, hook, and smash while blocking. Japanese interprets the middle move as a punch; Chinese also uses a hook-like term. Korean preserves the three-part action sequence. | Medium |
| 31628 | `사랑스러운 이여` | Preserve the intimate, ominous address and the possessive threat; review character voice in context. | The speaker claims the addressee and others as theirs, calls the addressee “lovely,” and predicts they will soon be together. Korean retains that tone and sequence. | Medium |
| 31631 | `#NAMED_ICON_GRAY_PS3_R1#` | Preserve the named-icon token exactly. | The token is identical in all four locales. | High |
| 31636 | `본 월` for `Bone Wall` | Resolve whether Bone Wall is a named structure/place or another local entity; the Japanese row materially conflicts with English and Chinese. | English and Chinese describe Hera Orhelm as keeper/guardian of the Bone Wall. Japanese instead calls her keeper of the Whitestone village quest board. Korean follows English/Chinese and transliterates the name. | Medium |
| 31642 | `자, 어서 가` for `Well? On your way with you.` | Confirm whether this is a brusque dismissal and retain a natural Korean equivalent without relying on the divergent locale readings. | English is an awkward dismissal. Japanese says to take care, while Chinese is an unclear blessing/path phrase. Korean follows the English intent provisionally. | Medium |
| 31644 | `제4장` plus the bawdy deception story | Preserve the chapter heading, blank-line separation, character roles, and final comparison; review register as part of the surrounding collection. | The passage describes a mistress substituting for a servant in bed with an Alfar master, then compares the husband's and wife's mistaken beliefs. Korean preserves the story and the two blank-line breaks without adding a new relationship. | Medium |
| 31649 | `이게 내 시간을 쓸 만큼 가치 있는 일이어야 할 텐데` | Preserve the speaker's impatient challenge and the concern about Varani in Ysa; standardize both names. | English uses a question-marked but declarative-sounding challenge. Japanese also questions whether the business is important; Chinese follows the English phrasing. Korean preserves the impatient meaning. | Medium |

Rows 31603-31609, 31611-31620, 31622-31627, 31629-31630, 31632-31635,
31637-31641, 31643, 31645-31648, and 31650 generally retain the English
meaning on this first reading. Proper-name spellings and the formal status
of terms including Apostasy, Arcaneid, Blood Plague, Scholia Arcana, House
of Sorrows, and Hierophant Shrine remain for integrated consistency review.

## Historical Audit Reconciliation

- The source-keyed historical entries for IDs 31600-31699 were checked.
  Relevant items include the 45-minute demo tokens, the Chaos-worshipper
  source typo, the `old` restart at Beggar's Bluff, Hammer move wording,
  the named icon, Bone Wall, the dismissal at ID 31642, the Chapter IV
  story, and the Varani-in-Ysa line.
- Two item-to-ID references in that historical question are stale or
  misassigned: `Lower` is listed at 31662 but occurs in active English at
  31562 (31662 is `Kollossae`); `consecrate themselves` is listed at 31671
  but occurs at 31571 (31671 is about Plagueshield). The archived question
  log was not edited, and these mismatches are recorded here to prevent
  carrying them forward.
- ID 31601 preserves all five `{*1}` wrappers and their order. The Korean
  payload text remains English although Japanese and Chinese localize it;
  this is recorded as a content-localization candidate, not a wrapper/key
  mismatch.
- ID 31636 follows English and Chinese over the materially different
  Japanese `quest-board keeper` reading. The correct in-game referent is
  still open.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  31601-31650 once and in identical order.
- Embedded line-break counts match, including the chapter heading and
  blank-line separation at ID 31644.
- The `{*1}` wrapper sequence at ID 31601 and the
  `#NAMED_ICON_GRAY_PS3_R1#` token at ID 31631 are preserved. Payload
  translations differ across locales at 31601 as described above.
- The source text at ID 31644 retains both blank-line breaks; no chapter
  separation was lost.
- No inspected row contains a locale-specific BOM, NBSP, zero-width space,
  or directional formatting character.
- No CSV text or source file was edited.

## Batch Status

IDs 31601-31650 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 31651.
