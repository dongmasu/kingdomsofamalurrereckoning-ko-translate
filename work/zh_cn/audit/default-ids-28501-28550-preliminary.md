# Preliminary Language Scan: `default` IDs 28501-28550

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 28501-28550 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 28501, 28504-28521, 28525-28527, 28529, 28531, 28533-28537, 28540-28543, 28545-28550 | Dialogue, lore, names, item/UI labels, and objectives | Recheck voice, established names, and terminology in the integrated pass. | Korean generally conveys the English. EAP, Tuatha Swordsman, Orella, Niskaru, Death Notices, Airancourt, Henge, Primos, Tidal Pools, Eagonn, Dolve Arne, Cur, and Hireling remain historical name/context candidates. | Medium |
| 28511 | `{1}` ranged-shot instruction | Preserve the button placeholder and the hold-to-fire action; confirm whether the instruction requires release after holding. | English says press and hold `{1}`; Korean retains `{1}` and the hold instruction. Japanese explicitly adds releasing the button, while Chinese and English do not. | High |
| 28522 | `여행자들` for capitalized `Travelers` | Confirm whether Travelers is a formal group and retain the reported chain of custody: Airancourt arranged delivery, but the woman last held the letter. | Korean preserves the delivery and final-possession statements. English capitalizes Travelers as a group; Korean uses a generic plural. Japanese/Chinese also translate or transliterate the group name. | Medium |
| 28527 | `속이 다 시원하군!` for “That was bracing!” | Recheck the reaction's intended sense and speaker tone; distinguish invigorating/satisfying from merely relieving. | English `bracing` can describe something stimulating or invigorating. Korean uses an idiom of relief/satisfaction; Japanese describes amusement, and Chinese reads it as coolness. | Low |
| 28530 | `워스워른의 시초` for “first of the Warsworn” | Determine whether Eagonn is the first member, founder, or formal originator of the Warsworn; keep the title and historical claim precise. | English calls him “first of the Warsworn”; Korean's `시초` can imply the founder/origin. Japanese says founder, and Chinese says the first Warsworn. | Medium |
| 28532 | `뒤섞인 거래` for “Mixed Business” | Confirm whether this is a quest/title label or an idiom, and preserve the intended double meaning if any. | The isolated English title is ambiguous; Korean translates it literally as mixed business/transaction. Japanese and Chinese offer different readings. | Low |
| 28538 | `거래를 하려 했다` for “The Champion wanted to deal.” | Determine whether `deal` is a card-game action, a negotiation, or a general transaction from its scene. | English is deliberately terse; Korean reads as wanting to make a deal. The historical audit specifically asks whether this is a card-game action. | Low |
| 28544 | `커(Cur)` | Confirm the identity and canonical rendering of the capitalized `Cur`; preserve that killing it is required for entry into Bhaile. | English capitalizes the name and uses it as the subject of “has to die.” Korean transliterates it; Chinese instead reads it as a generic “vicious dog,” while Japanese also transliterates. | Medium |

## Historical Audit Reconciliation

- The historical inventory for IDs 28500-28599 flags EAP, Tuatha Swordsman,
  item descriptions, Orella, Niskaru, Death Notices, Airancourt, Henge,
  Primos, Tidal Pools, Eagonn, “deal,” Dolve Arne, and Cur. It specifically
  asks whether `deal` is a card action and what `Cur` refers to.
- These remain unresolved inputs for the integrated review and do not
  approve a specific Korean term.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 28501-28550 once,
  in identical order.
- Embedded line-break counts and extracted runtime-token identities and order
  match across all four locales. `{1}` at ID 28511 and the nested marker
  sequence at ID 28524 are retained.
- No unexpected Unicode format character or structural exception was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 28501-28550 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 28551.
