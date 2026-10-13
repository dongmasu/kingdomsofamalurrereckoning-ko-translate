# Preliminary Language Scan: `default` IDs 6900-6949

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 6900-6949.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 6900 | `Go to the Grand Bursar's` → `대재무관의 집무실로 가기` | Keep the elliptical destination unresolved; verify whether the Grand Bursar's refers to an office, institution, or another implied place. | English omits the destination noun; Japanese identifies a grand accounting institution but does not establish an office. Korean adds `집무실`. | Medium |
| 6908 | `The Authority` → `권능(Authority)` | Confirm the canonical theological title and retain the capitalized entity/personification. | English capitalizes Authority; Japanese says Creator, while Chinese supports a divine-authority reading. Korean is plausible but not settled. | Medium |
| 6910 | `Freemen` → `자유민들` | Determine whether this is the named Freeman faction or generic free people; align with the faction reading if context supports it. | Japanese says `フリーマン団` (Freeman group); English/Chinese allow a generic reading. Korean uses the generic plural. | Medium |
| 6914 | `You're twice the hero I ever was, or could have been` → `넌 내가 이룬 것보다 두 배는 더 훌륭한 영웅이야` | Restore the comparison to the speaker as a hero, not to the speaker's achievements. | English compares the listener to what the speaker ever was/could have been as a hero. Korean shifts the comparison toward what the speaker accomplished. | High |
| 6931 | `barghest` → `바르게스트` | Standardize the creature spelling against `바게스트(barghest)` used in `base`; confirm the project-wide form. | Korean variants differ across resource types; this `default` row follows a form used elsewhere in `default`, not the `base` spelling. | Medium |
| 6934 | `Hierophant` → `계시자` | Align with the established `대사제` rendering unless this character/title intentionally has a distinct sense. | Other project occurrences commonly use `대사제`, and Chinese uses 大祭司. The current Korean terminology is inconsistent. | High |
| 6936 | Rivener Tarsus / Gloamfrost / Ender's Fire → `리브너 타르수스` / `글룸프로스트` / `엔더의 불꽃` | Standardize these three staff names with the same items at ID 30061 and review English-name display consistently. | The same staffs appear with variants such as `리베너 타르수스` and `엔더스 파이어`; the source confirms these are the same three named weapons. | High |
| 6941 | `The woman I wore` → `내가 걸쳤던 여인의 몸` | Preserve the strange bodily metaphor but check whether explicitly adding “body” makes the mechanism more concrete than English. | English deliberately says “the woman I wore”; Japanese supports borrowing a body, while Chinese is literal. Korean selects an explicit body reading. | Medium |
| 6943 | `the last of these heinous circles` → `마지막으로 이 사악한 마법진들 중 하나인` | Preserve that the Altar is the last circle in the sequence, not merely one of the circles mentioned last. | English says “the last of these”; Korean's “마지막으로 ... 중 하나” can weaken the ordering relationship. | Medium |

## Historical Audit Reconciliation

- Rechecked applicable historical questions for IDs 6900, 6908, 6910,
  6914, 6931, 6934, 6936, 6941, 6943, and 6947.
- ID 6907's House is identified by Japanese as the House of Ballads; Korean
  `발라드의 집` matches the project term. IDs 6922-6923 preserve their
  unspecified antecedent and coercive bargain; `접객 직원들` at 6929 fits
  English “serving staff.”
- ID 6930 retains `EARS`; the Korean does not mark plurality, and the title
  alone does not establish a number issue.
- ID 6947 preserves the distinct timing clauses and values; the layout's
  single embedded line break is retained.
- Historical candidate wording remains evidence only and does not authorize
  edits.

## Other Checks

- All 50 IDs occur exactly once in English, Japanese, Chinese, and active
  Korean.
- Line-break counts match across all four locales; only ID 6947 has an
  embedded break, preserved in Korean.
- No runtime-marker identity/order differences were found.
- Numeric values are preserved: ID 6903 `50%`; ID 6911 three charged and two
  uncharged arrows; ID 6947 `20/50/10%` HP and `30/20%` Mana. ID 6936's
  “three” is spelled out in Korean and matches English.
- No active CSV structure or text was changed.

## Batch Status

IDs 6900-6949 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
