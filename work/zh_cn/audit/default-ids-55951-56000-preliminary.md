# Preliminary Language Scan: `default` IDs 55951-56000

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 55951-56000 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 55951 | `명중당 체력 흡수 +15` | Confirm whether Health Stolen per Hit is a flat +15 or +15%; do not silently add a percent sign. | English, Chinese, and Korean show +15 without `%`; Japanese alone has `+15%`. The explanatory line and stat line break are preserved. | High |
| 55952 | Primos' sanctum / stairs | Confirm the sanctum term and preserve the warning about the long-unused stairs. | Korean retains the location, years without anyone ascending, and caution while climbing. | Medium |
| 55953 | Anathon epigraph / Stone Shadows poem | Verify the intended Fate-versus-stone metaphor, grammatical subjects, and imagery without normalizing away the source's uncertainty. | Korean preserves the epigraph and all six stanzas, with 55 newline characters. It retains the winding stairs, awakening below, descent, visions, and final knowledge of Stone Shadows; locale interpretations diverge on several images and referents. | High |
| 55956 | `피실험자들` for `subjects` | Check that these are experimental subjects rather than political subjects. | English says progress exceeded the speaker's other subjects; Japanese explicitly says test subjects and Chinese also uses experimental-subject wording. | High |
| 55957 | `주문 탄약(고속)` / SpellAmmoFast | Determine whether this is a player-facing label or an internal/debug string. | All locales translate the concatenated identifier, but its presentation context is absent. | Low |
| 55960 | magical dementia / Edgar Aron / Calovar's stone | Confirm the causal chain linking the miners' dementia, the stone, Motus Mining's troubles, Crudok, and Aurenda's light. | Korean retains the named agent, artifact, condition, and alleged foul play; the source's “from the crudok to the theft” construction remains awkward. | Medium |
| 55961 | five crews deserted / five Bogstaunch bottles | Keep the number of recruit crews distinct from the five recovered medicine bottles. | Korean says five crews deserted and all five bottles were found. Japanese/Chinese compress or alter the deserter detail; the two quantities refer to different things. | High |
| 55963 | `워스워른 계급` for Warsworn Rank | Determine whether this is a formal rank or title and standardize the term. | English is a standalone label; Japanese says title and Chinese says rank. | Medium |
| 55965 | `페이` / calming the wood | Preserve the speaker's skepticism and the possible practical use of the Fae method. | Korean retains the mortal-village contrast and conditional interest in how the Fae calmed the wood. | Medium |
| 55966 | `흠이 있는 보석` for imperfect gem | Clarify whether “imperfect” means flawed, uncut, or a particular gem grade. | Korean chooses a damaged/flawed gem, Japanese says damaged, and Chinese suggests uncut; English does not specify the defect. | Medium |
| 55970 | `유골에 안식을` / Resting the Bones | Confirm whether this is a named quest/title or a descriptive objective. | The source is an isolated title-like string; locales phrase burial/rest differently. | Low |
| 55972 | `창백한 지팡이(Paling Wand)` / abandoned waste | Verify the proper item name and preserve the caveat that reclamation requires hard work. | Korean retains the farm-making plan and explicitly says it will take sweat and effort. Japanese names the wand as a farming staff; Chinese literalizes “paling.” | Medium |
| 55975 | `바로네트 사건이 있었고` | Keep the source fragment “The Baronett happened” provisional until the intended event/name is known. | Korean makes it a Baronett event, then preserves the speaker/player arrival and ensuing conversation; the source itself is malformed. | Low |
| 55976 | `바람 주머니` / statue's gaze | Confirm the referent of “its” and whether the torches must be extinguished because they are in a statue's line of sight. | Korean retains the gaze, guards carrying the bag of winds, and instruction to use it before entering; Japanese explicitly says statue, English does not. | Medium |
| 55977 | Fateweaving / Orison | Keep prayer, Fateweaving, and Orison as three distinct services/options. | Korean preserves all three and does not collapse Orison into Fateweaving; exact Orison terminology remains open. | Medium |
| 55978 | `내 사랑` for `dove` | Confirm the affectionate address and retain the last-plan/last-job emphasis. | Korean uses an intimate address, while Chinese literally uses “peace envoy” and Japanese omits it. | Medium |
| 55979 | `Here's is` source grammar | Preserve the intended claim that freedom is possible here without reproducing the English grammatical error. | Korean naturally expresses that a person can be free there; Japanese/Chinese support the intended meaning. | High |
| 55981 | `플레지실드(Pledgeshield)` | Confirm Pledgeshield as a Warsworn rank and how the character takes contracts in the faction's name. | Korean retains the rank as a title and the named organization; Japanese instead says second-class mercenary. | Medium |
| 55985 | Arrivus Engine / ornate box | Confirm whether the engine is used on the ornate box as a tool or applied as an item. | Korean preserves the UI question and both item names. | Medium |
| 55986 | Ciara Sydanus / Jubal Caledus / Scholia Arcana | Preserve that the abyss was Ciara's prison and verify canonical institution/title names. | Korean retains the death, Jubal's being hurled into the prison-abyss, loss of the Archsage, and consultation with Savant Methneen. | Medium |
| 55990 | Dverga chronology | Confirm whether the object predates the Dverga's arrival on the island. | Korean preserves the uncertainty and the comparison to the Dverga settlement chronology. | Medium |
| 55991 | `{*1[지속 효과]}` | Confirm the passive-effect display term while retaining marker identity and placement. | The `{*1...}` marker remains first, followed by the description; Korean preserves the near-total-survival claim and examples. Japanese materially diverges by referring to sword edges/attacks rather than the character's durable nature. | Medium |
| 55993 | `대마법사 고레넷` / Grand Faemage | Confirm the formal title and canonical name rendering. | Korean translates the rank and retains Gorrenet; the other locales use differing mage titles. | Medium |
| 55994 | Scholia Arcana Grounds / Main Hall | Confirm the site terminology and preserve the private meeting's western-events purpose. | Korean retains the high-ranking members, private meeting, mystery in the west, and Rathir destination. | Medium |
| 55995 | working Cairn / songs of Summer | Verify the Cairn's function and whether “songs of Summer” is a named collection/rite. | Korean preserves the more-than-one-season effort, successful first working Cairn, and temporary safety of the songs. Other locales differ on whether the effort is one year or one additional season. | Medium |
| 56000 | Anela / Virki / Culn settlers | Preserve that Anela seeks revenge for the settlers' deaths and is found facing a group of raiders. | Korean retains the cause, destination, and confrontation; locale spellings differ. | Medium |

