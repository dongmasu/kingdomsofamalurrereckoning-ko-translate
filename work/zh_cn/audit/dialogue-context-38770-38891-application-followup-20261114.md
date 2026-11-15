# Dialogue Context Candidate Disposition Follow-up: IDs `38770`, `38771`, `38818`, `38891`

- Date: 2026-11-14.
- Reconciled the `candidate` rows in the append-only review ledger against the
  final edit manifest for `36000`-`39999`; these four IDs had no final
  disposition entry.
- Compared each current Korean row with its English, Japanese, and Chinese
  source. Related terms and exact-source labels were checked where applicable.
- Applied four clear, source-supported corrections. No speaker attribution or
  dialogue order was inferred from asset membership.

## Applied Corrections

| ID | Correction |
| ---: | --- |
| `38770` | Changed `네 자격을 증명해` to `네 권리를 쟁취해라`, matching English “Earn your right,” Japanese `権利を勝ち取れ`, and Chinese `争取你的权利`. |
| `38771` | Changed `발견한 우상` to `찾은 우상`, matching the parallel `Found Hammer` / `찾은 망치` and `Found Brooch` / `찾은 브로치` labels at `40630` and `52812`. |
| `38818` | Standardized the direct address to `먼지의 아이(Child of Dust)`, consistent with the chosen epithet form at `2426` and `38399`, while preserving the remainder of the sentence. The exact source wording at this ID omits “the,” so its parenthetical does too. |
| `38891` | Added the missing English pairing: `대장 브로건(Brogan)은 명사수야.` The source names only Brogan, so no surname was inferred. |

## Verification

- Used `tools/replace_text_preserve_eol.py` for all four ID-scoped CSV edits.
- Restored the four corresponding `finding_ref` values and refreshed their
  `source_fingerprint` fields in the review ledger; all other ledger bytes and
  dispositions were preserved.
- The four edited rows were rechecked for meaning, Korean naturalness, and
  formatting. No embedded line breaks, runtime tokens, or markup were altered.
- No source CSV, extracted asset, or game binary was modified.
- No commit was made.
