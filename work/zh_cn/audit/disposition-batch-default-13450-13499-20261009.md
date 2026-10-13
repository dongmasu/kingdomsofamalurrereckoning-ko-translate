# Disposition and Edit Batch: `default` IDs 13450-13499

- Decision date: 2026-10-09.
- Scope: all 21 candidate findings in the preliminary report.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, and archived questions.
- Twenty-one findings received dispositions: two accepted, thirteen `not an
  issue`, and six uncertain.
- Two accepted `Texto` corrections were applied at IDs 13463 and 13490.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 13450 is `not an issue`: `경비 장치` fits the mechanical context and
  preserves both adjustment and removal outcomes for the Control Shard.
- ID 13455 is `not an issue`: `타이브리아(Taibreah)` matches the earlier
  active Korean occurrence at ID 13375.
- ID 13458 remains uncertain: the isolated label does not resolve the
  relationship among Travelers, Star, and Camp.
- ID 13463 is accepted: replace `사적인 원한 하나 때문에` with
  `터무니없는 사적 원한 하나 때문에`. English `misplaced`, Japanese
  `逆恨み`, and Chinese `错放的私仇` all characterize the personal grudge as
  misguided; Korean omitted that judgment.
- ID 13464 is `not an issue`: Korean preserves the deliberately general
  subject and the grow/multiply/spread sequence without inventing its
  referent.
- ID 13469 remains uncertain: the canonical protagonist title for
  `unfated one` is unresolved; Korean preserves the path and requested
  change.
- ID 13470 is `not an issue`: the generic pet-food shortage message is
  clear; English capitalization alone does not establish a named item.
- ID 13471 is `not an issue`: Korean preserves the Beckoned's decision-making
  role and the speaker's trust in the assigned part.
- ID 13472 is `not an issue`: the tutorial preserves four components and
  equipment crafting.
- ID 13476 is `not an issue`: generic `당사자` preserves the source ambiguity;
  Chinese supports one side of a contract, while Japanese uses a broader
  involved-party term.
- ID 13479 is `not an issue`: all reference languages support that the
  maker's death does not remove the item's combat value; Korean preserves
  that point.
- ID 13480 is `not an issue`: Korean follows the English and Japanese
  assertion of life before the House during the Weeping King's era; Chinese
  alone frames it as an open question.
- ID 13483 is `not an issue`: `푼돈` conveys the colloquial small payment and
  the offer to teach stealth remains intact.
- ID 13484 is `not an issue`: Korean preserves the placement action and
  Alleia's name; no contrary context establishes another interaction.
- ID 13488 remains uncertain: the personal plea and conditional are
  preserved, but canonical character and place spellings remain unresolved.
- ID 13489 remains uncertain: the Preordained group's identity and canonical
  Korean name need corpus-level alignment.
- ID 13490 is accepted: replace `가족을 먹여 살리려고 땀 흘리는 게 어떤
  의미인지 몰라.` with `가족을 먹여 살리려고 땀 흘리는 남자로 산다는 게
  어떤 건지 몰라.` English and Japanese explicitly identify the family
  provider as a man; Korean omitted that stated contrast.
- ID 13493 remains uncertain: `Walen's Second` could mean a deputy,
  second-in-command, or a dueling role; the isolated line does not decide.
- ID 13494 remains uncertain: English leaves `they` unresolved; the
  antecedent and whether Missives is a named item need quest context.
- ID 13496 is `not an issue`: `장막(The Veil)` retains a readable Korean
  rendering and the English name in this short cursed-status line.
- ID 13498 is `not an issue`: `장물 매입상` clearly describes a buyer of
  stolen goods in the merchant offer.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 13463 | `사적인 원한 하나 때문에` | `터무니없는 사적 원한 하나 때문에` | D-3985 |
| 13490 | `가족을 먹여 살리려고 땀 흘리는 게 어떤 의미인지 몰라.` | `가족을 먹여 살리려고 땀 흘리는 남자로 산다는 게 어떤 건지 몰라.` | D-3998 |

## Verification

- The four locale files contain IDs 13450-13499 once each and in identical
  ascending order. The preliminary structural audit found matching record
  line-break counts and runtime-token signatures throughout this range.
- Only the two accepted Korean `Texto` cells changed. Their row keys and
  surrounding records remain unchanged.
- Before this batch: 542 accepted, 1,280 `not an issue`, and 2,159 uncertain.
  After this batch: 544 accepted, 1,293 `not an issue`, and 2,165 uncertain
  (4,002 dispositions total).
- The active Korean `default` CSV retains its UTF-8 BOM and CRLF record
  endings. Its SHA-256 after the edits is
  `84c195605337551c88ff15aef06531ab888f43487098ddef57b30e6f1b6e9fee`.
- Reversing only the two approved text substitutions must restore the
  preceding batch's CSV SHA-256 before these edits:
  `5d6d76fc19c475faa8658276e2296eba56b771902c50ae45389b634bc4487612`.
- A generic standard-library CSV parse is not used because the existing
  corpus contains multiline/quoting forms it rejects; key order in this
  range was checked line-by-line across all four locale files.
- Resume at ID 13500; 51,635 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
