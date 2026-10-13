# Consolidated `affix` Context Follow-Up: Residual Terms (D-19548)

- Date: 2026-10-12; decision D-19548.
- Scope: Chinese-only fallback IDs 124, 255, 341, and 496, variants 12,
  14, 21, 22, and 24.
- English is the semantic authority; Japanese is used for form/register;
  Chinese and other locale rows are supporting evidence.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID / variants | Active Korean | Disposition | Evidence and rationale |
| --- | --- | --- | --- |
| 124 / 12, 14, 21, 22, 24 | `폐허의` | uncertain | English `Ruin's` and the sibling sources permit a physical ruin, destruction/doom, or a named force. Chinese `废墟` leans toward physical ruins, while German `Untergangs`, French `fatale`, and Russian `Гибельная` lean toward destruction or fatality; Spanish/Italian use Ruin/rovina. General default uses of “ruin” do not identify this affix target. |
| 255 / 12, 14, 21, 22, 24 | `키스멧의` | uncertain | English `Kismet's`, German `Kismets`, and Italian `del kismet` support retaining the concept/name; Chinese `天定`, Spanish predetermination, French existential, and Russian fatalistic readings interpret it. No located Fate/Kismet lore occurrence binds this affix to a specific item or effect. |
| 341 / 12, 14, 21, 22, 24 | `*클레어리*` | uncertain | English `of Clairy`, Japanese `of Clairy`, German `von Clairy`, and French `de Clairy` support a proper name; Chinese transliterates it. Spanish, Italian, and Russian instead render clarity. No composed item or lore context resolves the source conflict. Keep the active postposed formatting established by D-18201. |
| 496 / 12, 14, 21, 22, 24 | `최상급` | uncertain | English `Prime` and the sibling sources diverge among primeval, fundamental, first, supreme, and elite. Chinese `至尊` and Russian's elite reading can support a tier, but German/Italian favor primeval and Spanish fundamental. Other Korean quality terms, including `최상급` at default ID 31745, do not prove this fragment's item-tier meaning. |

The 20 fallback rows remain `UNCERTAIN`. No Korean CSV cell changed. The
active affix `Texto` rows were checked directly; ID 341 is formatted as
`*클레어리*` in all six active variants. Its five inventory rows were
corrected to reflect this current candidate and its postposed `of ...`
formatting; no disposition changed.

## Counts and Integrity

- The 55 Chinese-only fallback keys remain 10 `ACCEPTED`, 10
  `NOT_AN_ISSUE`, and 35 `UNCERTAIN`; all 140 fallback keys remain
  10 / 95 / 35.
- Active `affix` SHA-256 remains
  `516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e`.
- Active `default` SHA-256 remains
  `84f6eac5ab61cca00b219d2949605f086a86daca0ddeb5d132321c959ad71ebd`;
  totals remain **2,456 accepted / 25,349 not an issue / 10,719 uncertain**
  (38,524).
- The fallback inventory SHA-256 is recorded in the checkpoint documents
  after this metadata correction.
- The affix CSV retains its UTF-8 BOM, 3,451 ordered data rows, and 3,452
  CRLF endings. No CSV edit or new CSV backup was needed.

## Resume

The five residual independent fallback terms ID 101 and IDs 124, 255, 341,
and 496 now have current grouped reviews and remain uncertain. IDs 115 and
117 stay linked to D-18173 and D-18175, respectively, and must not be
double-counted. Next inspect whether any genuinely new item/lore context can
resolve those linked decisions; do not repeat source-only comparisons.
The nine default uncertainties also remain open. Do not call the review
complete while these holds remain.
