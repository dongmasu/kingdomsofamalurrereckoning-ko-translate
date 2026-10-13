# Preliminary Language Scan: `default` IDs 26351-26400

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 26351-26400 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 26351, 26353-26362, 26364-26366, 26370, 26373, 26377-26380, 26383-26390, 26392-26398, 26400 | Dialogue, journal, and brief UI wording | Recheck register, pronoun roles, and short-string context during integrated review. | Korean generally follows the English meaning and Japanese voice. The missing Warsworn guard's English pronoun is feminine (26395), while Korean naturally avoids gender marking. The ironic class contrast at 26396 and the public praise at 26379 retain their broad intent. | Medium |
| 26352 | Havok copyright notice / `{LINE_CENTER}` | Preserve the control marker and distinguish immutable legal wording from locale-specific typography/text. | English, Japanese, and Korean retain the English notice and two NBSP characters; Chinese localizes the notice and has no NBSP. All four retain `{LINE_CENTER}`. This is a Chinese-source variation, not a Korean change request. | High |
| 26354, 26357, 26367, 26369, 26374, 26376, 26381, 26391, 26395, 26399 | High King / Scaith / Beckoned / Master Makers / warden / chantries / Bursars / Dverga / Cradle of Summer | Align faction, rank, office, and lore terms with historical records; separate translator choices from source anomalies. | `Beckoned` appears as `부름받은 자`, a documented competing form. `warden` is rendered as `경비대장` at 26374 and remains role-sensitive. At 26381, English has the grammatical mismatch “The Bursars has warned you”; Korean uses plural “회계관들이 ... 경고했어,” following the likely intended meaning. | High |
| 26363, 26371-26372, 26382, 26387, 26393 | Evenroot / Gambit Combo / Alchemist Virtuoso / ale / Resist Arrest / Corporal Ivar | Preserve gameplay/UI meaning and standardize plant, ability, craft-rank, and office terms. | The mountain spring's exclusive use for Evenroot is retained; skill and rank labels remain concise. `Resist Arrest` is rendered as an infinitive-style objective, and `Corporal` as `상병`; terminology should be checked against related UI entries. | Medium |
| 26368, 26375-26376, 26379, 26392, 26396-26399 | Lore passages, metaphors, and characterization | Preserve the bloodshed/casualty context, faction distinctions, irony, and quest relationships. | The Korean keeps the casualty-count failure (26368), the irony about wealth and unemployment (26360), the Crows/Mad Dog/Mad Men distinction (26379), and the sarcastic “slum it up” jab (26396). `infect this land` is rendered as `타락시키다` at 26376, which should be reviewed against the game's corruption terminology. | Medium |
| 26355-26356, 26358-26360, 26367-26368, 26374, 26378, 26388, 26395, 26400 | Madding Wind / Hystis / Elwa / Straton / Emaire / Didenhil / Edgar / Gravehal / Lyenna Crosse | Maintain name spellings and bilingual parenthetical use according to an eventual corpus-wide convention. | Historical questions already inventory these place/person names and identify the Lyenna Crosse/Dramil necklace entry at 26400. This pass retains them as consistency candidates rather than deciding canonical Korean spellings. | Medium |

## Historical Audit Reconciliation

- The preserved question log identifies High King, Master Makers, warden,
  Bursars, Evenroot, Gambit Combo, Alchemist Virtuoso, and ale terminology.
- It also records the internal-looking Havok line, names including Scaith,
  Elwa, Straton, Emaire, Kerrinan, Telogrus, Octienne, Lyenna Crosse and
  Dramil, plus the irony and faction/place questions in this range.
- ID 26381's English grammar issue is retained as a source anomaly; the
  historical inventory does not certify the Korean wording.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 26351-26400 exactly
  once and in identical order.
- Embedded line-break counts and extracted runtime-token signatures match.
- At ID 26352, the `{LINE_CENTER}` marker is preserved in each locale.
  English/Japanese/Korean have two NBSP characters in the copyright string;
  Chinese has none and localizes the legal text.
- No Korean translation or source CSV was edited.

## Batch Status

IDs 26351-26400 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 26401.
