# Preliminary Language Scan: `default` IDs 8100-8149

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 8100-8149.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions from
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 8101 | Uduath events / `a song of your very own` | Preserve the special-quest framing as a personal song without inventing how it is created or obtained. | Korean retains Hallam, Uduath, and a song unique to the addressee. | High |
| 8102 | `It is said to be scattered across Esharra` | Keep the omitted antecedent implicit; likely the song/story introduced at ID 8101. | Korean preserves the unknown object and the Esharra-wide distribution. | Medium |
| 8103 | `Temperence` → `절제` | Determine whether the source spelling is a typo for `Temperance` or an intentional title; retain a concise label pending context. | English spells the label `Temperence`; Japanese uses the standard temperance term and Korean translates the apparent sense. | Medium |
| 8108 | `Lady Ansilla's Children` → `레이디 안실라의 아이들` | Keep the capitalized phrase unresolved between a named group/place and literal children. | Korean preserves the source capitalization signal through bilingual naming without choosing a referent. | Low |
| 8110 | `Head Steward of House Ansilla` → `집사장` | Verify the household office title and preserve the switch from serving House Ansilla to serving the addressee. | Korean keeps the former title and the explicit change in service after the House's dissolution. | Medium |
| 8114 | `Court of Enchantments` → `마법의 궁정` | Retain the English-named court pending location evidence; note that Japanese instead identifies a “Hall of Heroes.” | Korean follows English; the Japanese/English source conflict remains unresolved. | High |
| 8115 | Dannestar / Ventrinio | Verify both names and whether Ventrinio is a person, place, or defensive force; preserve the claim that an army could be kept off the shore. | Korean retains both names and the coastal-defense meaning without fixing Ventrinio's identity. | Medium |
| 8119 | `Blood Rite` → `피의 의식` | Align this formal ritual term with related lore and preserve that two must die for one to live. | Korean retains the rite and the two-to-one survival statement. | Medium |
| 8121 | Armor reduction / Panic chance | Preserve 70%, 26%, and the two-line UI layout; confirm `Panic` as a named status effect. | Korean keeps both values, the newline, and the panic effect. | High |
| 8125 | Night Barghest / `Bane of Three Winds Crutch` | Confirm whether the subtitle names a creature, title, or location; retain the full association. | Korean calls the Night Barghest the “disaster” of Three Winds Crutch; the compound's exact relation remains open. | Medium |
| 8127 | `+{1} {2}` | Preserve both placeholder identities, order, spacing, and plus sign exactly; verify runtime meaning. | Korean and English use `+{1} {2}`. Japanese reverses them and uses two plus signs; Chinese uses `{1}{2}` without spacing. These are recorded as locale-format differences, not silently normalized. | High |
| 8128 | `tasty meat-birds` → `맛있는 고기새` | Retain the creature/food joke without naming a species not present in the source. | Korean keeps the speaker's complaint and the deliberately odd “meat-bird” term. | Medium |
| 8133 | conflicting directions / same tree four times | Preserve the speaker's first-person confusion, four passes, and two-paragraph structure. | Korean retains the direction changes, repeated-tree observation, and blank-line separation. | High |
| 8135 | Victor's Brew / Asker's Ale | Standardize both named drinks and retain the crude urine/sugar comparison. | Korean keeps both names and the intentionally vulgar comparison. | Medium |
| 8140 | Heart/Ring of Keozai / House of Ballads Knights | Align all three lore terms; preserve that the robe name honors the ring and that wearers guard ancient secrets. | Korean retains the relation among the robe, ring, and Knights of the House of Ballads. | Medium |
| 8143 | `Lady of Receivership` / sagecrafter | Verify the unusual formal office and retain the official `마법물품 제작` terminology. | Korean uses `수탁 관리인` and `마법물품 제작자`; the role title remains context-dependent. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 8101-8103, 8105, 8108, 8110, 8114-8115,
  8119, 8121, 8125, 8127-8128, 8133, 8135, 8137, 8140, and 8143.
- IDs 8101-8102 retain the personal-song premise and implicit antecedent.
  ID 8103 translates the apparent Temperance sense while recording the source
  spelling. ID 8105 retains the Withering War and grand self-description.
- ID 8108 leaves Lady Ansilla's Children unresolved. ID 8110 keeps the Head
  Steward role and service change. ID 8114 follows English over the
  conflicting Japanese `Hall of Heroes`; ID 8115 leaves Ventrinio's identity
  open while retaining the coast-defense claim.
- ID 8119 preserves the Blood Rite and two-deaths/one-survivor condition. ID
  8121 keeps the values and line break. ID 8125 retains the full Barghest/
  Three Winds Crutch relationship without deciding its exact lore type.
- ID 8127 follows English placeholder order and spacing; Japanese and Chinese
  formatting differences are documented. ID 8128 keeps the meat-bird joke.
  ID 8133 preserves the two paragraphs and four-pass confusion. ID 8135
  retains both drink names and crude comparison.
- ID 8137 keeps Maisie's Luck as a named heirloom. ID 8140 retains the
  Heart/Ring/House of Ballads relationships. ID 8143 uses the official
  Sagecraft term and leaves the formal office title open.
- Historical candidate wording is evidence only and does not authorize edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys in the same order.
- Actual CSV record line-break counts match across all four locales,
  including ID 8133's two paragraphs and ID 8121's two-line statistic.
- Localized runtime-marker identities/order and named icon markers match.
  Other brace-token identities match; ID 8127's order/spacing differences
  across locales are documented above.
- No active CSV structure or text was changed.

## Batch Status

IDs 8100-8149 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
