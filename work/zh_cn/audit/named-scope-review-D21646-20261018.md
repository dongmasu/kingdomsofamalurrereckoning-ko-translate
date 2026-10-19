# D-21646: Adarus and Argoth Source-Label Consistency

Date: 2026-10-18

## Scope

Reviewed two exact standalone source labels across the active resources.
For `Adarus`, base:2837 and default:27259 already use
`아다루스(Adarus)`; default:42550 omitted the English source spelling.
Japanese `アダラス` and Chinese `阿达鲁斯` corroborate the existing
Korean form. No Adarus Hollow/Fae hollow classification or Paling Wand
decision is changed.

For `Argoth`, default:29539 omitted the English spelling after the
established Korean `아르고스`. In the aligned Hallam the White sentence
at default:13773, English names Argoth the Mighty, Japanese uses
`アーゴス`, Chinese uses `阿戈斯`, and Korean already says
`아르고스(Argoth)`. The prior D-20383 finding that available context did
not establish Argoth as a person remains intact; this edit assigns no
identity category.

| Key | English | Korean old | Korean new |
| --- | --- | --- | --- |
| `default:42550` | `Adarus` | `아다루스` | `아다루스(Adarus)` |
| `default:29539` | `Argoth` | `아르고스` | `아르고스(Argoth)` |

These are row-local source-label annotations only. No glossary owner,
occurrence-index record, global alias, or historical tally was added
or changed.

## Validation

- default: PASS 2 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 70ca21ebe365afba283e91a4bc97b906839bfa6709ddf396dc5b0fc5b6553465
- Glossary, occurrence index, candidate shortlist, and non-target CSV bytes remained unchanged.
- Source/index key differences: missing=0, documented exclusions=0, contextual extras=1064, undocumented extras=0
- Source/occurrence comparison: 44476 source matches, 45540 indexed matches, 73430 CSV rows
- Terminal matches without a covering bilingual English label: 0
- Documented row-scoped Syl place labels: 5
- PASS 2167 unique entities; 45540 unique active-aligned occurrences
{"accepted"=>30464, "uncertain"=>103, "excluded"=>2966, "not-an-issue"=>12007}

No PAK or PAK-derived data was consulted. Full proper-name discovery
remains incomplete.

