# Dialogue Context Translation Edit Batch: IDs `23500`-`23749`

- Date: 2026-11-14.
- Rechecked all 12 candidates in the range against current English, Japanese,
  Chinese, and Korean. English established meaning, Japanese guided
  voice/register and layout, and Chinese supported the comparison.
- Applied all 12 supported corrections. Exact-English duplicate searches
  confirmed each candidate string is unique in the default source table.
- No speaker attribution or dialogue order was inferred from asset
  associations.

## Applied Corrections

| ID | Correction |
| ---: | --- |
| `23504` | Added the source pairing to the standalone `Sprint` label. |
| `23536` | Added the English form to the creature/name label `Selkie`. |
| `23595` | Changed the imperative `Leave Ghennig` objective to `-하기` form. |
| `23618` | Replaced the physical “stand it up” wording with the Hyperian's rising; paired the complete `Festival of Ethene` title. |
| `23624` | Paired the standalone damage label as `독 피해(Poison Damage)`. |
| `23635` | Matched the plain conversational register across both the theatrical invitation and the speaker's recognition/question. |
| `23641` | Localized all four highlighted payloads, preserving their wrapper order and the source's meaning: gem, socketed, equipment, socket. |
| `23661` | Added the English pairing to the named objective `The Unending Dream`. |
| `23662` | Replaced the overly insulting `하찮은 존재` with `평범한 자`, retaining the distinction from the explicit `필멸자` clause. |
| `23716` | Paired the complete creature type `니스카루 군주(Niskaru Lord)` and clarified its juvenile state. |
| `23723` | Changed the objective to the established `-하기` form. |
| `23741` | Paired the complete item label `Small Mitharan Prismere Blades`. |

## Verification

- Only the 12 edited IDs' `source_fingerprint` values were refreshed; all
  other ledger bytes and fields were preserved.
- The ledger validates all 65,135 IDs against the four current language
  tables. The quest index and both context catalogs reproduce byte-for-byte.
- The default CSV retains its UTF-8 BOM, 65,135 ordered data rows, 71,845
  CRLFs, and 244 LF-only record endings.
- ID `23641` retains all four `{*1...}` wrappers in their original order.
- The 20 CSV-preservation and context-index regression tests passed.
- `git -c core.whitespace=cr-at-eol diff --check` passed.

The next sequential candidate range is `23750`-`23999`.
