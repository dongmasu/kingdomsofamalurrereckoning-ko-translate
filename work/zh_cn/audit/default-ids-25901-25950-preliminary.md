# Preliminary Language Scan: `default` IDs 25901-25950

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 25901-25950 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 25901-25908 | sword-forging sister / Peacock / Arden / Byrn Elgar | Verify speaker/character references and preserve the sister's abrasive exterior and smithing skill. | English and Chinese identify a sister; Korean's `누이` selects an older sister, not explicit in English. The stat row preserves 43 Magic, 32 Melee, and 32 Ranged damage blocks in the source order. | Medium |
| 25909-25914 | Evenroot / Telogrus / Cartery Jayck / Pryderi / Laboratories | Standardize names and preserve the watering task and the city's trade-control claim. | Korean retains the task completion and the description of the goods-store owner controlling nearly all city trade. | Medium |
| 25915 | Ethene / Arkes / Hyperian confession | Preserve the five-line structure and verify the sequence of failed mission, attempted elevation, eruption, and near-fatal injuries. | English is grammatically fragmented (“and earn our recognition”); Korean resolves it as an attempted ascent for recognition. All four locales retain five lines, but sentence/line relations differ. | High |
| 25916-25923 | Gravehal / Ironfast Keep / Menetyre / Maid / Tyr Magnus / Chaos potion / trader | Verify names/roles and preserve the spider-stinger contract and the merchant's intentionally discouraging questions. | Korean retains the kill-and-submit-proof objective and the merchant's quality/quantity challenge. | Medium |
| 25925-25932 | caravan / Scholia Neophyte ring / Alserund / Weave / Borm of Bowstrings | Standardize proper/institutional names and preserve the prophecy and title. | Korean identifies the ring as proof of Neophyte rank but does not explicitly render the source's associated rights and honors. | Medium |
| 25934-25941 | credit roles / wounded at tower / Bruten / Oratory / Ettinmere / Arnick Arduna | Translate production roles and verify named people/places and the High Court venue. | `Oratory` is rendered as `예배당`; Japanese says prayer hall and Chinese says auditorium, so the venue's function is unresolved. At 25939, “his masters” and “my death” leave the debt/reference context open. | High |
| 25944-25949 | Agraivin / `$SQ23.bribe_value$` / soldier background / card guess / diplomatic mission | Verify names and preserve the bribe variable and game-number result. | Korean retains the exact `$SQ23.bribe_value$` token and the low-guess/four result. | Medium |
| 25950 | Hall of the Firstsworn | Verify the established place name and whether “Hall” is a named venue. | Korean renders a named Firstsworn hall; Japanese instead says shrine, while Chinese agrees with hall. | Medium |

## Historical Audit Reconciliation

- Rechecked source-keyed questions for IDs 25900-25949. The five-line
  confession, Neophyte ring, credit roles, injured-at-the-tower reference,
  Bruten, Oratory, and variable/card details remain candidates.
- Cross-checked recurring forms for Evenroot, Telogrus, Pryderi, Gravehal,
  Ironfast Keep, Menetyre, Tyr Magnus, Scholia Arcana, Alserund, Borm,
  Bruten, Wencen, Oratory, Ettinmere, Arnick Arduna, Agraivin, and
  Firstsworn.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 25901-25950 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales, including the
  five-line confession at ID 25915.
- Runtime-token signatures match, including `$SQ23.bribe_value$` at ID 25945.
- Numeric damage values and the card result are retained. No structural
  exception was found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 25901-25950 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
25951.
