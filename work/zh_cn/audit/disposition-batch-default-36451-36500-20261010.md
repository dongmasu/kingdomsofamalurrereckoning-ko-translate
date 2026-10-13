# Disposition Batch: `default` IDs 36451-36500

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: two accepted, four `not an issue`, and twelve uncertain.
- CSV changes: IDs 36462 and 36478 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 36451 | Akara-Tor / Dead Kel / Akara | Uncertain: the lair relation and connection are retained, but whether Akara-Tor is a named lair and its canonical spelling need lore context. |
| 36454 | Three Swords / Varani design | Uncertain: count, weapons, design attribution, and markings are retained; the set's canonical title and capitalization remain open. |
| 36455 | Luring and training a new pet | Not an issue: food attracts a suitable pet, Cillian finds and trains it, and it later arrives at the Keep. Korean keeps the stages distinct and correctly uses training, not taming. |
| 36458 | `one of the three staff` / `세 신하 중 한 명` | Uncertain: English may mean retainers/household officers or staff employees; the return-to-service event is preserved, but the role category is not settled. |
| 36460 | Clyeth Arne / Dolve Arne / Rathir | Uncertain: the choice to abandon Dolve Arne for a wasteful, frivolous life in Rathir is retained; the names and whether Dolve Arne is a place, estate, or family remain open. |
| 36462 | `Challenge Timer` / `도전 시간` | Accepted: English, Japanese, and Chinese explicitly identify a timer control. Replace `도전 시간` with `도전 타이머` to retain the UI function rather than a generic duration. |
| 36464 | Khamazandu's nature | Uncertain: the self-correction and warning are present, but the entity's nature and canonical name remain a lore/terminology question. |
| 36466 | Poison damage values | Not an issue: both +20 Poison Damage and +50% Poison Damage effects and their line structure are retained. |
| 36478 | Mitharu's Great Order / `이곳은` | Accepted: English, Japanese, and Chinese use a pronoun for the miniature-world comparison; Korean's second `이곳은` incorrectly makes the antecedent a location. Replace it with `그것은 세계 자체의 아주 작은 축소판과 같다.` while preserving the earlier locative `이곳에서` and the paragraph structure. |
| 36479 | Sparrows / Captain of the Watch / tunnel light | Not an issue: Korean preserves the evidence, the captain's transformation into a ruthless killer, and the imagined light from tunnel depths as the cause of defeat without inventing what the light is. |
| 36482 | `dustling` / `먼지의 자식` | Uncertain: the address is preserved, but the term's species/title versus dismissive-address status and relation to Children of Dust remain unsettled. |
| 36485 | Malformed six-steps/frozen-boots phrase | Uncertain: the severe cold and near-freezing are retained, but English is compressed and the locales differ on exactly what freezes. |
| 36487 | `picked clean` / `깨끗이 비워졌지만` | Uncertain: “stripped of contents” and “physically clean” are both possible across the source versions, and the object antecedent is unclear. |
| 36492 | Angharad / Rathir / `him` | Uncertain: her longing and turn to an unnamed person are retained; the person and proper-name forms need context. |
| 36495 | `Pride` / `긍지의 집` | Uncertain: Japanese suggests House of Pride, while Chinese reads pride as a virtue; capitalization alone does not decide the referent. |
| 36497 | Grand Bursar / allocation of gold | Uncertain: the English possessive is malformed, and the intended subject may be the official, office, or treasury. Korean selects an official allocating funds, a plausible but unverified repair. |
| 36500 | Basilica Gnostra / `노스트라 대성당` | Uncertain: the source's initial G, Japanese's Nostra, and Chinese's Gnostic reading differ; the canonical institution spelling/type is unresolved. |
| Remaining ordinary text in IDs 36451-36500 | Dialogue, names, values, objectives, and labels | Not an issue: all other rows were compared across the four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- Source-keyed historical questions at IDs 36458, 36460, 36464, 36478-36479,
  36482, 36485, 36487, 36492, 36495, and 36497 were checked against the four
  locale rows.
- The poison-damage values and variable/marker checks at IDs 36452, 36466,
  36484, and 36498 remain intact. No historical note was treated as edit
  approval.
- These are working dispositions, not independent final linguistic
  approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs 36451-36500
  once in matching order.
- Embedded line breaks and runtime markers match across locales. ID 36466's
  damage values, `{1}`/`{2}` at 36452, `$TR03.bribe_value$` at 36484, and
  both damage orbs and values at 36498 are retained.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39
  pre-existing bare-LF endings.
- Active default CSV SHA-256:
  `33da746707ab9f8c1a919611ac804dbff82b74d9504e7097c52d58244952420a`.
- Accepted changes are recorded in `edit-batch-20261010-addendum.md`.

## Checkpoint

Disposition is complete through ID 36500. Resume at ID 36501; 28,634
`default` IDs remain through ID 65134. The next unused decision ID is
D-11755. The next preliminary scan is
`default-ids-36501-36550-preliminary.md`.
