# Consolidated Context Review: `Goodbye.` at ID 30193

- Date: 2026-10-12.
- Decision: D-19479.
- Scope: `default` ID 30193.
- Compared English, Japanese source, Chinese source, preserved
  Japanese-derived Korean, active Korean, and exact repeated-label precedents
  by `ID_Linha`.

## Decision

| Decision | ID | Disposition | Rationale |
| --- | ---: | --- | --- |
| D-19479 | 30193 | accepted | English `Goodbye.`, Japanese `ではまた`, and Chinese `再见` all express a farewell. The active Korean `안녕히.` is an adverb without a predicate and reads as an incomplete fragment. Reuse `잘 가.`, already accepted for repeated `Goodbye.` labels under D-19467; this restores a complete, concise farewell without adding a new formality claim. |

Only the `Texto` cell at ID 30193 changed, from `안녕히.` to `잘 가.`.
There are no runtime markers or embedded line breaks in this label.

## Verification

- Active default SHA-256 before edit:
  `fc31e5ab140a22e2fb83774d3a941ac7e9605f69e6300c336806da6805c587f7`.
- Active default SHA-256 after edit:
  `f15516f83d38997de4411c3933b0fd826f2fc4851c66286eab0e5a8fad99a305`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-goodbye-correction-D19479/locatexts_zh_cn.koalocatext_default.csv`.
- Reversing the exact ID 30193 substitution reproduces the backup byte for
  byte. UTF-8 BOM, 65,135 data rows, unique ascending IDs, 72,011 CRLF
  sequences, and 73 bare-LF sequences are preserved.
- Totals after D-19479: **2,354 accepted / 25,139 not an issue / 11,031
  uncertain** (38,524). Resume at **D-19480** from the deduplicated
  unresolved-finding queue, not a contiguous ID scan.

These are working dispositions, not independent final linguistic approval.
