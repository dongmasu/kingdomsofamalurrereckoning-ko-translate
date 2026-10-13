# Preliminary Language Scan: `default` IDs 26301-26350

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 26301-26350 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 26301-26302, 26305, 26307-26309, 26315-26316, 26322-26328, 26330, 26332, 26334-26336, 26341, 26344-26345, 26350 | Dialogue, journal, and short UI wording | Check role/tense, character voice, and context-dependent brevity during integrated review. | Korean generally follows the English meaning and Japanese tone. ID 26307 preserves the ironic “Stay a while. As if we had a choice”; ID 26316 retains the distinction between a fallen city and citizens being trampled. No isolated approval is implied. | Medium |
| 26303, 26313-26314, 26317-26320, 26329, 26333, 26337, 26340, 26342-26343, 26346-26349 | House of Valor / Scholia Arcana / Unbound / Dverga / Dead Kel / Maid / Farrara / Enfamanir / Sidhe / order and proper names | Align recurring institutional, faction, title, and proper-name forms with the established glossary and bilingual-marking practice. | Historical notes explicitly compare ID 26303's `발러의 가문` with `용맹의 가문` at ID 26558. `Unbound`, the Maid, named Fae, and `our order` at 26340 remain context-sensitive. The line about the “modern Aisling Thirteen Fingers” (26320) needs name/lore consistency, not a local guess. | High |
| 26306 | Keeper's Rite / Crossing / Caer Elatha | Verify whether `Crossing` is a named rite/location or a generic passage and keep the three concepts distinct. | English explicitly says “invoke the Keeper's Rite” to “gain access to the Crossing” at the Fae hollow Caer Elatha. Korean says to perform the Guardian's rite in order to pass through the hollow's `통로`, which may flatten the capitalized lore term `Crossing`. | High |
| 26321 | Fae proverb | Preserve proverb cadence and confirm whether Korean `\\\"` sequences are runtime escapes or visible backslashes. | The proverb's short aphoristic form and attribution are retained, but the Korean field uses backslash-quote sequences while English/Japanese/Chinese use their own ordinary quote forms. This resembles the format question logged at ID 26224. | Medium |
| 26324, 26339, 26347 | Rond Farm / Aron Excavations / Hollowlands and Octienne | Standardize place and organization names, including English parenthetical display where the eventual convention requires it. | The history of `Rond Farm`, `Aron Excavations`, and `Hollowlands` is already part of the source-keyed name inventory. Korean uses `론드 농장`, `애런 채굴 사무소`, and `할로랜즈`; retain as candidates for corpus-wide consistency review. | Medium |
| 26331, 26338 | Dagger delayed attack / `SpawnVol5` | Preserve skill mechanics and determine whether the spawn label is player-facing text or an internal identifier before choosing a Korean display form. | The Dagger description retains the delayed second-hit critical effect. `SpawnVol5` appears internal-looking; Korean localizes it as `생성 Vol. 5`, so its intended audience and exact label need classification. | High |

## Historical Audit Reconciliation

- The historical question log groups 26303, 26321, 26329, and 26337 for the
  House of Valor poem, Fae proverb, Shadow of Enfamanir, and Maid terminology;
  it explicitly asks to compare House of Valor forms at IDs 26303 and 26558.
- It also inventories the names Afan, Wulf, Cadoroc, Drewn, Lyria, Alserund,
  Caer Elatha, Dverga, Dead Kel, Akara-Tor, Aisling Thirteen Fingers, Almere,
  Rond Farm, Enfamanir, Gardens of Ysa, and Sidhe.
- Historical terminology questions cover Neophyte, Scholia Arcana, Unbound,
  order, and the internal-looking `SpawnVol5` label. They remain unresolved
  evidence, not accepted dispositions.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 26301-26350 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales, including the
  six-line House of Valor passage at ID 26303 and the multi-sentence lore at
  ID 26329.
- Extracted runtime-token signatures match; no numeric or marker exception
  was found.
- Korean ID 26321 contains literal backslash-quote sequences, logged as a
  format question. Korean wording and all translation/source CSVs were not
  edited.

## Batch Status

IDs 26301-26350 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 26351.
