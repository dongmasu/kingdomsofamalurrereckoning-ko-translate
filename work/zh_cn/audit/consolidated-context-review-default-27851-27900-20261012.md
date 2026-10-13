# Consolidated Context Review: `default` IDs 27851-27900

- Review date: 2026-10-12.
- Scope: the open findings in D-8797 for IDs 27851-27900, checked against
  English, Japanese source and preserved Japanese-derived Korean draft,
  Chinese, active Korean, and relevant prior decisions.
- English controls meaning; Japanese informs voice/register; Chinese is
  supporting evidence.
- Result: two accepted `Texto` corrections, fifteen `not an issue`
  resolutions, and five specific uncertainties.

## Decisions D-19406-D-19410

| Decision | Key | Disposition | Evidence and rationale |
| --- | --- | --- | --- |
| D-19406 | `default` 27863 | accepted | Replace `운명에 매이지 않은 자` with the established direct-address form `운명 없는 자` for English `the unfated one`, following D-5563 and the Fateless One decisions D-770, D-10324, D-10904, and D-19397. Retain the archaic register. |
| D-19407 | `default` 27880 | accepted | Change `내가 직접 만든 것` to `내가 직접 발명한 것` for the title `Of My Own Invention`; English, Japanese, and Chinese all identify an invention, not merely something made. |
| D-19408 | `default` 27852-27853, 27856, 27868, 27874, 27877-27879, 27885-27888, 27891, 27898-27899 | not an issue | The names and roles are traceable to the English-led source or an accepted corpus form; key relations and local meanings are retained. Dverga is already rendered in the established `드베르가` form; `pyhril` retains the source spelling; Hanged Men follows D-18244; and the Missives/Praetorians sequence is clear and matches the related reviewed context at D-6591. The Gallows End correction at 27852 (D-8794) and poem-structure finding at 27853 (D-8795) are linked, not recounted. |
| D-19409 | `default` 27858, 27872 | uncertain | Keep two narrowly scoped questions: whether raw `Mage 01 Reckoning` is an internal label intended to remain untranslated, and the formal in-world role behind `Warden`. No unsupported label expansion or title is applied. |
| D-19410 | `default` 27865, 27890, 27894 | uncertain | Keep three specific questions: whether “clear the forest” means cutting trees or clearing a threat; whether `Father Etair` should use a general priest title rather than `신부`; and the conflicting “What Remains”/“survivors” readings. No unsupported narrowing is applied. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27863 | `그대, 운명에 매이지 않은 자여` | `그대, 운명 없는 자여` | Reuse the established Korean rendering for the protagonist's unfated status while retaining the ceremonial address. |
| 27880 | `내가 직접 만든 것` | `내가 직접 발명한 것` | Preserve the source's specific `invention` meaning in the short title. |

## Structural and Context Notes

- English, Japanese source, Chinese, active Korean, and the preserved
  Japanese-derived Korean draft each contain IDs 27851-27900 once in
  identical ascending order. Default rows contain `ID_Linha` and `Texto`;
  there is no variant column.
- Logical line-break counts agree across all five resources for these 50 IDs.
  The four-line poem at 27853 preserves all four lines. Runtime-token
  identities and order match the preliminary signature check; no token or
  numeric value was edited.
- ID 27874's Korean follows the English discovery/transport/chaos/escape
  sequence. Japanese and Chinese describe the Missives more as a book or
  scroll; the English-led Korean does not change the actors or event order.
- The retained forest-contract, Mage-label, Warden, Father Etair, and
  `What Remains` questions are independent of the two accepted edits.

## Verification

- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-context-27851-27900-D19406/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `ce9f700249394ec8f4418dcbe40e040002593bd7cb6845e52c6e16b9a486e4bc`.
- Post-edit SHA-256:
  `5f35a63ff2fd8e5fcffd9a312afe4170178c49b623f91323233623e601815926`.
- Reversing the two exact substitutions reproduces the backup byte-for-byte.
  Only the two approved `Texto` cells changed. The UTF-8 BOM, all 65,135
  rows, ascending unique ID order, 72,011 CRLF endings, and 73 pre-existing
  bare-LF endings are preserved. Source CSVs were not edited.

Totals: 2,256 accepted / 24,867 `not an issue` / 11,401 uncertain (38,524).
Resume D-19411 at ID 27901; sequentially unreviewed interval is 27901-65134
(37,234 IDs), besides older specific holds and register reconciliation.

These are working dispositions, not independent final linguistic approval.
