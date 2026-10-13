# Disposition and Edit Batch: `default` IDs 27701-27750

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  27701-27750, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: two accepted, four `not an issue`, and three uncertain.
- Accepted corrections at IDs 27705 and 27722 are applied.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 27705 | `here for you` / `너를 보러 여기 온 거야` | Accepted: change to `너를 위해 여기 온 거야.` English says the people are “here for” the Fateless One, and Chinese says they came for the addressee; “came to see you” narrows that purpose without support. The Fateless One title itself remains a separate terminology question. |
| 27722 | `My fine fellow` / `이 친구, 반갑군` | Accepted: change to `반갑네, 친구.` English uses a familiar direct address, Japanese a greeting, and Chinese “my good companion.” The current `이 친구` can sound like a third-person reference rather than addressing the listener. |
| 27701-27702, 27704-27705, 27711-27713, 27715, 27720, 27725, 27735-27736, 27742, 27747, 27750 | Gask / Adept / Hierophant / Fateless One / Sagecrafting / Beckoned / next “piece” / Ljosalfar / House of Ballads / Well of Souls / Windstones / House of Vengeance / Chancellor Erawn and Court of Summer / Minor Alchemist's Art Potion / Travelers | Uncertain: preserve the current identities and gameplay relationships while deferring the canonical lore, faction, title, crafting, and item terms to cross-corpus alignment. At 27742 the location relation is separately supported; the name/title forms remain open. ID 27750's crutch image is retained; the open point is the faction/title terminology. |
| 27731, 27740 | Engard poem / knights' verse | Uncertain: the poems preserve their narrative imagery and lineation, but meter, idiom, and lore references need integrated literary review. |
| 27734, 27741 | MQ05 shrine-function note / quest-synopsis note | Uncertain: these read as internal or system-facing documentation. Whether such strings should be translated or retained in English is a project-wide policy question. |
| 27721, 27735 | `$TRSQ01.bribe_value$` / `{1}` | Not an issue: runtime placeholder identities and order are preserved, and the localized currency label remains after the bribe variable. |
| 27731 | Engard poem lineation | Not an issue: the six-line poem structure matches the locale comparison and remains intact. |
| 27742 | Court of Summer / Gardens of Ysa relation | Not an issue: although the English sentence is malformed, Japanese and Chinese support the Court's location in the Gardens. Korean makes that relation explicit without changing who is to meet the High King. |
| 27703, 27706-27710, 27714, 27716-27719, 27723-27724, 27726-27730, 27732-27733, 27737-27739, 27743-27746, 27748-27749 | Dialogue, objectives, source fragments, sarcasm, and concise UI/item wording | Not an issue: wording generally preserves the English meaning and Japanese-supported voice. Korean retains the incomplete source fragment at 27727, the sarcastic reversal at 27728, repairs the English grammar error at 27738 without changing its meaning, and keeps the crutch metaphor at 27750. |

## Verification

- The four-locale key/order, line-break, and normalized runtime-token checks
  recorded in the preliminary report remain valid. ID 27735 retains `{1}`;
  the bribe variable at 27721 remains intact.
- The six-line poem at 27731 retains its lineation.
- Only Korean `Texto` values at IDs 27705 and 27722 changed; IDs, variants,
  row order, and all source CSVs remain unchanged.
- Active default CSV SHA-256 is recorded in the synchronized progress and
  handoff checkpoints.
- Register totals after this batch: 859 accepted, 2,972 `not an issue`, and
  4,944 uncertain (8,775 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 27751; 37,384 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.

## Context Re-review (2026-10-12)

D-19392-D-19395 re-reviewed all nineteen open ID findings from D-8774-D-8776:
two accepted corrections, sixteen `not an issue`, and one specific hold for
the canonical Korean form of `Fateless One` at ID 27705. The accepted
purpose correction at 27705 and the Court/Gardens relation at 27742 remain
linked without recounting. See
[`consolidated-context-review-default-27701-27750-20261012.md`](consolidated-context-review-default-27701-27750-20261012.md)
for the locale comparison, cell edits, structural checks, backup, and hashes.
