# D-21881: Chaos Flame Canonical Spelling Correction

Date: 2026-10-20

## Finding

At `default:49092`, the paired name was `혼돈 불꽃(Chaos Flame)`, while
the confirmed glossary canonical is `혼돈의 불꽃(Chaos Flame)`. English
identifies the magical Chaos Flame reagent; Japanese `混沌の炎` and Chinese
`混乱烈焰` corroborate. The other seven exact uses at `affix:280`,
`base:2538`, and `default:20211`, `21337`, `43683`, `46427`, and `56572`
use the canonical Korean form.

D-20056's grouped `not-an-issue` disposition reviewed the sentence's general
meaning. D-21521 later registered and paired the exact `Chaos Flame` name
here but left its Korean spelling unchanged. This correction supersedes
those prior decisions only for the name spelling at `default:49092`; the
reagent interpretation and surrounding sentence remain unchanged. Insert
only `의` in the name.

## Verification

- One `Texto` cell changed. Backup:
  `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21881/locatexts_zh_cn.koalocatext_default.csv`.
- Default CSV SHA-256: pre `1e670d456f14b5a87a0e6a8e5576fa6dfca325a1c10191324628afaace3f54ea`; post `58ed66094a5f103df175594e49e4089ac60eabc27cab419c6970c5e0aa570bdb`.
- The byte-preserving editor and independent manifest verifier passed: 65,135 ordered rows; BOM, line endings, tokens, non-target bytes, and inverse reconstruction preserved.
- Three existing occurrence-index context snapshots were updated for `resource:chaos-flame`, `item:chaos-weapon`, and `person:skald-atlas`. All other index fields, row order, statuses, and evidence are unchanged. Index SHA-256: pre `363d4c0075a2f0582862e4690cff39961801ccfcfa82ba254abe9cdb432f6d57`; post `dab14c16869fe2677f9510e60ad9ab435b012332edfcdd1c5811bb9f2c116420`. Byte-identical backup: `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21881/proper-name-occurrences.tsv`.
- No glossary, entity, key, status, cumulative count, or release artifact changed. No full residual audit or build was run.

The temporary D-21877 aligned inventory predates this edit and is stale at
`default:49092`; refresh it before any future inventory-driven screen.
Exact correction and source evidence: `proper-name-edits-D21881.tsv`.
