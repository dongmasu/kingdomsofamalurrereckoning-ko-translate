# D-21904: Jedda Kerning Name References

Date: 2026-10-20

## Finding

Reviewed the fresh standalone label at `default:18115` against its exact
duplicate at `default:56839`, the related narrative at `default:59350`, and
the earlier full-name context at `default:14412`. English consistently names
Jedda Kerning. Japanese `ジェダ・カーニング` and Chinese `杰达·克尔宁`
support the Korean `제다 커닝(Jedda Kerning)` form. The narrative references
the same woman and her scroll without introducing a conflicting name form.

No clear Korean name error or stronger corpus spelling was found. Keep the
reviewed Korean labels unchanged; do not add a global alias or entity
registration based only on these repeated labels.

## Candidates Excluded

- `Savant Reen` at `default:18023` was already resolved by D-19510 and
  incorporated in the broader D-19718 disposition. Do not reopen it.
- `Bolganbane Armament` at `default:18307` remains under D-5796's unresolved
  item/type/organization question. The current English, Japanese, and Chinese
  labels repeat the evidence already considered there and add no new
  contextual evidence; retain the existing text and hold.

## Outcome

Read-only, content-focused review. No translation CSV, glossary, occurrence
index, release artifact, or format-validation result changed. No format or
residual audit, package build, or in-game validation was run.
