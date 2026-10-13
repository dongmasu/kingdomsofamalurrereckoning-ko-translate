# Preliminary Language Scan: `default` IDs 25251-25300

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 25251-25300 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 25251, 25253 | Eli Tems / Varani / crudok / gnomes | Standardize names and preserve the distinction that the crudok was already present but only recently began preying on gnomes. | Korean retains the chronology and species relationship. | Medium |
| 25254-25255 | Travelers Camp / Understyle | Preserve the comparison to the Travelers' own camp and verify whether Understyle is a formal district name. | Korean treats both as place/faction terms; Chinese renders Understyle descriptively as an undercity garden. | Medium |
| 25260-25261 | Oreyn / antelope / Atheof | Verify both names and retain the transformation premise and request for help. | Korean preserves that Oreyn became an antelope and retains Atheof in transliteration. | Medium |
| 25265 | `$SQ53.bribe_value$` | Preserve the exact runtime variable and its position in the gold offer. | All four locales retain the same variable; no token mismatch was found. | High |
| 25267 | Seawatch / private sea access / protected perch | Clarify the proposed benefit and what “protected perch” denotes; preserve that the offer is accepted only after another task. | Korean retains private access, a safe viewpoint, acceptance, and the prerequisite. | High |
| 25268 | Pagus / manageable infestations / Niskaru spawn | Verify Pagus and preserve the speaker's contrast between controllable pests and Pagus treating them as Niskaru offspring. | Korean keeps the contrast; the pest's species and Pagus's identity remain contextual. | Medium |
| 25269, 25271 | Requiem / black gulls / Mitharan / Mithros | Standardize ship, deity/people, and region forms; preserve the ominous rigging image and distinction between Mitharan folk music and Mithros tradition. | Korean retains the dead gulls/corpses and regional music, but uses `미스란` for Mitharan and `미스로스` for Mithros. | High |
| 25272, 25277-25278 | Birth Candle / Chrysalae / ritual | Verify the ritual object's and plant's canonical names and preserve that the ritual required the player's help. | Korean retains the search, planting task, and thanks; locale spellings and whether Chrysalae is a plant name vary. | High |
| 25274-25276 | Mitharu / the Executioner / Teers | Standardize the deity, vigilante, and crew-member names; preserve the Executioner's feminine reference and the drugging/abandonment/treasure sequence. | Korean retains the chronology, but omits an explicit Korean pronoun for the Executioner; the source explicitly says “She.” | Medium |
| 25280-25281 | Unseelie ring / Destiny Stone / Agarth | Standardize the fae-group and character names and distinguish Destiny Stone from Fate Stone terminology. | Korean uses `운실리`, `운명의 돌`, and `아가스`; Japanese says “fate stone,” while English/Chinese use “Destiny Stone.” | High |
| 25283 | Nyralim / “ignore anything he says about me” | Standardize Nyralim and retain the masculine referent without over-resolving what he may say. | Korean preserves the warning; the pronoun is explicit in Japanese and English but naturally omitted in Korean. | Medium |
| 25288 | Cutter / “dear old Cutter” | Determine whether Cutter is a name, role, or nickname and preserve the teasing victory announcement and claim to winnings. | Korean retains the joking tone and the speaker's request to take their share. | High |
| 25290 | The Preordained / Calan Mcleod | Verify the faction/title rendering and proper-name spelling. | Korean uses plural `선결된 자들` for the English collective title; Japanese/Chinese use a singular/group form. | Medium |
| 25293 | Lawbreaker's Grotto | Confirm whether this is a named place and standardize it; resolve the locale source conflict. | Korean renders a grotto-like hideout; English/Chinese support a grotto, while Japanese instead says “Gorhart Prison.” | High |
| 25295-25299 | mortal / Almain Firemage / Maisie's Luck | Standardize the mortal/faction terms and class name; determine whether Maisie's Luck is a named game, saying, or ordinary phrase. | Korean retains the reason for joining the Travelers and uses `알마인 화염술사`; context for Maisie's Luck is absent. | Medium |
| 25300 | Goddess Lyria / Priestess / Erathell | Preserve the speaker's religious practice and the guidance/protection attributed to the priestess; standardize the deity and place names. | Korean retains the wartime context and uses respectful religious phrasing; English/Japanese/Chinese differ between worship and prayer wording. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 25250-25251, 25253, 25255,
  25260-25261, 25265-25267, 25268-25271, 25272, 25274-25278,
  25280-25281, 25283, 25288, 25290, 25293, and 25295-25299 against the
  active locale rows. Names, chronology, bribery token, Seawatch offer,
  creature/ship/region terminology, ritual terms, Fate/Destiny Stone,
  Preordained, Lawbreaker's Grotto, and class/name readings remain open.
- Cross-checked recurring forms for Varani, Eli Tems, Understyle,
  Travelers, Oreyn, Atheof, Seawatch, Pagus, Niskaru, Requiem, Mitharan,
  Mithros, Mitharu, the Executioner, Chrysalae, Unseelie, Destiny Stone,
  Agarth, Nyralim, Calan Mcleod, Lyria, and Erathell.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 25251-25300 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales except ID 25208:
  EN/KO have 14 line feeds and JA/ZH have 11. The five section boundaries
  and blank-line structure align, but three additional internal hard wraps
  occur in EN/KO and their exact positions differ.
- Runtime-token signatures match, including `$SQ53.bribe_value$` at
  ID 25265; no other runtime marker occurs.
- Numeric and quest/event order is retained. The ID 25208 line-wrap
  difference and its source typos (“are are,” “usally”) are recorded without
  changing any CSV.
- No Korean wording or source CSV was edited.

## Batch Status

IDs 25251-25300 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
25301.
