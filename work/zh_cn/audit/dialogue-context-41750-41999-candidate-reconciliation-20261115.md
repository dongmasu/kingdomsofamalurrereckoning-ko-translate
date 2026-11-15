# Candidate Reconciliation: IDs `41750`-`41999`

- Date: 2026-11-15.
- Rechecked all 17 correction candidates from the sequential four-language
  review against current English, Japanese, Chinese, and Korean, plus their
  linked term and context reviews.
- The supported corrections were already present for 16 in-range IDs.
  `41905` needed its English pairing aligned with the same establishment at
  `47041` and `47200`.
- Cross-range review of the same name also reconciled candidate IDs
  `47041`, `47200`, and `59258`; `29900` had already been counted in the
  `29750`-`29999` reconciliation and was not counted again.

## Candidate Decisions

| ID | Result |
| ---: | --- |
| `41750` | Confirmed the complete title/name pairing `대마법사 리니엘(Archmage Linniel)` and the donation-on-retirement meaning. |
| `41796` | Confirmed the complete rank and name pairing `샨 게센 중위(Lieutenant Shan Gethen)`. |
| `41798` | Confirmed the exact English title pairing `Deserters' Deserts`; the Korean title remains literal because the possible wordplay is unresolved. |
| `41804` | Confirmed the natural description of seismic and magical effects on the crater's humors; the technical scope is preserved without inventing a different biological meaning. |
| `41813` | Confirmed `줄리아(Julia)` and the rescue/journal meaning. Retained `산적` because this row does not establish a project-wide distinction that would justify changing it to `도적`. |
| `41814` | Confirmed the `로스(Roth)` pairing and the speaker's plain conversational voice. |
| `41817` | Confirmed `롱소드`, `그레이트소드`, and `해머`; all three paragraphs, runtime wrappers, and embedded line breaks are preserved. |
| `41827`, `41853`, `41961` | Confirmed the action-form objective endings `이동하기`, `항해하기`, and `대화하기`. |
| `41880` | Confirmed `케산니키(Kessanniki)` as the named Varani sea-chant form, distinct from the explanatory “선원들의 노래”. |
| `41905` | Updated `빅 헌트(Big Hunt)` to `빅 헌트(The Big Hunt)` to match the establishment's complete source name and established form. The informal welcome remains unchanged. |
| `41921` | Confirmed the ship-name pairing `스테드패스트호(Steadfast)` and its ship suffix. |
| `41977` | Confirmed both `리라(Lila)` pairings and retained the existing Sativa Fiber and Cradle of Summer wording. |
| `41994` | Retained the natural plural reading supported by English and Chinese; Japanese's place-oriented form does not establish a different Korean referent. |
| `41995` | Confirmed the consistent conversational plain register and natural suggestion to spend time at the mission. |
| `41999` | Confirmed the full personal-name pairing `갈렌 그월흐마이(Galen Gwalchmai)`. The agreement's completion chronology remains held because the language sources conflict. |

## Linked Big Hunt Occurrences

The exact name was checked across all five occurrences. `29900` was already
counted in its earlier candidate pass; `41905`, `47041`, `47200`, and `59258`
were reconciled in this linked group. All now use `빅 헌트(The Big Hunt)`.
The three rows that lacked the complete pairing (`29900`, `41905`, and
`59258`) were edited by ID with the EOL-preserving CSV tool. The other two
already used the selected form. Their greeting registers were left intact.
See the
[`Big Hunt name consistency follow-up`](dialogue-context-big-hunt-name-consistency-followup-20261115.md).

## Evidence-Limited Holds

The existing holds remain unresolved and are not treated as translation
errors:

| ID | Reason |
| ---: | --- |
| `41752` | The gift's exact identity differs or is underspecified across sources. |
| `41757` | English's burial shroud and Japanese's broader magical-artifact reading do not establish an item type to normalize. |
| `41803` | The source does not establish whether `pattern` is ordinary imagery or the fate-pattern concept. |
| `41826` | The physical referent of `Njordir's font` is not established. |
| `41833` | The deliberately opaque verse does not settle what kind of `eon` is meant. |
| `41847` | The sources do not identify whether `the order` is an organization, college, or another institution. |
| `41864` | The line does not establish whether `the Spire` is a proper place name. |
| `41869` | English and Japanese differ on the form of address. |
| `41876` | The standalone label does not establish whether `the Weaver` is a named figure or description. |
| `41918` | English and Japanese give different cave/prison location names. |
| `41935` | The sources do not establish whether capitalized `Scale` is a proper name. |
| `41957` | English says comrades, while Japanese says younger brothers. |
| `41976` | The identity and nature of `the Sorrows` remain unclear. |
| `41989` | `Tenders` has competing caretaker/attendant readings. |
| `41798` | The possible `Deserters' Deserts` wordplay cannot be recreated confidently in Korean. |
| `41999` | English, Japanese, and Chinese differ on whether the agreement is prospective or complete. |

## Verification

- Reconciled 17 in-range candidate IDs and three linked cross-range candidates
  (`47041`, `47200`, `59258`). The linked `29900` ID was already reconciled.
- Candidate reconciliation now covers 2,731 / 4,020 IDs (67.94%), with
  1,289 remaining.
- Changed Korean IDs: `29900`, `41905`, and `59258`. Their four-language
  source fingerprints were refreshed. The other candidate rows already
  reflected their supported corrections.
- The 65,135-row ledger fingerprint check, regenerated index/catalog checks,
  11 CSV-preservation tests, nine context-index tests, CSV record/order/BOM/
  line-ending checks, and CRLF-aware diff check passed.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.
