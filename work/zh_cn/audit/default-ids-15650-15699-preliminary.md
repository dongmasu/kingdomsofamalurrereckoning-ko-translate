# Preliminary Language Scan: `default` IDs 15650-15699

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 15650-15699.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 15650-15651 | `Warsworn` -> `워스원`; art of combat | Standardize the faction/rank form and determine whether the speaker means the arena or a broader tradition of combat. | Korean names Warsworn and praises the local passion for combat; the second row does not explicitly identify the venue. | Medium |
| 15652 | Smoke Bomb / `90 Poison Damage over 5 Seconds` | Preserve the full amount, damage type, duration, and target skill. | Korean retains 90 poison damage over five seconds and applies it to Smoke Bomb; the value matches the source. | High |
| 15654-15655 | Forsaken Plain / Winter Fae / House of Sorrows | Verify place/faction names and resolve what “It could not be so easily discarded” refers to; preserve the passage's lineation. | Korean retains all five lines of the account and the House's refusal/resistance. It interprets the final “it” broadly as the Winter people's great and unique qualities. | High |
| 15658 | Gnomish artificers / mundane and arcane skills | Verify the creature/craft term and preserve the distinction between mundane and arcane skills. | Korean translates the artisans as `노움 장인` and preserves the ring's purpose; whether “Gnomish” is a formal people-name remains a glossary question. | Medium |
| 15659 | `Whiner ‒ I mean Wine` | Resolve the deliberate name/wordplay without obscuring the corrected name Wine or the spear-skill boast. | Korean renders “Whiner” as `징징이`, then gives `와인(Whiner… Wine)`, preserving the correction and the boast. | High |
| 15660 | `Set: {1}/{2}` | Preserve both runtime placeholders and their exact order; confirm the label's UI meaning. | Korean preserves `{1}/{2}` and the `Set` label. | High |
| 15661 | Besin / Orbocant / Niskaru | Verify names and determine whether Orbocant is a place, institution, or other location; preserve Besin's plan and means. | Korean transliterates Orbocant and says Besin has not appeared since leaving it. The historical log notes a Chinese rendering as a council, but English does not specify the entity type. | Medium |
| 15664 | `The God Fang` -> `신의 송곳니` | Determine whether this isolated label names a weapon, creature, or title before standardizing it. | Korean translates the compound literally; no locale or surrounding row resolves its object type. | Medium |
| 15666 | Eswin's `whipped dog` -> `애완견` | Preserve the contemptuous “lapdog/lackey” insult and verify Eswin's name without reading this as a literal pet. | Korean uses `애완견`, which carries the pet/lapdog metaphor but may not clearly convey subservience. English names the mayor as Eswin; the Korean form is transliterated. | High |
| 15670 | Sundur Caverns / `the things` / Nix | Identify the objects being searched for and whether Nix is a person, creature, or obstacle; keep the source's vague object reference. | Korean preserves that the caverns are littered with “such things” and Nix must be dealt with before finding them all. | Medium |
| 15671 | `Master Mitharan Immunity String` -> `마스터 미타루 면역 문자열` | Determine whether this is an internal/debug label or player-facing text; retain its metadata-like structure pending context. | Korean translates all four label components literally. The historical audit already flags it as likely internal/debug text, not an approved UI term. | High |
| 15679 | `Our Telling` / `The Ballads` | Confirm whether Telling names a tradition/rite or storytelling performance, and align Ballads terminology. | Korean keeps both as named cultural terms (`전승`, `발라드`) and the speaker's claim that both have ended. | High |
| 15681-15682, 15699 | Scion / Hall of the Firstsworn / Vengeance | Verify the new Scion title, whether Vengeance is a named group/force, and the Hall's location type; standardize the Scion form. | Korean uses `사이온(Scion)` at 15681/15699 and renders Vengeance as `복수(Vengeance)`. At 15687 it appends `전당` to the bilingual Hall name, while Japanese calls it a shrine. | High |
| 15685 | `Your Grace` -> `각하` | Confirm the addressee's rank and the suitable Korean honorific. | Korean uses the formal `각하`; Japanese and Chinese also use formal-address equivalents, but the in-world rank remains unverified. | Medium |
| 15687 | `Hall of the Firstsworn` -> `퍼스트스원(Hall of the Firstsworn) 전당` | Resolve Hall-versus-shrine context and avoid a redundant Korean head noun if the English name is retained. | English names a Hall, Japanese says shrine, and Korean renders “Hall” bilingually then adds `전당`, yielding a potentially redundant construction. | High |
| 15691 | `I will return it` -> `돌려줄게` | Keep the object/addressee unresolved; do not infer what is being returned. | Korean preserves the promise without supplying the missing referents. | Medium |
| 15696-15697 | `At ease` / `last upgrade` | Determine whether `At ease` is a military command and whether the spider entered during a building or equipment upgrade. | Korean uses the general command `쉬어`; Chinese uses the military “stand at ease.” At 15697 Korean calls the upgrade `개조 작업`, but the source does not identify what was upgraded. | High |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 15650-15651, 15654-15655, 15659,
  15661, 15664, 15666, 15670-15671, 15679, 15681-15682, 15685, 15687,
  15691, and 15696-15697 against all four active locale rows. Their name,
  title, and context questions remain open; no historical disposition was
  treated as approval.
- Cross-batch checks retain Warsworn, Forsaken Plain, Winter Fae, House of
  Sorrows, Orbocant, God Fang, Mitharan, Telling/Ballads, Scion, Vengeance,
  Firstsworn, and Your Grace terminology as provisional consistency questions.
- No historical note authorizes a translation change.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order.
- Embedded line-break counts and normalized brace/dollar/hash token
  class/order signatures match across all four locales. ID 15655 retains its
  four embedded breaks; ID 15660 retains `{1}` then `{2}` in all locales.
- No structural exception was found in this range.

## Batch Status

IDs 15650-15699 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 15700-15749.
