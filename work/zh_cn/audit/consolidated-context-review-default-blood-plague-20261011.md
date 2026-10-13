# Consolidated Context Review: Blood Plague

- Date: 2026-10-11.
- Scope: previously uncertain `default` IDs 11305, 12628, 17879, 19513,
  and 24447.
- Method: compare English, Japanese, Chinese, Japanese-derived Korean,
  active Korean, related disease context, and prior terminology decisions by
  ID. English controls meaning; Japanese informs voice/register; Chinese is
  supporting evidence.
- Result: D-18240 reclassifies five existing uncertain keys as
  `not an issue`. No CSV cells changed.

## Evidence

| ID | English | Japanese | Chinese | Active Korean |
| ---: | --- | --- | --- | --- |
| 11305 | `The Blood plague works fast. Very fast.` | `ブラッドプラーグが広がるのは早い。あっという間だぞ` | `血疫来势汹汹。非常快。` | `혈역병은 빠르게 퍼져. 아주 빠르게.` |
| 12628 | `Blood Plague, and the boggarts that are spreading it all over Glendara.` | `ブラッドプラーグの恐怖と、それをグレンダーラじゅうに広げつつあるボガートどもの存在です` | `是血疫，博格特在格伦达拉到处散播。` | `혈역병, 그리고 글렌다라(Glendara) 전역에 병을 퍼뜨리는 보가트들.` |
| 17879 | `Blood Plague` | `ブラッドプラーグ` | `血疫` | `혈역병(Blood Plague)` |
| 19513 | `Blood Plague` | `ブラッドプラーグ` | `血疫` | `혈역병` |
| 24447 | `Blood Plague` | `ブラッドプラーグ` | `血疫` | `혈역병` |

At IDs 11305 and 12628, surrounding wording identifies a fast-spreading
illness carried/spread by boggarts. The three isolated labels at 17879, 19513,
and 24447 align across all five files; the Japanese phonetic form and Chinese
`血疫` support the same disease name.

Accepted D-6997 establishes `혈역병` as the Korean disease term at ID 22310.
Accepted D-12358 applies it to ID 38007, and D-12651 retains it at ID 39880.
The five reviewed cells already use this form, with an optional English
parenthetical only at ID 17879. Reclassify all five keys as `not an issue`;
no edits.

This ruling does not resolve other rows that use competing Korean forms such
as `피의 역병` or `혈액 역병`, nor does it clear entries with separate
creature, item-function, or narrative questions.

## Integrity and Checkpoint

- No `Texto` cell changed; active default SHA-256 remains
  `d2812e4d72b9d5ae24615f80475c73051fe28b4d96823dae218db4c9c4ee460a`.
- No backup was required because the active CSV was not edited.
- D-18240 reclassifies five existing uncertain keys without recounting any
  other entries.
- Cross-resource totals through D-18240: 1,920 accepted, 23,070
  `not an issue`, and 13,532 uncertain (38,522 total); next D-18241.
- These are working dispositions, not independent final linguistic
  approval. Remaining disease-term variants stay open for separate review.
