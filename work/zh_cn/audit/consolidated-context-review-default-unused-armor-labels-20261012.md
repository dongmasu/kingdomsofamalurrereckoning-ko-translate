# Consolidated Context Review: Unused `Armor` Labels

- Date: 2026-10-12.
- Decision: D-19453.
- Scope: `default` IDs 12637 and 44240, previously uncertain under D-3683,
  D-13593, and D-19449.
- Compared English, Japanese source and draft, Chinese, active Korean,
  neighboring IDs, and prior decisions.

## Decisions

| ID | English / active Korean | Finding |
| ---: | --- | --- |
| 12637 | `Scourge Armor [DO NOT USE]` / `재앙 방어구 [사용 금지]` | Not an issue. Korean preserves the English compound and unused warning. Chinese also renders an armor noun; Japanese narrows it to a plague-defense stat, but the English label does not establish that category. |
| 44240 | `Bleeding Armor [DO NOT USE]` / `출혈 방어구 [DO NOT USE]` | Not an issue. Korean preserves the English modifier-plus-Armor label and exact warning. Chinese also uses an armor noun; Japanese's “bleeding defense power” is a narrower interpretation unsupported by the English label alone. |

Both are isolated warning-marked labels, adjacent to unrelated dialogue or
UI rows. Their placement does not identify them as equipment, a defense
stat, an effect, or a test entry. That unresolved implementation category
does not demonstrate that the English-led Korean wording is mistranslated.
Keep the current literal Korean forms rather than guessing `방어력` or
inventing an item/effect category. Warning visibility is not part of this
linguistic decision.

## Verification

- Both IDs occur in English, Japanese source, Japanese-derived draft,
  Chinese, and active Korean. The draft matches the active Korean.
- No CSV cells changed; no backup was needed. Active default SHA-256 remains
  `f7f1d5aebc4c6c6f8be4bfdbd37820d73e2131103e80db4de6296909571a6857`.
- Two prior uncertainties were resolved as `not an issue`. Totals:
  **2,292 accepted / 24,999 not an issue / 11,233 uncertain** (38,524).
  Continue with D-19454 from the deduplicated unresolved-source queue.
