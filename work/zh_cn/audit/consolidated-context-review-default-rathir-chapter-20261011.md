# Consolidated Context Review: `Rathir Chapter`

- Date: 2026-10-11
- Scope: previously uncertain `default` IDs 16504, 18965, and 23882,
  reviewed with all repeated `Rathir Chapter` rows and the explicit Ysa/Rathir
  branch relationship at ID 37123.
- Result: D-18210 narrows the three existing uncertainties but retains their
  `uncertain` disposition. No Korean CSV cells changed and no keys were
  recounted.

## Evidence

The exact English label `Rathir Chapter` occurs at IDs 12601, 16504, 18445,
18965, 21759, 23882, 26952, and 29274. In all eight rows, Japanese uses
`ラシーア支部` and Chinese uses `拉瑟里分会`, both identifying an
organizational branch. The Japanese-derived Korean draft and active Korean
use `지부` in all eight rows.

ID 37123 removes the remaining institutional ambiguity: English says “The
Ysa Chapter is but a small branch of our larger Rathir Chapter”; Japanese
likewise describes Ysa as a small branch belonging to Rathir, and Chinese
calls it a small branch under Rathir. Korean preserves the same hierarchy
with `지부` for Rathir and `분회` for Ysa. Earlier decisions D-3674 and
D-5837 also accepted the branch reading at IDs 12601 and 18445.

The unresolved issue is Korean proper-name consistency, not the meaning of
`Chapter`. Seven of the eight repeated labels currently use `라시르 지부`,
while ID 18445 uses `라시어 지부`; the explicit comparison at ID 37123 also
uses `라시어` for Rathir. Existing corpus decisions defer a global choice
between `라시르` and `라시어`. Neither the Japanese nor Chinese spelling
establishes the canonical Korean form. Accordingly, IDs 16504, 18965, and
23882 remain uncertain pending the corpus-wide Rathir spelling decision;
this review does not authorize a row-local normalization.

## Verification

- IDs 16504, 18965, and 23882 were checked by `ID_Linha` in all five files:
  English source, Japanese source, Japanese-derived Korean draft, Chinese
  source, and active Korean. Each ID occurs once in each file and in the same
  key order.
- The three labels contain no runtime markers or embedded line breaks.
- No active Korean CSV was edited. Its SHA-256 remains
  `7c3cde61768c72e5f5517dc495ba76a4e534121b2920f4f82d9c6459f4039f21`.
- Cross-resource totals remain 1,910 accepted, 22,969 `not an issue`, and
  13,643 uncertain (38,522 unique dispositions). D-18210 links to the three
  existing uncertainty records and does not count them again; next decision:
  D-18211.

These are working dispositions, not independent final linguistic approval.
