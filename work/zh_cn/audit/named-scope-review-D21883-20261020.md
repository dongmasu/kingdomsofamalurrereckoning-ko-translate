# D-21883: Eilis Spelling And Two Retained Name Scopes

Date: 2026-10-20

## Content Review

A current-English title/name screen excluded keys already present in the
occurrence index. Review was limited to the following eight default keys;
other screen hits are candidates, not reviewed findings.

- `51758`, `55216`: identical English `Private Eilis Ilver`, Japanese
  `兵卒アイリス・イルヴァー`, and Chinese `列兵艾利斯·艾尔维尔`.
  Only `51758` used `아일리스`; `55216`, the explicit full-name
  self-introduction at `46586`, and the short first-name label at `29953`
  use `에일리스`. Correct only `아일리스` to `에일리스` at `51758`.
  This is local spelling consistency, not definitive pronunciation.
  Preserve ranks and existing D-9597/D-14227/D-16689 uncertainties.
- `12790`, `15291`, `31009`: English `Private Menyr`, Japanese
  `兵卒メニア`, Chinese `列兵门伊尔`. Korean `메니어`/`메니르`
  variation remains unresolved; frequency alone does not settle it.
  Preserve all three cells and D-4671's name/rank hold.
- `59323`: English `Captain Golsey Eidar`, Japanese
  `ゴルシー・エイダー隊長`, Chinese `戈斯利·艾达尔队长`.
  Korean `골시 에이다르 대위` has no clear name error. Retain it;
  do not add an English annotation just to satisfy a style gate.

An independent read-only reviewer supported the Eilis-only correction and
retaining Menyr's hold. No personal identity is inferred from a shared
surname. The manifest's `person:eilis-ilver` is a scope identifier only,
not a new glossary/index registration.

An additional independent bounded probe of repeated exact standalone
English person labels in unindexed default rows found no supported Korean
name-stem mismatch after excluding the Eilis/Menyr/Golsey scopes above,
generic crafting labels, Emotional placeholders, and action/quest phrases.
This is not an exhaustive name audit; do not rerun that same probe without
new evidence.

## Focused Verification

The existing cell editor and separate manifest verifier passed: one
`Texto` cell, 65,135 ordered records, unchanged BOM/line endings/tokens and
non-target bytes, and exact inverse reconstruction.

- Manifest: `proper-name-edits-D21883.tsv`.
- Backup: `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21883/locatexts_zh_cn.koalocatext_default.csv`.
- Default SHA-256 before: `58ed66094a5f103df175594e49e4089ac60eabc27cab419c6970c5e0aa570bdb`.
- Default SHA-256 after: `a3283aa1dff13af5c5aa8b8c57e7836f2ab75cc18a7f7d20c3ab6a9e79bd25f0`.

No occurrence entry exists at the edited key, so no context refresh was
needed. No affix/base, glossary, occurrence index, historical disposition,
count, or release artifact was changed. No full format/residual audit,
inventory rebuild, package build, or in-game validation was run.
