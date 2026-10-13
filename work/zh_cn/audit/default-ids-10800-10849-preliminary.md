# Preliminary Language Scan: `default` IDs 10800-10849

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 10800-10849.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 10800 | `Honorable Military Discharge` → `명예 제대` | Confirm whether this is a certificate, status, item, or UI command. | Korean gives a natural concise label, but English capitalization and the isolated phrase do not establish its resource type. | Medium |
| 10802 | `Activity - Butcher - Fish` → `활동 - 생선 손질` | Determine whether `Butcher` is an action, occupation, or middle category and retain the intended label hierarchy. | Korean reads as fish processing and omits the visible “Butcher” category; Japanese and Chinese also differ in how they segment the label. | Medium |
| 10803 | Fahrlangi mages → `파를랑기 마법사들` | Align the group-name transliteration with other Fahrlangi references. | Korean preserves the plural mage group; the proper-name form remains provisional. | Medium |
| 10808 | `The Chariot` → `전차` | Confirm whether this is a tarot/archetype name, item, or literal vehicle before finalizing the label. | Korean and Chinese use a literal chariot form; Japanese uses a “chariot-rider” wording. Category context is absent. | Medium |
| 10809 | all-Abilities potion / four reagents | Verify canonical reagent names and preserve every quantity and line break. | Korean retains 3/3/2/1, includes English names parenthetically, and matches all five source line breaks. | High |
| 10813 | `the Well` / develop it / `paid well` | Confirm whether the capitalized Well is a named project and retain the possible “paid well” wordplay. | Korean uses generic `샘` and interprets the later phrase as generous pay. Japanese also marks the Well as a named concept; the underlying project is unspecified. | Medium |
| 10820 | `the great tragedy` / quiet since | Keep the event and quiet location unnamed. | Korean preserves the speaker's apology and refusal to say more without supplying the missing event or place. | Low |
| 10822 | Court of Winter / Bhaile / Midden | Align the proper names and preserve the sequence of massacre, destruction, and corruption. | Korean retains all three events and the Winter birthplace claim. Bhaile and Midden remain proper-name transliterations. | Medium |
| 10828 | `Redemption` → `속죄` | Determine whether this is a quest, skill, moral concept, or title. | Korean's “atonement” reading is plausible, but Japanese and Chinese suggest other nuances and no category is visible. | Medium |
| 10831 | Gwalchmai → `그월흐마이` | Align the name with the active corpus' variants. | Other active rows use both `그왈흐마이` and `그월흐마이`; preserve for consolidated name review rather than normalizing here. | High |
| 10833 | `The Font` → `샘` | Confirm whether this names a specific magical spring/fountain or is a generic label. | Other active text uses `샘(The Font)` as a named location; this standalone row drops the English traceability and capitalization. | Medium |
| 10838 | Livrarium / Praetorian Garrison / Apotyre / Detyre | Verify canonical city, place, and institution terms, and preserve the hidden-prize clue and all paragraph breaks. | Korean retains the city's origin story and the instruction to walk from its birth to its end. All seven source line breaks are present. | Medium |
| 10842 | Tyr Magnus / Hroth Magnus / Fae Engard | Verify names and the identity/type of Engard; preserve the memoir's chronology, combat anecdote, and full layout. | Korean retains the father's mercenary history and the four source line breaks. “Fae Engard” may be a person, group, or proper entity; the source does not clarify it. | Medium |
| 10848 | `bring the fight to Telogrus` | Confirm whether this means attack Telogrus directly or confront forces associated with it. | Korean says to “pick a fight” with Telogrus, which may sound interpersonal; English's target and the scene context need checking. | Medium |
| 10849 | Erion Raff / Mull Rane | Verify the mage and destination spellings while preserving his completed departure. | Korean retains the overnight tavern stay and subsequent departure; names remain provisional. | Low |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 10800, 10802-10803, 10808-10809,
  10813, 10820, 10822, 10828, 10831, 10833, 10838, 10842, 10848, and
  10849 against the active rows.
- Checked Gwalchmai's recurring spellings and The Font's named-location use
  in the active corpus. These remain audit candidates, not approved edits.
- No translation change is authorized.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean with
  identical keys and order.
- CSV-record line-break counts and normalized runtime-marker classes/order
  match across all four locales. ID 10809 retains five line breaks, ID 10838
  retains seven, and ID 10842 retains four.
- Recipe quantities at ID 10809 and the 15% XP modifier at ID 10830 are
  retained.
- No active CSV structure or text was changed. Active CSV hashes remain the
  checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; names and terms above remain unsettled.

## Batch Status

IDs 10800-10849 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 10850-10899.
