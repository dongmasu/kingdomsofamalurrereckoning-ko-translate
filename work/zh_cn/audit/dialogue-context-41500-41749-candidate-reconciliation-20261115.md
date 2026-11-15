# Candidate Reconciliation: IDs `41500`-`41749`

- Date: 2026-11-15.
- Rechecked all 11 correction candidates from the sequential four-language
  review against the current English, Japanese, Chinese, and Korean rows and
  the existing context-specific reviews.
- The supported correction text was already present in the active Korean for
  all 11 in-range candidates. No Korean CSV row was changed in this pass.
- Exact-source duplicate `43268` was checked together with `41671`; both IDs
  are candidates in the ledger and both are counted as reconciled.

## Candidate Decisions

| ID | Result |
| ---: | --- |
| `41525` | Confirmed `이중 판금` and two enchantments; this preserves both source details and the resized-for-mortals clause. |
| `41533` | Confirmed `라토퍼(Ratofer)의 반지 판매`, keeping the possessive name span intact in the objective. |
| `41545` | Confirmed the informal greeting without the unsupported romantic `내 사랑`; English `dove` and Japanese/Chinese context support the familiar, relieved tone. |
| `41586` | Confirmed the established `로어스톤(Lorestones)` terminology and objective form. |
| `41599` | Confirmed that only a hero stands between order and ruin; the Korean no longer adds that the hero must appear. |
| `41650` | Confirmed the current explicit `달인의 자물쇠따개(Master's Pick)` reference and retrieval meaning. English leaves the exact operation of `free` open, Japanese says the device makes the Pick usable, Chinese supports retrieving the lockpick, and the TR03 context identifies the Pick as the named item. |
| `41671`, `43268` | The English, Japanese, Chinese, and Korean rows are identical. Both use `무슨 통지서야?`, which fits the delivered Notices of Duty in SQ122 and avoids the public-announcement sense of `공지`. |
| `41720` | Confirmed the reference to the women who admired the speaker; the Korean does not broaden them to everyone. The speaker's gender and identity remain unassigned. |
| `41722` | Confirmed the standalone place-name pairing `물물교환 거리(Barter Row)`. |
| `41732` | Confirmed the restored self-correction (“Well, I am”) and the consistent informal voice. No speaker identity was inferred from the asset association. |
| `41746` | Confirmed the established action-form objective ending `이동하기`. |

## Separate Hold

`41648` (`Recipes`) remains an evidence-limited UI terminology hold. The
English, Japanese, and Chinese labels do not establish whether the menu is
limited to cooking or covers crafting more broadly. This is not included in
the correction-candidate total.

## Verification

- Reconciled 11 in-range candidate IDs and linked exact-source candidate
  `43268`, for 12 unique ledger IDs total. No candidate was added to or
  removed from the 4,020-ID pool.
- Candidate reconciliation now covers 2,711 / 4,020 IDs (67.44%), with
  1,309 remaining.
- `default:41650` already contained the accepted revision at the start of
  this pass; its four-language source fingerprint was refreshed in the
  ledger. No other ledger row was changed.
- The 65,135-row ledger fingerprint check, index/catalog checks, 11
  CSV-preservation tests, nine context-index tests, CSV BOM/line-ending
  checks, and CRLF-aware diff check passed.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.
