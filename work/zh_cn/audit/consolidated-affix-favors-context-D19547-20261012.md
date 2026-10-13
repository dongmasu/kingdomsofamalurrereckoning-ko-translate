# Consolidated `affix` Context Follow-Up: Favors (D-19547)

- Date: 2026-10-12; decision D-19547.
- Scope: Chinese-only fallback ID 101, variants 12, 14, 21, 22, and 24.
- English is the semantic authority; Japanese is used for form/register;
  Chinese and other locale rows are supporting evidence.
- This is a working disposition, not independent final linguistic approval.

## Decision

| ID / variants | Active Korean | Disposition | Evidence and rationale |
| --- | --- | --- | --- |
| 101 / 12, 14, 21, 22, 24 | `호의의` | uncertain | English `Favors's` remains malformed. The distinct default ID 15844 says those who seek to enjoy “fate's favors” must study Fate; Japanese `運命の恩恵` and the active Korean `운명의 은총` confirm a Fate-related “benefit/blessing” sense in that sentence. However, no source links that sentence to affix ID 101 or identifies the item/effect receiving this modifier. Other sibling affix readings still range across fortune, patronage, luck, and gifts. The new occurrence narrows a possible sense but does not establish that replacing `호의의` is safe. |

The five inventory rows remain `UNCERTAIN`. No Korean CSV cell changed.

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
- The affix CSV still has its UTF-8 BOM, 3,451 ordered data rows, and
  3,452 CRLF endings. No CSV edit or new CSV backup was needed.
- The last byte-identical CSV edit backup remains the pre-D-19546 file at
  `/private/tmp/ko-translate-backups/20261012/before-affix-willful-term-D19546/locatexts_zh_cn.koalocatext_affix.csv`;
  it is a historical pre-edit backup, not a copy of the current active CSV.

## Resume

Continue D-19548 with residual Chinese-only fallback terms 124, 255, 341,
and 496, grouped by their unresolved semantic conflicts. The full review is
not complete while default and affix uncertainties remain.
