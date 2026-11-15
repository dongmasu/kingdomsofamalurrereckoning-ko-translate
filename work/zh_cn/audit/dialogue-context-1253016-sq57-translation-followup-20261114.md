# SQ57-Linked Translation Follow-Up

- Date: 2026-11-14.
- This targeted follow-up applied five source-supported corrections among
  previously recorded candidates associated with `1253016.quest_bxml` (`SQ57`).
  It is not a complete line-by-line revalidation of every linked key.
- The asset catalog contains 767 linked `default` IDs. The ledger records the
  full set through 761 exact `.quest_bxml` links plus six historical
  suffixless links: `47563`, `47676`, `47745`, `47941`, `47973`, and `47987`.
  Those existing ledger associations were preserved.
- The asset's quest ID, three NPC symbols, and 498 dialogue handlers support
  asset-level grouping only. They do not establish any reviewed line's
  individual speaker or playback order.

## Applied Corrections

| ID | Review |
| ---: | --- |
| `36838` | Clarified that prayers to Mitharu are plentiful but people who answer them are rare, with Reddle Mane's people as the exception. Preserved the existing paired names and conversational register. |
| `38426` | Added the missing `(Narit)` pairing and recast the brothers' names into a readable Korean list; retained the home-fire and Tuatha-protection meaning. |
| `39444` | Paired the complete establishment name `Sele's Emporium Alchemical` and removed the mixed honorific/plain construction, keeping the welcoming, conversational voice. |
| `51665` | Kept the established `군도(The Isles)` name and replaced the stiff 하게체 imperative with a natural plain-style warning; retained the reference to valuable goods that need care. |
| `59610` | Standardized the named location to `군도(The Isles)` and recast the description in conversational plain style, consistent with the Japanese line; retained both city viewpoints. |

English anchored meaning, Japanese guided register and form, and Chinese
provided supporting evidence. No speaker, gender, or dialogue sequence was
inferred from the asset association.

## Verification

- Only the five specified `default` text fields were changed. The active CSV
  retains its 65,135 ordered IDs, UTF-8 BOM, 71,838 CRLF sequences, 244
  LF-only sequences, and zero bare CR characters.
- The five corresponding ledger `source_fingerprint` fields were refreshed;
  all other fields, rows, and ordering were preserved.
- Exact-English duplicate, line-break, and runtime-token checks found no
  additional change required for these five rows.
- The preservation-helper tests, dialogue-context index tests,
  review-ledger fingerprint validation, index/catalog reproducibility checks,
  and CRLF-aware diff check passed.
- No source CSV, extracted game asset, or game binary was modified.
