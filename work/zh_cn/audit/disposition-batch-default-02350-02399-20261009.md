# Disposition Batch: `default` IDs 2350-2399

- Decision date: 2026-10-09
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 2350-2399.
- English governs meaning; Japanese supports voice/register and alternate
  readings; Chinese is a secondary cross-check.
- These decisions are a working editorial disposition, not final independent
  linguistic approval. Uncertain items remain unchanged.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 2352 | `chrysalae` | Unchanged; retain the traceable source term pending an established Korean name. | D-382: uncertain |
| 2357 | `Shadowthorn` | Unchanged; proper-name versus descriptive-compound reading remains open. | D-383: uncertain |
| 2367 | `silkfarmers` | `비단 재배자` -> `비단 생산자`; avoid implying that silk itself is cultivated. | D-384: accepted |
| 2367 | `Ossuary` | Unchanged; the exact Korean burial-site category is unresolved. | D-385: uncertain |
| 2369 | `Ethene` | Unchanged; Korean name form remains uncertain. | D-386: uncertain |
| 2372 | `a hundred thousand spiders` | `수십만` -> `거미 십만 마리`; restore the exact quantity. | D-387: accepted |
| 2372 | `the Widow` | Unchanged; generic widow versus named title remains unresolved. | D-388: uncertain |
| 2373 | `Gloamthicket` | Unchanged; name/category conflict across locale references remains open. | D-389: uncertain |
| 2382 | `Zefwyn Lan` | Unchanged; canonical Korean name form is not established. | D-390: uncertain |
| 2385 | `Sidhe` | Unchanged; the lore term's Korean form and referent remain open. | D-391: uncertain |
| 2390 | `Dead Kel` | Unchanged; retain the traceable English name pending global name review. | D-392: uncertain |
| 2391 | `vintage Alfar spell books` | `희귀한` -> `오래된`; restore the supported age/antiquity sense. | D-393: accepted |
| 2393 | `dismissed` | Unchanged; Korean colloquial dismissal is supported by the references and speaker's relieved tone. | D-394: not an issue |
| 2398 | `Dverga script` | Unchanged; writing-system meaning is supported, but the canonical Korean people-name is not settled. | D-395: uncertain |

The three accepted `Texto` edits are authorized by D-384, D-387, and D-393.
The Widow/title, burial-site category, lore-term, and proper-name questions
remain explicitly open. Same-numbered findings from other resource types are
not applied to these `default` rows.

## Structural Verification

- All four locale CSVs parse to 65,135 rows with identical complete
  `default` ID order.
- IDs 2350-2399 retain their keys and order. The five-line poem at ID 2372
  has four embedded line breaks in both English and Korean; no line-count
  mismatch exists.
- Localized markers and numeric values in the reviewed range remain intact.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, and CRLF record
  endings. No row, key, variant, or sidecar was changed.

## Checkpoint

- Decisions recorded: D-382-D-395.
- Cumulative dispositions: 117 accepted, forty-three `not an issue`, and
  235 uncertain.
- Next range: `default` IDs 2400-2449, using
  [`default-ids-02400-02449-preliminary.md`](default-ids-02400-02449-preliminary.md).
