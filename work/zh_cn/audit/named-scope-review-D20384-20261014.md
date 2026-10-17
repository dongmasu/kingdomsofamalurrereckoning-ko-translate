# D-20384: Focused `default` Thresh Terminology Review

Date: 2026-10-14

## Scope and Decision

Reviewed all 82 active `default` rows whose English source contains the
standalone term `thresh` or `threshes`. Compared English meaning with the
Japanese and Chinese source rows and checked the Korean usage in context.
English distinguishes the general creature `Thresh` from the named
`Grave Thresh`; Japanese supports the pronunciation 스레시, while Chinese
was used only as secondary evidence.

Standard forms:

| English source term | Korean form |
| --- | --- |
| `Thresh` / `threshes` | `스레시(Thresh)` |
| `Grave Thresh` | `무덤 스레시(Grave Thresh)` |
| `Paragon Thresh` | `파라곤 스레시(Paragon Thresh)` |
| `Bog Thresh` | `늪지 스레시(Bog Thresh)` |
| `Kora Thresh` | `코라 스레시(Kora Thresh)` |
| `Thresh's lair` | `스레시(Thresh)의 소굴` |

The `Paragon Thresh` form reuses the accepted D-20183 terminology at ID
55449. The `Bog Thresh` form at ID 55561 was already consistent. The scope
also covered titles, quest labels, dialogue, repeated references, and verse.
No prior disposition was reopened or recounted, and no global tally changed.
This focused terminology pass does not extend the completed sequential
default review, which remains complete through D-20377 / ID 65134.

The initial pass changed 58 Korean `Texto` cells. A residual spelling scan
then found one additional `쓰레쉬` at ID 45374, which was corrected to
`스레시(Thresh)`. In total, 59 cells changed across the 82 source rows. A
per-ID English/Japanese/Chinese and before/after comparison is in
[`thresh-terminology-edits-D20384.tsv`](thresh-terminology-edits-D20384.tsv).
The byte-preserving procedures are
[`apply-thresh-terminology-D20384.rb`](apply-thresh-terminology-D20384.rb)
and
[`apply-thresh-spelling-followup-D20384.rb`](apply-thresh-spelling-followup-D20384.rb).

## Verification

- Pre-edit active default SHA-256:
  `07981d157152c8a5880c23c16c81e466a23c69a17103d2a4df37d8d63dce31c9`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261014/before-thresh-terminology-D20384/locatexts_zh_cn.koalocatext_default.csv`.
- Intermediate SHA-256 after the initial 58 edits:
  `7670f32c73396dccfc5974c8165d975c337b86bc26a791f55842a73fc790926d`.
- Byte-identical follow-up backup before correcting ID 45374:
  `/private/tmp/ko-translate-backups/20261014/before-thresh-spelling-followup-D20384/locatexts_zh_cn.koalocatext_default.csv`.
- Final active default SHA-256:
  `b1e6b7f727f7f924ed7fe673d87eb8abe6b362352341f5653892890b505485ef`.
- Exactly 59 `Texto` cells changed. Reverse edits restored the pre-edit file
  byte-for-byte; all bytes outside the target `Texto` fields were preserved.
- UTF-8 BOM, 65,135 ordered IDs (`0`-`65134`), CSV parse structure, 72,084
  CRLF endings, and zero bare-LF endings passed verification.
- A residual scan including `쓰레쉬`, `쓰레시`, `스레쉬`, `스레시`, and other
  observed variants found no unpaired Korean Thresh term in the 82 source rows.
- Source CSVs under `src/csv/` were read-only. No PAK or PAK-derived data was
  consulted. No prior disposition or global total was changed.
