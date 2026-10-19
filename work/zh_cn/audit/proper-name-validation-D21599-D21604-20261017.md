# D-21599-D-21604 Validation

Date: 2026-10-17. Proper-name discovery remains incomplete.
Next batch: **D-21605**, starting with default:1865 in
`proper-name-residual-queue-D21605-20261017.md`.

## Scope And Counts

Six bounded batches registered 103 source-attested personal-name entries.
Every exact name scope was searched across affix/base/default and compared
with aligned English, Japanese and Chinese. The official Korean manual
extraction/reference supplies no direct entries for these names.

| Batch | Entities | Row Review Events | Edited Texto Events |
| --- | ---: | ---: | ---: |
| D-21599 | 7 | 37 | 16 |
| D-21600 | 21 | 35 | 29 |
| D-21601 | 20 | 39 | 32 |
| D-21602 | 23 | 50 | 39 |
| D-21603 | 28 | 50 | 33 |
| D-21604 | 4 | 5 | 4 |
| Total | 103 | 216 | 153 |

There are **214 distinct resource/ID/variant row keys**: three base and
211 default rows. Default:26896 and 57868 were reviewed in separate Enright
and Luethar entity scopes. Therefore, 216 review events are not 216 distinct
CSV rows. Likewise, 153 edit events affect **151 distinct default Texto
cells**, not 153 distinct cells. Affix/base bytes were not changed.
The new entity/row dispositions comprise 153 accepted and 63 not-an-issue;
these are focused index events, not historical/global translation totals.

Existing full-name spellings were reused; source-local lowercase
`Luethar de Groot` was preserved. Complete Adept/Scholar title annotations
remain unnested. Given-name/surname overlaps did not trigger identity
mergers, and unrelated historical entity decisions were preserved.

## Verification

- `test-proper-name-residuals-D21599-D21604.rb`: 4 tests, 561 assertions,
  zero failures/errors/skips.
- `test-audit-proper-name-residual-final.rb`: 1 test, 11 assertions,
  zero failures/errors/skips; registered terminal bilingual coverage passes.
- `test-proper-name-candidates.rb`: 13 tests, 68 assertions,
  zero failures/errors/skips.
- `test-proper-name-cell-editor.rb`: byte-preserving editor fixtures pass.
- `test-proper-name-inventory.rb`: inventory fixtures pass.
- `validate-proper-name-data.rb`: 2,074 unique glossary entities and 44,684
  unique active-aligned occurrence keys; no duplicates, orphans or stale
  Korean snapshots.
- `verify-proper-name-batch-chain.rb 21599 21604`: all six batches pass
  reverse reconstruction against their range-specific byte-identical
  pre-edit backups. Verified 65,135 ordered default rows, exact mixed
  line-ending sequence, BOM, headers/keys/variants, target values and
  unchanged masked non-target bytes. Reconstructed starting default hash:
  `d34f7816844a38137fb27ae318156fdb6754ebe61a21a8a68870ee50956bcb60`.
- All five active checkpoint blocks match byte-for-byte.

The inherited D-21598 audit failure was an evidence-parser whitespace
defect, not a new translation defect: the documented omission sentence
contained a line break. Whitespace normalization restores the existing
row-scoped not-an-issue recognition. No translation, entity status or
acceptance count was changed to bypass the audit.

## Current State

Indexed occurrence states: accepted 29,852; not-an-issue 11,837;
excluded 2,899; uncertain 96, totaling 44,684. There are no unreviewed
indexed keys; the 96 reviewed uncertain matches occupy 93 CSV rows.
These index counts do not prove exhaustive discovery or overall completion.

The next queue has 30 distinct partial-pair/spelling candidates, not 30
approved errors. Eyrie Peak/Eryie Peak has two additional unclassified
discovery labels outside the indexed holds. Single-word, title, contextual
and other-category discovery still needs residual checks. Do not repeat
the completed sequential review or reopen unrelated terminal keys.

Active CSV SHA-256:

- Affix: `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`.
- Base: `13e739d6cd88898448241ace8239ac1c1203f9db885cb64591eb7ffcf3f683de`.
- Default: `197b76ed7f8cae0aafeaa77958c3800551e7457b98ceb4ae2bfd4d5d7014504c`.

Last actual default edit backup:
`/private/tmp/ko-translate-backups/20261017/before-proper-name-D21604/locatexts_zh_cn.koalocatext_default.csv`.
Each earlier edited batch retains its own immediately pre-edit backup.
No source/archive or release payload changes, new build, commit, push,
Windows execution test or in-game validation were performed in this pass.
