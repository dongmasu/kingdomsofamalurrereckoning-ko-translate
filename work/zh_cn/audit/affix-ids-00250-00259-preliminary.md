# Preliminary Language Scan: `affix` IDs 250-259

- Review date: 2026-10-07
- Scope: all 55 active target variants for IDs 250-259.
- Compared English `FF` source entries by `ID_Linha`; compared exact target
  variants in Japanese, Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 250 | `Ash` | 잿빛 | Check the material sense against the `Ash Shock Rod` / `Elm Shock Rod` item family; “ash wood” may fit better than “ashen/gray.” | German `Eschenholz`, French `frêne`, and Russian `Ясеневый` refer to ash wood/the ash tree; Spanish, Italian, and Chinese favor ashes/ash. Japanese transliterates the English. Base ID 1938 (`Elm Shock Rod`) confirms that this item family uses tree names as materials, but retain the source ambiguity until the item's role is confirmed. | Medium |
| 258 | `Mitharan Spiritweave` | 미사란 영혼직조 | Reconcile `미사란` with the active corpus's `미타란` rendering of `Mitharan`; do not choose a global form from one row. | Base ID 1026 and multiple other active entries render `Mitharan` as `미타란`, while this affix and some other rows use `미사란`. Japanese and Chinese connect the adjective to Mitharu but do not establish the Korean adjective form. | Medium |

## Chinese-Only Variant Follow-Up

- ID 255 has five target variants (12, 14, 21, 22, and 24) listed in
  `affix-extra-variant-review.tsv` because they lack Japanese-derived draft
  rows. All five were checked here against their Chinese entries and the
  available German, Spanish, French, Italian, and Russian sibling evidence.
  English and Japanese each provide one `FF` entry for the ID, not exact
  target-variant keys.
- The five fallback variants express the same `Kismet's` candidate as V11.
  The cross-language readings range from the name `Kismet` to fate/
  predestination; the active Korean `키스멧의` remains plausible but
  unresolved pending lore context.

## Variant Coverage

- IDs 250-257 and 259 have six target variants each; ID 258 has one. All 55
  active target variants were examined.
- Korean wording is identical across the target variants for each ID. This
  is plausible for Korean, which does not inflect these modifiers for the
  gender and number distinctions encoded by several sibling locales;
  preserve every target key nevertheless.
- IDs 251 (`Hero's`), 252 (`Stout`), 253 (`Dive`), 254 (`Wayfarer's`), 255
  (`Kismet's`), 256 (`Enduring`), 257 (`of Protection`), and 259 (`of
  Wizadry`) had no additional high-confidence concern in this pass. The
  English spelling `Wizadry` is a source typo; the Korean `마법의` expresses
  the intended sense.

## Batch Status

All 55 target variant rows for IDs 250-259 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
