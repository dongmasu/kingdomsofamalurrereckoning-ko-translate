# Disposition and Edit Batch: `default` IDs 26901-26950

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 26901-26950, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: zero accepted, two `not an issue`, and three uncertain.
- No Korean CSV text was changed.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 26901-26904, 26906-26907, 26910-26912, 26914-26920, 26924-26929, 26931-26932, 26935-26938, 26940-26942, 26944-26946, 26948-26950 | Dialogue, quest, and concise UI wording | Not an issue: the reviewed wording generally preserves English meaning and Japanese-supported tone. Separate terminology and context questions remain open. |
| 26905, 26908 | Chain Reaction effect / match-time placeholders | Not an issue: the five-stack cap and `{1}`/`{2}` placeholder order are preserved. |
| 26909 | Four-part Unbound poem and literal `\"` sequences | Uncertain: the Korean retains all four slash-separated lines, but the backslash-quote sequences may be literal text or an export artifact. Leave unchanged pending display-format evidence. |
| 26913, 26921-26929, 26939-26949 | Cynoc's Eye / Testament / Cipher / ranks, names, factions, and “pack” | Uncertain: recurring proper-name forms and lore categories need corpus-wide alignment. The Korean preserves the ambiguity of “your pack” rather than selecting Wolf Pack without evidence. |
| 26930, 26933-26934 | Card-game exchange / The Burn / “Stick it too far” | Uncertain: the card logic and the referent/action in the warning remain context-dependent; do not resolve them from the terse strings alone. |

## Verification

- The preliminary report's four-locale key/order, line-break, and runtime-token
  checks were retained. The five-stack cap and both time placeholders remain
  unchanged; no unexpected format character was found.
- No Korean CSV was edited. Active default CSV SHA-256 remains
  `7c29102be8e79b384079c17872c5d15de980db654bfb72954dbdd8d3f10ca4d0`.
- Register totals after this batch: 844 accepted, 2,928 `not an issue`, and
  4,861 uncertain (8,633 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 26951; 38,184 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.

## Integrated Context Re-review (2026-10-11)

Twenty-four of the 25 unique prior uncertainties in D-8636-D-8638 were
resolved: two accepted corrections and twenty-two `not an issue`. ID 26909
remains uncertain on whether its literal `\"` sequences are visible at
runtime. Totals are 2,217 accepted / 24,630 `not an issue` / 11,677
uncertain (38,524). See
[`consolidated review 26901-26950`](consolidated-context-review-default-26901-26950-20261011.md).
