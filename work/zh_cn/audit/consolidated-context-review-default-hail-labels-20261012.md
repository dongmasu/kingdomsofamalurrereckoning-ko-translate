# Consolidated Context Review: `Hail.` Labels

- Date: 2026-10-12.
- Decision: D-19468.
- Scope: open `default` IDs 29166, 30817, 31170, and 58259.

## Finding

English `Hail.` is a greeting. Japanese `こんにちは` and Chinese `你好`
confirm the salutation reading rather than a separate action or object.
Korean `안녕.`, `안녕하시오.`, and `문안드리오.` all preserve that function;
the differing Korean forms reflect possible speaker/register choices, while
English does not specify one register and Japanese/Chinese use general
greetings. Resolve all four as `not an issue`.

| ID | English | Japanese | Chinese | Active Korean | Disposition |
| ---: | --- | --- | --- | --- | --- |
| 29166 | `Hail.` | `こんにちは` | `你好` | `안녕.` | not an issue |
| 30817 | `Hail.` | `こんにちは` | `你好` | `안녕하시오.` | not an issue |
| 31170 | `Hail.` | `こんにちは` | `你好` | `안녕하시오.` | not an issue |
| 58259 | `Hail.` | `こんにちは` | `你好` | `문안드리오.` | not an issue |

All four were open in the deduplicated unresolved-source queue and had no
later disposition in D-19464-D-19467. No Korean CSV cells changed.

## Verification

- Compared English, Japanese source and preserved draft, Chinese, and active
  Korean by `ID_Linha`.
- No runtime markers or embedded line breaks occur in these labels.
- Active default SHA-256 remains
  `f8e237e820c7c362683c3cdb237b750011d6d72116af6165fd66c744e2cc5b96`.
- Totals after D-19468: **2,349 accepted / 25,084 not an issue /
  11,091 uncertain** (38,524). Resume at **D-19469**.
