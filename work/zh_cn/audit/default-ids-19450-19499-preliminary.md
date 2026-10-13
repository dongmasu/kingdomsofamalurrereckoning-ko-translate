# Preliminary Language Scan: `default` IDs 19450-19499

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 19450-19499.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 19454, 19458, 19460, 19462-63, 19465-68, 19472, 19480, 19484, 19487, 19490-91, 19498 | Fateless One; Undersea Fasting; Hyperian; Freemen; Runere/Firstsworn; Snakestail Grotto; Alabastra; Gnomes | Align recurring names, titles, faction labels, and whether place labels should be localized. | Korean transliterates or translates forms that other locales retain or interpret differently. `Undersea Fasting` and `Snakestail Grotto` also have place/type conflicts across references. | Medium |
| 19464, 19474-76 | game of knuckles; grotesque whimsy; Hierophant; Hireling | Resolve the contest, unnamed gruesome object, institutional title, and hireling role only with context. | Korean reads knuckles as a fist-fighting wager, calls the object an ornament, and renders Hierophant/Hireling as `대사제`/`고용 용병`; references differ. | Medium |
| 19469 | `{*1potions}` / `{*1merchants}` / `{*1alchemy}` | Preserve each runtime wrapper and verify localized UI labels. | Korean localizes all three labels while retaining the `{*1...}` wrappers; the other locales do likewise. | Low |
| 19470, 19481-82 | lockpicking `by 1`; Boggart summon limit; Freeze chance | Preserve exact effect semantics, trigger conditions, and limits. | Korean retains the lockpicking increment and the five-summon cap. At 19482, English/Chinese describe a temporary 50% chance to freeze on being attacked, while Korean says the chance “increases by 50%,” potentially changing a fixed chance into an increment. | High |
| 19477, 19479, 19486 | colon-ended question; dam support; ungrammatical `Sounds who makes?` | Preserve continuation boundaries and avoid over-resolving malformed or ambiguous source wording. | Korean retains the colon at 19477, interprets the dam support as exposed at 19479, and renders the likely intended question at 19486. | Medium |
| 19478, 19483-84, 19497 | Grinning Vane; Master at Arms; Castellan; Decanus/Praetorians | Verify whether names/epithets and military offices have established Korean forms. | Korean translates `Grinning` in a likely named epithet, uses `병기장` for Master at Arms, and transliterates Decanus where Japanese/Chinese give a rank equivalent. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 19458, 19464, 19469-70, 19474,
  19477, 19479, 19483-84, 19486, 19490, and 19497. They remain preliminary;
  no historical note authorizes a translation edit.
- The ID 19469 localized marker payloads were compared with the active
  English, Japanese, Chinese, and Korean rows; their wrappers remain intact.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain IDs 19450-19499
  in identical order.
- No row-count, key, physical line-break, or runtime-wrapper identity
  difference was found. ID 19469 has three localized marker payloads with
  matching wrapper structure.
- The values at IDs 19405, 19470, 19481, and 19482 were reviewed against the
  source descriptions; the possible probability-vs-increment issue at 19482
  is recorded above.
- Korean wording and the source CSVs were not edited.

## Batch Status

IDs 19450-19499 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 19500-19549.
