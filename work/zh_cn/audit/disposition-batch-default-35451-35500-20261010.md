# Disposition Batch: `default` IDs 35451-35500

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling preliminary findings with active Korean,
  immutable English/Japanese/Chinese rows, prior decisions, terminology,
  markers, values, and structure.
- Evidence caution: Japanese wording refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- Decisions: two accepted, five `not an issue`, and nine uncertain.
- CSV changes: IDs 35451 and 35495.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35451 | Put the player in contact with the observer | Accepted: change `널 지켜보던 사람과 만나게 해주겠어` to `널 지켜보던 사람과 연락할 수 있게 해주겠어`. English and Japanese promise contact, not necessarily an in-person meeting; Korean's old wording narrowed the outcome. |
| 35453, 35493 | Wandering Well / Ainmhi / Well vanishing | Uncertain: the quest sequence and reported disappearance are retained, but the canonical Well/Ainmhi forms and relationship between the two entries need cross-corpus/context review. |
| 35458 | Source typo `enegies` | Not an issue: Korean correctly uses `에너지`; the device focus and wavering Dream are retained. |
| 35459 | Returning woman / `She don't owe them` | Uncertain: return and lack of explanation are retained; the antecedent of `them` and the implied obligation need conversation context. |
| 35462-35463 | Windstones / Urul Tusk / singular-to-plural Cairn | Uncertain: the quoted clue and uncertainty are preserved; the source's one-Cairn-then-`them` shift remains unresolved and must not be silently normalized. |
| 35465 | Physiology as a book barely begun to crack | Not an issue: Korean retains the English's extended book metaphor and the limited state of research. |
| 35466 | `Temp Gamplay Holder` | Uncertain: Korean preserves the apparent temporary gameplay-placeholder meaning, but whether this is internal/test content or player-facing text is unknown; the source typo does not settle that. |
| 35470, 35472-35473 | The Light / The Orison / self-made help | Uncertain: Korean retains the named concepts and self-reliance claim; formal entity/rite status and the Orison reading differ across locales. |
| 35478 | First Sword | Uncertain: the objective is retained, but prior D-8034 flags whether this is an enemy title/rank; do not normalize `첫 번째 검` without opponent context. |
| 35479-35480 | Quarters / Tine Delfric / Warsworn | Uncertain: management of the Quarters and key function are retained; Quarters' institution type and name forms remain unresolved. |
| 35482-35483 | `{3}% {1} {2}` / gems and shards | Not an issue: all numbered placeholders, order, percent sign, and gem/shard distinction are preserved. |
| 35488-35489 | Unibox Follower Dispenser / King Havoc | Uncertain: the device and two separate Telogrus epithets are retained; canonical system-term and epithet forms need glossary context. |
| 35494 | `$NQD_City_Adessa.upgrade_price$` | Not an issue: the exact runtime variable and gold label are preserved. |
| 35495 | `No mortal, perhaps` | Accepted: change `필멸자가 아니라고? 그럴지도.` to `필멸자에게는 불가능할지도 모르지.` Japanese and Chinese read the fragment as something unavailable/impossible to mortals, not a question about the addressee's identity; preserve its elliptical transition into Gadflow's claim. |
| 35497-35498 | Anokatos / Kollossae oath / Red Legion object | Uncertain: sacred witness, oath, and life-at-risk warning are retained; oath scope and faction/name terminology need integrated context. |
| Remaining ordinary text in IDs 35451-35500 | Dialogue, labels, names, values, markers, and structure | Not an issue: the other 27 IDs were checked in all four locales; no additional supported row-local defect was identified. |

## Historical Audit Reconciliation

- Prior D-8034 leaves `First Sword` unresolved; ID 35478 stays unchanged.
- Wandering Well, Ainmhi, Offering-adjacent lore, Orison, and Red Legion
  terminology remain open rather than inheriting one-row guesses.
- The English `enegies` and `Temp Gamplay Holder` source typos are not
  copied into Korean and do not independently prove a translation defect.

## Verification

- All four locale files contain IDs 35451-35500 exactly once and in the same
  order. No embedded line breaks or runtime-marker mismatch occurs.
- `$NQD_City_Adessa.upgrade_price$`, `{3} {1} {2}` order, the standalone
  period at 35492, and the source values are retained.
- Only the two authorized Korean `Texto` values changed. Keys, row order,
  BOM, and original physical line-ending distribution are preserved.
- These working dispositions are not independent final linguistic approval.
- Resume disposition at ID 35501; 29,634 IDs remain through ID 65134.
