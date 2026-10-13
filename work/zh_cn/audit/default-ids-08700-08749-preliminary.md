# Preliminary Language Scan: `default` IDs 8700-8749

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 8700-8749.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and applicable historical questions in
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 8701 | `Faelands` → `패란즈` | Standardize the Fae/Faelands name; compare with forms such as `페이랜드` and `윈터 페이랜드` elsewhere. | English names the Faelands; Japanese transliterates “Feyland,” Chinese describes the Fae continent, and the current Korean `패란즈` is inconsistent with nearby terminology. | Medium |
| 8706 | Traveler / Hierophant | Standardize `Traveler` against `트래블러스` and `여행자(Travelers)` variants; align Hierophant with `대사제`/`대주교` occurrences. | Korean uses `트래블러스` and `대주교`; the same faction/title have other Korean forms in the active draft. | Medium |
| 8711 | `The Widow` → `과부` | Determine whether capitalization indicates a named character, card, or quest marker rather than the generic title. | The isolated label has no context; Korean selects the ordinary noun “widow.” | Low |
| 8721 | `I fought for the dog` → `그를 위해 싸웠지만` | Preserve the speaker's dismissive `dog` insult without inventing a relationship to Orieator. | Chinese retains “dog,” Japanese calls Orieator a former superior, and Korean removes the insult while keeping the speaker's service to him. | Medium |
| 8723 | `Well of Souls` → `영혼의 샘` | Confirm whether the established location is a “well,” “spring,” or named site; align capitalization and prior usage. | English names the Well; Japanese says spring and Chinese says well. Korean uses `샘`, leaving the well/spring distinction unresolved. | Medium |
| 8730 | third map / second map | Preserve both ordinal references and record the source inconsistency rather than silently correcting one. | The English first names fragments of a third map, then calls it a second map; Korean faithfully retains both. | High |
| 8733 | `Sorrogweth` / madwoman and her master | Verify the proper name and relationship from quest context; keep the request to find Sorrogweth and the stated consequence. | All four rows preserve the named objective and the madwoman/master relationship, but do not identify either party further. | Medium |
| 8742 | Crymbil/Skratta / Marthen Row, Marten Row / Marthenshire, Martenshire | Preserve the seven-paragraph account and narrator bias; reconcile the source's inconsistent spellings without treating the claims as verified lore. | English varies the settlement names; Korean normalizes them as `마턴 로우`/`마턴셔` and retains the argument and caveats. | Medium |
| 8744 | Tuatha → `투아타` | Standardize against `투아사(Tuatha)` used elsewhere, including ID 8387. | The English name is unchanged while active Korean alternates between `투아타` and `투아사`. | Medium |
| 8749 | House of Sorrows / Long Winter | Preserve the House name and the three forces the Winter Fae oppose; confirm whether capitalized `Long Winter` is a named event/title. | Korean retains the House, Tuatha, Long Winter, and death; proper-name status for Long Winter is unresolved. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 8711, 8721, 8730, 8733, and 8742
  against all four language rows.
- The map-number contradiction at ID 8730 remains in the translation as
  written. No source typo was silently repaired.
- Added cross-row terminology questions for Faelands, Traveler, Hierophant,
  and Tuatha. Historical wording remains evidence only, not approval.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts match across all four locales.
- Runtime-marker IDs and order match after treating localized `{*N...}`
  display labels as the same marker ID.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.

## Batch Status

IDs 8700-8749 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
