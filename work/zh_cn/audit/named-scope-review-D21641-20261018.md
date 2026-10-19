# D-21641: Cloudcrest Source-Label Consistency

Date: 2026-10-18

## Scope

Reviewed the five exact, standalone `Cloudcrest` labels that lacked
English pairing. English controls the exact source form; Japanese
`クラウドクレスト` and Chinese `云顶` corroborate the aligned label.
The three already paired rows at default:21014, 46364, and 55334 were
checked and retained.

| Key | English | Korean old | Korean new |
| --- | --- | --- | --- |
| `default:37607` | `Cloudcrest` | `클라우드크레스트` | `클라우드크레스트(Cloudcrest)` |
| `default:39417` | `Cloudcrest` | `클라우드크레스트` | `클라우드크레스트(Cloudcrest)` |
| `default:42369` | `Cloudcrest` | `클라우드크레스트` | `클라우드크레스트(Cloudcrest)` |
| `default:44597` | `Cloudcrest` | `클라우드크레스트` | `클라우드크레스트(Cloudcrest)` |
| `default:48012` | `Cloudcrest` | `클라우드크레스트` | `클라우드크레스트(Cloudcrest)` |

This source-label-only decision does not determine whether any isolated
label denotes Cloudcrest Mountain, Cloudcrest Peak, or Cloudcrest
Passage. It creates no entity, occurrence disposition, or global alias.
D-21134 and D-21138 distinctions and all terminal decisions remain
unchanged. The official Korean manual files contain no direct
`Cloudcrest` entry.

## Validation

- default: PASS 5 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 0ffefccfc3c40ec367359e5b79674e650c6974e6bdf700f5042374b181fcb87c
- Glossary, occurrence index, candidate shortlist, and non-target CSV bytes remained unchanged.
- Source/index key differences: missing=0, documented exclusions=0, contextual extras=1064, undocumented extras=0
- Source/occurrence comparison: 44468 source matches, 45532 indexed matches, 73430 CSV rows
- Terminal matches without a covering bilingual English label: 0
- Documented row-scoped Syl place labels: 5
- PASS 2165 unique entities; 45532 unique active-aligned occurrences
{"accepted"=>30458, "uncertain"=>103, "excluded"=>2966, "not-an-issue"=>12005}

No PAK or PAK-derived data was consulted. Full proper-name discovery
remains incomplete.

