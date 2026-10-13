# Consolidated Context Review: Standalone Hanged Men Labels

- Date: 2026-10-11.
- Scope: `default` IDs 28296 and 29944, previously uncertain under D-18246.
- Compared English, Japanese source and Japanese-derived Korean, Chinese,
  active Korean, and the established accepted form at ID 28302.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Decision D-18252

Both English rows are the exact standalone label `The Hanged Men`. Japanese
calls the group `首吊海賊団` (“hanged pirates”), consistent with the repeated
English lore identifying the Hanged Men as Dead Kel's named pirate crew.
The Chinese `吊死鬼` is a secondary literal rendering and does not override
the English group identity.

D-18244 already accepted `교수형 사내들(The Hanged Men)` at ID 28302, the
same English standalone label in the same established crew context. Apply
that exact display form to IDs 28296 and 29944; do not create a separate
transliterated display convention for these duplicate labels.

| ID | Previous Korean | Applied Korean | Disposition |
| ---: | --- | --- | --- |
| 28296 | `행맨(The Hanged Men)` | `교수형 사내들(The Hanged Men)` | accepted; supersedes D-18246 uncertainty |
| 29944 | `행맨(The Hanged Men)` | `교수형 사내들(The Hanged Men)` | accepted; supersedes D-18246 uncertainty |

## Verification

- Only the active Korean `Texto` cells at IDs 28296 and 29944 changed.
- The active default CSV remains 65,135 data rows with its UTF-8 BOM, row
  order, all other bytes, and original mixed line endings preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-hanged-men-standalone-context-20261011/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `bd80c7003f0fb1785206d94c61b703e1d47c7529d399664e647c0821e28a84a5`.
- Post-edit SHA-256:
  `a19d10e66a7946ce925300d542d37951a123189804571b701269b11fbfb7a35a`.
- Cross-resource totals through D-18252: 1,929 accepted, 23,085 `not an
  issue`, and 13,508 uncertain (38,522 unique keys). The next decision is
  D-18253.
- This is a working correction, not independent final linguistic approval.
