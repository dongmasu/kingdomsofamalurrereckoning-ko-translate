# Preliminary Language Scan: `default` IDs 10500-10549

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 10500-10549.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 10502 | `{*1awareness}` → `{*1경계도}` | Confirm the established UI label for the player's detection/awareness meter. | The English describes an eye indicator filling and turning red as awareness of the player increases. Japanese and Chinese also frame this as detection/awareness. The runtime wrapper is intact; the Korean term remains provisional. | Medium |
| 10514 | `resisted my advances` / age difference | Preserve the speaker's self-serving romantic framing without implying more consent than the source states. | Korean closely follows the English and Japanese account. Chinese makes the connection sound more mutually understood; English does not establish that. | Medium |
| 10523 | Vekreth / Arylia / Belen / Thyrdon / Lupoku / Mitharu | Verify divine-name spellings, relationships, and the comic/suggestive tone together. | This long myth moves through Vekreth's infatuation, Arylia's disclosure, Mitharu's four-day bell inspection, and the gods' marriage. Korean preserves the source paragraph break; its names and some phrasing need corpus/lore consistency review. | Medium |
| 10528 | `dreg` / `the Testament` → `이단자` / `유언서` | Confirm the insult and whether `Testament` is a faction or institution rather than a document. | Japanese renders the referent as the Belen sect and Chinese as the Belen covenant; Korean `유언서` reads as a testament document. English names the Testament as an active organization planning further violence. | High |
| 10531 | `my brother, Gilman` → `내 동생 길먼` | Do not resolve Gilman's relative age from the English alone. | English `brother` is age-neutral; Japanese specifies an older brother, while Korean specifies a younger brother. Chinese is also age-neutral. The active Korean therefore adds an unsupported age relationship. | High |
| 10533 | `Perform the Giving` → `봉헌 의식을 거행하라` | Confirm whether `Giving` is a named rite, offering, or other specific ceremony. | Japanese uses a contribution/rite formulation and Chinese a distribution formulation. Korean's votive-rite interpretation is plausible but not settled by this isolated command. | Medium |
| 10539 | `dove` / Crilgarin | Check the affectionate vocative and keep the wounded, taunting delivery. | Korean preserves the comparison with Crilgarin and the speaker's prediction of regret; the English endearment is rendered broadly as `그대여`. | Low |
| 10547 | Maxen / Crossing / Keepers / Florion | Align the post and faction names; clarify the replacement-rotation context. | Korean preserves the report-to-Florion objective and the statement that Maxen remains until replacements return. `Crossing` is left untranslated while Japanese uses a descriptive rendering; confirm the established place name and `Keepers` form. | Medium |
| 10548 | Black Arick / Spritely One / Mya / Stormbreaker / barghest | Review the proper-name forms and nautical imagery without disturbing the eight source line breaks. | This chapter excerpt contains dense ship, storm, and combat imagery. Korean retains all eight breaks and the major events, but the English proper names are mostly rendered without parenthetical source forms; check against the project's inconsistent bilingual-name practice. | Medium |
| 10549 | `poachers` → `밀렵꾼` | Preserve the English-based reading, but verify the situation before treating the other locales as evidence of an error. | English says `poachers`; Japanese says thieves and Chinese says intruders. Korean follows English with “poachers,” which is semantically the strongest available reading absent more context. | Medium |

## Historical Audit Reconciliation

- Rechecked the archived questions for IDs 10502, 10514, 10523, 10528,
  10533, 10547, and 10548 against the active English, Japanese, Chinese, and
  Korean rows.
- Added active-row comparisons for IDs 10531 and 10549. The English/Japanese/
  Chinese disagreement at 10549 does not override English meaning.
- Existing candidates remain preliminary evidence only; no translation
  change is authorized.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean with
  identical keys and order.
- CSV-record line-break counts and normalized runtime-marker classes/order
  match across the four locales. IDs 10523 and 10548 retain one and eight
  embedded line breaks respectively.
- The 60% Burning Damage and 30% Mark of Flame increases at ID 10513 are
  retained in Korean.
- No active CSV structure or text was changed. Active CSV hashes remain the
  checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; names and terms above remain unsettled.

## Batch Status

IDs 10500-10549 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 10550-10599.
