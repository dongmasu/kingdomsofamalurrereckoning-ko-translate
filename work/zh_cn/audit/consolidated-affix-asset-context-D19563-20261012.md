# Consolidated `affix` Asset-Context Search (D-19563)

- Date: 2026-10-12; decision D-19563.
- Scope: read-only item/loot asset context search for the seven unresolved
  Chinese-only fallback terms from D-19561.
- This historical asset-text search was superseded by the source-only review
  rule. Do not use its findings as translation evidence.

## Search and Disposition

| ID | English modifier | Active Korean | Disposition | Asset-context result |
| ---: | --- | --- | --- | --- |
| 101 | `Favors's` | `호의의` | uncertain | No linked item/effect name found. |
| 115 | `of the Reckoned` | `*심판받은 자*` | uncertain; link D-18173 | No linked item/effect name found; do not double-count the linked decision. |
| 117 | `Fortune's` | `행운의` | uncertain; link D-18175 | No linked item/effect name found; do not double-count the linked decision. |
| 124 | `Ruin's` | `폐허의` | uncertain | No linked item/effect name found. |
| 255 | `Kismet's` | `키스멧의` | uncertain | No linked item/effect name found. |
| 341 | `of Clairy` | `*클레어리*` | uncertain | No linked item/effect name found. |
| 496 | `Prime` | `최상급` | uncertain | No linked item/effect name found. |

The historical literal-string search found no linked item/effect context.
This negative result is not proof that binary references do not exist and
must not be used to support a translation disposition.

## Counts and Integrity

- No active Korean CSV cells changed; no CSV backup was required.
- Default totals remain **2,458 accepted / 25,352 not an issue / 10,714
  uncertain** (38,524); the four default residuals remain 62755, 62792,
  62796, and 62867.
- The 55 Chinese-only affix fallback keys remain 10 / 10 / 35; all 140
  fallback keys remain 10 / 95 / 35.
- Active default SHA-256:
  `539e1d1a1473a229ba218b853d514ba0f25a68083e4ed19dff389c33adb6067f`.
- Active affix SHA-256:
  `516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e`.
- Fallback inventory SHA-256:
  `8554f891ccf10edfbd259e95d44a3de608e354ecce6ec90d64aae367f44aec09`.

## Resume

Resume D-19564 at affix ID 101 (`Favors's`) only if new item/effect
composition data, in-game evidence, or authoritative Korean terminology
becomes available. Otherwise retain the uncertainty and continue by unique
term without repeating the negative literal-string search. The default
residuals and 35 fallback affix rows remain unresolved; do not mark the
overall review complete.
