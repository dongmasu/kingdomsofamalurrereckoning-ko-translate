# Preliminary Language Scan: `default` IDs 19400-19449

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 19400-19449.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 19400-03 | Tuatha/Seelie; gilded collar; Alder/Akara | Preserve the dismissive faction conflation, coercive collar/noose metaphor, and ambiguity about whether Akara selects or brings people by need or fate. | Korean retains these relations; the names and the collar's literal/metaphorical status remain context-dependent. | Medium |
| 19405 | Lightning/Shocking damage; Mana | Verify distinct damage terminology and exact values. | Korean preserves 360 Lightning Damage, 30 Shocking Damage, 135 Mana, and the source line break. | Low |
| 19407 | Gleir Rathwen / Bayala Tirin / Rathir / Dokkalfar / Parting | Verify lore names, chronology, and verse imagery together. | Korean preserves the founding date (14 years after the Parting) and all four locales have 7 physical line breaks. | Medium |
| 19412, 19419-20, 19422 | Rites of Passage; squire / “a season”; Detyre; Idwa Widfrond | Confirm named-rite status, rank, ambiguous season duration, region name, and whether “ran off” means fled or eloped. | Korean keeps the duration nonspecific and renders “ran off” as fled; the Japanese and Chinese versions differ on the season's length. | Medium |
| 19427-30 | deposing speaker; `The Scion prepares`; foraging; “back and forth for years” | Preserve political threat and fragment status; clarify whether the repeated situation is stagnation or recurring cycles. | Korean keeps the coercive threat and renders the repeated situation as continuing back-and-forth; Scion's identity remains unclear. | Medium |
| 19431-35 | Mitharans / Eldrith / 3033-1049 BE; Orison / Delver / Winter | Verify historical terms and chronology; check whether the Orison is the implied subject and standardize Delver/Winter terminology. | Korean retains the six English line breaks, era range, and names. Japanese and Chinese differ in layout; Japanese explicitly supplies Orison in 19434. | Medium |
| 19437, 19444, 19447-49 | beggar/hag verse; Maid; two Houses; Father Dynwel; Lunala | Review compressed verse, title/faction referents, and recurring proper names. | Korean preserves the verse's repeated “bent” image; `Maid` is rendered as `시녀`, and the Houses remain unnamed. | Medium |
| 19440 | `Klurikon Protoype` | Preserve the likely intended “Prototype” meaning while leaving the source typo untouched. | Korean renders “prototype”; the English source misspells it. | High |
| 19443 | `{*1[Weapon Attacks]}` / Chakrams Dodge attacks | Verify the ability description and localized UI label while retaining the runtime wrapper. | Korean preserves the `{*1[...]}` structure and line break; the visible label is localized, as in other locales. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 19400-05, 19407, 19412, 19419-20,
  19422, 19427-31, 19434-35, 19437, 19440, 19443, and 19447. They remain
  preliminary; no historical note authorizes a translation edit.
- The historical note's claim that all six ID 19431 line breaks are preserved
  is correct for English and Korean, but Japanese has four and Chinese five.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain IDs 19400-19449
  in identical order.
- No row-count, key, or runtime-wrapper identity difference was found.
  Physical line-break counts differ at ID 19431 only (EN/KO 6, JA 4, ZH 5).
  ID 19407 has 7 line breaks in every locale. Korean matches English at 19431.
- ID 19405's numeric values and Mana cost match. ID 19443 localizes only the
  marker label while preserving its wrapper and following line break.
- Korean wording and the source CSVs were not edited.

## Batch Status

IDs 19400-19449 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 19450-19499.
