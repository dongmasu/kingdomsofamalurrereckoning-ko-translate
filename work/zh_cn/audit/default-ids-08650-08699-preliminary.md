# Preliminary Language Scan: `default` IDs 8650-8699

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 8650-8699.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and applicable historical questions in
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 8650 | `Flawless Mitharan Flamed Shaft` → `완벽한 미타란 화염 장대` | Identify the item category and exact meaning of `Flamed Shaft`; retain the English cross-reference until its equipment context is known. | The English item name is opaque; Japanese transliterates it, Chinese reads a “fire-burned rod,” and Korean translates it as a flaming pole. | Low |
| 8651 | `Detect Hidden Training` → `은신 감지 훈련` | Align `Detect Hidden` with the established skill terminology and preserve that this is training for the skill. | Korean keeps the training label and uses the established-sense `은신 감지`; the remaining question is consistency with the official term. | Medium |
| 8661 | `The Amethyn` / Winter King / oblivion | Preserve the place's rebirth role and the Winter King's contemplation of eternal silence and oblivion; verify whether the name and article indicate a named site. | Korean retains the core imagery; Japanese/Chinese differ on whether the king is specifically the Winter Fae King. | Medium |
| 8663 | `Argine, Queen of Staves` → `아르진, 홀의 여왕` | Determine whether `Staves` denotes a weapon type, card suit, or named title; align with game item/card terminology. | Historical notes already identify the title ambiguity; Japanese and Chinese emphasize staves, but the isolated label does not settle its sense. | Medium |
| 8664 | `friends` → `친구들` | Retain the English plural-person reading unless UI context supports a relationship/status label. | English is plural people; Japanese reads “friendship,” while Korean and Chinese use friends. | High |
| 8670 | Ethene / five-line confession | Verify the goddess's Korean name and preserve the confession's sequence; note the source has four embedded breaks while Chinese has three. | Korean follows English's `Ethene` spelling and four-break layout. Japanese renders the name differently; the Chinese record combines the first two lines. | Medium |
| 8671 | coined name `Mithroliths` | Preserve that the speaker is proposing a new name for unique standing stones; decide later whether to coin a Korean compound or retain transliteration plus English. | Korean retains the tentative proposal and includes `Mithroliths` in parentheses. | Medium |
| 8673 | “Tied all your knots and pulled all your anchors” → `매듭은 다 풀고 닻도 올렸나` | Confirm the nautical preparation idiom; `tied` means securing knots, not untying them. | Korean says the knots were undone, reversing the English action. Japanese says to tie what needs tying; Chinese preserves the knot phrasing. | High |
| 8684 | capitalized `Vengeance` → `복수` | Determine whether this names a destination/place rather than abstract revenge; use a proper-name rendering if context confirms it. | English capitalizes the destination, while Korean renders the abstract concept. Historical notes already leave the location sense open. | Medium |
| 8689 | shrines → `성소들` | Preserve the plural and determine which shrines are meant from quest context. | Korean explicitly pluralizes; Japanese says two shrines and Chinese also uses a plural demonstrative. | High |
| 8690 | House of Ballads / Maid | Standardize House of Ballads with IDs 8428, 8537, and 8598; retain the claim that the Maid's manipulation cannot weaken loyalty. | Korean keeps the relationship and loyalty claim, but uses `하우스 오브 발라드`, one of several active forms. | Medium |
| 8698 | `{*3Fate}` | Preserve marker ID `*3` and localize only its visible label. | All locales keep marker ID `*3` in the same order; the visible `Fate` label is localized in Korean. | High |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 8650, 8663-8664, 8670-8671, and
  8684 against all four language rows.
- Added ID 8673 after direct comparison found that Korean's `매듭은 다 풀고`
  reverses the source's “tied all your knots” action.
- ID 8670's Chinese line layout differs by one embedded break; the report
  records the source-locale exception without changing any text.
- Historical candidate wording remains evidence only and does not authorize
  translation edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts match except at ID 8670: English,
  Japanese, and Korean have four embedded breaks; Chinese has three.
- Runtime-marker IDs and order match after treating localized `{*N...}`
  display labels as the same marker ID, including `{*1Gender}` at ID 8656
  and `{*3Fate}` at ID 8698.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.

## Batch Status

IDs 8650-8699 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
