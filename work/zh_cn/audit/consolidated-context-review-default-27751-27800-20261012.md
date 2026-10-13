# Consolidated Context Review: `default` IDs 27751-27800

- Review date: 2026-10-12.
- Scope: re-review twenty open IDs in D-8786 across English, Japanese
  source/draft, Chinese, active Korean, and previous audit decisions.
- Result: one accepted correction, eighteen `not an issue`, and one specific
  uncertainty at ID 27777. D-19397 also resolves the preceding batch's
  Fateless One hold at 27705 using the established active-corpus form.
- English controls meaning; Japanese informs voice/register; Chinese is
  supporting evidence.

## Decisions D-19396-D-19398

| Decision | Key | Disposition | Evidence and rationale |
| --- | --- | --- | --- |
| D-19396 | `default` 23838, 27800 | accepted | Change the exact `(Socketed)` suffix from `장착됨` to `소켓 장착`, matching the existing Korean rendering at ID 42784 and Chinese `已镶嵌`. Preserve every `$STR` variable and its order. |
| D-19397 | `default` 27705, 27751, 27759-27760, 27762, 27767-27768, 27772, 27775-27776, 27778-27782, 27786-27787, 27790-27791 | not an issue | `Fateless One` uses the established `운명 없는 자` form (D-770, D-2222, D-2399, D-10324, D-10904); the purpose correction at 27705 remains intact. Other translations retain the source meaning, name identities, game relations, values, and appropriate register. `High Fulgen` at 27777 is excluded and remains uncertain. |
| D-19398 | `default` 27777 | uncertain | English says “High Fulgen's” without identifying whether High Fulgen is a person or region. Japanese and Chinese explicitly say the Bolgan Masters are in the Fulgen highlands. Korean preserves the English possessive neutrally; leave it unchanged pending map/lore context. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 23838 | `$STR0 $STR1 $STR2 (장착됨)` | `$STR0 $STR1 $STR2 (소켓 장착)` | Match the exact `Socketed` suffix to the established localized UI wording at 42784. |
| 27800 | `$STR0 $STR1 (장착됨)` | `$STR0 $STR1 (소켓 장착)` | Match the same exact source suffix and preserve both dynamic names in order. |

## Structural and Context Notes

- English, Japanese source, Japanese-derived Korean, Chinese, and active
  Korean each contain IDs 27751-27800 once in identical ascending order.
  Default CSVs have `ID_Linha` and `Texto` fields; there is no variant
  column.
- IDs 27755, 27762, 27765, and 27800 retain their line break, normalized
  runtime-marker identities/order, and variable identities. In particular,
  27762 retains `{*1}`, `{*1}`, `{LINE_SPACE}`, `{1}` in source order.
- The exact `(Socketed)` source suffix occurs at 23838, 27800, and 42784.
  The two former cells now match the latter's `소켓 장착`; no variables were
  moved or removed.
- ID 27772's `Fateless One` meaning is supported by the repeated accepted
  Korean form; ID 27777 alone remains open because the locale sources differ
  on the entity type behind High Fulgen.
- Prior accepted corrections at 27771 and 27796 and prior structural
  dispositions D-8784 were linked, not counted again.

## Verification

- Parsed comparison against the pre-edit backup found exactly two changed
  `Texto` cells, IDs 23838 and 27800. Reversing those exact substitutions
  reproduces the backup byte-for-byte.
- UTF-8 BOM, all 65,135 rows, sorted row order, 72,011 CRLF endings, and 73
  pre-existing bare-LF endings are preserved. Source CSVs are unchanged.
- Pre-edit SHA-256:
  `ee4e3f792f073c0050bc201ab095cc04603815845a30f4652c3bb06476a56650`.
- Post-edit SHA-256:
  `eabf47f8fb078df2d43f0ce05200c6152fae3623d5867797a0a3a0d0538ca09a`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-context-27751-27800-D19396/locatexts_zh_cn.koalocatext_default.csv`.
- Totals: 2,249 accepted / 24,815 `not an issue` / 11,460 uncertain
  (38,524). Resume D-19399 at ID 27801; sequentially unreviewed interval is
  27801-65134 (37,334 IDs).

These are working dispositions, not independent final linguistic approval.
