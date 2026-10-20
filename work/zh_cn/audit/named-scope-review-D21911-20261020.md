# D-21911: Ondea Source-Local Name Check

Date: 2026-10-20

## Finding

The standalone `Ondea` label at `default:19988` appears in English,
Japanese, and Chinese with the same Latin spelling. Korean uses
`온데아`. No aligned locale supplies a different pronunciation or a
stronger Korean spelling, so no clear error is established. Keep the cell
unchanged and do not infer a person/place category from the isolated label.

## Candidate Excluded

- `Julian` (`default:19987`) was already reviewed under D-21633 and remains
  `줄리안(Julian)`; do not recount or requeue it.

## Outcome

Read-only, content-focused review. No translation CSV, glossary,
occurrence index, or release artifact changed. No format/residual audit,
package build, or in-game validation was run.
