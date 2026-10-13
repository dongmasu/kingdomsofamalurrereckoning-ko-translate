# Disposition and Edit Batch: `default` IDs 26951-27000

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 26951-27000, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: one accepted, two `not an issue`, and three uncertain.
- Accepted correction at ID 26996 is applied to the active Korean CSV.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 26996 | Almain and Varani workers | Accepted: change `광부들` to `노동자들`. English says `workers`, Japanese `作業員`, and Chinese `工人`; none specifies miners. The revision removes unsupported occupational detail. |
| 26957-26961, 26963-26968, 26970, 26972-26990, 26992-26995, 26997-27000 | Dialogue, lore, quest, and concise UI/item wording | Not an issue: the reviewed wording generally preserves English meaning and Japanese-supported voice. Separate name and context questions remain open. |
| 26954 | Stun effect values | Not an issue: the 6% chance and 5-second duration match all locale references. |
| 26952-26953, 26955-26956, 26962, 26968-26969, 26976, 26978-26980, 26984, 26992, 26994-26999 | Rathir Chapter / names / Pack / Hyperian / ranks, faction, and lore terms | Uncertain: canonical names and organizational terms need corpus-wide alignment. `Pack` at ID 26956 may or may not be the named Wolf Pack; the accepted occupational correction at ID 26996 does not settle Tyrenium or related lore terminology. |
| 26951, 26969, 26991, 26996 | “The other night” / Hyperian location / unidentified substance / Tyrenium report | Uncertain: the elapsed-time nuance, spatial relation, substance, and some technical/lore terms cannot be settled from these isolated strings. The specific “workers” occupation at 26996 was corrected separately. |
| 26971 | Fae proverb and literal `\"` sequences | Uncertain: preserve the proverb and two backslash-quote sequences until it is confirmed whether they are rendered literally or transformed by the runtime/export path. |

## Verification

- The preliminary report's four-locale key/order, line-break, and token checks
  were retained. The Mathon poem still has four embedded line breaks; the
  `6%`/`5` values remain unchanged.
- Only ID 26996's `Texto` wording was edited. No IDs, variants, or row order
  were changed.
- The active default CSV preserves its UTF-8 BOM and pre-existing newline
  counts (72,046 CRLF endings and 39 bare-LF endings).
- Active default CSV SHA-256:
  `30ef793b0db1eaf79a9335dd56e5110f754592eb8ef657effd615d0121e61076`.
- Register totals after this batch: 845 accepted, 2,930 `not an issue`, and
  4,864 uncertain (8,639 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 27001; 38,134 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.

## Integrated Context Re-review (2026-10-11)

Eighteen of the 21 unique prior uncertainties were resolved: two accepted
corrections and sixteen `not an issue`. IDs 26952, 26956, and 26971 remain
uncertain for Rathir spelling, the identity of `The Pack`, and runtime quote
visibility. D-8644's accepted correction at 26996 is linked without
recounting. Totals are 2,219 accepted / 24,646 `not an issue` / 11,659
uncertain (38,524). See
[`consolidated review 26951-27000`](consolidated-context-review-default-26951-27000-20261011.md).
