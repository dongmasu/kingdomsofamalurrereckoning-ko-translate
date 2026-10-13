# Combined-Name Disposition: Remaining `affix` IDs 130-585

- Date: 2026-10-11
- Scope: all 456 active `affix` IDs 130-585, comprising 2,691 Korean
  `(ID_Linha, Tipo_Variante)` keys.
- English determined meaning; Japanese informed register and fragment
  structure; Chinese was supporting evidence. Existing per-10-ID preliminary
  scans and exact-key source comparisons were reused, then checked against
  the active CSV and prior decisions. These are working dispositions, not
  independent final linguistic approval.
- This consolidated report closes the remaining `affix` lane without
  repeating the 73,430/73,430 first-pass scan or duplicating prior fallback
  decisions.

## Accepted Corrections

Decision D-18195 authorizes ten `Texto` cell changes:

| ID / variants | Previous Korean | Applied Korean | Rationale |
| --- | --- | --- | --- |
| 258 / 11 | `미사란 영혼직조` | `미타란 영혼직조` | English is `Mitharan Spiritweave`. Reuse the accepted corpus distinction `Mitharan = 미타란` (D-18122, D-18134, D-18158); do not confuse the adjective with deity `Mitharu = 미사루`. |
| 333 / 11, 12, 14, 21, 22, 24 | `충격적인` | `전격` | English `Shocking` is an item/effect modifier, not “surprising.” The English `Shocking Sentinel` at base ID 2699 is rendered `전격 감시자`; Chinese `震撼` supports an impact/electric sense. |
| 361 / 11 | `미사란 백금` | `미타란 백금` | Apply the same accepted `Mitharan = 미타란` distinction. |
| 447 / 11 | `미사란 드레드스케일` | `미타란 드레드스케일` | Apply the same accepted `Mitharan = 미타란` distinction; preserve the unresolved item-name rendering. |
| 563 / 11 | `미사란 프리즘미어` | `미타란 프리즘미어` | Apply the same accepted `Mitharan = 미타란` distinction; preserve the established item-name form. |

## Uncertain Findings

D-18197 records 475 newly dispositioned keys for these candidate IDs:

`132, 140, 142, 144, 147, 152, 153, 154, 161, 162, 172, 173, 180, 182, 192, 198, 200, 214, 220, 236, 249, 250, 263, 278, 287, 297, 309, 331, 341, 346, 351, 354, 356, 375, 377, 380, 389, 396, 400, 411, 415, 417, 423, 424, 428, 430, 431, 434, 438, 440, 443, 444, 452, 453, 458, 459, 461, 466, 468, 469, 470, 474, 478, 484, 493, 496, 501, 505, 509, 510, 513, 527, 539, 541, 544, 548, 557, 560, 567, 570, 573, 576, 578, 580, 581`.

The per-ID preliminary reports document the individual questions. Remaining
uncertainties include unattached equipment/effect senses, conflicting
proper-name or stat readings, unresolved Korean modifier attachment, and
action/UI fragments whose continuation is not available. In particular,
the colon and target relation on action fragments remain unchanged until the
complete composed UI phrase is verified. No candidate was treated as an
accepted edit merely because it appeared in a preliminary report.

## Not an Issue

D-18196 records 2,111 newly dispositioned keys: all remaining keys in IDs
130-585 except the accepted and uncertain keys listed above and the 95
fallback keys linked to earlier decisions. Seven preliminary candidates
were directly rejected as non-errors:

- IDs 231, 299, and 574 follow the English meaning despite a Chinese-only
  source divergence or an English spelling error; Korean preserves the
  intended meaning.
- IDs 319 and 365 preserve the actual English source. ID 365 is `(Hard)
  Dispel`, not `(Very Hard) Dispel`; the preliminary candidate's claimed
  missing `Very` is a false positive.
- ID 471 correctly expresses English `Eviscerating`.
- ID 488 `Exit` is naturally rendered as `나가기`.

No other actionable semantic error was established among the 2,089
non-candidate keys.

## Coverage and Prior Decisions

- The English file has one `FF` source row for every ID 130-585. Active
  Korean and Chinese have identical, ascending target key arrays: 2,691
  keys across all 456 IDs. The Japanese source and Japanese-derived draft
  have 2,596 exact target keys; the remaining 95 keys are Chinese-only
  fallbacks across IDs 196, 202, 223, 231, 240, 255, 263, 289, 299, 341,
  337, 368, 369, 444, 466, 496, 510, 527, and 574.
- All 95 Chinese-only fallback keys were dispositioned earlier under
  D-18178 and D-18179. They were re-linked here and are not counted again.
  This includes 50 fallback keys among the preliminary candidate IDs.
- The 456 IDs and 2,691 active keys were all covered. IDs with fewer than
  six active variants remain intact; no missing Japanese key was treated as
  an independent translation disagreement.
- The preliminary claim that base ID 649 supported a Fatesworn item form is
  invalid: active base ID 649 is `Golden Chalice`. That cross-reference was
  not used as evidence for this affix disposition or for later base work.
- No target string contains an embedded newline or runtime marker. Action
  colons were preserved. No runtime base/affix pairing or rendered complete
  name was inferred.

## Source Hashes and Edit Integrity

| File | SHA-256 |
| --- | --- |
| `src/csv/en_us/locatexts_en_us.koalocatext_affix.csv` | `8727c06a9cd19a2c9c79090072684da97a1586858b50986a8cc4de72fc3ac302` |
| `src/csv/ja_jp/locatexts_ja_jp.koalocatext_affix.csv` | `984bb7ca18f074c456d46d0c043fa999b95ad12e7ffea45460330b9c3e1b0677` |
| `work/ja_jp/locatexts_ja_jp.koalocatext_affix.csv` | `1a09f5536e0735c38567f5143fbb2babe6471f24c590e8baf9dfbce64457fa10` |
| `src/csv/zh_cn/locatexts_zh_cn.koalocatext_affix.csv` | `9f9d25d578b35ba607cebf9a0bd1ec45153736d618f7d6d1b14b09049a40e3e6` |
| Active Korean `affix`, pre-edit | `7697d7d09933ca7f7f8f6e41fcd82bb5f29e4b092368b856489a8c62f1dc21b9` |
| Active Korean `affix`, post-edit | `937a8da098291eb9e6f277a49e1cf0a3ef81cb59977df59d03c8dcdc742ddea3` |

Only the ten approved `Texto` cells at IDs 258, 333, 361, 447, and 563
changed. The UTF-8 BOM, 3,451 data rows, key order, all 3,452 CRLF record
endings, and every other byte are preserved. The byte-identical pre-edit
backup is
`/private/tmp/ko-translate-backups/20261011/before-affix-review-0130-0585/locatexts_zh_cn.koalocatext_affix.csv`.

The lane adds 10 accepted, 2,111 `not an issue`, and 475 uncertain unique
keys. Cross-resource totals through D-18197 are 1,879 accepted, 19,685
`not an issue`, and 13,417 uncertain (34,981 total); next D-18198.

## Resume

Continue with active `base` IDs 1300-4843 (3,544 rows). Existing decisions
D-001, D-002, and D-003 at base IDs 1741, 1746, and 4674 are already counted
and must be linked, not counted again. The first-pass source scan is
complete; reuse the per-range base preliminary scans, validate their
candidates against the active CSV, then disposition the remaining 3,541
unique rows. Preserve the uncertain source/name/context findings.
