# D-21645: Arthagall Source-Label Consistency

Date: 2026-10-18

## Scope

Reviewed the exact standalone English label `Arthagall` across the active
default resource. The source contains three exact labels: default:8422
and default:59914 already pair the same Korean spelling with English;
default:49669 omitted that source spelling. The two parallel rows use
Japanese `アーサガール` and Chinese `亚尔撒加尔`; the target row leaves
the English name untranslated in those locales.

| Key | English | Korean old | Korean new |
| --- | --- | --- | --- |
| `default:49669` | `Arthagall` | `아르타갈` | `아르타갈(Arthagall)` |


Only the missing row-local English annotation was added. No person,
creature, faction, place, or other identity category is inferred, and
no glossary or occurrence-index record was created. Existing historical
judgments and tallies were not reopened or recounted.

## Validation

- default: PASS 1 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 696e3ba724211105d74732d29710e5486d6805ca35fce88d6623c591d63148f8
- Glossary, occurrence index, candidate shortlist, and non-target CSV bytes remained unchanged.
- Source/index key differences: missing=0, documented exclusions=0, contextual extras=1064, undocumented extras=0
- Source/occurrence comparison: 44476 source matches, 45540 indexed matches, 73430 CSV rows
- Terminal matches without a covering bilingual English label: 0
- Documented row-scoped Syl place labels: 5
- PASS 2167 unique entities; 45540 unique active-aligned occurrences
{"accepted"=>30464, "uncertain"=>103, "excluded"=>2966, "not-an-issue"=>12007}

No PAK or PAK-derived data was consulted. Full proper-name discovery
remains incomplete.

