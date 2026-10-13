# Preliminary Language Scan: `default` IDs 33401-33450

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 33401-33450 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 33402 | `티모니움 실(schill)` / `T.P.` | Confirm the material name `timonium schill`, the T.P. abbreviation, and Motus/Cruenna/Hollowlands forms; preserve that all such material found there is sellable and Cruenna can provide information. | Korean transliterates timonium but leaves `schill` in English parentheses and retains T.P. The source-keyed historical range explicitly groups these terms for terminology review. | Medium |
| 33403 | `아르바의 지팡이, 아르바의 숨결` | Preserve that the resting place contains Arba's staff, named the Breath of Arba, and that it should be delivered to Anella; clarify the sentence's apposition only with context. | Korean retains the staff, item name, and delivery objective. English's punctuation leaves the relationship between resting place, staff, and Breath of Arba compressed. | Medium |
| 33413 | `암호서` for `codex` | Confirm whether this is a cipher/codebook, a named codex/book, or another specific text; avoid narrowing `codex` to a cryptographic book without evidence. | English says “that codex”; Japanese calls it a book of fate and Chinese a codex/canon. Korean's `암호서` specifically implies a cipher book. | Medium |
| 33426 | `워스원` for `Warsworn` | Standardize the named faction/people form across the corpus while retaining this standalone label. | Korean transliterates the name; Chinese translates it semantically and Japanese transliterates it. The canonical display form remains a glossary question. | Low |
| 33430 | `플레그실드` for `Plagueshield` | Determine whether Plagueshield is a named remedy, protection, or other entity and reconcile this transliteration with the active draft's several translated/transliterated forms. | Korean transliterates it here, whereas other active rows use forms such as `역병 방패`, `역병 방호제`, `역병 방호막`, and `플라그실드`. The English capitalizes the term, but its type varies by context. | Medium |
| 33433 | `캡틴 캔웬` for `Captain Canwen` | Confirm whether Captain is a formal rank and standardize the Korean title treatment with other captain labels. | Korean transliterates “Captain” instead of translating it as a rank; English/Japanese/Chinese identify a captain title. The isolated name label does not establish the project's preferred display convention. | Low |
| 33441 | Templar Sable book excerpt | Preserve the two-paragraph excerpt, the unknown hide/binding, unsuccessful attempts to open the tome, and the later account of Sable's desert campaign; retain the source's religiously charged voice. | Korean retains both paragraphs and the main claims. English, Japanese, Chinese, and Korean all have two newline characters; lore names and the exact hide/material remain context candidates. | Medium |
| 33442 | `아침 태양의 부흥` for `Rise of the Morning Suns` / `세 장엄자` | Verify the title's “rise” sense and the established forms for the three Majestics and Erathell without changing the rebirth/land-shaping claim. | Korean renders `Rise` as a revival/rebirth noun and calls the beings “Majestics” (`장엄자`). The title and setting names need cross-corpus consistency. | Medium |
| 33446 | `수집품들` for `collections` | Determine whether this exclamation refers to donations/fundraising or collectible objects; use actual UI/story context rather than assuming a collection category. | Korean selects collected items. Japanese says donations/fundraising and Chinese also reads fundraising, while earlier audit entries show the same English `Collections` ambiguity across the corpus. | High |
| 33450 | `토너먼트 챔피언` for `tournament Champions` | Preserve the collective victory condition and determine whether Champions is a formal title or generic winner label. | Korean describes becoming tournament champions after winning the match. English capitalizes Champions; Japanese and Chinese use a generic champion reading. | Low |

IDs 33401, 33404-33412, 33414-33425, 33427-33429, 33431-33432,
33434-33440, 33443-33445, 33447-33449 generally retain the English meaning
on this first reading. Proper names, lore, and UI terms remain integrated-
pass candidates; no other distinct wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 33400-33499 was checked against
  this range. It explicitly flags Hollowlands, `timonium schill`, T.P., and
  related names, and says to determine whether `Sorrows` is a faction/place/
  concept. ID 33479's satire lies outside this batch.
- The `Collections` ambiguity at ID 33446 recurs in earlier reports,
  including the standalone label at 9434 and other fundraising/collected-
  object contexts; those records do not settle this line's meaning.
- The English/Japanese/Chinese/Korean two-paragraph structure at ID 33441
  was checked and preserved.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 33401-33450 once
  and in identical order.
- Embedded line-break counts match across all four locales throughout the
  range. ID 33441 retains two newline characters.
- ID 33448 preserves `+50%` Elemental Damage.
- No runtime-marker mismatch was detected in the range.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 33401-33450 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 33451.
