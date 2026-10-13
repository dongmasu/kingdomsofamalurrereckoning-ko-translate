# Preliminary Language Scan: `default` IDs 21701-21750

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 21701-21750 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 21701 | concatenated `GodricPayne` / `고드릭 페인` | Confirm the canonical character spelling; retain the intended separation between first and family names. | English source concatenates the name, while Japanese and Korean indicate “Godric Payne.” Korean adds a space and preserves the honorific. | High |
| 21703 | Crystal War / `영웅으로` | Align the event name and check whether “hero” adds an unsupported characterization. | English says legends will tell of the player ending the war; Korean says the story will be told of the player “as a hero” who ended it. | Medium |
| 21704 | `my lady` / `우리 여주인` | Identify the speaker's lady/master only if context permits; retain the conditional willingness to kill. | Korean preserves the condition and does not invent a proper name for the lady. | Medium |
| 21707 | dustling / `먼지 인간` | Align this derogatory mortal epithet with established lore terminology. | Korean gives a literal “dust human” rendering; English and Chinese support the contemptuous reference to another mortal. | Medium |
| 21709 | potion from an acid solution | Clarify whether this is a potion made from acid or an acid solution applied to restore an object's shine. | Korean preserves the restoration effect and Nell's expected payment; the source syntax and recipe/object context remain ambiguous. | Medium |
| 21714 | `A Trip Alserund` / `알세룬드 여행` | Verify Alserund spelling and whether this is a quest title or ordinary travel prompt. | Korean renders it as a trip to the named place; English title is ungrammatical/incomplete and Japanese/Chinese use a travel-title reading. | Medium |
| 21716 | Mithroliths / `미스로리스 다섯 곳 더` | Align the plural with the established Mithrolith form and confirm that five additional sites are required. | Korean retains “five more” and the place/object name; spelling varies in English versus earlier glossary entries. | Medium |
| 21718 | Herald / Lord of the Hunt / Ametair | Verify the deity/title and whether Herald means messenger, attendant, or ceremonial office. | Korean uses `전령`; Japanese uses a servant/attendant reading and Chinese supports herald. | Medium |
| 21719 | +9 Physical / +40% longbow damage | Keep the flat and percentage bonuses distinct and preserve their applicability to longbows. | Korean retains +9 physical damage and +40% longbow damage on separate lines. | High |
| 21721 | `Mexico` | Determine whether this isolated out-of-world country name is a test string or player-facing content. | All locales contain the same literal country name; historical audit marks it as potentially internal/test text. | Low |
| 21724 | Lotos / Warchief / Preordained | Align the character, faction, and rank with earlier forms; retain the self-introduction and greeting. | Korean uses `전쟁족장` for Warchief and the established `예정된 자들` form for Preordained; English misspells `acquaintance` but the Korean greeting is clear. | Medium |
| 21733 | unraveling / fateshift / Fate / `{1}` / `{LINE_SPACE}` | Align mechanic/UI terminology and preserve all control, localized-label, and line-space markers in source order. | Korean preserves the two `{1}` controls, all four localized wrappers, `{LINE_SPACE}`, and the sequence of approach, activation, effect, bonus, and continue prompt. | High |
| 21736 | Weapon Attacks / Delayed special attacks | Confirm the skill-tree label and what “Delayed” means for Daggers and Faeblades. | Korean retains the heading and delayed-special-attack unlock; the gameplay meaning of “Delayed” remains unclear. | Medium |
| 21738 | `PRIOR` / `이전` | Determine whether this is the ordinary word “prior” or a legacy keyboard/Page Up label for the target platform. | Korean translates the ordinary previous/back sense; English/Japanese preserve the uppercase input label, while Chinese explicitly says Page Up. | High |
| 21739 | Sagrell / “lights of this summer life” | Align the lore names and preserve the repeated Sagrell/you emphasis and ballad-like register. | Korean retains resurrection, return to the light of summer life, and the repeated condition that the ballad cannot be sung without Sagrell or the player. | Medium |
| 21744 | Hospitalis Quarters / board of petitions | Align the district name and determine whether the board is formally a petition board or notice board. | Korean preserves that residents post petitions and the speaker maintains the board for the place's good. | Medium |
| 21745 | The Testament / `테스타먼트` | Determine whether this capitalized term names Belen's faction/cult, a text, or another group. | Korean transliterates the name and preserves the speaker's lack of remorse after killing its members; nearby references remain context-dependent. | Medium |
| 21748 | `hound the Tuatha` / `faithful instrument` | Preserve the relentlessly pursuing sense and the speaker's manipulative praise. | Korean says the player would see tasks through in any situation and became the speaker's faithful tool; Chinese reads the latter more favorably as an assistant. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions for IDs 21701, 21703-21704, 21707, 21709,
  21714, 21716, 21718, 21721, 21724, 21733, 21736, 21738-21739, 21744-21745,
  and 21748 against the active four-locale rows. They remain preliminary
  questions; no historical note authorizes a translation edit.
- Cross-checked Godric Payne, Crystal War, dustling, Alserund, Mithrolith,
  Ametair, Preordained, Hospitalis Quarters, the Testament, and the
  tournament/tutorial terms against recurring usage. Official-manual text
  search was unavailable in this environment; named-term verification
  remains pending for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 21701-21750 exactly
  once and in identical order.
- Physical line-break counts match for every ID: one embedded break at 21719
  and two at 21736; other rows have no embedded line breaks.
- IDs 21719 preserve +9 and +40% values.
- ID 21733 retains all normalized runtime-marker identities in the same order
  in all four locales, including both `{1}` controls and `{LINE_SPACE}`.
- No key, order, line-break, numeric-value, or detected runtime-token
  discrepancy was found in this batch.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 21701-21750 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
21751.
