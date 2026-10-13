# Preliminary Language Scan: `default` IDs 19700-19749

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 19700-19749.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 19703, 19708-09, 19711, 19714, 19717-18 | Erathell; Emberwood; Bolgan Bane; Sceptre; Niahm/Kolmir/ettin war-priest; Preordained/Freehold; Stoneskin | Verify names, faction/region types, and established weapon/role terms. | Korean localizes these terms; source locales differ on names and whether some are proper labels or descriptions. `홀` for Sceptre remains a terminology candidate. | Medium |
| 19720-21, 19724, 19727-28 | Lyria's will; vague course of action; Domus Politica; family control; three months' guard duty | Preserve the compressed logic, unspecified objective, institution name, and exact duration without supplying context. | Korean retains the conflict with Lyria's will, generic action requirement, and three-month night-and-day duty. Domus Politica's institution/building status is unresolved. | Medium |
| 19732-33 | collective `We forgive you`; Saturnalia | Confirm whether the speaker's `We` is a formal collective voice and whether Saturnalia is a named event or the festival concept. | Korean's `용서하마` reads as singular first person; Japanese also omits the plural, while Chinese uses a plural voice. Korean/Japanese transliterate Saturnalia and Chinese translates it. | Medium |
| 19738, 19740 | Warden Bridge; `{*1Shield Bash}` / damage mitigation | Verify Warden's title sense and skill/UI terminology while preserving the marker wrapper and exact stat. | References interpret Warden as keeper or prison official. Korean localizes Shield Bash inside `{*1[...]}` and preserves +40% mitigation while blocking. | Medium |
| 19743, 19745 | “witless and eager”; guile under kindness | Preserve the deliberately insulting description and the contrast between scheming and possible gentleness. | Korean retains the condescending characterization and underlying possibility of kindness. | Low |
| 19746, 19749 | Isles / Livrarium / Basilica Gnostra / Forum; Morganer Rile | Verify whether Isles is a named civic district and standardize institution and character spellings. | Korean renders Isles generically as `군도` and transliterates the named institutions; reference forms differ. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 19703, 19708-09, 19711, 19714,
  19717, 19720-21, 19724, 19732-33, 19738, 19740, 19743, and 19746. They
  remain preliminary; no historical note authorizes a translation edit.
- ID 19740's localized skill label was checked separately from its runtime
  wrapper and numeric effect.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain IDs 19700-19749
  in identical order.
- No row-count, key, or physical line-break difference was found. ID 19740
  localizes the `{*1[...]}` label while retaining its wrapper; the +40%
  blocking mitigation value matches.
- The three-month duration at ID 19728 is retained. Korean wording and source
  CSVs were not edited.

## Batch Status

IDs 19700-19749 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 19750-19799.
