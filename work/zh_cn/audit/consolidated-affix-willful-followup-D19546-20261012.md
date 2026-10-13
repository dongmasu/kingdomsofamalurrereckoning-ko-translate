# Consolidated `affix` Context Follow-Up: Willful (D-19546)

- Date: 2026-10-12; decision D-19546.
- Scope: `affix` ID 444, variants 11, 12, 14, 21, 22, and 24. This revisits
  the five Chinese-only fallback keys from D-18179 and the source-matched
  variants carried as uncertain by D-18197.
- English determines meaning; Japanese and Chinese are supporting
  contextual evidence. This is a working disposition, not independent final
  linguistic approval.

## Decision

| ID / variants | Previous Korean | Applied Korean | Disposition | Evidence and rationale |
| --- | --- | --- | --- | --- |
| 444 / 11, 12, 14, 21, 22, 24 | `*의지가 굳은 자*` | `*고집 센 자*` | accepted | English `willful daughter` at default ID 2374 is rendered Japanese `自分勝手` and Chinese `任性`; English `willful man` at ID 9588 is rendered Japanese `強情` and Chinese `固执`. The active Korean translations at both IDs use `고집 센`. These exact repeated uses establish the stubborn/headstrong sense, not merely positive determination. Apply the same established Korean term to all six variants. |

The five ID 444 fallback rows in
`affix-extra-variant-review.tsv` are updated to `ACCEPTED` and to the
applied Korean candidate. This supersedes the earlier unresolved readings
at D-18179 and D-18197 for these exact ID 444 keys.

## Counts and Integrity

- The 55 Chinese-only fallback keys now comprise 10 `ACCEPTED`, 10
  `NOT_AN_ISSUE`, and 35 `UNCERTAIN`. Across all 140 fallback keys, the
  current inventory is 10 accepted, 95 not an issue, and 35 uncertain.
- The remaining 35 fallback uncertainties are IDs 101, 115, 117, 124, 255,
  341, and 496, each at variants 12, 14, 21, 22, and 24. IDs 115 and 117
  remain linked to D-18173/D-18175.
- Active `default` totals remain **2,456 accepted / 25,349 not an issue /
  10,719 uncertain** (38,524); SHA-256 remains
  `84f6eac5ab61cca00b219d2949605f086a86daca0ddeb5d132321c959ad71ebd`.
- Active `affix` pre-edit SHA-256:
  `611fed1a67bc8eeb277a621e92f463e8b7a451c285ede8dc273e2940e8e0903f`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-affix-willful-term-D19546/locatexts_zh_cn.koalocatext_affix.csv`.
- Active `affix` post-edit SHA-256:
  `516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e`.
- The active CSV retains its UTF-8 BOM, all 3,451 ordered data rows and
  keys, and 3,452 CRLF endings. Replaying only the six approved `Texto`
  substitutions against the backup reproduces the active file byte-for-byte.
- Updated fallback inventory SHA-256:
  `c0c132e1d99fd7add8cad31cb1f6a67e485ca569972b9e6ceb95c6d5d2926663`.
  It retains 140 unique ordered keys with 10 `ACCEPTED`, 95
  `NOT_AN_ISSUE`, and 35 `UNCERTAIN` rows.

## Resume

The nine current `default` uncertainties remain D-18027 IDs 62755, 62789,
62792, 62796, 62797, 62798 and D-18038 IDs 62867, 62869, 62899; all have
current grouped reviews and need new context for another disposition.
Resume D-19547 by seeking distinct item/lore context for the remaining
`affix` group, starting with `Favors's` at ID 101. Do not repeat a
source-only comparison. The review is not complete while these default and
affix holds remain unresolved.
