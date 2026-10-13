# Disposition and Edit Batch: `default` IDs 29301-29350

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  29301-29350, checked against English, Japanese, Chinese, active Korean,
  recurring project terminology, and the historical audit.
- Decisions: two accepted, fifteen `not an issue`, and ten uncertain.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 29326 | `타이레니움(Tyrenium)` | `티레니움(Tyrenium)` | The same mineral already appears as `티레니움` at ID 26783. This corrects the isolated variant at this row only. |
| 29330 | `출혈 중인 적을 공격할 때마다 15% 확률로 추가 피해 200을 줍니다.` | `출혈 상태인 적을 타격할 때마다 15% 확률로 추가 피해 200을 줍니다.` | English says “Each hit.” `타격할 때마다` preserves the per-hit trigger; `공격할 때마다` could apply once per attack action, especially for multi-hit attacks. This follows the accepted phrasing pattern at ID 28843. |

## Other Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 29304 | Mutual bond / despair on separation | Not an issue: the reciprocal bond and despair consequence are retained without inventing who is threatening to separate them. |
| 29309 | Fae united by a shared narrative | Not an issue: the unifying story and its status as one of the few shared things among the people are retained; the antecedent of “their” remains open. |
| 29316 | Helyc's brainchild / loot expectations | Not an issue: Helyc's authorship, the speaker's doubt about the loot, and hope for even a fraction are preserved. |
| 29320 | Curse must last through the Long Winter | Not an issue: the speaker's refusal and duration condition are retained; Circle/Long Winter names remain open separately. |
| 29327 | Kandrian Keep never falling | Not an issue: the absolute claim, repeated incursions, and description of the invading tyrants are retained. |
| 29333 | Price negotiation | Not an issue: the conditional offer, expectation of a high price, and request for agreement are retained without changing the haggling tone. |
| 29336 | Ivar / abandonment of the region | Not an issue: Ivar's standing as a fighter and disagreement with Lord Kandrian's plan to abandon the region are preserved. |
| 29337 | Family ring / refusal to yield | Not an issue: ownership, Beckoned address, and refusal despite a show of force are preserved. |
| 29338 | Telogrus occupation / Preordained blockade | Not an issue: army departure, blockade purpose, and resupply target are retained. |
| 29339 | Defeat Gnarsh / remove Prismere taint | Not an issue: both objectives and their order are preserved; exact Prismere/taint terminology remains open separately. |
| 29344 | Wise Fateweaver / Lyria's gifts | Not an issue: wisdom, power, and attribution of the ability to Lyria are retained; canonical role/name forms remain open. |
| 29346 | Scion departs with Akara's power | Not an issue: end-of-life timing, departure, power transfer, and seedling/rooting image are retained; guard number and formal titles remain open separately. |
| 29348 | Twin amulets / key / Tala-Rane map / strongboxes | Not an issue: disappearance, key and map appearance, map identity, and strongbox-finding purpose are preserved. |
| 29349 | Changing the world | Not an issue: the speaker's possibility of making a difference by a different method is retained. |
| IDs 29301-29350 structural and remaining ordinary text | Keys/order, breaks, runtime markers, and unflagged wording | Not an issue: all four locales contain the same 50 IDs in order; embedded line-break counts and normalized runtime-token identities/order match. |
| 29302 | `Acolyte` / `시종` | Uncertain: the capitalized term may be a formal religious rank; Korean can instead read as a personal attendant. |
| 29315 | UI label `MULTIPLY` | Uncertain: Japanese uses `*` and Chinese identifies the keypad key, while Korean translates the arithmetic operation. The input/control context is missing. |
| 29317 | Aron Excavations Mine | Uncertain: exact company/site name and whether “Mine” is part of the proper name remain unclear across locales. |
| 29320 | Circle of Engard / Long Winter | Uncertain: both are capitalized names, but their status as faction/event terms and canonical Korean forms need alignment. |
| 29322 | `vs. Stunned targets` | Uncertain: matchup meaning is clear, but the canonical Korean status-effect term differs across locale references. |
| 29324 | `by the Widow's mercy` | Uncertain: the exclamation, surprise at seeing an Alfar, and Canneroc question are retained, but Korean phrasing may imply the Widow caused the arrival. |
| 29334 | Kobold Savage | Uncertain: formal creature/class label versus descriptive “savage kobold” remains unresolved. |
| 29343 | Decay of wild Fae | Uncertain: Korean `부패` can imply corruption, while English `decay` and Japanese decline also allow a fading/disappearance reading. |
| 29350 | Master Healing Potion | Uncertain: acquisition/crafting options and nearby-pack clue are preserved; canonical potion tier/name needs glossary alignment. |
| Other named terms in IDs 29301-29350 | Acolyte / Helyc / Engard / Anokatos / Widow / Canneroc / Tyrenium / Kandrian Keep / Kahrunk / Culminite / Faer Gorta / Kobold / Niskaru / Telogrus / Preordained / Gnarsh / Prismere / Alabastra / Emaire / Scion / Akara / Fateweaver / Lyria / Prismere Orb / Aster Strongboxes / Master Healing Potion | Uncertain: defer canonical spelling, faction, creature, rank, item, and lore terms to integrated review. IDs 29326 and 29330 are dispositioned separately above. |

## Verification

- Only the approved `Texto` cells at IDs 29326 and 29330 changed.
- IDs, row order/count, delimiter, quoting, BOM, and newline distribution
  were preserved. The per-hit damage values and embedded line breaks remain
  intact.
- Active default CSV SHA-256 and direct structural counts are recorded in
  `TRANSLATION_PROGRESS.md` and `NEXT-SESSION.md`.
- Register totals after this batch: 898 accepted, 3,131 `not an issue`, and
  5,190 uncertain (9,219 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 29351; 35,784 `default` IDs remain.

These working dispositions do not constitute independent final linguistic
approval.
