# Preliminary Language Scan: `default` IDs 38851-38900

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 38851-38900 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, available historical terminology notes, line
  breaks, runtime markers, values, and recurring terms.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 38865 | `they may bet his way` / `자기 이름으로 내기를 걸 수 있어` | Clarify whether the gladiator can bet on themself, or whether spectators may bet on that gladiator; avoid adding an unsupported transaction detail. | English uses an unclear pronoun and “bet his way.” Japanese says wagers can be placed on that fighter; the Korean can instead read as the gladiator placing a bet under their own name. | Medium |
| 38871 | mediciner / `약초 치료사` | Confirm whether the speaker is a general medicine practitioner or specifically an herbal healer. | English says “simple mediciner,” Japanese/Chinese say doctor, while Korean narrows the occupation to herbal treatment. An earlier audit notes `mediciner` as a recurring terminology question. | Medium |
| 38874 | Offering / `봉헌 의식` | Standardize the capitalized rite/location term while retaining whether it is a ceremony or a place where it occurs. | English asks “Where is the Offering?” Japanese asks where it is performed and Chinese asks where the sacrifice takes place. Earlier audits leave Offering as a named rite with unresolved canonical Korean. | Medium |
| 38877 | `late night liaisons with his wife` / `밤늦게 만난 걸` | Preserve the implied intimate/illicit relationship, not just a late-night meeting. | English implies an affair; Japanese explicitly says secret relations and Chinese says they were having an affair. Korean only says the jarl discovered a late-night meeting. | High |
| 38885 | Blood Rite / `혈맹의 의식` | Verify whether the named rite is a blood sacrifice/ritual rather than a blood alliance or oath, while retaining the two-lives-for-one condition. | English calls for a Blood Rite and states the exchange as two lives for one. Japanese and Chinese describe a blood ritual; Korean's `혈맹` can imply an alliance/oath. Earlier audit notes already flag Blood Rite wording. | Medium |
| 38899 | Unlocked! / `잠금 해제!` | Check whether this is a completion/status notification (“unlocked”) or an instruction to unlock. | English and Chinese present a completed unlock state; Korean's noun phrase can read like an action label. UI context is needed. | Low |

IDs 38851-38864, 38866-38870, 38872-38876, 38878-38884, and 38886-38898
generally retain the English meaning on this first reading. ID 38889's Cipher
may be a named object rather than a generic code. ID 38891 localizes an exact
quarter-inch armor gap as less than a finger-width; check whether that loss
of measurement precision matters in context.

## Historical Audit Reconciliation

- The historical source-keyed open-question log has a documented gap covering
  IDs 37700-40349. Earlier notes on Blood Rite, Offering, mediciner, named
  labels, and game-stat text were consulted; they remain candidates, not
  approved dispositions.
- ID 38854's `FAIL LINE 1` is an internal/test-like label, as with the
  previously recorded `FAIL LINE` at 38240; whether it is player-facing
  remains unknown.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 38851-38900 once
  and in identical order.
- Embedded line-break counts and detected runtime-marker identities/order
  match across all four locales.
- ID 38875 retains the 8-second duration, 40% armor reduction, and 30 Mana
  cost. No other numeric or runtime-token exception was detected.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 38851-38900 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 38901.

## Subsequent Working Disposition

The separate disposition pass is recorded in
`disposition-batch-default-38851-38900-20261010.md`: two accepted, two
`not an issue`, and four uncertain findings. Corrections at IDs 38871 and
38877 restore the general medical occupation and the implied affair. Blood
Rite and Offering terminology remain open; this preliminary scan is not
independent final review.
