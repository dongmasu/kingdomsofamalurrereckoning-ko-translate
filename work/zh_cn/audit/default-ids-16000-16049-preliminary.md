# Preliminary Language Scan: `default` IDs 16000-16049

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 16000-16049.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 16000 | silver -> `은화` | Determine whether the speaker means silver metal, silver currency, or coins. | English, Japanese, and Chinese say “silver” without specifying coins; Korean narrows it to `은화`. The shop context may resolve the intended commodity. | Medium |
| 16001 | `Behind the Veil` -> `장막 너머` | Confirm whether Veil is a named place, faction, or metaphor and preserve capitalization if it is a proper name. | The isolated title supports a literal “beyond the veil” reading but gives no referent. | Medium |
| 16002 | Materials / Paddy / Keep / Tower | Verify the names and preserve the delivery-to-construction sequence. | Korean retains the collected materials, delivery to Paddy at the Keep, and purpose of beginning Tower construction. | Medium |
| 16003 | passion / waves and wind consuming bones | Preserve the defiant voice and the image of fighting until nature consumes the remains. | Korean retains the refusal to be stopped and the conditional “if need be” ending. | Medium |
| 16004 | Mitharu / generous and just | Align the deity's Korean form and preserve the conditional reward. | Korean keeps the gratitude, deity name, generosity/justice, and reward contingent on helping. | Medium |
| 16006-16008 | Matron Eowl / Chaos Critter / Klurikon | Verify the title/name forms and whether `Chaos Critter` is a named creature type. | Korean uses `대모`, generic `괴물`, and bilingual Klurikon; Japanese transliterates the creature label and Chinese reads it as a small monster. | Medium |
| 16010-16011 | hallowed grounds / Green / Healer's warmth | Determine whether Green is a proper name and preserve the stranger/mortal/healer distinctions. | Korean treats Green as a name and retains the healing offer and mortal-war question; the color/name ambiguity remains unresolved. | Medium |
| 16015-16016 | Red / faked deaths / tribute | Verify Red as a person or nickname and preserve desertion and tribute context. | Korean retains the group desertion, risk that Red finds them, and the report that the tribute was accepted. | Medium |
| 16018 | Mathon / errant thread / mockingbird / crimson sword | Preserve the four-line verse, impersonation image, and sequence; check whether adding “Fate” to “the weave” is supported. | Korean retains all four lines and the mockingbird's borrowed calls, but renders “the weave” as `운명의 직조`, adding Fate where English/Japanese do not state it explicitly. | High |
| 16020-16024 | Gorguath / House of Ballads / deserters / Vauner House | Verify place/faction names and determine whether Vauner House means a family, faction, or location. | Korean retains the destination, House of Ballads knight, deserter bounty, and Vauner family-like form; the isolated name does not settle the category. | Medium |
| 16026 | cut-throat woman / pendant | Preserve the crime-scene details and that the pendant remains clenched in her fist. | Korean retains the cut neck, likely regional bandit cause, and pendant in the woman's fist. | Medium |
| 16030-16033 | Jottun / gnome / Fate / Akara | Verify people/deity terminology and preserve the threat's heaven-to-hell parallel. | Korean retains the speaker's knowledge of Jottun risks, the Adessa gnome description, and Akara pulling the speaker down from the heavens. | Medium |
| 16035-16037 | Mel Senshir / Founding of Scholia Arcana / mobility | Verify place/institution names and whether “mobility” means freedom to act or physical maneuverability. | Korean keeps the eastern bastion and founding title, but translates the city-based freedom to move/act as `기동성`, which can suggest physical maneuverability. | High |
| 16039 | Zungar / Apotyre / Whitestone / gnomes | Verify the recurring name forms and preserve the accepted assignment and northern mine location. | Korean retains the decades-long threat, takeover intent, accepted task, and mine north of Whitestone. | Medium |
| 16040 | Litany Altar / `them` | Identify the plural objects and align the altar name. | Korean preserves the surprise, windfall, and instruction to place the objects by the altar; the antecedent is outside the row. | Medium |
| 16041-16043 | doctor / killer / blood cleanup / scaffolding fingers | Clarify whether “doc” is a named doctor and preserve the strained-hand metaphor. | Korean retains the body transfer, remaining tasks, and fingers metaphor; English's scaffolding comparison is intentionally odd. | Medium |
| 16044 | `Health: {1}/{*2{2}}` -> `체력: {1}/{*2{2}}` | Preserve the exact nested variable/control-marker structure and verify the established Korean health label. | Placeholder and localized-marker identities/order match across the four locales; `체력` versus `생명` terminology remains a glossary question. | High |
| 16045-16046 | Balor / Ordo / Fateweaver | Verify name forms and preserve the irony about a better path to fame. | Korean retains the siege chronology and the question about Ordo being tricked, followed by the speaker's claim to see a better route to fame. | Medium |
| 16048-16049 | Ljosalfar / Icebrine / Crows | Standardize people/place/group names and preserve the Crows' commercial draw and leadership condition. | Korean retains the long journey from Icebrine and the tournament pause until the Crows have a leader; transliterations vary across locales. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 16001-16004, 16006-16008, 16010-16011,
  16015-16016, 16018, 16020-16024, 16026, 16030-16037, 16039-16046, and
  16048-16049 against all four active locale rows.
- The name, context, and terminology questions remain open. The “Fate” addition
  at 16018 and the `기동성` rendering at 16037 are additional candidates; no
  historical note authorizes a translation change.
- Cross-batch consistency candidates include Mitharu, Matron Eowl, Chaos
  Critter, Klurikon, House of Ballads, Vauner House, Jottun, gnome, Phasmer,
  Mel Senshir, Scholia Arcana, Zungar, Apotyre, Whitestone, Fateweaver, and
  Ljosalfar.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match across all four locales. The poem at ID 16018 retains three embedded
  line breaks; ID 16044 retains `{1}/{*2{2}}` in the same marker sequence.
- The official Korean manual could not be text-searched in this environment;
  terminology candidates remain unverified against it.

## Batch Status

IDs 16000-16049 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 16050-16099.
