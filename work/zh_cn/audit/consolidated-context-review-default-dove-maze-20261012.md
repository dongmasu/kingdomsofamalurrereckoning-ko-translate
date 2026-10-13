# Consolidated Context Review: Repeated `dove` Address in the Dark Maze Line

- Review date: 2026-10-12.
- Scope: unresolved address at `default` IDs 4135 and 62969.
- No CSV cells changed.

## Decision D-19433

The English rows are exact duplicates: `Then there's the Dark Maze, a
labyrinth of hidden paths. You'll just have to find a way through, dove.`
The Japanese rows omit the vocative and describe traversing the maze as a
trial. Chinese renders the address literally as `和平使者` and directly tells
the addressee to find a way through. Both Korean rows use the same `그대가`
construction for the addressee and preserve the instruction. The English
image does not establish age, gender, romance, or a character name; differing
Japanese/Chinese strategies do not by themselves show a Korean meaning error.

Disposition: `not an issue` for the address at ID 62969. The same address
finding is cleared at ID 4135, but that row remains uncertain solely because
the proper-name status of `Dark Maze` is unresolved. Do not recount ID 4135
as fully resolved.

## Verification

- English, Japanese, Chinese, and active Korean values were compared by ID.
- No translation CSV changed; the active default SHA-256 remains
  `6f80a870f122f45d9e87553e4c76d39e547d6194843dc244b20eec82be5ec513`.
- Totals: 2,268 accepted / 24,949 `not an issue` / 11,307 uncertain
  (38,524).
- Resume at D-19434 from the deduplicated unresolved-finding queue; do not
  restart a contiguous ID scan.
