# D-21639: All-Resource Proper-Name Candidate Refresh

Date: 2026-10-17

## Scope

Rebuilt the English-led lexical heuristic over all 73430
aligned affix/base/default rows with the active 2165-entry
glossary. The fresh scan found 29628 phrases against the
saved 29604-phrase baseline: 24 appeared and none
disappeared. Two phrases, `Ever Glen` and `Theater of Fates`, were
already captured in the D-21447 screen and were not re-reviewed.

The remaining 22 phrases create 34 candidate-context associations
across 33 unique source contexts. These map to 34 candidate-occurrence
links and 33 unique terminal occurrence records, all with exact English
matches and manifest-backed dispositions. `Chaos Core` and `Chaos cores`
share `default:9945` and one `resource:chaos-core` record. Japanese and
Chinese texts are retained as supporting cross-checks; the existing
Korean labels are recorded. No entity, alias, disposition, translation,
or historical tally was changed.

| Candidate | Contexts | Terminal links | Existing dispositions |
| --- | ---: | ---: | --- |
| `Abyss armor` | 1 | 1 | accepted=1 |
| `and Darkvari` | 2 | 2 | accepted=2 |
| `Bede Edithing` | 1 | 1 | accepted=1 |
| `Chaos Core` | 1 | 1 | accepted=1 |
| `Chaos cores` | 2 | 2 | accepted=2 |
| `Chaos Flames` | 1 | 1 | accepted=1 |
| `Chaos Weapon Core Component` | 1 | 1 | accepted=1 |
| `Chaos Weapon Core Components` | 2 | 2 | accepted=2 |
| `Courden` | 2 | 2 | accepted=1, not-an-issue=1 |
| `Court of Enchantment` | 1 | 1 | not-an-issue=1 |
| `Cynric boys` | 2 | 2 | accepted=2 |
| `deed to the Skoria Mine` | 2 | 2 | accepted=2 |
| `Dorothy Enright` | 1 | 1 | accepted=1 |
| `Ewa Teofring` | 1 | 1 | accepted=1 |
| `Giri Urdur` | 1 | 1 | not-an-issue=1 |
| `Luminitsa's Cards` | 1 | 1 | accepted=1 |
| `Nena Adolla` | 1 | 1 | accepted=1 |
| `Praetorian order` | 1 | 1 | accepted=1 |
| `Prince of Spring` | 2 | 2 | accepted=2 |
| `Raven Guard` | 1 | 1 | not-an-issue=1 |
| `Stellan's Journal` | 4 | 4 | accepted=2, excluded=2 |
| `The Ravens` | 3 | 3 | accepted=1, excluded=2 |

## Validation

- Source/index key differences: missing=0, documented exclusions=0, contextual extras=1064, undocumented extras=0
- Source/occurrence comparison: 44468 source matches, 45532 indexed matches, 73430 CSV rows
- Terminal matches without a covering bilingual English label: 0
- Documented row-scoped Syl place labels: 5
- PASS 2165 unique entities; 45532 unique active-aligned occurrences
{"accepted"=>30458, "uncertain"=>103, "excluded"=>2966, "not-an-issue"=>12005}
- Active CSV hashes, glossary bytes, occurrence-index bytes, and the
  saved baseline were unchanged.

The lexical heuristic and the separate 305-row variant shortlist are
bounded discovery aids, not exhaustive inventories or completion
percentages. Full proper-name discovery remains incomplete.
No PAK or PAK-derived data was consulted.
