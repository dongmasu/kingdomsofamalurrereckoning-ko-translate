# Disposition and Edit Batch: `default` IDs 27451-27500

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 27451-27500, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: zero accepted, three `not an issue`, and four uncertain.
- No CSV wording was changed.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 27452, 27454, 27463, 27468, 27471, 27475, 27482, 27484-27487, 27493-27495 | Mistress Scathe / Mull-Rane / Anecitus / Coilsbain / Skoria Mine / Agarth / Wulf / Caerwyn / St. Odwig's Mission / Cryamor / Idylla | Uncertain: canonical names, roles, and place forms need alignment with the project terminology inventory. Preserve the current identifiable forms. |
| 27457, 27496 | Map Tutorial / VP Functionality QA | Uncertain: `지도 안내` is a plausible localized tutorial label, while `VP Functionality QA` looks internal. Player-facing status and localization policy are not established by these rows. |
| 27476, 27478-27480, 27485, 27487, 27491-27492 | Final rites / altar instruction / peace and faith / St. Odwig's Mission / black pool / “abuse of drink” / Flowering rite | Uncertain: preserve the ritual sequence and lore referents; confirm named-place use and the idiomatic force of the expulsion phrase in surrounding context. |
| 27483 | `Cur` -> `잡종견` | Uncertain: English is an isolated noun that could be a literal dog or an insult for a person. Japanese transliteration and Chinese dog reading support the current choice but do not establish the referent conclusively. |
| 27469 | `PLACEHOLDER MESSAGE` | Not an issue: the literal placeholder is preserved exactly across the locale rows; do not localize or replace it without a display-path decision. |
| 27489-27490 | Trade-cost variable / Gold icon / `+17% Melee Attack Damage` | Not an issue: `$DLC1_Diplomacy.trade_cost_medium$`, `#NAMED_ICON_GOLD#`, their order, and the +17% stat value are preserved. |
| 27451, 27453, 27455-27456, 27458-27470, 27472-27475, 27477, 27481-27484, 27488, 27493, 27497-27500 | Dialogue, lore, quest, and concise UI/item wording | Not an issue: reviewed wording generally retains English meaning and Japanese-supported voice. Open terminology candidates remain listed separately. |

## Verification

- The four-locale key/order, line-break, and runtime-token checks remain valid.
  The trade-cost variable precedes the Gold icon at ID 27489, and ID 27469's
  placeholder remains unchanged.
- The `+17%` melee-damage value at ID 27490 is preserved.
- No CSV wording, IDs, variants, or row order changed.
- Active default CSV SHA-256 remains
  `a7558a92f602baffc3186e12c592060bc123478156c8494ff5854fae799b9081`.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39 bare-LF
  endings.
- Register totals after this batch: 851 accepted, 2,954 `not an issue`, and
  4,913 uncertain (8,718 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 27501; 37,634 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
