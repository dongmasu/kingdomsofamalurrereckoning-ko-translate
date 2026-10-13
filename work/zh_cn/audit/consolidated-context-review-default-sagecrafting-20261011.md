# Consolidated Context Review: Repeated `Sagecrafting` Labels

- Date: 2026-10-11
- Scope: previously uncertain `default` IDs 14693, 23190, and 55761,
  reviewed together across English, Japanese, Japanese-derived Korean,
  Chinese, active Korean, and existing terminology decisions.
- Result: D-18209 reclassifies all three rows as `not an issue`. No Korean
  CSV cells changed.

## Evidence

All three IDs have the same values in their corresponding locale files:

| English | Japanese | Japanese-derived Korean | Chinese | Active Korean |
| --- | --- | --- | --- | --- |
| `Sagecrafting` | `宝石術` | `마법물품 제작` | `附魔` | `마법물품 제작` |

Japanese specifies jewelcrafting and Chinese uses an enchanting term, so
those two locales do not establish a narrower craft domain. The Korean,
however, uses the game's documented official-manual term `마법물품 제작`.
This is already applied to Sagecraft/Sagecrafting elsewhere, including
accepted/non-issue decisions D-1996, D-3286, and D-18198. The five-language
join confirms these three are the same standalone skill/category label, not
three separate translation variants.

The prior uncertainties asked whether the broad official Korean term was
equivalent to the named crafting skill. The official Korean terminology and
repeated approved corpus use answer that question; no local error is
supported. This disposition does not claim that the Japanese and Chinese
craft labels are semantically identical or authorize changing other
Sagecrafting phrases that have separate contextual issues.

## Related Candidate Kept Open

The repeated `Lower` labels at IDs 11571, 11720, and 14141 agree in all five
files: English `Lower`, Japanese `ロー`, Japanese-derived Korean `낮음`,
Chinese `较低`, and active Korean `낮음`. This is corroborated by the exact
same five-locale label at ID 6256; D-1677 treated that instance as a low
option and found `낮음` acceptable. These cues increase confidence that the
current translation captures a low/lower value, but they do not identify the
intended control or dimension at the three open IDs. ID 11721's following
`vs. heavily wounded enemies` fragment is not enough to establish that it
forms a phrase with ID 11720. The three uncertainties therefore remain open;
do not allocate a new disposition number or normalize them until UI context
establishes whether the value is a setting, comparison, direction, or action.

## Verification and Totals

- IDs 14693, 23190, and 55761 were joined by `ID_Linha` in all five files;
  each key occurs once and the same exact source/target values recur.
- The three rows contain no runtime markers or embedded line breaks.
- No active Korean CSV was edited. Active `default` SHA-256 remains
  `7c3cde61768c72e5f5517dc495ba76a4e534121b2920f4f82d9c6459f4039f21`.
- This follow-up adds corroborating context only; it does not create a new
  decision-register entry or change the counts.
- Cross-resource totals through D-18209: 1,910 accepted, 22,969 `not an
  issue`, and 13,643 uncertain (38,522 unique dispositions); next decision:
  D-18210.

These are working dispositions, not independent final linguistic approval.
