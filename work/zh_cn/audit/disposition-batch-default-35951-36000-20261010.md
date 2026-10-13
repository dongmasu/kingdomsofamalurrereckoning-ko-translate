# Disposition Batch: `default` IDs 35951-36000

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and established Korean name forms.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- Decisions: two accepted, three `not an issue`, and six uncertain.
- CSV changes: IDs 35979 and 35984 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35953 | `Fall` / `Children of Dust` | Uncertain: Korean reads `Fall` as downfall while Japanese and Chinese read it as autumn. The capitalized English event and the historical source-keyed question leave the lore unresolved; retain the current Korean and poem structure. |
| 35957 | Upgrade marker / Faer Gorta health siphon | Not an issue: Korean preserves the localized runtime wrapper, summoned Faer Gorta as the actor, enemies as the health source, and the player as recipient. The Chinese creature label conflicts with English and Japanese and is not adopted. |
| 35959 | First Scaith | Uncertain: English capitalizes the title/name and assigns responsibility for the family's suffering; Korean preserves that relation, but the isolated row cannot establish whether `First` is a rank, name, or ordinal. |
| 35967, 35972 | Prayer-rune circlet / `Find the First` | Uncertain: the circlet's gold material, prayer runes, and lack of time to craft it are retained. `First` may be a title or person, but the short objective and locale variants do not settle its identity. |
| 35977 | Passive stealth-attack tutorial | Not an issue: Korean preserves the passive marker, Daggers/Faeblades, unaware-target condition, and sufficient-damage requirement for an instant kill; the three embedded breaks match. |
| 35979 | Laz and Raz names in the Grumble Brothers poem | Accepted: English explicitly contrasts Laz with Raz, and Japanese, Chinese, and the established Korean precedent at base IDs 977/3440 support distinguishing the names. Korean rendered both as `라즈`, obscuring the two families. Add source-name parentheticals (`라즈(Laz)` / `라즈(Raz)`) at the opening and family references; preserve all 22 embedded breaks. |
| 35979 | `No body to find` / brothers' wordplay | Uncertain: the family contrast is retained, but English can mean either a missing body/person or daughters with no bodies; Japanese favors the latter. Do not rewrite the literary line without context. |
| 35982, 35985 | Sceptres / Moves page | Uncertain: values (+2 Physical Damage and +5% Damage) are intact, and Korean uses `홀`; the precise in-game subtype and official Korean UI name for the Moves page require broader terminology alignment. |
| 35984 | `strange new land` / `기묘한 신대륙` | Accepted: English, Japanese, and Chinese say a strange new land, not a continent. Replace `신대륙` with `새 땅` to remove the unsupported continent implication while retaining the discovery claim. |
| 35990 | Lion of Winter / Magus King / Indarian of Kandrian / Lord of Aodh | Uncertain: the four-line structure and peace wish are retained, but the rank/name boundaries and the source's syntax differ across locales. Defer title normalization pending glossary/context review. |
| Remaining ordinary text in IDs 35951-36000 | Dialogue, objectives, names, labels, and values | Not an issue: the other 39 IDs were checked in all four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The source-keyed 35800-35999 entry flags 35953, 35979, and 35990.
  Their lore/poetry questions remain uncertain; the historical note did not
  approve a particular rendering.
- The Laz/Raz distinction at 35979 and the continent implication at 35984
  were additionally verified against the active rows and were not previously
  approved corrections.
- The accepted spelling treatment at 35979 follows the established
  `라즈(Laz)` precedent at base IDs 977 and 3440; it distinguishes the names
  without inventing unsupported lore.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs 35951-36000
  once in identical order.
- ID 35953 retains three embedded breaks; 35957 one; 35977 three; 35979
  twenty-two; 35982 one; and 35990 three. Runtime-marker wrappers and
  numeric values remain intact.
- The active default CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39
  pre-existing bare-LF endings. SHA-256:
  `2d8ac087cd44b2a1aca51c46790d45b6922f3c75f3a442c4c2c6869e245bfe8b`.
- The previously documented checkpoint-hash discrepancy remains unresolved;
  no unrelated content was reverted.
- These are working dispositions, not independent final linguistic approval.

## Checkpoint

Disposition is complete through ID 36000. Resume at ID 36001; 29,134
`default` IDs remain through ID 65134. The next unused decision ID is
D-11615. Preliminary scan:
`default-ids-36001-36050-preliminary.md`.
