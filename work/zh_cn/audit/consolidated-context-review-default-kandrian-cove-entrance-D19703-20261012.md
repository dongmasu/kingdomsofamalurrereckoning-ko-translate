# Consolidated Context Review: Kandrian Cove Swim Entrance (D-19703)

- Date: 2026-10-12.
- Scope: `default` ID 16116, originally flagged in D-5054.
- Compared the exact English, Japanese, Chinese, and active Korean row and
  checked the corresponding in-corpus `Kandrian Cove` label at ID 3647.
  English anchors meaning; Japanese and Chinese support the location/entrance
  reading. The official Korean manual extraction was consulted for broader
  setting context but does not name this sublocation. No PAK material was used.

## Decision

| ID | Disposition | Evidence |
| ---: | --- | --- |
| 16116 | `accepted` | English presents `KandrianCoveSwimEntrance` as a location label, and Japanese and Chinese both translate the concatenated key as a Kandrian cave/swim entrance, so its internal-looking formatting is not grounds to retain uncertainty. English uses `Cove`; the active Korean corpus already renders `Kandrian Cove` as `칸드리안 만` at ID 3647. Normalize `코브` to that established form and retain `수영 입구`. |

## Applied Text

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 16116 | `칸드리안 코브 수영 입구` | `칸드리안 만 수영 입구` |

## Integrity and Resume

- One evidence-backed correction applied; no uncertainty retained.
- Pre-edit default SHA-256:
  `0e802bcf522324a1663156087c92a7d7961d301d73cc704a49c3b87f77b8055a`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-kandrian-cove-entrance-D19703/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit default SHA-256:
  `2c094b06c1a3151bada966d820c32272266ac038083790cd05214911e902ed48`.
- The exact inverse of the single `Texto` substitution reproduces the backup
  byte-for-byte. The UTF-8 BOM, 72,011 CRLF endings, 73 existing bare-LF
  endings, row order, and every non-target byte are preserved.
- Updated totals: **3,362 accepted / 33,714 not an issue / 1,448 uncertain**
  (38,524).
- Next unresolved candidate: D-5058 / ID 16121. Default review remains
  incomplete.