Other reviewed rows generally preserve the English meaning on this first
reading. Names and terms remain provisional, including Anathon, Stone
Shadows, Niskaru Lord, SpellAmmoFast, Edgar Aron, Calovar, Aurenda,
Maedrigal Fenn, Bogstaunch, Warsworn, Erathell, Resting the Bones, Paling
Wand, Baronett, Orison, Pledgeshield, Arrivus Engine, Scholia Arcana,
Dverga, Grand Faemage Gorrenet, Cairn, Anela, and Virki.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `55950-56049`.
  Relevant prompts include the Maid/crystal discrepancy (55950), the
  health-absorption stat (55951), Primos' sanctum (55952), the Anathon
  epigraph/Stone Shadows poem (55953), experimental subjects (55956),
  SpellAmmoFast (55957), Edgar Aron/Calovar/Aurenda (55960), five recruit
  crews and Bogstaunch bottles (55961), Warsworn Rank (55963), Fae-calmed
  wood (55965), imperfect gem (55966), Resting the Bones (55970), Paling
  Wand (55972), Baronett fragment (55975), bag of winds (55976), Orison
  (55977), `dove` (55978), Pledgeshield (55981), Arrivus Engine (55985),
  Scholia Arcana/Savant (55986), Dverga (55990), Passive marker (55991),
  Grand Faemage (55993), working Cairn/songs of Summer (55995), and Anela/
  Virki (56000).
- Historical boundary ID 55950 was included in the preceding active batch.
  ID 56000 is the closing boundary of this historical range and is included
  once; next active range begins at ID 56001.
- Historical questions are prompts, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 55951-56000 once
  and in identical ascending order.
- All four files contain 65,135 default records. At 55953, the epigraph and
  poem retain 55 newline characters in all locales. At 55991, `{*1...}`
  marker identity/order matches. Other newline counts and recognized
  runtime-token sequences match throughout the batch.
- Numeric exception: at 55951 Japanese alone adds `%` to `+15`; English,
  Chinese, and Korean show flat `+15`. Preserve for review rather than
  treating this as a resolved percentage.
- Active CSV SHA-256 values match the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41fcd82bb5f29e4b092368b856489a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 55951-56000 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 56001.
