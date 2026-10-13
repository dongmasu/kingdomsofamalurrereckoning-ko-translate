# Disposition Batch: `default` IDs 36551-36600

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: three accepted, three `not an issue`, and nine uncertain.
- CSV changes: IDs 36583, 36591, and 36594.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 36553 | `Fateshift Weapon Buff` / `운명 전환 무기 강화` | Uncertain: the weapon-buff label is understandable, but the canonical Korean name and whether Fateshift is a named mechanic/UI category remain unresolved. |
| 36557 | The Testament | Uncertain: English names the Testament, while Japanese and Chinese identify a Belen organization/covenant. The entity and Korean faction form remain unresolved. |
| 36559 | The Tidal Pools / `조수 웅덩이` | Uncertain: the source and Japanese suggest a named place, while Korean/Chinese use a generic term. The canonical location name is not established. |
| 36563 | Adept Ignas / `숙련자 이그나스` | Uncertain: Adept may be a formal rank; Japanese and Chinese differ on the role, and the project has no approved Korean rank term. |
| 36565 | Windstones / `바람돌` | Uncertain: the depleted state and possibility of later return are retained, but the canonical named-object form remains open. |
| 36574 | Greater Healing potion / `상급 치유 물약` | Not an issue: English and Chinese specify a greater healing potion, and Korean preserves that tier and the find objective. Japanese's medium-potion reading does not justify changing the English-based translation. |
| 36579 | Feet `cut clean to the bone` | Not an issue: Korean preserves the severe injury image, supported directly by English and Chinese; Japanese's softened wording is not evidence of a Korean meaning error. |
| 36583 | `그만출게` | Accepted: add the required word space, changing it to `그만 출게`; the source meaning and casual voice are otherwise correct. |
| 36586 | Weeping King / House of Sorrows | Uncertain: departure and the House's ruined state are retained, but the exact lore relation expressed by “with good cause” is not established by the isolated line. |
| 36588 | Maid / Belmaid / Sir Sagrell poem | Uncertain: the eight lines and stanza break are preserved, but the source's compressed syntax and the identity/title references do not support a confident row-local rewrite. |
| 36590 | Max Mana potion ingredients | Uncertain: the temporary effect, reagent order, quantities 3/3/1, and paragraph/list structure are preserved; canonical Korean ingredient names need corpus-wide alignment. |
| 36591 | `thrice-damned maltworm` / `세 번이나 저주받은 술벌레` | Accepted: remove the misleading literal count and use `저주받은 술주정뱅이`, supported by Japanese and Chinese readings of a cursed/damned drunkard. The idiomatic “take your pick” remains correct. |
| 36594 | `Amalur` / `아마러` | Accepted: change to `아말루르`, the established Korean form recorded at D-5071 and used throughout the active corpus. No other part of the sentence changes. |
| 36597 | Ettin Brute / `에틴 덩치` | Uncertain: Ettin is retained phonetically, but the creature/category and Korean rendering of Brute need terminology alignment. |
| Other rows in IDs 36551-36600 | Dialogue, names, values, objectives, and labels | Not an issue: the remaining rows were compared across the four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The source-keyed historical questions at IDs 36557, 36563, 36565, 36579,
  36586, 36588, 36591, 36594, and 36597 were checked against the four locale
  rows. New disposition candidates at IDs 36553, 36559, 36574, and 36590 were
  also evaluated.
- Recurring Testament, Adept, Windstones, Fateshift, Tidal Pools, and Ettin
  terminology remains open where no canonical project-wide choice exists.
- These are working dispositions, not independent linguistic approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs 36551-36600
  once and in identical order.
- ID 36567 retains `{1}/1` in every locale. The poem at 36588 retains eight
  verse lines and its stanza break. The recipe at 36590 retains all three
  ingredients, quantities 3/3/1, and paragraph/list breaks.
- No runtime-token or embedded-line-break mismatch was introduced.
- Only active Korean `Texto` cells at IDs 36583, 36591, and 36594 changed.

## Checkpoint

Disposition is complete through ID 36600. Resume at ID 36601; 28,534
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-36601-36650-preliminary.md`. The next unused decision ID is
D-11784.
