# Consolidated Context Review: House of Sorrows `Tenders`

- Date: 2026-10-12.
- Decision: D-19454.
- Scope: uncertain `Tenders` findings at `default` IDs 51864, 53355, 58237,
  and 58651. The first three held only the role label; 58651 also held
  `Delvers`.
- Compared English, Japanese source and draft, Chinese, active Korean,
  corpus role definitions, and accepted Korean precedents.

## Finding

English ID 13355 defines the Tenders as a sacred group overseeing the decay
and decomposition of Winter Fae bodies. ID 42553 says Tenders take a dead
Fae's body to the Midden and see it safely into rot. ID 63584 identifies
them as Alarane's order and House stewards responsible for the corporeal,
contrasted with Delvers' spiritual work. Japanese uses guardian/caretaker
terms; Chinese consistently uses keeper/caretaker terms.

The English-led evidence establishes a caregiving office, not merely a
protective guard. The accepted active-corpus rendering `돌보는 이들(Tenders)`
at ID 38153 and singular `돌보는 이(Tender)` at ID 38447 preserve the role
meaning while retaining the formal English title.

| ID | Previous Korean | Result |
| ---: | --- | --- |
| 51864 | `수호자들` | Accepted: `돌보는 이들(Tenders)` |
| 53355 | `수호자들(Tenders)` | Accepted: `돌보는 이들(Tenders)` |
| 58237 | `수호자들(Tenders)` | Accepted: `돌보는 이들(Tenders)` |
| 58651 | `...수호자들(Tenders)과 델버들(Delvers)...` | Partial accepted correction: `...돌보는 이들(Tenders)과 델버들(Delvers)...`; retain uncertainty on the separate Delvers title/rendering under D-17728. |

## Verification

- The four target IDs align across English, Japanese source, Japanese draft,
  Chinese, and active Korean. IDs 13355, 42553, and 63584 provide direct
  role definitions. No runtime marker or embedded line break was changed.
- Four Korean `Texto` cells changed; the first three uncertainties were
  fully resolved. The partial edit at 58651 does not change the uncertain
  count.
- Pre-edit SHA-256:
  `f7f1d5aebc4c6c6f8be4bfdbd37820d73e2131103e80db4de6296909571a6857`.
- Post-edit SHA-256:
  `819a799828fdc6db21a0b3bed715588a9075c19fdb3cb5dd2acd4007d9ceb17c`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-tenders-D19454/locatexts_zh_cn.koalocatext_default.csv`.
- Reversing the four exact `Texto` substitutions reproduces the backup
  byte-for-byte. BOM, record count/order, 72,011 CRLF endings, and 73
  existing bare-LF endings are preserved.
- Totals: **2,295 accepted / 24,999 not an issue / 11,230 uncertain**
  (38,524). Continue with D-19455 by grouped unresolved role/context.
