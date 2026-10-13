# Preliminary Language Scan: `default` IDs 39001-39050

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 39001-39050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, available historical terminology notes, line
  breaks, runtime markers, values, and recurring terms.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 39004 | The Baronett / `바러넷` | Standardize the pirate's proper-name spelling with the earlier Baronett finding; do not reinterpret it as a generic baron. | English capitalizes The Baronett as a name. An earlier report records `남작네트` as a provisional phonetic form; this row uses a different form. | High |
| 39020 | Solemn Bell / `장엄한 종` | Confirm whether Solemn Bell is a named quest object and retain a consistent proper-name form. | English capitalizes the item, Japanese places it in quotation marks as a name, and Korean/Chinese read as a generic “solemn bell.” | Medium |
| 39022 | Traveler / `여행자` | Check whether this capitalized Traveler is the named faction member and align it with other Travelers references. | English and Japanese identify a female Traveler who pickpocketed the speaker; Korean uses the generic occupation. Earlier audits repeatedly leave Travelers as a faction/name consistency issue. | Medium |
| 39043 | `dove` / `내 사랑` | Preserve the affectionate address while checking that the Korean does not intensify its romantic force beyond context. | English uses the endearment “dove.” Japanese omits it, Chinese renders an unrelated peacekeeper-like address, and Korean uses “my love.” Earlier audit notes treat `dove` as an affectionate address. | Medium |

IDs 39001-39003, 39005-39019, 39021, 39023-39042, and 39044-39050
generally retain the English meaning on this first reading. Proper names,
speaker relationships, register, and UI context remain subject to integrated
review.

## Historical Audit Reconciliation

- The historical source-keyed open-question log has a documented gap covering
  IDs 37700-40349. Existing notes on The Baronett, The Crossing, Travelers,
  and `dove` were consulted; no prior candidate is treated as an approved
  disposition.
- The exact Korean spelling of The Baronett remains inconsistent across
  occurrences.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 39001-39050 once
  and in identical order.
- Embedded line-break counts and detected runtime-marker identities/order
  match across all four locales.
- ID 39005 retains rare-equipment salvage meaning; ID 39016 retains the
  gladiator/gambler income source. No numeric or runtime-token exception was
  detected.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 39001-39050 received one preliminary reading. Findings were later
dispositioned in `disposition-batch-default-39001-39050-20261010.md` and
registered as D-12519-D-12523. This remains preliminary work, not independent
Reviewer approval. Continue the disposition pass at `default` ID 39051.
