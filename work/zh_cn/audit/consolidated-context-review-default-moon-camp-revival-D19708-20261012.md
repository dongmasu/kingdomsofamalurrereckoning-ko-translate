# Consolidated Context Review: Moon Camp and Fate (D-19708)

- Date: 2026-10-12.
- Scope: D-5120-D-5127 and D-5129, IDs 16290-16291,
  16295-16301, 16305, 16310-16312, 16315-16316
  (15 source-keyed rows).
- Compared English/Japanese/Chinese/active Korean exact rows,
  including the complete multiline ingredient list at 16291.
  English anchors meaning; Japanese informs tone and Chinese
  cross-checks. Official Korean manual p. 7 and D-19609 establish
  `트래블러` for the named Travelers faction. No PAKs.

## Decisions

- `accepted` (1): 16300. `Moon Camp is a Traveler's base`
  identifies the Travelers organization, not generic travelers;
  `여행자(Traveler)들의 거점` -> `트래블러(Travelers)의 거점`.
  Keep the camp and Plains of Erathell names and thief opportunity.
- `not an issue` (14): 16290-16291, 16295-16299, 16301,
  16305, 16310-16312, 16315-16316. The anatomist's knowledge
  metaphor, bleeding-potion quantities (3/2/1/1), Cradle taboo,
  Syllareta survival, Teers' oath, English `Pride of Pryderi`
  title, Archsage command, Watch/market directions, technical
  `GRAND HP GRUNT` label, Midden and creature names, Scholia Arcana,
  Fate's irony and prized blade are represented. Japanese alone
  reads Pride of Pryderi as a trading company; retain English-led
  `프라이데리의 자랑`. No speculative correction of internal labels.
- The separate Chinese-only affix fallback inventory and active
  affix CSV SHA-256 were independently checked against D-19565:
  `ad1ad94b1fa3e4a6fe5dbe4ced2d121387ed71733de2ec9e5f587c4e367ae101`
  and `516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e`.
  Inventory has 140 rows, 10 accepted / 130 not an issue / 0
  uncertain; D-19565 records the 55-key subtotal 10 / 45 / 0.
  No affix CSV edit or recount.

## Integrity and Resume

- Pre-edit SHA-256
  `68b1cd437e1629bcb914f5c6c3d58e96cd49d7ce7512ee5ad8eb618dbb41de34`.
- Byte-identical backup
  `/private/tmp/ko-translate-backups/20261012/before-moon-camp-travelers-D19708/locatexts_zh_cn.koalocatext_default.csv`.
- Active SHA-256
  `46fcf4cc52ca2efaeab632198665bbb5c2c301eddf7861ef0693e23e2de21e9c`.
- Exact inverse recreates backup byte-for-byte; BOM, 72,011
  CRLF, 73 existing bare LF, row order and all other bytes preserved.
- Totals **3,367 accepted / 33,798 not an issue / 1,359 uncertain**
  (38,524). Next unclosed group D-5130 (inspect its precise IDs).
