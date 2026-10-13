# Preliminary Language Scan: `default` IDs 16400-16449

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 16400-16449.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 16400 | `dove` -> `아가씨` / Hierophant | Confirm the intimate address and canonical Hierophant title. | Japanese omits the address; Chinese calls the speaker a “peace envoy”; English uses intimate `dove`. Korean chooses `아가씨`, adding a gender/age implication. | High |
| 16401-16404 | Gadflow's Winter / Piercing Damage / fight fire with fire | Preserve the skill label and determine whether the idiom should be figurative or literal in Korean. | Korean retains the “fight fire with fire” image literally; Japanese instead uses “an eye for an eye,” while Chinese uses “poison with poison.” | Medium |
| 16405-16409 | not for sale / Ferria's tavern / Mercantile / fight | Preserve the refusal's tone, the shopkeeper's complaint, and the character's combat enthusiasm. | Korean retains the refusal and all main dialogue points; “not for sale” may be flirtation or a literal rejection of a bribe. | Medium |
| 16410-16414 | Lord of the Hunt / Three Swords / Cape Solace | Verify title/name forms and distinguish the named blademaster from the three legendary blades. | Korean preserves the boast “I am the hunt” and the arrangement to return one blade to Derfel and keep two; locale sources vary on whether Three Swords is a person, epithet, or literal blade-name. | High |
| 16416-16418 | contract / Phoenix Resistance `[DO NOT USE]` / red-eyed enemies | Preserve reward scaling and the explicit non-use warning. | Korean retains better terms leading to a better reward, keeps the warning as `[사용 금지]`, and retains the threat against the red-eyed targets. | High |
| 16421-16424 | Trek / Sir Creth / Nanne Hanri / Privateer's Uniform | Verify names, performed-role context, and uniform category. | Korean retains Trek's role as the only actor to play Sir Creth, Nanne's former chief-alchemist position, and the privateer uniform. | Medium |
| 16425 | `FAIL LINE` -> `실패 줄` | Determine whether this is a test/debug label or player-facing text. | English/Japanese retain the literal label, Chinese describes a failed dialogue line, and Korean translates it literally. No player context is present. | High |
| 16428-16430 | Mel Aglir / Rathir / Fargill Enfries | Verify proper-name spellings against recurring occurrences. | Korean retains the trade-hub geography and bilingual character name; the place/name forms remain cross-batch questions. | Medium |
| 16432 | Valor's Defender | Determine whether this is a named person, faction, or item and align House of Valor terminology. | Korean treats it as a title/name and retains the essence, gnome's depravity, and ironic near-praise. | Medium |
| 16434-16438 | Hierophant / higher or lower / travel / Fae immortality | Preserve prayer register, card-game choices, welcoming tone, and the “supposed immortality” caveat. | Korean keeps the central meanings; at 16438 it retains that Fae immortality is supposed/reported rather than asserting it as established fact. | Medium |
| 16439-16444 | Family Recipe / Gravehal Library / divine artifact / Spawning Pools | Verify proper names and whether Spawning Pools is literal creature-breeding terrain or a named place. | Korean preserves the artifact's impossible mortal craftsmanship and engraved floating city; it translates Spawning Pools literally, while Japanese calls it an origin/source and Chinese an egg-laying pool. | High |
| 16447 | Dark Sliver | Verify whether this is the staff's proper name and preserve the speaker's possessive reference. | Korean explicitly treats Dark Sliver as the speaker's named staff; Japanese does likewise, while Chinese can read it as an address/name for the listener. | Medium |
| 16448 | Varani trading rules / “add your terms” | Preserve the five-paragraph advice and clarify whether the final step means proposing, adding, or agreeing to one's own conditions. | Korean retains the sea/dice analogy, all three rules, friend-versus-friend warning, knowledge hierarchy, and closing counsel. Paragraph breaks match. | High |
| 16449 | Seranon | Verify the proper-name spelling. | Korean retains the name with English in parentheses; Japanese and Chinese leave it in Latin letters. | Low |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 16400, 16405, 16410, 16414, 16417,
  16428, 16430, 16432, 16444, and 16448 against all four active locale rows.
- The address, title, name, test-label, and item/location questions remain
  open. The divergent “fight fire with fire” rendering at 16404 and the
  ambiguity of Spawning Pools at 16444 are also recorded; no historical note
  authorizes a change.
- Cross-batch consistency candidates include Hierophant, Gadflow, Lord of the
  Hunt, Three Swords, Tuatha, Allestar, Valor's Defender, Fae, Gravehal,
  Spawning Pools, and Seranon.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match across all four locales. `[DO NOT USE]` at 16417 is preserved;
  ID 16448 retains all blank paragraph breaks. No structural exception was
  found.
- The official Korean manual could not be text-searched in this environment;
  terminology candidates remain unverified against it.

## Batch Status

IDs 16400-16449 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 16450-16499.
