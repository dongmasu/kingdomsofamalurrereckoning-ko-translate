# Preliminary Language Scan: `default` IDs 26551-26600

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 26551-26600 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 26551, 26553-26557, 26560-26568, 26570-26576, 26579-26585, 26587-26590, 26592-26600 | Dialogue and concise quest/item wording | Recheck character voice, tense, and context-dependent short labels during integrated review. | Korean generally preserves the source meaning and Japanese tone. ID 26552's “Beautiful, exquisite things” keeps the suggestive implication of ordinary blades being inadequate without stating an unstated action. ID 26564 preserves the great families' war-support position and Coriana Anwon reference. | Medium |
| 26558, 26575 | House of Valor / Champion of Valor | Resolve the corpus-wide Korean naming convention and compare every occurrence, including ID 26303. | Korean uses `용맹의 가문` at 26558, while the historical audit records `발러의 가문` at 26303. This is a direct consistency difference for the same named House. `Champion of Valor` is separately rendered `용맹의 챔피언`; do not normalize either without a terminology decision. | High |
| 26565, 26567, 26573, 26577, 26585, 26594, 26598-26599 | Lightwatch / Sun Camp / Belen / Witchknight and poison quest / Offering / Cape Solace / health potions / Tala-Rane | Review idiom, lore, and aspect while preserving the source's implied context. | At 26565, “drown your sorrows” is a drinking idiom in a tavern context; Korean says to forget sorrow, while Japanese and Chinese make drinking explicit. At 26573, English `my gift` is rendered `내 힘`, and the opening “I would never have known...” is recast as a counterfactual; determine whether `gift` is a power/ability in context. ID 26598's “has been essential” becomes past-tense `필요한 사람이었어`; check whether the support is still ongoing. | Medium |
| 26554-26555, 26564, 26573, 26577, 26587, 26594 | Kollossae / Marauder Totems / Mitharu and Order / Belen / Master Kiftal and Anira / Lyria / Akara | Standardize deity, faction, race, creature, item, and role terms; preserve speaker relationships and quest requirements. | The Korean keeps the Marauder Totem bounty, altar to Mitharu as god of Order, Belen testimony, Sorrogweth Fungus requirement, Lyria blessing, and Cape Solace residents' Akara belief. The cultist passage at 26573 remains context-sensitive and should be compared with other Belen entries. | High |
| 26559, 26578, 26586 | Material quantities / `$STR0` and `$STR1` / NUMPAD 2 | Preserve number order, variable identity/order, keyboard label, and layout. | ID 26559 preserves 5 wood materials and 2 cloth materials on separate lines. At 26578, English, Chinese, and Korean use `$STR0` then `$STR1`; Japanese reverses them to `$STR1` then `$STR0`. Korean follows English/Chinese. `NUMPAD 2` is localized in Korean as `숫자 키패드 2`. | High |
| 26551, 26554, 26558, 26561, 26564-26567, 26571-26572, 26577, 26584, 26588, 26592, 26594-26595, 26598-26599 | Aster/Scaith / Myrinne / House of Valor / Owaiglyn / Coriana Anwon / Lightwatch / Crilgarin / Argine / Mel Aglir / Cranwyn / Kiftal / Capstan Odvar / Gravehal / Harst / Cape Solace / Mallory / Tala-Rane | Maintain canonical names and a consistent Korean-English display convention. | Historical questions already list these people, places, groups, and item terms. This pass records the variants without treating any one spelling as approved. | Medium |

## Historical Audit Reconciliation

- The source-keyed historical log covers the Aster/Scaith, Myrinne,
  Marauder Totems, Mitharu, Bux, House of Valor, material quantities,
  Coriana Anwon, Lightwatch, Sun Camp, Cranwyn, Belen, Kiftal, Witchknight
  Anira, Sorrogweth, Capstan Odvar, Lyria, Gravehal, Harst, Cape Solace,
  Mallory, and Tala-Rane items.
- The history explicitly asks to compare House of Valor at ID 26558 with
  ID 26303. The current Korean forms differ and remain unresolved.
- ID 26578's source-order variable exception is recorded; it does not justify
  changing the Korean draft.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 26551-26600 exactly
  once and in identical order.
- Actual embedded line-break counts match across all four locales.
- Runtime variables are present at ID 26578 in all locales, but Japanese
  reverses their order. Korean matches English and Chinese.
- Counts at ID 26559 and the keyboard label at ID 26586 are preserved.
- No translation CSV was edited.

## Batch Status

IDs 26551-26600 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 26601.
