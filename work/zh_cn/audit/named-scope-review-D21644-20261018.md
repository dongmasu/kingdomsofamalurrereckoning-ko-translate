# D-21644: Fateweaver Source-Label Consistency

Date: 2026-10-18

## Scope

Reviewed the eight exact standalone English labels that lacked an
English annotation. The official Korean manual uses `페이트위버` for
Fateweaver (PDF pages 1, 3, and 5); Japanese `フェイトウィーバー` and
Chinese `织命者` corroborate. Preserve the source number: six rows are
`Fateweaver`, and two are `Fateweavers`. The inconsistent Korean
`운명술사` was normalized to the manual form.

| Key | English | Korean old | Korean new |
| --- | --- | --- | --- |
| `default:2677` | `Fateweaver` | `페이트위버` | `페이트위버(Fateweaver)` |
| `default:6481` | `Fateweaver` | `페이트위버` | `페이트위버(Fateweaver)` |
| `default:11605` | `Fateweavers` | `페이트위버` | `페이트위버(Fateweavers)` |
| `default:25724` | `Fateweavers` | `페이트위버들` | `페이트위버들(Fateweavers)` |
| `default:28832` | `Fateweaver` | `운명술사` | `페이트위버(Fateweaver)` |
| `default:37750` | `Fateweaver` | `페이트위버` | `페이트위버(Fateweaver)` |
| `default:43495` | `Fateweaver` | `페이트위버` | `페이트위버(Fateweaver)` |
| `default:47257` | `Fateweaver` | `페이트위버` | `페이트위버(Fateweaver)` |

The exact singular labels at default:4133, 7635, and 11967 were already
paired as `페이트위버(Fateweaver)` and remain unchanged. This adds only
row-local source spelling; it does not classify the standalone labels
as people, a race, a faction, or an order. Earlier decisions at
default:37750 and default:43495 remain terminal and were not recounted.
No glossary owner, occurrence-index record, global alias, or historical
tally was added or changed. Existing Fateweaving decisions were not
reopened.

## Validation

- default: PASS 8 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 f97b10091cea9d379ccdc45f75188be5f1e01455bd65f8a1613219c0a7386dd6
- Glossary, occurrence index, candidate shortlist, and non-target CSV bytes remained unchanged.
- Source/index key differences: missing=0, documented exclusions=0, contextual extras=1064, undocumented extras=0
- Source/occurrence comparison: 44476 source matches, 45540 indexed matches, 73430 CSV rows
- Terminal matches without a covering bilingual English label: 0
- Documented row-scoped Syl place labels: 5
- PASS 2167 unique entities; 45540 unique active-aligned occurrences
{"accepted"=>30464, "uncertain"=>103, "excluded"=>2966, "not-an-issue"=>12007}

No PAK or PAK-derived data was consulted. Full proper-name discovery
remains incomplete.

