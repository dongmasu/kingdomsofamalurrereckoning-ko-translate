# Disposition Batch: `default` IDs 35351-35400

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling preliminary findings with active Korean,
  immutable English/Japanese/Chinese rows, prior decisions, terminology,
  markers, values, and structure.
- Evidence caution: Japanese wording refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- Decisions: one accepted, five `not an issue`, and eight uncertain.
- CSV changes: ID 35376.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35355 | Potion levels / `{*1}`, `{LINE_SPACE}`, `{1}`, `{2}` | Not an issue: the levels and scrolling controls are retained; marker identities, order, and localized visible payload are preserved. |
| 35362-35363 | Unnamed `he` / fate-barrier | Uncertain: the speaker is intentionally unnamed; Korean adds respectful `그분`, and the exact gameplay meaning of fate-barrier is not established here. |
| 35364 | `Wolf (3 Meat)` | Not an issue: the animal and quantity three are both retained; the isolated inventory/trade context does not reveal a competing interpretation. |
| 35368-35370 | Silkfarmers / Gnarsh's brood / Skald | Uncertain: silk collection versus cultivation, brood as offspring versus group, and canonical Skald spelling/title remain context and glossary questions. |
| 35373 | `Melly the Sword` | Uncertain: Japanese identifies a swordswoman while Chinese can read “long-sword Melly”; `검 메리` is awkward, but the epithet's canonical Korean form is not settled. |
| 35375 | Higher / four-card outcome | Uncertain: the loss on a four is retained, but the game's Higher/High betting label needs UI context. |
| 35376 | Drewn as last living heir to the keep | Accepted: change `그 요새는 그에게 넘겨도 돼` to `그 요새를 물려받을 수 있어`. English says the last living heir can have the keep, and Japanese explicitly says he can become its lord; the old wording invents an unnamed grantor's permission to transfer it. |
| 35377-35379 | Forsaken Plain / Emaire / refugee camps / Missives of Sable | Uncertain: locations and eastern refugee-camp relation are retained; canonical names and whether Sable is an owner, epithet, or descriptor remain open. |
| 35380, 35383 | Activity Test - Gnome / Dame Oleyn | Uncertain: the test's UI role and the rank/character implications of `Dame` need context; no title convention is imposed. |
| 35381 | Grim's Gem | Not an issue: Korean follows English and Chinese; Japanese's unrelated Tear of Mitharu is a locale divergence, not grounds to override English. |
| 35389 | The Offering | Uncertain: the impending event is retained, but prior decisions leave open whether the capitalized term names a rite, sacrifice, or object. |
| 35391 | `dove` address / making oneself scarce | Uncertain: hiding and the promise of a near reunion are retained; prior decisions do not establish a safe Korean endearment for this speaker. |
| 35396-35397 | Political trinkets / heralds / Might-Finesse-Sorcery markers | Not an issue: the status-play metaphor, announcement's limited function, and all three marker IDs/order with localized labels are retained. |
| Remaining ordinary text in IDs 35351-35400 | Dialogue, labels, values, and structure | Not an issue: the other 29 IDs were checked in all four locales; no additional supported row-local defect was identified. |

## Historical Audit Reconciliation

- Prior `dove` decisions leave the Korean address unresolved; ID 35391 remains
  unchanged rather than borrowing a form from a different speaker.
- Existing Offering decisions distinguish clear ritual contexts from
  ambiguous standalone uses; the event label at 35389 remains uncertain.
- The Chinese Tear of Mitharu at 35381 does not override the English Grim's
  Gem. No source-locale divergence is copied into Korean without evidence.

## Verification

- All four locale files contain IDs 35351-35400 exactly once and in the same
  order; no embedded line breaks occur in this range.
- Runtime markers at 35355/35397, `{1} {2}` order, quantity `3`, card value
  `four`, and seven centuries at 35395 are preserved.
- Only the authorized Korean `Texto` value at ID 35376 changed. Keys, row
  order, BOM, and original physical line-ending distribution are preserved.
- These working dispositions are not independent final linguistic approval.
- Resume disposition at ID 35401; 29,734 IDs remain through ID 65134.
