# Consolidated Context Review: Standalone `Tenders` Labels

- Date: 2026-10-12.
- Decision: D-19455.
- Scope: open standalone `Tenders` labels at `default` IDs 7085, 49433,
  55332, 63123, and 64724.
- Compared English, Japanese source and draft, Chinese, active Korean,
  corpus role definitions, prior findings, and accepted terminology.

## Finding

English IDs 13355, 42553, and 63584 establish `Tenders` as the House of
Sorrows order responsible for the corporeal care and decomposition of
Winter Fae. Japanese renders the role as a guardian/protector, while Chinese
uses keeper/caretaker wording. The English-led caretaker meaning is also
reflected in the accepted active-corpus forms `돌보는 이들(Tenders)` at ID
38153 and `돌보는 이(Tender)` at ID 38447.

| ID | Previous Korean | Result |
| ---: | --- | --- |
| 7085 | `관리인` | Accepted: `돌보는 이들(Tenders)` |
| 49433 | `수호자들` | Accepted: `돌보는 이들(Tenders)` |
| 55332 | `수호자들` | Accepted: `돌보는 이들(Tenders)` |
| 63123 | `돌보는 자들` | Accepted: `돌보는 이들(Tenders)` |
| 64724 | `수호자들(Tenders)` | Partial accepted correction to `돌보는 이들(Tenders)`; the ID remains uncertain on the other name/title questions under D-18138. |

The role meaning and Korean wording are transferable to the exact standalone
labels. The correction at 64724 is limited to the role and does not resolve
the other findings attached to that key.

## Verification

- All five target IDs align across English, Japanese source, Japanese draft,
  Chinese, and active Korean. No runtime marker or embedded line break was
  changed.
- Five Korean `Texto` cells changed; four prior uncertainties were fully
  resolved. The partial correction at 64724 remains uncertain and is not
  recounted.
- Pre-edit SHA-256:
  `819a799828fdc6db21a0b3bed715588a9075c19fdb3cb5dd2acd4007d9ceb17c`.
- Post-edit SHA-256:
  `883dd752db5f82b069188900e1cb0f340d0ec0cf112d70a639a8ba3723c1764b`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-tenders-labels-D19455/locatexts_zh_cn.koalocatext_default.csv`.
- Reversing the five exact `Texto` substitutions reproduces the backup
  byte-for-byte. BOM, record order, 72,011 CRLF endings, and 73 existing
  bare-LF endings are preserved.
- Totals: **2,299 accepted / 24,999 not an issue / 11,226 uncertain**
  (38,524). Continue with D-19456 by grouped unresolved Tenders contexts.
