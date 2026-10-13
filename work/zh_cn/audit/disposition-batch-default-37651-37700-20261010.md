# Disposition Batch: `default` IDs 37651-37700

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: one accepted, four `not an issue`, and eleven uncertain.
- CSV change: ID 37686.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 37651 | save-data repair prompt | Not an issue: both choices and consequences are explicit, including deleting all corrupted files for attempted repair versus continuing with saving disabled. |
| 37658 | Revival | Uncertain: the twitchiness and discouraging life conditions remain; the place-name versus generic “revival” convention is unsettled elsewhere. |
| 37665 | `old boy` / `늙은 양반` | Uncertain: Korean preserves an age-marked familiar address, but the English idiom and differing locale interpretations need scene context. |
| 37666 | Champion's Manor / Den | Uncertain: key, rest, gambling break, and return are preserved; Den's proper-name versus generic-venue status is unresolved. |
| 37670 | Labor of Love | Uncertain: the idiomatic Korean phrase is plausible, but the capitalized English may be a formal quest/title. |
| 37675 | Preordained / `운명에 정해진 자들` | Uncertain: pass requirement and threat are retained; formal faction status and canonical Korean name remain open. |
| 37677 | Hero of Mel Senshir / “nobody accounted for” | Not an issue: Korean follows English's “nobody expected the Hero” sense. Japanese and Chinese shift toward no one being able to defeat the Hero, but the English-led Korean reading is coherent. |
| 37678 | Executive Creator of Worlds | Uncertain: Korean translates the role literally, while English/Japanese retain the English title; player-facing versus developer-credit context is unknown. |
| 37682 | Offering / Scion | Uncertain: ceremony chronology and continuing Scion role are retained, but formal lore terms need alignment. |
| 37686 | eager Zungars and Darkvaris / `굶주린` | Accepted: remove the unsupported hunger wording and say they would `서로 기꺼이 피를 흘리겠지` for the speaker's gold. English says eager to spill blood; the Korean proper-name forms remain provisional. |
| 37692 | `conclusion` / `내 결론` | Uncertain: the imperative is retained, but combat-finisher versus spoken-conclusion meaning depends on context. |
| 37693 | Emperor Morus / Sophia / Bloodbringer | Uncertain: the two-paragraph history, stray-arrow event, eye wound, and conflict are retained; the English does not specify whether Sophia is older or younger. |
| 37697 | Askers | Uncertain: the family taking in the speaker after the father's death and approximate ten-year duration remain; canonical group/name form is provisional. |
| 37698 | the House / Cydan | Uncertain: departure, crow/storm image, and Cydan's liberation goal remain; formal faction status and name spelling need context. |
| 37699 | `-{1} {2}` positional tokens | Not an issue: Korean preserves the English sign, spacing, and token order. Japanese alone reorders the same positional variables; no cross-locale normalization is made. |
| Other rows in IDs 37651-37700 | Dialogue, names, values, objectives, items, and labels | Not an issue: remaining rows preserve source meaning and structure; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The source-keyed questions at IDs 37654-37699 were checked, including the
  passive marker, Den, Preordained, Hero of Mel Senshir, Offering/Scion,
  Morus history, and positional variables.
- The Japanese-only marker-order difference at 37699 remains documented;
  Korean preserves the English order and exact `{1}`/`{2}` values.
- The Ysa title-cost variable at 37690, potion quantities at 37679, and the
  two-paragraph history at 37693 remain unchanged.
- These are working dispositions, not independent linguistic approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs
  37651-37700 once and in identical order.
- Only active Korean `Texto` at ID 37686 changed.
- The save-data choices, `{*1[...]}` wrapper, `{1}`/`{2}` order, values,
  recipe layout, and artifact-history paragraph break remain unchanged.
- The UTF-8 BOM and existing mixed line endings are preserved; exact counts
  and the resulting SHA-256 are recorded in the current checkpoint documents.

## Checkpoint

Disposition is complete through ID 37700. Resume at ID 37701; 27,434
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-37701-37750-preliminary.md`. The next unused decision ID is
D-12232.
