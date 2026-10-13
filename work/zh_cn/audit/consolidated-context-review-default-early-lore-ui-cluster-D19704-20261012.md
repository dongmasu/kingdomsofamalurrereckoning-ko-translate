# Consolidated Context Review: Early Lore and UI (D-19704)

- Date: 2026-10-12.
- Scope: D-5058, D-5060-D-5065, D-5067-D-5068 and D-5072:
  IDs 16121, 16124-16126, 16128, 16134-16136, 16138-16140,
  16144-16145, and 16149 (14 unique keys).
- Checked exact active Korean and English/Japanese/Chinese source rows;
  English governs meaning, Japanese register, and Chinese supports context.
  Consulted the official Korean manual extraction for setting terminology;
  it does not define these isolated sublocation or UI labels. No PAKs.

## Decisions

- `not an issue` (13): 16121, 16124-16126, 16128, 16134-16136,
  16139-16140, 16144-16145, 16149. The source-paired title, names,
  traitor/land image, blood trail, location labels, Winter Court/Tuatha
  history, drunkenness label, Quarters dialogue and salvage/payment sense
  are sufficiently represented; unsupported alternative proper names or
  literal scene interpretations do not justify keeping these keys open.
  The generic English `coin` at 16149 does not establish a distinct
  denomination; the existing Korean currency usage remains acceptable
  in this context, not an assertion of a newly verified unit.
- `accepted` (1): 16138. English `Prodigy` and Chinese `奇才` do not
  require a child; Japanese transliterates. Replace `신동` with age-neutral
  `천재` for this standalone label.

## Integrity

- Pre-edit SHA-256:
  `2c094b06c1a3151bada966d820c32272266ac038083790cd05214911e902ed48`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-early-lore-ui-cluster-D19704/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit SHA-256:
  `61a3561c8afac8d26e58a7a22b280d5dc2b85b54e6b5fec23301f7719e1278cb`.
- Replacing the single resulting `16138;천재` record with the original
  `16138;신동` reproduces the backup byte-for-byte. BOM, 72,011 CRLF,
  73 pre-existing bare LF, row order and all other bytes are unchanged.
- Totals: **3,363 accepted / 33,727 not an issue / 1,434 uncertain**
  (38,524). Next unclosed group: D-5074 / IDs 16151, 16160.
